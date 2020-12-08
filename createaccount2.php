<?php
  $db_host = "localhost";
  $db_user = "user";
  $db_pass = "itws";
  $db_name = "konami";
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

header('Location: login.php');
    exit;
?>