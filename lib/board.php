<?php
//επιστρέφει το τι περιέχει η θέση xy
function show_piece($x, $y) {
    global $mysqli;
    $sql = 'select * from board where side=? and y=?';
    $st = $mysqli->prepare($sql);
    $st->bind_param('ii', $x, $y);
    $st->execute();
    $res = $st->get_result();
    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

//επιστρέφει σε json μορφή την κατάσταση του ταμπλό
function show_board($input) {
    global $mysqli;

    $b = current_color($input['token']);
    if ($b) {
        show_board_by_player($b);
    } else {
        header('Content-type: application/json');
        print json_encode(read_board(), JSON_PRETTY_PRINT);
    }
}
function show_board_by_player($b) {
    global $mysqli;
    $orig_board = read_board();
    $board = convert_board($orig_board);
    $status = read_status();
    if ($status['status'] == 'started' && $status['p_turn'] == $b && $b != null) {
        // It my turn !!!!
        //$n = add_valid_moves_to_board($board, $b);

        // Εάν n==0, τότε έχασα !!!!!
        // Θα πρέπει να ενημερωθεί το game_status.
    }
    header('Content-type: application/json');
    print json_encode($orig_board, JSON_PRETTY_PRINT);
}

//επαναρχικοποιεί το ταμπλό
function reset_board() {
    global $mysqli;
    $sql = 'delete from `board`';
    $mysqli->query($sql);
    $sql = 'insert into `board` select * from `board_empty`';
    $mysqli->query($sql);
}
//ανακτά την κατάσταση του ταμπλό από την βάση δεδομένων
function  read_board() {
    global $mysqli;
    $sql = 'select * from board';
    $st = $mysqli->prepare($sql);
    $st->execute();
    $res = $st->get_result();
    return($res->fetch_all(MYSQLI_ASSOC));
}

function convert_board(&$orig_board) {
    $board = [];
    foreach ($orig_board as $i => &$row) {
        $board[$row['side']][$row['y']] = &$row;
    }
    return($board);
}

//πραγματοποιεί την κίνηση χρώματος c στην θέση sy
function do_move($c, $s, $y) {
    global $mysqli;
    $sql = 'call `move_piece`(?,?,?);';
    $st = $mysqli->prepare($sql);
    $st->bind_param('iiii', $c, $s, $y);
    $st->execute();
    header('Content-type: application/json');
    print json_encode(read_board(), JSON_PRETTY_PRINT);
}

?>
