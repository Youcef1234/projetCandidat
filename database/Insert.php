<?php

  include 'Connexion.php';


$conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);


$stmt = $conn->prepare("INSERT INTO candidat (id,nom,prenom,age) VALUES (:id , :nom , :prenom ,:age)");

$stmt->bindParam(':id', $id,PDO::PARAM_STR);
$stmt->bindParam(':nom', $nom,PDO::PARAM_STR);
$stmt->bindParam(':prenom', $prenom,PDO::PARAM_STR);
$stmt->bindParam(':age', $age,PDO::PARAM_STR);


$id = "4";
$nom = "Wayne";
$prenom = "Bruce";
$age = "44";


$stmt->execute();

?>




















 /*   $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $stmt = $conn->prepare("INSERT INTO newtable (id,nom,prenom,age,date_de_naissance,nationalite,email,telephone,code_postal,adresse,ville,remarque,diplome,experience_pro,competences,langue,evaluation_langue,evaluation_competences,commentaires) VALUES (:id , :nom , :prenom ,:age , :date_de_naissance , :nationalite , :email , :telephone , :code_postal ,:adresse, :ville , :remarque , :diplome , :experience_pro , :competences , :langue , :evaluation_langue , :evaluation_competences , :commentaires)");
    $stmt->bindParam(':id', $id,PDO::PARAM_STR);
    $stmt->bindParam(':nom', $nom,PDO::PARAM_STR);
    $stmt->bindParam(':prenom', $prenom,PDO::PARAM_STR);
    $stmt->bindParam(':age', $age,PDO::PARAM_STR);
    $stmt->bindParam(':date_de_naissance', $date_de_naissance,PDO::PARAM_STR);
    $stmt->bindParam(':nationalite', $nationalite,PDO::PARAM_STR);
    $stmt->bindParam(':email', $email,PDO::PARAM_STR);
    $stmt->bindParam(':telephone', $telephone,PDO::PARAM_STR);
    $stmt->bindParam(':code_postal', $code_postal,PDO::PARAM_STR);
    $stmt->bindParam(':adresse', $adresse,PDO::PARAM_STR);
    $stmt->bindParam(':ville', $ville,PDO::PARAM_STR);
    $stmt->bindParam(':remarque', $remarque,PDO::PARAM_STR);
    $stmt->bindParam(':diplome', $diplome,PDO::PARAM_STR);
    $stmt->bindParam(':experience_pro', $experience_pro,PDO::PARAM_STR);
    $stmt->bindParam(':competences', $competences,PDO::PARAM_STR);
    $stmt->bindParam(':langue', $langue,PDO::PARAM_STR);
    $stmt->bindParam(':evaluation_langue', $evaluation_langue,PDO::PARAM_STR);
    $stmt->bindParam(':evaluation_competences', $evaluation_competences,PDO::PARAM_STR);
    $stmt->bindParam(':commentaires', $commentaires,PDO::PARAM_STR);

// inserting a record

    $id = "2";
    $nom = "John";
    $prenom = "Doe";
    $age = "35";
    $date_de_naissance = "1983-01-01";
    $nationalite = "Anglaise";
    $email = "jhondoe@gmail.com";
    $telephone = "0654678910";
    $code_postal = "57100";
    $adresse = "4 rue des Coquelicots";
    $ville = "Thionville";
    $remarque = "RAS";
    $diplome = "Diplome ingenierie informatique";
    $experience_pro = "D-Soft";
    $competences = "C#";
    $langue = "Anglais";
    $evaluation_langue = "20";
    $evaluation_competences = "17";
    $commentaires = "RAS";



    $id = "3";
    $nom = "Stark";
    $prenom = "Tony";
    $age = "38";
    $date_de_naissance = "1980-01-01";
    $nationalite = "Suedois";
    $email = "starktony@gmail.com";
    $telephone = "0652345890";
    $code_postal = "57240";
    $adresse = "4 rue Foch";
    $ville = "Nilvange";
    $remarque = "";
    $diplome = "Diplome ingenierie informatique";
    $experience_pro = "Marmelab";
    $competences = "Fullstack";
    $langue = "Francais";
    $evaluation_langue = "20";
    $evaluation_competences = "18";
    $commentaires = "";


    $id = "3";
    $nom = "Chan";
    $prenom = "Jackie";
    $age = "55";
    $date_de_naissance = "1963-01-01";
    $nationalite = "Chinoise";
    $email = "Jackiechan@gmail.com";
    $telephone = "0677889900";
    $code_postal = "54500";
    $adresse = "13 rue Foch";
    $ville = "Vandoeuvre-lès-Nancy";
    $remarque = "";
    $diplome = "Diplome ingenierie informatique";
    $experience_pro = "MicroPC";
    $competences = "Java";
    $langue = "Francais";
    $evaluation_langue = "17";
    $evaluation_competences = "20";
    $commentaires = "";

    $stmt->execute();



    echo "New record created successfully";
try {
} catch (PDOException $e) {

    echo "There is some problem in connection: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();

}

?>