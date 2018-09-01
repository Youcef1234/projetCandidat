
<?php

include_once 'Connexion.php';

try

{
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');


  $data = json_decode(file_get_contents('php://input'),true);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
  $mdp=$data['user']['password'];
  $confmdp=$data['confmdp'];
  if ($mdp==$confmdp) {
  
    $sql = "UPDATE users 
      SET login = '".$data['user']['login']."', 
      password = '".$data['user']['password']."'
      WHERE idusers ='".$data['user']['idusers']."'"  ;

      if ($conn->query($sql)) {
      echo json_encode("Record has been successfully user updated");
      }
      else{
      echo json_encode("there is an error with your user update request");
      }
  }
  else{
    echo json_encode("error write correctly your passwords");
  }

}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>