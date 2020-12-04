<?php

$servername = "localhost";
$username = "user";
$password = "itws";

// Create connection
try {
  $dbconn = new PDO('mysql:host=localhost;dbname=konamifitness',$username,$password);
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
      echo '<option value =' . $row['code'] .'>';

      echo $row['description'];
        echo '</option value>';


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
    <link rel=stylesheet href="nutrition.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&family=Raleway&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
  </head>
  <body>
    <h1>Search for activities: </h1>
    <div id= "selection">

</div>
    <div class="searchbox">
      
      <br>
      <form method="post" action="startWorkoutSearch.php" id="Search_Workout">
        <input type="text" name="op1" id="search" value="" />
        <input type="submit" name="workout" value="Search"/>
        <br/>
      </form>
    </div>
<script type="text/javascript">  
      // notice the quotes around the ?php tag         
      var x="<?php echo 'Select dropdown arrow to see search results for \''. $o1 . '\''; ?>";
        document.getElementById('selection').innerHTML = x;
    </script>

      <form action=""> 
  <select name="dropdown" onchange="showCustomer(this.value)">
    <option value="">Select a physical activity:</option>
      <?php

        if(isset($o1)) {

            search($o1,$dbconn);

        }


      ?>
  </select>
</form>

<br>
<div id="txtHint"></div>
<script>
function showCustomer(str) {
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

  xhttp.open("GET", "endworkoutsearch.php?q="+str, true);
  xhttp.send();
}
</script>
  </body>

</html>



