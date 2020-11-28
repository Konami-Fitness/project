<?php

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

$get_data = callAPI('GET', 'https://api.nal.usda.gov/fdc/v1/foods/search?query=burger&api_key=XYMry4e3VAgaNGLsOPTOVnJQZAtTwH2JnnNOsqAX', false);
$response = json_decode($get_data, true);

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
  <?php
    foreach($response['foods'] as $row) {
      printf($row['description'] . "<br>");
      foreach($row['foodNutrients'] as $row2) {
        if($row2['nutrientName'] == 'Energy' && $row2['unitName'] == 'KCAL' ) {
          printf($row2['value'] . ' Calories' . '<br>');
        }
      }
      printf("<br><br><br><br>");
    }
  ?>
  </body>
</html>
