<?php

//API Key df1483f0003854703ed49501f3b91ca42e4f1105

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
      //new
      'Allow: GET, HEAD, OPTIONS',
      'Vary: Accept',
      'Authorization: Token df1483f0003854703ed49501f3b91ca42e4f1105',
   ));
   curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
   curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
   // EXECUTE:
   $result = curl_exec($curl);
   if(!$result){die("Connection Failure");}
   curl_close($curl);
   return $result;
}

$get_data = callAPI('GET', 'https://wger.de/api/v2/workoutlog/', false);
// printf($get_data);
$response = json_decode($get_data, true);

// if (!isset($response['response']['errors'])) {
//   $response['response']['errors'] ="";
//   $errors = $response['response']['errors'];
// } else {
//   $errors = $response['response']['errors'];
// }
//
// if (!isset($response['response']['data'][0])) {
//   $response['response']['data'][0] ="";
//   $errors = $response['response']['data'][0];
// } else {
//   $errors = $response['response']['data'][0];
// }

?>
<!doctype html>
<html>
  <head>
    <title>Konami Wger</title>
  </head>
  <body>
  <?php
    foreach($response['results'] as $row) {
      printf($row['id'] . "<br>" . $row['exercise'] . "<br><br><br><br><br>");
    }
  ?>
  </body>
</html>
