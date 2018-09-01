
<?php

include_once 'Connexion.php';

try

{
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');


	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = "insert into `langue` 
		values (NULL,'".$data['langue']['l_nom']."',
		'".$data['langue']['l_evaluation']."',
		'".$data['langue']['l_commentaire']."')" ;

    if ($conn->query($sql)) {
		echo json_encode("Record langue has been successfully inserted");
    }
    else{
		echo json_encode("there is an error with your langue insert request");
    }
}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>