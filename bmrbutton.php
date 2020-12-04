<?php
	session_start();
	$weight = $_SESSION['weight'];
	$height = $_SESSION['height'];
	$age = $_SESSION['age'];
	$gender = $_SESSION['gendernum'];
	$calorieplan = $_SESSION['goalnum'];

	if ($gender == 0) {
		$bmr = 10*$weight+6.25*$height-5*$age+5;
	}
	if ($gender == 1) {
		$bmr = 10*$weight+6.25*$height-5*$age-161;
	}
	if ($gender == 2) {
		$bmr = ((10*$weight+6.25*$height-5*$age+5)+10*$weight+6.25*$height-5*$age+5)/2;
	}

	echo 'BMR: '.$bmr;

	$cal = $bmr;

	if ($calorieplan == 0) {
		$cal = $cal;
	}
	if ($calorieplan == 1) {
		$cal = 1.1*$cal;
	}
	if ($calorieplan == 2) {
		$cal = $cal-500;
	}

	echo 'Calorie goal: '.$cal;
?>

<button type="button" action="calculations.php">BMR</button>