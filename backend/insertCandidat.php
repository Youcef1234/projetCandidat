<?php

include_once 'Connexion.php';

try

{
    header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');

	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$sql = "INSERT INTO `candidat` 
		VALUES (NULL,'".$data['candidat']['nom']."', 
			'".$data['candidat']['prenom']."',
			'".$data['candidat']['age']."',
			'".$data['candidat']['date_naissance']."',
			'".$data['candidat']['Nationalite']."',
			'".$data['candidat']['email']."',
			'".$data['candidat']['telephone']."',
			'".$data['candidat']['adresse']."',
			'".$data['candidat']['Code_Postal']."',
			'".$data['candidat']['Ville']."',
			'".$data['candidat']['Remarque']."')";

    if ($conn->query($sql)) {
		echo json_encode("Record candidat has been successfully insert");
    }
    else{
		echo json_encode("there is an error with your candidat insert request");


    }


}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>