<?php
$host='localhost';
<<<<<<< HEAD
$db = 'mytavli';
=======
$db = 'adise20_chess1';
>>>>>>> 6eb3309babc096ae59f1afd99ce85f8ce043ce48
require_once "config_local.php";

$user=$DB_USER;
$pass=$DB_PASS;


if(gethostname()=='users.iee.ihu.gr') {
<<<<<<< HEAD
	$mysqli = new mysqli($host, $user, $pass, $db,null,'/home/student/it/2012/it123832/mysql/run/mysql.sock');
=======
	$mysqli = new mysqli($host, $user, $pass, $db,null,'/home/staff/asidirop/mysql/run/mysql.sock');
>>>>>>> 6eb3309babc096ae59f1afd99ce85f8ce043ce48
} else {
        $mysqli = new mysqli($host, $user, $pass, $db);
}

if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . 
    $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

?>