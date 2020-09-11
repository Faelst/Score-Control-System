<?php
    include 'key.php';
    
    $db = new connectioDbVoalle;

    $servidor= $db->getServer();
    $usuario= $db->getUser();
    $senha = $db->getPass();
    $dbname= $db->getDbName();

    try {
        //code...
        $conn = mysqli_connect($servidor,$usuario,$senha,$dbname);
    } catch (\Throwable $th) {
        //throw $th;
        throw new Error($th);
    }

        if(!$conn){
            die ("Falha na conexão".mysqli_connect_error());
        }
        
?>