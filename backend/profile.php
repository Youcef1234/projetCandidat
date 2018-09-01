<?php

include_once 'Connexion.php';

try
{
    header('Access-Control-Allow-Origin: *');
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

    $data = json_decode(file_get_contents('php://input'),true);
    $req=$conn->prepare("
      SELECT * 
      FROM users u 
      where u.idusers=".$data['id_user']);

    $req->execute();
    $d=array();
    while($row=$req->fetch()) {
        $d['mydb']= array(
            'idusers'=>$row['idusers'],
            'login' =>$row['login'],
            'password' =>$row['password'],
            'status' =>"error",

        );
    }

  echo json_encode($d);


}
catch  (PDOException $e)
{
    echo "Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();
}

?>