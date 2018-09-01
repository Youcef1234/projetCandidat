
<?php

include_once 'Connexion.php';

try

{
	header('Access-Control-Allow-Origin: *');
	header('Content-Type: application/json');


	$data = json_decode(file_get_contents('php://input'),true);
	
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sql = "insert into `experience_pro` 
		values (NULL,'".$data['experience']['employeur']."',
		'".$data['experience']['debut_contrat']."',
		'".$data['experience']['fin_contrat']."',
		'".$data['experience']['xpro_Commentaire']."')" ;

	if ($conn->query($sql)) {
    	$sql = "insert into `candidat_experience` 
      	values (".$data['idcandid'].",(select max(idexperience_pro) from experience_pro))" ;
	    if ($conn->query($sql)) {      
	      echo json_encode("Record langue_experience has been successfully inserted");
	    }
	    else{
	      echo json_encode("there is an error with your candidat_experience insertion request");
	    }
  	}
}

catch (PDOException $e)

{

echo json_encode("There is some error problem in connection: " . $e->getMessage());

}

?>