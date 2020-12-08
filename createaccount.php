

<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" href="createaccount.css">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <title>Create Account</title>
  </head>
  <body>
    <div class="topnav">
      <a class="navleft" href="home.html">Konami Fitness</a>
      <ul class="navmid">
        <li><a href="startworkoutsearch.php">Fitness</a></li>
        <li><a href="startfoodsearch.php">Nutrition</a></li>
        <li><a class="active" href="login.php">Sign Up</a></li>
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
    <h1></h1>
    <div class="createbox">
      <p>Create your account with Konami Fitness</p>
      <form action="createaccount2.php" method="post">
        <label for="fname">Username</label><br>
        <input type="text" class="full" name="username" autofocus required></br>
        <label for="fname">Password</label><br>
        <input type="password" class="full" name="password" required></br>

        <div class="left">
          <label for="fname">First name</label><br>
          <input type="text" id="fname" name="fname" size="18" required>
        </div>
        <div class="left">
          <label for="lname">Last name</label><br>
          <input type="text" id="lname" name="lname" size="18" required></br>
        </div>
        <div class="clear">&nbsp;</div> <!-- used to put age on next line-->

        <label for="age">Age</label><br>
        <input type="number" class="full" id="age" name="age" required></br>

        <input type="radio" id="male" name="gender" value="male">
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="female">
        <label for="female">Female</label>
        <input type="radio" id="other" name="gender" value="other">
        <label for="other">Other</label></br><br>

        <label for="height">Height</label><br>
        <input type="text" class="full" id="height" name="height" required><br>
        <input type="radio" id="cm" name="heightunit" value="cm">
        <label for="cm">cm</label>
        <input type="radio" id="in" name="heightunit" value="in">
        <label for="in">in</label></br><br>

        <label for="weight">Weight</label><br>
        <input type="text" class="full" id="weight" name="weight" required><br>
        <input type="radio" id="kg" name="weightunit" value="kg">
        <label for="cm">kg</label>
        <input type="radio" id="lbs" name="weightunit" value="lbs">
        <label for="in">lbs</label></br></br>

        <p id="goal">Goal: </p>
        <input type="radio" id="gain" name="goal" value="gain">
        <label for="gain">Gain weight</label>
        <input type="radio" id="lose" name="goal" value="lose">
        <label for="lose">Lose weight</label>
        <input type="radio" id="maintain" name="goal" value="maintain">
        <label for="maintain">Maintain weight</form></br></br>

        <input type="submit" value="Submit">
        <ul>
          <li>Have an account? <a href="login.php">Sign in</a></li>
        </ul>
      </form>
    </div>
  </body>
</html>
