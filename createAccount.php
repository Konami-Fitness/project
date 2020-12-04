<?php
  $db_host = "localhost";
  $db_user = "user";
  $db_pass = "itws";
  $db_name = "konamifitness";
  $con = new mysqli($db_host, $db_user, $db_pass, $db_name);

  if ( ! empty( $_POST ) ) {
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        // Getting submitted user data from database
        
        $username = $_POST['username'];
        $password = $_POST['password'];
        $fname = $_POST['fname'];
        $lname = $_POST['lname'];
        $age = $_POST['age'];
        $height = $_POST['height'];
        $weight = $_POST['weight'];

        if ( isset($_POST['gender'])) {
          $gender = $_POST['gender'];
          if ($gender == 'male') {
            $gendernum = 0;
          }
          if ($gender == 'female') {
            $gendernum = 1;
          }
          if ($gender == 'other') {
            $gendernum = 2;
          }
        }
        if (!isset($_POST['gender'])) {
          $gendernum = 2;
        }

        if ( isset($_POST['heightunit'])) {
          $unit_h = $_POST['heightunit'];
          if ($unit_h == 'cm') {
            $heightunit = 0;
          }
          if ($unit_h == 'in') {
            $heightunit = 1;
          }
        }

        if ( !isset($_POST['heightunit'])) {
          $heightunit = 0;
        }

        if ( isset($_POST['weightunit'])) {
          $unit_w = $_POST['weightunit'];
          if ($unit_w == 'kg') {
            $weightunit = 0;
          }
          if ($unit_w == 'lbs') {
            $weightunit = 1;
          }
        }

        if ( !isset($_POST['weightunit'])) {
          $weightunit = 0;
        }

        if ( isset($_POST['goal'])) {
          $goal = $_POST['goal'];
          if ($goal == 'gain') {
            $goalnum = 0;
          }
          if ($goal == 'lose') {
            $goalnum = 1;
          }
          if ($goal == 'maintain') {
            $goalnum = 2;
          }
        }

        if ( !isset($_POST['goal'])) {
          $goalnum = 2;
        }


        $sql = "INSERT INTO users (username, password, firstname, 
          lastname, sex, age, weight, height, heightbin, 
          weightbin, calorieplan) VALUES ('".$username."','".$password.
          "','".$fname."','".$lname."',".$gendernum.",".$age.",".$weight."
          ,".$height.",".$heightunit.",".$weightunit."
          ,".$goalnum.")"; 
          // $result = $con -> query($sql);
          if ($con->query($sql) === TRUE) {
            echo "New record created successfully";
          } else {
            echo "Error: " . $sql . "<br>" . $con->error;
          }
          $con -> close();
    }
  }


?>

<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylsheet" href="createaccount.css">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <title>Home Page</title>
  </head>
  <body>
    <div class="topnav">
      <a class="active navleft" href="home.html">Konami Fitness</a>
      <ul class="navmid">
        <li><a href="startworkoutsearch.php">Fitness</a></li>
        <li><a href="startfoodsearch.php">Nutrition</a></li>
        <li><a href="createaccount.php">Login/Sign Up</a></li>
        <li><a href="support.html">About Us</a></li>
      </ul>
      <button class="navright" type="button" name="button">
        <svg viewBox="0 0 100 80" width="40" height="40">
          <rect id="rect1" width="100" height="20" rx="8"></rect>
          <rect id="rect2" y="30" width="100" height="20" rx="8"></rect>
          <rect id="rect3" y="60" width="100" height="20" rx="8"></rect>
        </svg>
      </button>
    </div>
<h1>Create Account</h1>
<form action="createAccount.php" method="post">
  <input type="text" name="username" placeholder="Enter username" required></br>
  <input type="text" name="password" placeholder="Enter password" required></br>
  <input type="text" name="fname" placeholder="Enter first name" required>
  <input type="text" name="lname" placeholder="Enter last name" required></br>
  <input type="number" name="age" placeholder="Age" required></br>

  <input type="radio" id="male" name="gender" value="male">
  <label for="male">Male</form>
  <input type="radio" id="female" name="gender" value="female">
  <label for="female">Female</form>
  <input type="radio" id="other" name="gender" value="other">
  <label for="other">Other</form></br>

  <input type="text" name="height" placeholder="Enter height" required>
  <input type="radio" id="cm" name="heightunit" value="cm">
  <label for="cm">cm</label>
  <input type="radio" id="in" name="heightunit" value="in">
  <label for="in">in</label></br>

  <input type="text" name="weight" placeholder="Enter weight" required>
  <input type="radio" id="kg" name="weightunit" value="kg">
  <label for="cm">kg</label>
  <input type="radio" id="lbs" name="weightunit" value="lbs">
  <label for="in">lbs</label></br>  

  <p>Goal: </p>
  <input type="radio" id="gain" name="goal" value="gain">
  <label for="gain">Gain weight</form>
  <input type="radio" id="lose" name="goal" value="lose">
  <label for="lose">Lose weight</form>
  <input type="radio" id="maintain" name="goal" value="maintain">
  <label for="maintain">Maintain weight</form></br>

  <input type="submit" value="Submit">
  <a href="login.php">Login</a>
</form>
</body>
</html>
