<?php
		session_start();

	$servername = "localhost";
	$username = "user";
	$password = "itws";

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

	//net calories 

	function netCalories($gain,$loss) {
		return $gain - $loss;

	}

	//uses met and duration to calculate users calories burned for a particular workout

	function metToCalsBurned($met,$minutes,$w) {
	  return $minutes * ($met * 3.5 * $w) / 200;
	}



	//cals lost from physical activity outside of body's maintenance

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


	//cals gained from food intake
	function calsGained($dbconn, $u) {
	  $user = $u;
	  $sql = 'SELECT * FROM usertonutrition u WHERE u.userid = ' . $user. ' and EXTRACT(DAY from u.time) = (SELECT EXTRACT(DAY FROM current_timestamp()))';
	  $q = $dbconn->query($sql);

	$sum = 0;
	 foreach($q as $row) {
	      $sq2 = 'SELECT (n.energy *' . $row['qty'] . ') as total FROM nutrition n WHERE n.fdcid = ' . $row['fdcid'];
	      $q2 = $dbconn->query($sq2);
	      $sum = $q2->fetchAll()[0]['total'] + $sum; 
	    }  
	    return $sum;
	}

	//bmr calculation - energy needed for body to maintain itself at rest (without workouts being factored in)

	function getBMR($dbconn, $gender, $new_weight, $new_height, $age, $useri) {
		$bmr = 0;
		if ($gender == 0) {
			$bmr = 10*$new_weight+6.25*$new_height-5*$age+5;
		}
		else if ($gender == 1) {
			$bmr = 10*$new_weight+6.25*$new_height-5*$age-161;
		}
		else if ($gender == 2) {
			$bmr = ((10*$new_weight+6.25*$new_height-5*$age+5)+10*$new_weight+6.25*$new_height-5*$age+5)/2;
		}

		$sql = 'UPDATE users SET BMR = '. $bmr . ' WHERE userID = ' . $useri;

		$dbconn->query($sql);
		return $bmr;
	}


	//calorie goal calculation

	function calorieGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan) {
		$maintenance = $bmr + calsLostInWorkouts($dbconn, $useri,$new_weight);

		if ($calorieplan == 2) {
			$cal = $maintenance;
		}
		else if ($calorieplan == 0) {

			$cal = 1.1*$maintenance;
		}
		else if ($calorieplan == 1) {

			$cal = $maintenance-500;
		}
		$sql = 'UPDATE users SET caloriegoal = '. $cal . ' WHERE userID = ' . $useri;

		$dbconn->query($sql);

		return $cal;


	}
		
	//length from calorie goal calculation
	function calorieGoalDist($bmr,$dbconn,$useri,$new_weight,$calorieplan)  {

		$lengthFromCalorieGoal = (calorieGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan) - calsGained($dbconn,$useri));
		return $lengthFromCalorieGoal;
	}


	//checks to see if user has reached calorie goal
	function checkGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan) {

		$len =  calorieGoalDist($bmr,$dbconn,$useri,$new_weight,$calorieplan);

		if ($len <= 0 && $len >= -100) {
			echo "Congratulations on reaching your calorie goal for today!";

		} else if ($len < -100){
			echo "You're starting to go over your calorie goal for today.";
		} else if ($len > 0){
			echo "You haven't reached your calorie goal yet. There's still time to eat some more!";
		}

	}


$progress = 65;
?>


