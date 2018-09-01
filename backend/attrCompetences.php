
<?php

include_once 'Connexion.php';

try

{
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $data = json_decode(file_get_contents('php://input'),true);

  $sql = "iNSERT into `competence` 
    values (NULL,
    '".$data['competence']['com_nom']."',
    '".$data['competence']['com_evaluation']."',
    '".$data['competence']['com_commentaire']."' )" ;

  if ($conn->query($sql)) {
    $sql = "insert into `candidat_competences` 
      values (".$data['idcandid'].",(select max(idcompetence) from competence))" ;
    if ($conn->query($sql)) {      
      echo json_encode("Record competence_candidat has been successfully inserted");
    }
    else{
      echo json_encode("there is an error with your competence_candidat insertion request");
    }
  }
  else{
    echo json_encode("there is an error with your competence_candidat insertion request");
  }
}

catch (PDOException $e)
{
  echo json_encode("There is some error problem in connection: " . $e->getMessage());
}

?>