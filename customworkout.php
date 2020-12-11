<?php
session_start();
?>

<!doctype html>
<html>
  <head>
    <title>Konami Grade Book</title>
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" href="nutrition.css">
    <link rel="stylesheet" href="custom.css">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
  </head>
  <body>
    <div class="topnav">
      <a class="navleft" href="home.html">Konami Fitness</a>
      <ul class="navmid">
        <li><a class="active" href="startworkoutsearch.php">Fitness</a></li>
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

    <h1>Enter custom workout </h1>
    <div class="custombox">
      <form action="post" action="customworkout2.php" id="workoutinput">
        <label for="workoutname">Workout name</label><br>
          <input type="text" name="op1" id="workoutname" value="" /><br><br>
          <label for="duration">Duration (in minutes)</label><br>
          <input type="number" name="op3" id="duration" value="" /><br><br>
          <label for="metvalue">MET value</label><br>
          <input type="number" name="op2" id="metvalue" value="" /><br><br>
          <input type="submit" name="custworkout" value="Submit"/>
      </form>
    </div>
</body>
</html>
