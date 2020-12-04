<?php
$mysqli = new mysqli("localhost", "root", "websys7", "websys_shop");
if($mysqli->connect_error) {
  exit('Could not connect');
} 

$sql = "SELECT id, fname, lname
FROM customers WHERE id = ?";

$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $_GET['q']);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($cid, $cname, $name);
$stmt->fetch();
$stmt->close();

echo "<table>";
echo "<tr>";
echo "<th>CustomerID</th>";
echo "<td>" . $cid . "</td>";
echo "<th>CompanyName</th>";
echo "<td>" . $cname . "</td>";
echo "<th>ContactName</th>";
echo "<td>" . $name . "</td>";
echo "</tr>";
echo "</table>";
?>