<?php
session_start();
$userid = $_SESSION['userid'];

$servername = "localhost";
  $username = "user";
  $password = "itws";
// Create connection
try {
  $dbconn = new PDO('mysql:host=localhost;dbname=konami',$username,$password);
  $dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e){
  echo "Connection failed: " . $e->getMessage();
}

try {
	if (isset($_POST['custworkout']) && $_POST['custworkout'] == 'Submit') {
		if ($_POST['op1'] != "" && $_POST['op2'] != "") {
			$o1 = $_POST['op1'];
	      	$o2 = $_POST['op2'];

	      	$calsburned = metToCalsBurned($op2, $op3, $_SESSION['weight']);
			$sql = 'INSERT INTO customworkouts (userid, calories) VALUES (' . $_SESSION['userid'] . ',' . $calsburned . ')';
			$q = $dbconn->query($sql);
		}
	}
}
catch (PDOException $e) {
	echo $e->getMessage();
}

$err = Array();

function metToCalsBurned($met,$minutes,$w) {
	  return $minutes * ($met * 3.5 * $w) / 200;
	}

header('Location: startworkoutsearch.php');
    exit;
?>