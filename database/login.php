<?php


include_once 'Connexion.php';


try
{
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');


    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    $data = json_decode(file_get_contents('php://input'),true);

    $req=$conn->prepare("SELECT *
      FROM users u
      where u.login='".$data['login']."'
      and u.password='".$data['mdp']."'");

    $req->execute();
    $d=array();

    while($row=$req->fetch()) {
      $d['mydb']= array(
          'idusers'=>$row['idusers'],
          'login' =>$row['login'],
          'password' =>$row['password'],
          'status'=>200
        );
    }
    if (!empty($d)) {
      echo json_encode($d);
    }
    else {
      echo json_encode("Record error user doesn t exist");
    }

}
catch  (PDOException $e)
{
    echo "Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();
}
?>
