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

function search($o1,$dbconn) {
  $sql = 'SELECT * FROM activity WHERE LOWER(description) LIKE LOWER(\'%'. $o1 . '%\') ORDER BY description';
  $result = $dbconn->query($sql);
  echo '<br>';
  foreach($result as $row) {
    echo '<div class = \'piece\'>';
    echo '<option value =' . $row['code'] .'>';

    echo $row['description'];
      echo '</option value>';

    echo '</div class>';
  }
}

function insertExercise($userid, $name, $pictures, $dbconn) {
  // $userid int, $name varchar(50), $timestamp datetime, $pictures varchar(50)
  $sql = 'INSERT INTO exercise (userid, name, pictures) VALUES(' .
  $userid . ',' .
  '\'' . $name . '\'' . ',' .
  '\'' . $pictures . '\')';
  $result = $dbconn->query($sql);
  echo "Successfully inserted.";
}

// Use the user's input as the search part of the url
try {
  if (isset($_POST['xname']))  {
    $searchphrase = rawurlencode($_POST['xname']);
    // echo rawurlencode($_POST['xname']);
    $searchurl = 'https://wger.de/api/v2/exercise/?name=' . $searchphrase;

    $get_data = callAPI('GET', $searchurl, false);
    // printf($get_data);
    $response = json_decode($get_data, true);

    //
    insertExercise(1, $_POST['xname'],'',$dbconn);

    foreach($response['results'] as $exercise) {

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
} catch (PDOException $e) {
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
      <input type="text" name="xname" id="name" value="" />
    </form>

    <!-- <form action="">
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
        xhttp.open("GET", "usertoexercise.php?q="+str, true);
        xhttp.send();
      }
    </script> -->
  </body>
</html>
