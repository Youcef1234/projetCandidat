
<?php

include_once 'Connexion.php';

try

{
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');


	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = "DELETE FROM interet 
		WHERE idinteret ='".$data['interet']['idinteret']."'"  ;

    if ($conn->query($sql)) {
		echo json_encode("Record has been successfully interet deleted");
    }
    else{
		echo json_encode("there is an error with your interet delete request");


    }
}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>