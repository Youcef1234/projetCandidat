<?php


include_once 'Connexion.php';


try
{
    header('Access-Control-Allow-Origin: *');
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

    $req=$conn->prepare("
      SELECT *
      FROM langue
    ");

    $req->execute();
    $d=array();
    foreach($req->fetchAll() as $row) {
        $d['mydb'][]= array(
            'idlangue'=>$row['idlangue'],
            'l_nom' =>$row['l_nom'],
            'l_evaluation' =>$row['l_evaluation'],
            'l_commentaire' =>$row['l_commentaire']
        );

    }

  echo json_encode($d);


}
catch  (PDOException $e)
{
    echo "Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();
}


?>
