<?php

ini_set('display_errors', 'on');

require_once "lib/dbconnect.php";
require_once "lib/board.php";
require_once "lib/game.php";
require_once "lib/users.php";


$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);
if (isset($_SERVER['HTTP_X_TOKEN'])) {
    $input['token'] = $_SERVER['HTTP_X_TOKEN'];
}

switch ($r = array_shift($request)) {
    case 'board' :
        switch ($b = array_shift($request)) {
            case '':
            case null: handle_board($method, $input);
                break;
            case 'piece': handle_piece($method, $input);
                break;
            case 'makemove': handle_makemove($method, $input);
                break;
            default: header("HTTP/1.1 404 Not Found");
                break;
        }
        break;
    case 'status':
		
        if (sizeof($request) == 0) {
			if (($method=='PUT')){
                handle_status($method, $input);
            }
			else {
				handle_status($method, null);
			}
           
        } else {
            
            header("HTTP/1.1 404 Not Found");
        }
        break;
    case 'players': handle_player($method, $request, $input);
        break;
    default: header("HTTP/1.1 404 Not Found");
        exit;
}
function handle_status($method,$data = null){
    //	Λήψη της τρέχουσας κατάστασης του παιχνιδιού: Ο client κάνει κλήση στον server και αυτός αποκρίνεται με την τρέχουσα κατάσταση του παιχνιδιού σε μορφή json
	if ($method== 'POST'){
        show_status();
    }
    else if ($method == 'PUT'){
		// Λήψη της τρέχουσας κατάστασης του παιχνιδιού μετά από κίνηση: Ο client κάνει κλήση στον server, κάνοντας ανανέωση της κατάστασης του παιχνιδιού.... (****)
        if ($data==null){
			update_game_status();
        }//	Λήψη της τρέχουσας κατάστασης του παιχνιδιού μετά από κίνηση που οδηγεί στο τέλος του παιχνιδιού: Ο client κάνει κλήση στον server, κάνοντας ανανέωση της κατάστασης του παιχνιδιού (σε αυτήν την περίπτωση η ανανέωση τερματίζει το παιχνίδι) .... (****)
        else {
			update_game_status_for_end($data);
        }// (****) και αυτός αποκρίνεται με την τρέχουσα κατάσταση του παιχνιδιού σε μορφή json.
        show_status();
    }
}// Διαχειριζόμαστε την μετακίνηση
function handle_makemove($method, $input) {
    if ($method == 'PUT') {
        
		$J = $input;
        // το χρώμα των πιονιών του παίκτη μας
		$CL = $J[0]['piece_color'];
       // το token του παίκτη μας
	   $TO = $J[0]['token'];
        // Μέσα στο input έχουμε ακριβώς τις κινήσεις
        for ($i = 1; $i < count($J) - 1; $i++) {
            // Αν δεν έχουμε μετακίνηση απλά συνεχίζουμε την for
			if ($J[$i]['from'] == "-") {
                continue;
            }
			// Αν έχει γίνει μετακίνηση
			// Στην θέση 0 του from παίρνουμε την πλευρά από την οποία μετακινούμε το πιόνι
            $FS = $J[$i]['from'][0];
			// Στην θέση 1 του from παίρνουμε τον αριθμό θέσης από την οποία μετακινούμε το πιόνι
            $FN = $J[$i]['from'][1];
			
			if (isset($J[$i]['from'][2]) && (($J[$i]['from'][2]=="1") || ($J[$i]['from'][2]=="2") || ($J[$i]['from'][2]=="0")) ){
				$FN.=$J[$i]['from'][2];
			}
			// Στην θέση 0 του to παίρνουμε την πλευρά στην οποία μετακινούμε το πιόνι
            $TS = $J[$i]['to'][0];
				// Στην θέση 1 του to παίρνουμε τον αριθμό θέσης στην οποία μετακινούμε το πιόνι
            $TN = $J[$i]['to'][1];
			if (isset($J[$i]['to'][2]) && (($J[$i]['to'][2]=="1") || ($J[$i]['to'][2]=="2") || ($J[$i]['to'][2]=="0")) ){
				$TN.=$J[$i]['to'][2];
			}
            global $mysqli;
			// καλουμε την συνάρτηση .. μέσα στο sql θα δούμε τι κάνει.. βάζουμε τις κινήσεις
            $sql = 'call `move_piece`(?,?,?,?,?,?);';
			
            $st = $mysqli->prepare($sql);
			// Το 1ο και το 3ο (s) είναι ότι στέλνουμε strings Β ή W
			// Τα 2o και το 4ο (i) είναι ότι στέλνουμε integers 1-12
            $st->bind_param('sisiss', $FS, $FN, $TS, $TN, $TO, $CL);

            $st->execute();
        }
        header('Content-type: application/json');
        print json_encode(read_board(), JSON_PRETTY_PRINT);
    }
}

function handle_board($method, $input) {
    if ($method == 'GET') {
        show_board($input);
    } else if ($method == 'POST') {
        reset_board();
        show_board($input);
    }
}


// Πιθανό πρώτο στοιχείο του πίνακα -> 'piece'
// Έλεγχος πιόνια
// Αν η μέθοδος είναι PUT αλλάζουμε θέση σε πιόνι
 
function handle_piece($method, $input) {
	if ($method == 'PUT') {
        move_piece($input);
    }
}

function handle_player($method, $request, $input) {
    switch ($b = array_shift($request)) {
        case '':
        case null: if ($method == 'GET') {
                show_users($method);
            } else {
                header("HTTP/1.1 400 Bad Request");
                print json_encode(['errormesg' => "Method $method not allowed here."]);
            }
            break;
        case 'B':
        case 'W': handle_user($method, $b, $input);
            break;
        default: header("HTTP/1.1 404 Not Found");
            print json_encode(['errormesg' => "Player $b not found."]);
            break;
    }
}

?>
