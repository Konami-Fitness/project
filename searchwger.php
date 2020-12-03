<?php

$servername = "localhost";
$username = "user";
$password = "itws";

// Create connection
// try {
//   $dbconn = new PDO('mysql:host=localhost;dbname=konamifitness',$username,$password);
//   $dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
// } catch (PDOException $e) {
//   echo "Connection failed: " . $e->getMessage();
// }

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
      'APIKEY: df1483f0003854703ed49501f3b91ca42e4f1105',
      'Content-Type: application/json',
      'Allow: GET, HEAD, OPTIONS',
      'Vary: Accept',
      'Authorization: Token df1483f0003854703ed49501f3b91ca42e4f1105',
   ));
   curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
   curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
   // EXECUTE:
   $result = curl_exec($curl);
   if (!$result) {die("Connection Failure");}
   curl_close($curl);
   return $result;
}


function addExercise($dbconn, $foodname) {

}

// Use the user's input as the search part of the url
try {
  if (isset($_POST['op1']))  {
    $searchphrase = rawurlencode($_POST['op1']);
    // echo rawurlencode($_POST['op1']);
    $searchurl = 'https://wger.de/api/v2/exercise/?name=' . $searchphrase;

    $get_data = callAPI('GET', $searchurl, false);
    // printf($get_data);
    $response = json_decode($get_data, true);



    // foreach($response['results'] as $exercise) {
    //   if ($exercise['language'] == 2) {
    //     printf($exercise['name'] . "<br>muscles:<br>");
    //     foreach($exercise['muscles'] as $muscle) {
    //       printf($muscle . "<br>");
    //     }
    //     printf("secondary muscles:<br>");
    //     foreach($exercise['muscles_secondary'] as $muscle2) {
    //       printf($muscle2 . "<br>");
    //     }
    //     printf("equipment:<br>");
    //     foreach($exercise['equipment'] as $eqmt) {
    //       printf($eqmt . "<br>");
    //     }
    //     printf("<br><br>");
    //   }
    // }
    // if (is_array($response['results'])) printf('egg');
    // else printf('bad egg');
    //
    foreach($response['results'] as $exercise) {
    // $exercise = $response['results'];

      printf('<form method="post">
        <input type="submit" name="addExercise" class="button" value="' . $exercise['name'] . '">
      </form>');

      printf('category: ' . $exercise['category'] . '<br>muscles: ');

      foreach($exercise['muscles'] as $muscle) {
        printf($muscle . ' ');
      }

      if (sizeof($exercise['muscles_secondary']) > 0) {
        printf('<br>secondary muscles: ');
        foreach($exercise['muscles_secondary'] as $muscle2) {
          printf($muscle2 . ' ');
        }
      }

      if (sizeof($exercise['equipment']) > 0) {
        printf('<br>equipment: ');
        foreach($exercise['equipment'] as $eqmt) {
          printf($eqmt . ' ');
        }
      }
      printf('<br><br><br><br>');
    }
  }

  // by name, category, muscles, secondary muscles, equipment
  // if (isset($_POST['addExercise']))  {
  //   addFood($dbconn, $_POST['addExercise']);
  // }
}

catch (PDOException $e) {
  echo $e->getMessage();
}

?>
<!doctype html>
<html>
  <head>
    <title>Exercises</title>
  </head>
  <body>
    <form method="post" action="searchwger.php">
      <label for="name">Search for an exercise: </label></br>
      <input type="text" name="op1" id="name" value="" />
    </form>
  </body>
</html>
