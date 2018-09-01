<?php


include_once 'Connexion.php';


try
{
    header('Access-Control-Allow-Origin: *');
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

    $req=$conn->prepare("
      SELECT *
      FROM competence c
    ");

    $req->execute();
    $d=array();
    foreach($req->fetchAll() as $row) {
        $d['mydb'][]= array(
            'idcompetence'=>$row['idcompetence'],
            'com_nom' =>$row['com_nom'],
            'com_evaluation' =>$row['com_evaluation'],
            'com_commentaire' =>$row['com_commentaire']
        );

    }

  echo json_encode($d);


}
catch  (PDOException $e)
{
    echo "Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();
}


?>
