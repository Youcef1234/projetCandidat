
<?php

include_once 'Connexion.php';

try

{
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');


	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = "INSERT INTO interet 
		VALUES(NULL,
		'".$data['interet']['nom']."', 
		commentaire = '".$data['interet']['commentaire']."')";
    if ($conn->query($sql)) {
		echo json_encode("Record interet has been successfully inserted");
    }
    else{
		echo json_encode("there is an error with your interet insert request");


    }
}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>