<!doctype html>
<html>
  <head>
    <title>Konami Grade Book</title>
    <!-- <link rel=stylesheet href="nutrition.css"/> -->
    <link rel="stylesheet" href="navbar.css">
    <!-- <link rel="stylesheet" href="bmr.css"> -->
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">


  </head>
  <body>
  	<div class="topnav">
      <a class="active navleft" href="home.html">Konami Fitness</a>
      <ul class="navmid">
        <li><a href="startworkoutsearch.php">Fitness</a></li>
        <li><a href="startfoodsearch.php">Nutrition</a></li>
        <li><a href="login.php">Login/Sign Up</a></li>
        <li><a href="bmrbutton.php">Statistics</a></li>
        <li><a href="support.html">About Us</a></li>
      </ul>
      <button class="navright" type="button" name="button" onclick="window.location.href='usersettings.php'">
        <svg viewBox="0 0 100 80" width="40" height="40">
          <rect id="rect1" width="100" height="20" rx="8"></rect>
          <rect id="rect2" y="30" width="100" height="20" rx="8"></rect>
          <rect id="rect3" y="60" width="100" height="20" rx="8"></rect>
        </svg>
      </button>
    </div>
  	<h1> Tracking Dashboard </h1>

  	  <div id="congratsMsg">
  	  	<?php
  	  			    $bmr = getBMR($dbconn, $gender, $new_weight, $new_height, $age, $useri);

  	  	   checkGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan);

  	  	?>
  	  	<br><br>
  	  </div>

  	  <div id="stats">

		   <?php 

		    $bmr = getBMR($dbconn, $gender, $new_weight, $new_height, $age, $useri);
	        if(array_key_exists('button1', $_POST)) { 
	            echo 'Your body needs ' . $bmr . ' calories for maintenance at rest.'; 
	        } 
	      else if(array_key_exists('button2', $_POST)) { 
	            echo 'You should aim for ' . calorieGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan) . ' calories today.'; 
	        }  else if(array_key_exists('button3', $_POST)) { 
	        	$lengthFromCalorieGoal = calorieGoalDist($bmr,$dbconn,$useri,$new_weight,$calorieplan);
	        	if($lengthFromCalorieGoal < 0) {
	        		 echo 'Burning ' . abs($lengthFromCalorieGoal) . ' calories from doing any kind of physical activity should get you back down to your calorie goal!';
	        		 printf(' You are currently at %d %% of your calorie goal', ((calorieGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan) -  $lengthFromCalorieGoal)/(calorieGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan))) * 100); 

	        	} else {
	        		 echo 'You need ' . abs($lengthFromCalorieGoal) . ' calories more today to reach your goal!'; 
	        		 printf(' You are currently at %d %% of your calorie goal', ((calorieGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan) -  $lengthFromCalorieGoal)/(calorieGoal($bmr,$dbconn,$useri,$new_weight,$calorieplan))) * 100);

	        	}

	        }  else if(array_key_exists('button4', $_POST)) { 
	            echo 'You\'ve eaten ' . calsGained($dbconn,$useri) . ' calories today.'; 
	        }else if(array_key_exists('button5', $_POST)) { 
	            echo 'You\'ve burned ' . calsLostInWorkouts($dbconn, $useri, $new_weight) . ' calories from working out today.'; 
	        }   else if(array_key_exists('button6', $_POST)) { 
	            echo 'Your net calories for today so far is ' . netCalories(calsGained($dbconn,$useri), calsLostInWorkouts($dbconn, $useri, $new_weight) + $bmr) . ' calories.'; 
	         }
	  

	       ?>
	   
	</div>

      <form method="post" action="bmrbutton.php" id="trackingButtons">
        
      		<div class="leftbuttons">
	        <input type="submit" class = "button" name="button1" value="How Many Calories Does My Body Need at Rest for Maintenance?"/><br><br>
	           
	      
	        <input type="submit" class = "button" name="button2" value="Calculate My Calorie Goal For Today"/><br><br>
	           
	      
	        <input type="submit" class = "button" name="button3" value="Progress for Calorie Goal"/><br><br>
	    	</div>
	        
	        <div class="rightbuttons">
	        <input type="submit" class = "button" name="button4" value="How many calories have I eaten today?"/><br><br>

	       	<input type="submit" class = "button" name="button5" value="How many calories have I burned from working out?"/><br><br>

	      
	        <input type="submit" class = "button" name="button6" value="Net Calories From Workouts and Food Intake for the Day So Far (takes into consideration maintenance calories at rest)"/><br><br>
	    	</div>

      </form>

     
  </body>
</html>


