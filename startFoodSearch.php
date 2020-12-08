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

  function callAPI($method, $url, $data) {
  $curl = curl_init();
  switch ($method) {
    case "POST":
      curl_setopt($curl, CURLOPT_POST, 1);
      if ($data) curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
      break;
    case "PUT":
      curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
      if ($data) curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
      break;
    default:
      if ($data) $url = sprintf("%s?%s", $url, http_build_query($data));
   }
   // OPTIONS:
   curl_setopt($curl, CURLOPT_URL, $url);
   curl_setopt($curl, CURLOPT_HTTPHEADER, array(
      'APIKEY: XYMry4e3VAgaNGLsOPTOVnJQZAtTwH2JnnNOsqAX',
      'Content-Type: application/json',
   ));
   curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
   curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
   // EXECUTE:
   $result = curl_exec($curl);
   if(!$result){die("Connection Failure");}
   curl_close($curl);
   return $result;
}

  function search($o1,$dbconn) {

    // Replace this with the method of getting the nutrition search results
    // $sql = 'SELECT * FROM activity WHERE LOWER(description) LIKE LOWER(\'%'. $o1 . '%\') ORDER BY description';
    // $result = $dbconn->query($sql);
    // echo '<br>';
    $searchphrase = $_POST['op1'];

    $searchurl = 'https://api.nal.usda.gov/fdc/v1/foods/search?query=' . 
    $searchphrase . '&api_key=XYMry4e3VAgaNGLsOPTOVnJQZAtTwH2JnnNOsqAX';


    $get_data = callAPI('GET', $searchurl, false);
    $response = json_decode($get_data, true);
    $_SESSION['data'] = $response;


    foreach($response['foods'] as $row) {
      echo '<option value =' . $row['fdcId'] .'>';

      echo $row['description'];
        echo '</option>';


    }

  }

  try {
    if (isset($_POST['nutrition']) && $_POST['nutrition'] == 'Search') {
      $o1 = $_POST['op1'];
      $o2 = $_POST['op2'];



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
      <a class="active navleft" href="home.html">Konami Fitness</a>
      <ul class="navmid">
        <li><a href="startworkoutsearch.php">Fitness</a></li>
        <li><a href="startfoodsearch.php">Nutrition</a></li>
        <li><a href="login.php">Login/Sign Up</a></li>
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
   
    <h1>Search for Foods: </h1>


    <div class="searchbox">
      <br>
      <form method="post" action="startFoodSearch.php" id="Search_Workout">
           <label for="quantity">Quantity: </label><br>
        <input type="text" name="op2" id="quantity" value="<?php echo isset($_POST["op2"]) ? $_POST["op2"] : 1; ?>" /><br><br>
        <label for="search">Food: </label><br>

        <input type="text" name="op1" id="search" value="<?php echo isset($_POST["op1"]) ? $_POST["op1"] : ''; ?>"/>
        <input type="submit" name="nutrition" value="Search" /><br>
        <br/>
      </form>
    </div>
    <div id= "selection">

</div>
<script type="text/javascript">  
      // notice the quotes around the ?php tag         
      var x="<?php echo 'Select dropdown arrow below to see search results for \''. $o1 . '\''; ?>";
        document.getElementById('selection').innerHTML = x;
    </script>

      <form action=""> 
  <select id="drop" name="dropdown" onchange="showCustomer(this.value)">

    <option id ="firstOption" value="">Select a Food:</option>
      <?php

        if(isset($o1)) {

            search($o1,$dbconn);

        }




      ?>

  </select>



</form>

<br>
<div id="txtHint">
  

</div>
<script>




function showCustomer(str) {


  var qty ="<?php echo $o2 ?>";


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

  xhttp.open("GET", "endFoodSearch.php?q="+str+","+qty, true);
  xhttp.send();

}
</script>
  </body>

</html>