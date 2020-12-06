<?php
session_start();
    		$_SESSION['userid'] = 1;

$useri = $_SESSION['userid'];

$mysqli = new mysqli("localhost", "root", "websys7", "konami");
if($mysqli->connect_error) {
  exit('Could not connect');
} 

$sql = "SELECT code, mets, category_id,description
FROM activity WHERE code = ?";

list($code_id, $duration)= explode(',',$_GET['q']);


$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s",$code_id);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($code, $mets, $catid, $desc);
$stmt->fetch();
$stmt->close();


$sql2 = "INSERT INTO usertoworkout(userid, code, duration) VALUES(" . $useri. "," . $code . "," . $duration. ")"; 
$stmt = $mysqli->query($sql2);

echo "Your workout has been recorded.";


?>

