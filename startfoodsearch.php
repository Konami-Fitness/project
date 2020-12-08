<?php

session_start();
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


$calories = 0;
$protein = 0;
$carbs = 0;
$fat = 0;
$sugar = 0;
$sodium = 0;
$brand = NULL;


foreach($response['foods'] as $row) {
    echo '<div class = \'popup\' id = ' . $row['fdcId'] . 
    ' onClick = showCustomer(this.id)  onmouseover=showInfo(this) onmouseout=hideInfo(this)>';

      echo $row['description'];

    if(isset($row['brandOwner'])) {
        $brand = $row['brandOwner'];

    } 

    foreach($row['foodNutrients'] as $row2) {
    
      if ($row2['nutrientName'] == 'Energy' && $row2['unitName'] == 'KCAL' ) { $calories = $row2['value'];}
      if ($row2['nutrientName'] == 'Protein' && $row2['unitName'] == 'G' ) { $protein = $row2['value'];}
      if ($row2['nutrientName'] == 'Carbohydrate, by difference' && $row2['unitName'] == 'G' ) { $carbs = $row2['value'];}
      if ($row2['nutrientName'] == 'Total lipid (fat)' && $row2['unitName'] == 'G' ) { $fat = $row2['value'];}
      if ($row2['nutrientName'] == 'Sugars, total including NLEA ' && $row2['unitName'] == 'G' ) { $sugar = $row2['value'];}
      if ($row2['nutrientName'] == 'Sodium, Na' && $row2['unitName'] == 'MG' ) { $sodium = $row2['value'];}  
    }
    if(isset($row['brandOwner'])) {
         echo '<span class= \' popuptext \' >Brand: ' . $brand . ', '. 'Calories: ' . $calories . ' Cal,<br>' . 'Protein: ' . $protein . ' g, ' . 'Carbs: ' . $carbs . ' g,<br>'
      . 'Total Fat: ' . $fat . ' g, ' . 'Sugar: ' . $sugar . ' g,<br>' . 'Sodium: ' . $sodium . ' mg</span>';
    
    } else {
                echo '<span class= \' popuptext \' >Calories: ' . $calories . ' Cal,<br>' . 'Protein: ' . $protein . ' g, ' . 'Carbs: ' . $carbs . ' g,<br>'
      . 'Total Fat: ' . $fat . ' g, ' . 'Sugar: ' . $sugar . ' g,<br>' . 'Sodium: ' . $sodium . ' mg</span>';
    }


        echo '</div><br><br>';

  
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
   
    <h1>Search for Foods: </h1>


    <div class="searchbox">
      <br>
      <form method="post" action="startFoodSearch.php" id="Search_Workout">
           <label for="quantity">Quantity: </label><br>
        <input type="text" name="op2" id="quantity" value="<?php echo isset($_POST["op2"]) ? $_POST["op2"] : 1; ?>" /><br><br>
        <label for="search">Food: </label><br>

        <input type="text" name="op1" id="search" placeholder="Search for a food" value="<?php echo isset($_POST["op1"]) ? $_POST["op1"] : ''; ?>"/>
        <input type="submit" name="nutrition" value="Search" /><br>
        <br/>
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
<div id="txtHint">
  

</div>
<script>




function showCustomer(str) {


    var bool ="<?php echo isset($_SESSION['userid']) ?>";
if(bool == "") {
  alert("Warning: You may not use this feature without creating an account or signing in.");
} else {

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
