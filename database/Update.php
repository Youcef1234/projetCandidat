<?php

include_once 'Connexion.php';

try

{

    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$sql = "UPDATE `newtable` SET `id`= 'Dubois' , `prenom` = 'Thierry' , `email` = 'duboisthierry@gmail.com' WHERE `id` = 1" ;

    if ($conn->query($sql) === TRUE) {

        echo "Record updated successfully";
    }


{

echo "Record has been successfully updated";

}

}

catch (PDOException $e)

{

echo "There is some problem in connection: " . $e->getMessage();

}

?>