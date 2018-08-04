<?php

$d = json_decode(file_get_contents("php://input"));

$servername = "localhost";
$username = "youcef";
$password = "aqwzsx1234";
$database="projet";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
// set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $nom=$d->Chan;
    $prenom=$d->Jackie;

    $stmt = $conn->prepare("INSERT INTO newtable ('nom','prenom','age')VALUES('".$nom."','".$prenom."' ,'".$age."')");
    echo $nom. " ".$prenom." ".$age;
}
catch(PDOException $e)
{
    echo "Connection failed: " . $e->getMessage().' in '.$e->getFile().' on line '.$e->getLine();
}

?>
