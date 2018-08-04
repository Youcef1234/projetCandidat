<?php

include_once 'Connexion.php';

try

{
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    // sql to create table

    $sql = "CREATE TABLE `newtable` ( `ID` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR(100) NOT NULL , `prenom` VARCHAR(100) NOT NULL , `age` INT(20)NOT NULL ,`date_de_naissance` DATE NOT NULL,`nationalite` VARCHAR (100) NOT NULL ,`e-mail` VARCHAR (100) NOT NULL ,`telephone` INT (15) NOT NULL ,`code_postal`INT (11), `Ville` VARCHAR(100) NOT NULL ,`adresse` VARCHAR (100) NOT NULL ,`Remarque` LONGTEXT , `diplome` VARCHAR (100) NOT NULL ,`experience_pro` VARCHAR (100) NOT NULL , `competences` VARCHAR (100) NOT NULL , `langue` VARCHAR (100) NOT NULL,`evaluation_langue` INT (15) NOT NULL ,`evaluation_competences` INT (15) NOT NULL , `commentaires` LONGTEXT NOT NULL , PRIMARY KEY(`ID`)) ";

    // use exec() because no results are returned

    if ($conn->query($sql) === TRUE) {

        echo "Table newtable created successfully";

    }

}

catch (PDOException $e)

{

    echo "There is some problem in connection: " . $e->getMessage();

}

?>