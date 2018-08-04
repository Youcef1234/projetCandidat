<?php


include_once 'Connexion.php';


try
{
    header('Access-Control-Allow-Origin: *');
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);

    $req=$conn->prepare("
      SELECT * 
      FROM candidat c 
      JOIN competence ce 
        ON c.idcompet= ce.idcompetence 
      JOIN diplome dip 
        ON c.iddiplome = dip.iddiplome 
      JOIN experience_pro xpro 
        ON c.idxpro=xpro.idexperience_pro 
      JOIN langue l 
        ON l.idlangue=c.idlangues
    ");

    $req->execute();
    $d=array();
    foreach($req->fetchAll() as $row) {
        $d['mydb'][]= array(
            'idcandidat'=>$row['idcandidat'],
            'nom' =>$row['nom'],
            'prenom' =>$row['prenom'],
            'age' =>$row['age'],
            'date_naissance'=>$row['date_naissance'],
            'Nationalite'=>$row['Nationalite'],
            'email'=>$row['email'],
            'telephone'=>$row['telephone'],
            'adresse'=>$row['adresse'],
            'Code_Postal'=>$row['Code_Postal'],
            'Ville'=>$row['Ville'],
            'Remarque'=>$row['Remarque'],
            'com_nom'=>$row['com_nom'],
            'com_evaluation'=>$row['com_evaluation'],
            'com_commentaire'=>$row['com_commentaire'],
            'type_diplome'=>$row['type_diplome'],
            'date_obtention'=>$row['date_obtention'],
            'dip_commentaire'=>$row['dip_commentaire'],
            'employeur'=>$row['employeur'],
            'debut_contrat'=>$row['debut_contrat'],
            'fin_contrat'=>$row['fin_contrat'],
            'xpro_Commentaire'=>$row['xpro_Commentaire'],
            'l_nom'=>$row['l_nom'],
            'l_evaluation'=>$row['l_evaluation'],
            'l_commentaire'=>$row['l_commentaire']);
    }

  echo json_encode($d);


}
catch  (PDOException $e)
{
    echo "Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();
}




// $d['projet'][]= array('id'=>$row['id'],'nom' =>$row['nom'], 'prenom' =>$row['prenom'], 'age' =>$row['age'],'date_de_naissance'=>$row['date_de_naissance'],'adresse'=>$row['adresse'],'ville'=>$row['ville'],'code_postal'=>$row['code_postal'],'nationalite'=>$row['nationalite'],'telephone'=>$row['telephone'],'email'=>$row['email'],'diplome'=>$row['diplome'],'experience_pro'=>$row['experience_pro'],'competences'=>$row['competences'],'langue'=>$row['langue'],'evaluation_langue'=>$row['evaluation_langue'],'evaluation_competences'=>$row['evaluation_competences'],'remarque'=>$row['remarque']












/*try

{

$database = new Connexion();

$db = $database->openConnexion();

$sql = "SELECT * FROM newtable " ;

foreach ($db->query($sql) as $row) {

echo " ID: ".$row['ID'] . "<br>";

echo " nom: ".$row['nom'] . "<br>";

echo " prenom: ".$row['prenom'] . "<br>";

echo " age: ".$row['age'] . "<br>";

}

}

catch (PDOException $e)

{

echo "There is some problem in connection: " . $e->getMessage();

}
*/
?>