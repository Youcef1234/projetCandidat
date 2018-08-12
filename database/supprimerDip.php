
<?php

include_once 'Connexion.php';

try

{
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');


	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = "delete from diplome 
		WHERE iddiplome ='".$data['diplome']['iddiplome']."'"  ;

    if ($conn->query($sql)) {
		echo json_encode("Record diplome has been successfully deleted");
    }
    else{
		echo json_encode("there is an diplome delete error with your request");


    }





}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>