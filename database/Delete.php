<?php

include_once 'Connexion.php';

try

{
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

    $sql = "DELETE FROM newtable WHERE `id` = 1 " ;

    if ($conn->query($sql) === TRUE) {

        echo "Record updated successfully";
    }
    {

        echo "Record has been successfully deleted";

    }

}

catch (PDOException $e)

{

    echo "There is some problem in connection: " . $e->getMessage();

}

?>