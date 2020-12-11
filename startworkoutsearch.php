<?php
session_start();

$servername = "localhost";
  $username = "user";
  $password = "itws";
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
    foreach($result as $row) {
      echo '<div class = \'popup\' id = ' . $row['code'] .
    ' onClick = showCustomer(this.id)  onmouseover=showInfo(this) onmouseout=hideInfo(this)>';
          echo $row['description'];

       echo '<span class= \' popuptext \' >MET: ' . $row['mets'] . '</span>';
       echo '</div><br><br>';


    }

  }

  try {
    if (isset($_POST['workout']) && $_POST['workout'] == 'Search') {
      $o1 = $_POST['op1'];
      $o2 = $_POST['op2'];
      if($o2 == 0) {
        $o2 = 30;
      }


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
    <link rel="stylesheet" href="navbar.css">
    <link rel=stylesheet href="nutrition.css"/>
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

    <h1>Search for activities: </h1>

    <div class="searchbox">

      <br>
      <form method="post" action="startworkoutsearch.php" id="Search_Workout">
        <label for="duration">Duration of Activity (minutes): </label><br>
        <input type="text" name="op2" id="duration" value="<?php echo isset($_POST["op2"]) ? $_POST["op2"] : 30; ?>" /><br><br>

        <label for="search">Activity: </label><br>

        <input type="text" name="op1" id="search" placeholder="Search for an exercise" value="<?php echo isset($_POST["op1"]) ? $_POST["op1"] : ''; ?>" />

        <input type="submit" name="workout" value="Search"/><br>
        <br/>
      </form>
      <form method="post" action="customworkout.php" id="inscustomworkout">
        <input type="submit" name="customworkout" value="Insert custom workout"/>
      </form>
    </div><br><br>


<div id="searchResults">
      <?php

        if(isset($o1)) {

            search($o1,$dbconn);

        }


      ?>
</div>

<br>


<div id="txtHint"></div>



<script>
function showCustomer(str) {



    var bool ="<?php echo isset($_SESSION['userid']) ?>";
if(bool == "") {
  alert("Warning: You may not use this feature without creating an account or signing in.");
} else {

  var dur ="<?php echo $o2 ?>";

  var xhttp;
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };

  xhttp.open("GET", "EndWorkoutSearch.php?q="+str+","+dur, true);
  xhttp.send();
}
}

function showInfo(str) {
 var popup = str.childNodes[1];
 //popup.classList.toggle("show");
  popup.style.visibility = 'visible';

 str.style.background = 'rgba(193, 232, 245,0.6)';




}
function hideInfo(str) {

 var popup = str.childNodes[1];
 popup.style.visibility = 'hidden';
  str.style.background = '';
}

</script>
  </body>

</html>
