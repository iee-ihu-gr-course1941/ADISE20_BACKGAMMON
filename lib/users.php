<?php
//ανακτά από την βάση δεδομένων τα στοιχεία των 2 παικτών
function show_users() {
    global $mysqli;
    $sql = 'select username,piece_color from players';
    $st = $mysqli->prepare($sql);
    $st->execute();
    $res = $st->get_result();
    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
//Ανακτά από την βάση δεδομένων τα στοιχεία του παίκτη που αντιστοιχεί στο χρώμα b
function show_user($b) {
    global $mysqli;
    $sql = 'select username,piece_color from players where piece_color=?';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s', $b);
    $st->execute();
    $res = $st->get_result();
    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
//καταχωρεί στην βάση δεδομένων τον παίκτη που τα στοιχεία του είναι γραμμένα στην μεταβλητή input
function set_user($b, $input) {
	//δεν έχει δοθεί username
    if (!isset($input['username'])) {
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => "No username given."]);
        exit;
    }
    $username = $input['username'];
    global $mysqli;
    $sql = 'select count(*) as c from players where piece_color=? and username is not null';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s', $b);
    $st->execute();
    $res = $st->get_result();
    $r = $res->fetch_all(MYSQLI_ASSOC);
	//υπάρχει ήδη παίκτης με το επιλεγμένο χρώμα 
    if ($r[0]['c'] > 0) {
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => "Player $b is already set. Please select another color."]);
        exit;
    }
	//εισαγωγή του παίκτη
    $sql = 'update `players` set `username`=?, `token`=md5(CONCAT( ?, NOW()))  where `piece_color`=?';
    $st2 = $mysqli->prepare($sql);
    $st2->bind_param('sss', $username, $username, $b);
    $st2->execute();
	//ενημέρωση της κατάστασης του παιχνιδιού
    update_game_status();
    $sql = 'select * from players where piece_color=?';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s', $b);
    $st->execute();
    $res = $st->get_result();
	//επιστρέφει τα στοιχεία του παίκτη σε json μορφή
    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function handle_user($method, $b, $input) {
    if ($method == 'GET') {
		//εμφάνιση user
        show_user($b);
    } else if ($method == 'PUT') {
		//καταχώρηση user
        set_user($b, $input);
    }
}
//επιστρέφει το χρώμα που αντιστοιχεί στον παίκτη με token αυτό της παραμέτρου
function current_color($token) {
    global $mysqli;
    if ($token == null) {
        return(null);
    }
    $sql = 'select * from players where token=?';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s', $token);
    $st->execute();
    $res = $st->get_result();
    if ($row = $res->fetch_assoc()) {
        return($row['piece_color']);
    }
    return(null);
}

?>
