<?php
	session_start();

	$servername = "localhost";
$username = "root";
$password = "websys7";

// Create connection
try {
  $dbconn = new PDO('mysql:host=localhost;dbname=konami',$username,$password);
  
} catch (PDOException $e){
  echo "Connection failed: " . $e->getMessage();
}
	$weight = $_SESSION['weight'];
	$height = $_SESSION['height'];
	$age = $_SESSION['age'];
	$gender = $_SESSION['gendernum'];
	$calorieplan = $_SESSION['goalnum'];
	$useri = $_SESSION['userid'];
	$new_weight = $weight;
	$new_height = $height;

//unit conversion if necessary
	if($_SESSION['weightunit'] == 'lb' ) {
		$new_weight = 0.453592 * $_SESSION['weight'];
	}
	if($_SESSION['heightunit'] == 'in' ) {
		$new_height = 2.54 * $_SESSION['height'];
	}


function netCalories($gain,$loss) {
	return $gain - $loss;

}

function metToCalsBurned($met,$minutes,$w) {
  return $minutes * ($met * 3.5 * $w) / 200;
}

function calsLostInWorkouts($dbconn, $u,$w) {
  $user = $u;
  $sql = 'SELECT * FROM usertoworkout u WHERE u.userid = ' . $user. ' and EXTRACT(DAY from u.time) = (SELECT EXTRACT(DAY FROM current_timestamp()))';
  $q = $dbconn->query($sql);

$sum = 0;
 foreach($q as $row) {
      $sq2 = 'SELECT a.mets FROM activity a WHERE a.code = ' . $row['code'];
      $q2 = $dbconn->query($sq2);
      $calsBurned = metToCalsBurned($q2->fetchAll()[0]['mets'],$row['duration'],$w); 
      $sum = $calsBurned + $sum; 
    }  
    return $sum;
}

function calsGained($dbconn, $u) {
  $user = $u;
  $sql = 'SELECT * FROM usertonutrition u WHERE u.userid = ' . $user. ' and EXTRACT(DAY from u.time) = (SELECT EXTRACT(DAY FROM current_timestamp()))';
  $q = $dbconn->query($sql);

$sum = 0;
 foreach($q as $row) {
      $sq2 = 'SELECT n.energy FROM nutrition n WHERE n.fdcid = ' . $row['fdcid'];
      $q2 = $dbconn->query($sq2);
      $sum = $q2->fetchAll()[0]['energy'] + $sum; 
    }  
    return $sum;
}

	if ($gender == 0) {
		$bmr = 10*$new_weight+6.25*$new_height-5*$age+5;
	}
	if ($gender == 1) {
		$bmr = 10*$new_weight+6.25*$new_height-5*$age-161;
	}
	if ($gender == 2) {
		$bmr = ((10*$new_weight+6.25*$new_height-5*$age+5)+10*$new_weight+6.25*$new_height-5*$age+5)/2;
	}


	$cal = $bmr;

	$maintenance = $bmr + calsLostInWorkouts($dbconn, $useri,$new_weight);
	//echo '<br>' .calsLostInWorkouts($dbconn,$useri);
	if ($calorieplan == 0) {
		$cal = $maintenance;
	}
	if ($calorieplan == 1) {
		$cal = 1.1*$maintenance;
	}
	if ($calorieplan == 2) {
		$cal = $maintenance-500;
	}


	$lengthFromCalorieGoal = ($cal - calsGained($dbconn,$useri));



?>



<!doctype html>
<html>
  <head>
    <title>Konami Grade Book</title>
    <link rel=stylesheet href="nutrition.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
  </head>
  <body>
  	<h1> Tracking Dashboard </h1>
      <form method="post" action="bmrbutton.php" id="trackingButtons">
        
      
        <input type="submit" class = "button" name="button1" value="How Many Calories Does My Body Need at Rest for Maintenance?"/>
           
      
        <input type="submit" class = "button" name="button2" value="Calculate My Calorie Goal"/>
           
      
        <input type="submit" class = "button" name="button3" value="Progress for Calorie Goal"/>
        
        <input type="submit" class = "button" name="button4" value="What is my current calorie count?"/>
      
        <input type="submit" class = "button" name="button5" value="Net Calories From Workouts and Food Intake for the Day So Far (takes into consideration maintenance calories at rest)"/>

      </form>

     <div id="stats">
<?php 

        if(array_key_exists('button1', $_POST)) { 
            echo 'Your body needs ' . $bmr . ' calories for maintenance at rest.'; 
        } 
      else if(array_key_exists('button2', $_POST)) { 
            echo 'You should aim for ' . $cal . ' calories today.'; 
        }  else if(array_key_exists('button3', $_POST)) { 
        	if($lengthFromCalorieGoal < 0) {
        		 echo 'You\'re over your calorie goal for today by ' . abs($lengthFromCalorieGoal) . ' calories.'; 

        	} else {
        		 echo 'You need ' . abs($lengthFromCalorieGoal) . ' calories more today to reach your goal.'; 

        	}
        }  else if(array_key_exists('button4', $_POST)) { 
            echo 'Current calorie count: ' . calsGained($dbconn,$useri) . ' calories.'; 
        }  else if(array_key_exists('button5', $_POST)) { 
            echo 'Your net calories for today so far is ' . netCalories(calsGained($dbconn,$useri), calsLostInWorkouts($dbconn, $useri, $new_weight) + $bmr) . ' calories.'; 
         }
  

?>

</div>

 
  </body>
</html>


