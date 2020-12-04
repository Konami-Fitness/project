<?php
	session_start();
	$db_host = "localhost";
	$db_user = "user";
	$db_pass = "itws";
	$db_name = "konamifitness";

	if ( ! empty( $_POST ) ) {
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        // Getting submitted user data from database
        $con = new mysqli($db_host, $db_user, $db_pass, $db_name);
        $stmt = $con->prepare("SELECT * FROM user WHERE username = ?");
        $stmt->bind_param('s', $_POST['username']);
        $stmt->execute();
        $result = $stmt->get_result();
    	$user = $result->fetch_object();

    		
    	// Verify user password and set $_SESSION
    	if ( $_POST['password'] == $user->password  ) {
    		echo 'checkpoint 2';
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
    		$_SESSION['goalnum'] = $user->caloriegoal;
    	}
    }
}
?>

<form action="login.php" method="post">
  <input type="text" name="username" placeholder="Enter username" required>
  <input type="text" name="password" placeholder="Enter password" required>
  <input type="submit" value="Submit">
</form>
<a href="userSettings.php">Settings</a>