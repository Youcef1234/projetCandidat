<?php

include_once 'Connexion.php';

try

{
    header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');

	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = "UPDATE candidat 
		SET nom = '".$data['candidat']['nom']."', 
			prenom = '".$data['candidat']['prenom']."',
			age = '".$data['candidat']['age']."',
			date_naissance = '".$data['candidat']['date_naissance']."',
			Nationalite = '".$data['candidat']['Nationalite']."',
			email = '".$data['candidat']['email']."',
			telephone = '".$data['candidat']['telephone']."',
			adresse = '".$data['candidat']['adresse']."',
			Code_Postal = '".$data['candidat']['Code_Postal']."',
			Ville = '".$data['candidat']['Ville']."',
			Remarque = '".$data['candidat']['Remarque']."'

		WHERE idcandidat ='".$data['candidat']['idcandidat']."'"  ;

    if ($conn->query($sql)) {
		echo json_encode("Record has been successfully updated");
    }
    else{
		echo json_encode("there is an error with your request");


    }


}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>