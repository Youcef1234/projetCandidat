<?php

include_once 'Connexion.php';

try

{
    header('Access-Control-Allow-Origin: *');


/*    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$sql = "UPDATE `newtable` SET `id`= 'Dubois' , `prenom` = 'Thierry' , `email` = 'duboisthierry@gmail.com' WHERE `id` = 1" ;

    if ($conn->query($sql) === TRUE) {

        echo "Record updated successfully";
    }


{

echo "Record has been successfully updated";

}*/
$data = json_decode(file_get_contents('php://input'),true);
//print_r($data['candidat']);
echo  json_encode("amal");
}

catch (PDOException $e)

{

echo "There is some problem in connection: " . $e->getMessage();

}

?>