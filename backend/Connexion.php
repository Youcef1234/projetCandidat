<?php

header('Content-type: application/json');
//Connexion a la BDD

$servername = "localhost";
$username = "youcef";
$password = "aqwzsx1234";
$database="mydb";

try {
$conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
// set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

}
catch(PDOException $e)
{
echo "Connection failed: " . $e->getMessage().' in '.$e->getFile().' on line '.$e->getLine();
}

?>
