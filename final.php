<?php
$mysqli = new mysqli("localhost", "user", "itws", "konamifitness");
if($mysqli->connect_error) {
  exit('Could not connect');
} 

$sql = "SELECT code, mets, category_id,description
FROM activity WHERE code = ?";

$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $_GET['q']);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($fdcid, $mets, $catid, $desc);
$stmt->fetch();
$stmt->close();
echo "Your workout has been recorded.";

$fdcid = $_GET['q'];

echo "hjhjhjhjhjh";

$response = $_SESSION['data'];
foreach($response['foods'] as $row) {
	if ($row['fdcid'] == $fdcid) {
		foreach($row['foodNutrients'] as $row2){
			if ($row2['nutrientName'] == 'Energy' $row2['unitName'] == 'KCAL' ) { $calories == $row2['value'];}
			if ($row2['nutrientName'] == 'Protein' $row2['unitName'] == 'G' ) { $protein == $row2['value'];}
			if ($row2['nutrientName'] == 'Carbohydrate, by difference' $row2['unitName'] == 'G' ) { $carbs == $row2['value'];}
			if ($row2['nutrientName'] == 'Total lipid (fat)' $row2['unitName'] == 'G' ) { $fat == $row2['value'];}
		}

	}
}


$sql2 = "INSERT INTO usertonutrition(userid, fdcid) VALUES(1,". $fdcid . ")";
$sql3 = "INSERT INTO nutrition(fdcid, protein, totalLipid, carbs, energy) VALUES (".$fdcid.",".$protein.",".$fat.",".$carbs.",".$calories.")";
$stmt = $mysqli->query($sql2);
$stmt = $mysqli->query($sql3);


?>