
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
		'".$data['interet']['commentaire']."')";
	
	if ($conn->query($sql)) {
    	$sql = "insert into `candidat_interet` 
      	values (".$data['idcandid'].",(select max(idinteret) from interet))" ;
	    if ($conn->query($sql)) {      
	      echo json_encode("Record interet_experience has been successfully inserted");
	    }
	    else{
	      echo json_encode("there is an error with your interet_experience insertion request");
	    }
  	}

}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>