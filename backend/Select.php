<?php


include_once 'Connexion.php';

require_once __DIR__ . '/vendor/autoload.php';

use \Firebase\JWT\JWT;




$publicKey = <<<EOD
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC8kGa1pSjbSYZVebtTRBLxBz5H
4i2p/llLCrEeQhta5kaQu/RnvuER4W8oDH3+3iuIYW4VQAzyqFpwuzjkDI+17t5t
0tyazyZ8JXw+KgXTxldMPEL95+qVhgXvwtihXC1c5oGbRlEDvDF6Sa53rcFVsYJ4
ehde/zUxo6UvS7UrBQIDAQAB
-----END PUBLIC KEY-----
EOD;


    try
    {
        $decoded = JWT::decode($_GET['letoken'], $publicKey, array('RS256'));


        header('Access-Control-Allow-Origin: *');
        $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

        $req=$conn->prepare("
          SELECT * 
          FROM candidat c where idcandidat=".$_GET['idcandid']."
        ");

        $req->execute();
        $d=array();
        while($row=$req->fetch()) {
            $d['mydb']= array(
                'idcandidat'=>$row['idcandidat'],
                'nom' =>$row['nom'],
                'prenom' =>$row['prenom'],
                'age' =>$row['age'],
                'date_naissance'=>$row['date_naissance'],
                'Nationalite'=>$row['Nationalite'],
                'email'=>$row['email'],
                'telephone'=>$row['telephone'],
                'adresse'=>$row['adresse'],
                'Code_Postal'=>$row['Code_Postal'],
                'Ville'=>$row['Ville'],
                'Remarque'=>$row['Remarque'],
                'decoded'=>$decoded,
            );
        }

      echo json_encode($d);
    }
    catch  (PDOException $e)
    {
        echo json_encode("Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine());
    }
    catch(UnexpectedValueException $e ){
        echo json_encode("jwt failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine());
    }
    

?>