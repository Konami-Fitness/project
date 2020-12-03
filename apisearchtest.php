<?php

$servername = "localhost";
$username = "user";
$password = "itws";

// Create connection
try {
  $dbconn = new PDO('mysql:host=localhost;dbname=konamifitness',$username,$password);
  $dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}


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


function addFood($dbconn, $foodname) {
  
}

// Use the user's input as the search part of the url
try {
  if (isset($_POST['op1']))  {
    $searchphrase = $_POST['op1'];


    $searchurl = 'https://api.nal.usda.gov/fdc/v1/foods/search?query=' . 
    $searchphrase . '&api_key=XYMry4e3VAgaNGLsOPTOVnJQZAtTwH2JnnNOsqAX';


  $get_data = callAPI('GET', $searchurl, false);
  $response = json_decode($get_data, true);

  foreach($response['foods'] as $row) {
      // print_r($row);
    
      printf('<form method="post">
        <input type="submit" name="addFood" class="button" value="' . $row['description'] . '">
      </form>');


      foreach($row['foodNutrients'] as $row2) {
        if($row2['nutrientName'] == 'Energy' && $row2['unitName'] == 'KCAL' ) {
          printf($row2['value'] . ' Calories' . '<br>');
          }

        if($row2['nutrientName'] == 'Protein' && $row2['unitName'] == 'G' ) {
          printf($row2['value'] . ' Protein' . '<br>');
          }

        if($row2['nutrientName'] == 'Carbohydrate, by difference' && $row2['unitName'] == 'G' ) {
          printf($row2['value'] . ' Carbohydrate' . '<br>');
          }

        if($row2['nutrientName'] == 'Total lipid (fat)' && $row2['unitName'] == 'G' ) {
          printf($row2['value'] . ' Fat' . '<br>');
          }
      }
      printf('<br>');
    }
  }

  if (isset($_POST['addFood']))  {
    addFood($dbconn, $_POST['addFood']);
  }
} catch (PDOException $e) {
  echo $e->getMessage();
}



if (!isset($response['response']['errors'])) {
  $response['response']['errors'] ="";
  $errors = $response['response']['errors'];
} else {
  $errors = $response['response']['errors'];
}

if (!isset($response['response']['data'][0])) {
  $response['response']['data'][0] ="";
  $errors = $response['response']['data'][0];
} else {
  $errors = $response['response']['data'][0];
}

?>
<!doctype html>
<html>
  <head>
    <title>Konami Calculator</title>
  </head>
  <body>
    <form method="post" action="apisearchtest.php">
      <label for="name">Search for a food: </label></br>
      <input type="text" name="op1" id="name" value="" />
    </form>
  </body>
</html>