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
    if ($method== 'POST'){
        show_status();
    }
    else if ($method == 'PUT'){
		
        if ($data==null){
			update_game_status();
        }
        else {
			update_game_status_for_end($data);
        }
        show_status();
    }
}
function handle_makemove($method, $input) {
    if ($method == 'PUT') {
        $J = $input;
        $CL = $J[0]['piece_color'];
        $TO = $J[0]['token'];
        
        for ($i = 1; $i < count($J) - 1; $i++) {
            if ($J[$i]['from'] == "-") {
                continue;
            }
            $FS = $J[$i]['from'][0];
            $FN = $J[$i]['from'][1];
            $TS = $J[$i]['to'][0];
            $TN = $J[$i]['to'][1];
            global $mysqli;
            $sql = 'call `move_piece`(?,?,?,?,?,?);';
            $st = $mysqli->prepare($sql);
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

function handle_piece($method, $input) {
    if ($method == 'GET') {
        
    } else if ($method == 'PUT') {
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
