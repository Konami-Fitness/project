<?php
	session_start();
	$db_host = "localhost";
	$db_user = "user";
	$db_pass = "itws";
	$db_name = "konami";

	if ( ! empty( $_POST ) ) {
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        // Getting submitted user data from database
        $con = new mysqli($db_host, $db_user, $db_pass, $db_name);
        $stmt = $con->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->bind_param('s', $_POST['username']);
        $stmt->execute();
        $result = $stmt->get_result();
    	$user = $result->fetch_object();


    	// Verify user password and set $_SESSION
    	if ( $_POST['password'] == $user->password  ) {
    		$_SESSION['userid'] = $user->userID;
    		$_SESSION['password'] = $user->password;
    		$_SESSION['username'] = $user->username;
    		$_SESSION['fname'] = $user->firstname;
    		$_SESSION['lname'] = $user->lastname;
    		$_SESSION['age'] = $user->age;
    		$_SESSION['gendernum'] = $user->sex;
    		$_SESSION['height'] = $user->height;
    		$_SESSION['heightunit'] = $user->heightbin;
    		$_SESSION['weight'] = $user->weight;
    		$_SESSION['weightunit'] = $user->weightbin;
    		$_SESSION['goalnum'] = $user->calorieplan;
    	}
    }
}
?>

<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" href="login.css">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <title>Home Page</title>
  </head>
  <body>
    <div class="topnav">
      <a class="navleft" href="home.html">Konami Fitness</a>
      <ul class="navmid">
        <li><a href="startworkoutsearch.php">Fitness</a></li>
        <li><a href="startfoodsearch.php">Nutrition</a></li>
        <li><a class="active" href="createaccount.php">Sign in</a></li>
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
		<div class="loginbox">
			<p>Sign in with your Konami Fitness account</p>
			<form action="login.php" target="home.html" method="post">
				<label for="email">Username</label><br>
			  <input type="text" name="username" placeholder="Enter username" required><br>
				<label for="password">Password</label><br>
			  <input type="password" id="password" name="password" placeholder="Enter password" required><br>
				<input type="checkbox" name="show" onclick="showPassword()">
        <label for="show">Show password</label><br><br>
			  <input type="submit" value="Submit" onclick="window.location.href='home.html'">
			</form>
			<ul>
        <li><a href="createaccount.php">Create your account</a></li>
      </ul>
		</div>
		<script>
			function showPassword() {
			  var x = document.getElementById("password");
			  if (x.type === "password") {
			    x.type = "text";
			  } else {
			    x.type = "password";
			  }
			}
		</script>
	</body>
</html>
