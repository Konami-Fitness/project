<?php

session_start();
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
      echo '<div class = \'piece\'>';
      echo '<option value =' . $row['fdcid'] .'>';

      echo $row['description'];
        echo '</option value>';

      echo '</div class>';

    }

  }

  try {
    if (isset($_POST['nutrition']) && $_POST['nutrition'] == 'Search') {
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
      <form method="post" action="workoutcopy.php" id="Search_Workout">
        <input type="text" name="op1" id="search" value="" />
        <input type="submit" name="nutrition" value="Search"/>
        <br/>
      </form>
    </div>


      <form action=""> 
  <select name="customers" onchange="showCustomer(this.value)">
    <option value="">Select a customer:</option>
      <?php

        if(isset($o1)) {

            search($o1,$dbconn);

        }




      ?>
  </select>
</form>

<br>
<div id="txtHint">Customer info will be listed here...</div>
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

  xhttp.open("GET", "final.php?q="+str, true);
  xhttp.send();
}
</script>
  </body>

</html>