<?php


include_once 'Connexion.php';


try
{
    header('Access-Control-Allow-Origin: *');
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

    $req=$conn->prepare("
      SELECT *
      FROM interet i
      JOIN candidat_interet ci
      on i.idinteret=ci.idinteret
      WHERE ci.idcandidat=".$_GET['idcandid']."
    ");

    $req->execute();
    $d=array();
    foreach($req->fetchAll() as $row) {
        $d['mydb'][]= array(
            'idinteret'=>$row['idinteret'],
            'nom' =>$row['nom'],
            'commentaire' =>$row['commentaire']
        );

    }

  echo json_encode($d);


}
catch  (PDOException $e)
{
    echo "Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();
}


?>
