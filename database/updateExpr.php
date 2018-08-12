
<?php

include_once 'Connexion.php';

try

{
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');


	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = "UPDATE experience_pro 
		SET employeur = '".$data['experience']['employeur']."', 
		debut_contrat = '".$data['experience']['debut_contrat']."',
		fin_contrat = '".$data['experience']['fin_contrat']."',
		xpro_Commentaire = '".$data['experience']['xpro_Commentaire']."'
		WHERE idexperience_pro ='".$data['experience']['idexperience_pro']."'"  ;

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