
<?php

include_once 'Connexion.php';

try

{
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');


	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = "insert into `diplome` 
		values (NULL,'".$data['diplome']['type_diplome']."',
		'".$data['diplome']['date_obtention']."',
		'".$data['diplome']['dip_commentaire']."')" ;

    if ($conn->query($sql)) {
    	$sql = "insert into `candidat_diplome` 
	      values (".$data['idcandid'].",(select max(iddiplome) from diplome))" ;
	    
	    if ($conn->query($sql)) {      
    		echo json_encode("Record 1 competence_diplome has been successfully inserted");
    	}
    	else{
			echo json_encode("there is an competence diplome insert error with your request");
    	}
    }
    else{
		echo json_encode("there is an competence diplome insert error with your request");
    }
}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>