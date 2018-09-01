<?php


include_once 'Connexion.php';


try
{
    header('Access-Control-Allow-Origin: *');
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

    $req=$conn->prepare("
      SELECT *
      FROM experience_pro
    ");

    $req->execute();
    $d=array();
    foreach($req->fetchAll() as $row) {
        $d['mydb'][]= array(
            'idexperience_pro'=>$row['idexperience_pro'],
            'employeur'=>$row['employeur'],

            'debut_contrat' =>$row['debut_contrat'],
            'fin_contrat' =>$row['fin_contrat'],
            'xpro_Commentaire' =>$row['xpro_Commentaire']
        );
    }

  echo json_encode($d);


}
catch  (PDOException $e)
{
    echo "Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();
}


?>
