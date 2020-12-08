<?php
session_start();
$useri = $_SESSION['userid'];
$mysqli = new mysqli("localhost", "root", "websys7", "konami");
if($mysqli->connect_error) {
  exit('Could not connect');
} 

list($fdcid, $qty)= explode(',',$_GET['q']);



$calories = 0;
$protein = 0;
$carbs = 0;
$fat = 0;
$sugar = 0;
$sodium = 0;
$brand = NULL;

$response = $_SESSION['data'];
foreach($response['foods'] as $row) {

	if ($row['fdcId'] == $fdcid) {
		$description = $row['description'];
		if(isset($row['brandOwner'])) {
				$brand = $row['brandOwner'];

		} 

		foreach($row['foodNutrients'] as $row2) {
		
			if ($row2['nutrientName'] == 'Energy' && $row2['unitName'] == 'KCAL' ) { $calories = $row2['value'];}
			if ($row2['nutrientName'] == 'Protein' && $row2['unitName'] == 'G' ) { $protein = $row2['value'];}
			if ($row2['nutrientName'] == 'Carbohydrate, by difference' && $row2['unitName'] == 'G' ) { $carbs = $row2['value'];}
			if ($row2['nutrientName'] == 'Total lipid (fat)' && $row2['unitName'] == 'G' ) { $fat = $row2['value'];}
			if ($row2['nutrientName'] == 'Sugars, total including NLEA ' && $row2['unitName'] == 'G' ) { $sugar = $row2['value'];}
			if ($row2['nutrientName'] == 'Sodium, Na' && $row2['unitName'] == 'MG' ) { $sodium = $row2['value'];}  
		}
	}
}




if(isset($brand)) {
		$description =  str_replace("'","\'",$description);
	$brand =  str_replace("'","\'",$brand);
$sql3 =  'INSERT INTO nutrition(fdcid, description,brandOwner,protein,totalLipid,carbs,energy,sugar,sodium) VALUES('.$fdcid.',\''.$description.'\',\''.$brand.'\','.$protein.','.$fat.','.$carbs.','.$calories.','.$sugar.','.$sodium. ')';
} else {
	$description =  str_replace("'","\'",$description);
	$brand =  str_replace("'","\'",$brand);
	$sql3 =  'INSERT INTO nutrition(fdcid, description,protein,totalLipid,carbs,energy,sugar,sodium) VALUES('.$fdcid.',\''.$description.'\','.$protein.','.$fat.','.$carbs.','.$calories.','.$sugar.','.$sodium. ')';
	


}




$sql2 = "INSERT INTO usertonutrition(userid, fdcid, qty) VALUES(" . $useri . ",". $fdcid . "," . $qty . ")";
$stmt = $mysqli->query($sql3);
$stmt = $mysqli->query($sql2);
echo "Your nutrition log has been updated.";

?>

