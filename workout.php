<?php

$servername = "localhost";
$username = "root";
$password = "websys7";

// Create connection
try {
  $dbconn = new PDO('mysql:host=localhost;dbname=konami',$username,$password);
  $dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e){
  echo "Connection failed: " . $e->getMessage();
}




  $err = Array();



  function search($o1,$dbconn) {
    $sql = 'SELECT * FROM activity WHERE LOWER(description) LIKE LOWER(\'%'. $o1 . '%\') ORDER BY description';
    $result = $dbconn->query($sql);
    echo '<br>';
    foreach($result as $row) {
      echo '<div class = \'piece\'>';
      echo $row['description'];
      echo '</div class>';

    }

  }

  try {
    if (isset($_POST['workout']) && $_POST['workout'] == 'Search') {
      $o1 = $_POST['op1'];


      }

   
  }
  catch (PDOException $e) {
    echo $e->getMessage();
  }
?>

<!doctype html>
<html>
  <head>
    <title>Konami Grade Book</title>
    <link rel=stylesheet href="styles.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
  </head>
  <body>
    <h1>Search for activities: </h1>
    <div class="calcbox">
      
      <br>
      <form method="post" action="workout.php" id="Search_Workout">
        <input type="text" name="op1" id="search" value="" />
        <input type="submit" name="workout" value="Search"/>
        <br/>
      </form>
    </div>

      <div class="search">
      <?php

        if(isset($o1)) {

            search($o1,$dbconn);

        }




      ?>
    </div>

  </body>

</html>



