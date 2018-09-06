<?php


include_once 'Connexion.php';

require_once __DIR__ . '/vendor/autoload.php';

use \Firebase\JWT\JWT;
try {
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');



    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    $data = json_decode(file_get_contents('php://input'), true);


    $req = $conn->prepare("SELECT *
      FROM users u
      where u.login='" . $data['login'] . "'
      and u.password='" . $data['mdp'] . "'");


    $req->execute();
    $d = array();


    while ($row = $req->fetch()) {
        $d['mydb'] = array(
            'idusers' => $row['idusers'],
            'login' => $row['login'],
            'password' => ($row ['password']),
            'status' => 200
        );
    }


    if (!empty($d)) {
        $privatekey = "MIIEoQIBAAKCAQB0LOxuqbRdfxFfeIPUWejvNhYX2x0oOcIxkURP7scoXlRXPCne
            QEGTrLw5kgqpNpcCUTt77t9oE11kj9Sg6WfX772U/C6E/Pir3zMcoooWoMUVPzpX
            EE8e59/R9LfxHPULcCHU3l1jnC+5PxECkDoq5qWLXBxulxgdqTnTj/GUE+cBO8cO
            I95OlPyxWZYyp8CEWPY5QPPo1nqIabG2M6toWSk+XQEC+AQgKJu+/XNx1aq1KTSN
            H1b231jZQnQVkLOBilXgbWZ5DQBhUaqJ0kiwfU+/sOG8Nc4cGwXtPsDNPziE6uIr
            e22q8cie/4/CxUBofe029zSx7B7qJV+0aSsXAgMBAAECggEAKRtAKUPo6vAsIIDO
            /JM3pXSYyqYgIfyV5t4EstfFJlaCNz+1fMt1qKAFFcXD+e2z7wD5MDfsWrIHaK6v
            yKPtt20/wnicqTetcXsPZcFpZOpL8eGmben6ZPActPiHIUxitEJf5icsGjPIex6C
            kUqhGk70ImRcNxFFWjFnoaEcFI2c7HzHJ+wCtYDRVaTtik3lMv8gT586J3nAqNZY
            jMgKvF/Sjovw0xoCDxgO8NcPn+Dcukw/6V7lOfrC3fvgvZMelXzcGnSFxn2O0DjZ
            MnW36w1xtfqJa1FR/475bQsgIcq3h+h7Y8UcCpuzKMvYW2uOzFR5ZC1pmyMGEYuw
            EeB3uQKBgQDZUmb8HKwojpcoxO62zVTmX0UJ0DaVyoxPBkozR61NULrPHADd+X8r
            D0WbssdQQg25ftMJZQGcagsD5gS9kFzVZR1r/hZY6cnIPN6wK8cDZTnNVoXoOH82
            1X1fofF5lydt2+pUB3QA7+VryTMOMGckCAcN1CxXfWpb8uzBszUezQKBgQCI2hli
            7io3GL66Ahi5XIUqZMukny8y2I2IZqf5P0eGFaW3YfRIOrYHO6GW6BQV+QeaAfyL
            vIDK4+ktMBsYcAesg5CLFSYiKNq/Qok9kA4Ma37lCPQ5bM8HhJqoclqzVc/MTykq
            xPuJey+24XIZpucF4+DNQGJBDaPfPkDePROpcwKBgHlWH7fdjmWqj00s/xdDd4aU
            ZKiA/ykNCN/KZD1TZLhJPbQLL5TAC7eP9E5lOBFgf+c0n0GcipS5RGMt1zG724kt
            xoqYOAP2rDnHepIkLx5/MxGpoGQyvxxvgGuXsIox0crtwVyfOK6ZQp+2m3Htpnig
            nsei0gsbM/oYnQXdN+h1AoGACAZaBL4YhaCS1o926a+uM10zv9SBzQZ7zirO4MPA
            KvGsBQPecjnXILdzc0jqnJs8weAp8fu8xaj1rGusuxMesBQK7szvroMcyKhbKdv/
            puTKzR1oTNG/lh5Ff2ktPmTiyYU+0b45TceGdb/kk/KAi4zgSsjiuhPVryqUXTPR
            qlcCgYAtXhsqN8gJ+n9qPuy6jxxVmgik8HHpUCIJN7Eh5VcRRJGocswtBiGaIdKU
            xKp0CIWRrfFROfzkbhkTtwuihjiFAicKAT/n6OobJAdwI+wBtW/S1HyUqG8qj71H
            OU2QtSZJP6F072pbxPHDGQnOB62PA5D4IQMzLFH1+iW2nTaSJQ==";
        $token = array(
            "iss" => "optionnal",
            "aud" => "com",
            "iat" => 1356999524,
            "nbf" => 1357000000,
            "id"  =>$d['mydb']['idusers'] ,
        );
        $jwt = JWT::encode($token, $privatekey);
        $d=array("jwt"=>$jwt);
        echo json_encode($d);
    } else {
        echo json_encode("Record error user doesn t exist");
    }


} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine();
}

?>
<?php
/**
 * Created by PhpStorm.
 * User: youcef
 * Date: 01/09/18
 * Time: 18:30
 */