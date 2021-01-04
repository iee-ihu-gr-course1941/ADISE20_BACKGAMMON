<?php

function show_status() {
	global $mysqli;
	check_abort();
	$sql = 'select * from game_status';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function check_abort() {
	global $mysqli;
	$sql = "update game_status set status='aborded', result=if(p_turn='W','B','W'),p_turn=null where p_turn is not null and last_change<(now()-INTERVAL 5 MINUTE) and status='started'";
	$st = $mysqli->prepare($sql);
	$r = $st->execute();
	
	// Παίρνουμε το game status
	$sql = "select * from game_status";
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$status = $res->fetch_assoc();
	
	// Aν τελικά δούμε ότι το παιχνίδι ειναι εγκαταλελλημένο
	if ($status['status'] == "aborded"){
		// Ανανεώνουμε τους παίκτες, αφαιρώντας τους
		$sql = "update players set username=null, token=null, last_action=null";
		$st->execute();
		// Διαγράφουμε την κατάσταση του ταμπλώ
		$sql = 'delete from `board`';
		$mysqli->query($sql);
		// Και το επαναφέρουμε στην αρχική του κατάσταση
		$sql = 'insert into `board` select * from `board_empty`';
		$mysqli->query($sql);
	}
}
//ανακτά από την βάση δεδομένων και επιστρέφει την κατάσταση του παιχνιδιού
function read_status() {
	global $mysqli;
	$sql = 'select * from game_status';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$status = $res->fetch_assoc();
	return($status);
}
function update_game_status() {
	global $mysqli;
	
	$status = read_status();
	$new_status=null;
	$new_turn=null;
	
	$st3=$mysqli->prepare('select count(*) as aborted from players WHERE last_action< (NOW() - INTERVAL 5 MINUTE)');
	$st3->execute();
	$res3 = $st3->get_result();
	$aborted = $res3->fetch_assoc()['aborted'];
	if($aborted>0) {
		$sql = "UPDATE players SET username=NULL, token=NULL WHERE last_action< (NOW() - INTERVAL 5 MINUTE)";
		$st2 = $mysqli->prepare($sql);
		$st2->execute();
		if($status['status']=='started') {
			$new_status='aborted';
		}
	}

	
	$sql = 'select count(*) as c from players where username is not null';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$active_players = $res->fetch_assoc()['c'];
	
	
	switch($active_players) {
		case 0: $new_status='not active'; break;
		case 1: $new_status='initialized'; break;
		case 2: $new_status='started'; 
				
				if($status['p_turn']==null) {
					$new_turn='W'; // It was not started before...
				}
				// Αφού έχει ξεκινήσει το παιχνίδι, παίρνει σειρά μια ο ένας παίκτης, μια ο άλλος
                                else {
                                    if ($status['p_turn']=='B'){
                                        $status['p_turn']='W';
                                        $new_turn= 'W';
                                    }
                                    else if ($status['p_turn']=='W'){
                                        $status['p_turn']='B';
                                        $new_turn = 'B';
                                    }
                                }
				break;
	}

	$sql = 'update game_status set status=?, p_turn=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ss',$new_status,$new_turn);
	$st->execute();
}
//καθορίζεται η κατάσταση του παιχνιδιού ώς ολοκληρωμένο με νικητή αυτόν που έχει σειρά να παίξει
function update_game_status_for_end($data) {
	global $mysqli;
	$new_turn='null';
	// Σε αυτήν την περίπτωση έχει πατηθεί το κουμπί για να τερματιστεί το παιχνίδι
	if ($data['new_status']=='_null'){
			// Θέτουμε το game status σε not active και σβήνουμε σειρά παίκτη και τον τελευταίο που έπαιξε
			$sql = "update game_status set status='not active', p_turn=null, last_change = null";
			$st = $mysqli->prepare($sql);
			$st->execute();
			// Αρχικοποιούμε τους παίκτες
			$sql = "update players set username=null, token=null, last_action = null";
			$st = $mysqli->prepare($sql);
			$st->execute();
	}
	// Ελέγχουμε ποιος θα είναι ο επόμενος που θα παίξει
	else if ($data['new_status']=='next_play'){
			if ($data['just_played']=='W'){
				$sql = "update game_status set  p_turn='B'";
			}
			else {
				$sql = "update game_status set  p_turn='W'";
			}
			$st = $mysqli->prepare($sql);
			$st->execute();
    }
	// Δηλώνουμε ότι το παιχνίδι τελείωσε
    else {
            $sql = "update game_status set status='ended', p_turn=null";
			$st = $mysqli->prepare($sql);
			$st->execute();
    }
	
	
	
	
}

?>
