<?php

include_once 'Connexion.php';

try

{
    header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');


	$data = json_decode(file_get_contents('php://input'),true);
	
	echo  json_encode($data['candidat']);
	
}

catch (PDOException $e)

{

echo "There is some problem in connection: " . $e->getMessage();

}

?>