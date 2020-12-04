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
    	if ( password_verify( $_POST['password'], $user->password ) ) {
    		$_SESSION['user_id'] = $user->userID;
    	}
    }
}
?>

<form action="login.php" method="post">
  <input type="text" name="username" placeholder="Enter username" required>
  <input type="text" name="password" placeholder="Enter password" required>
  <input type="submit" value="Submit">
</form>