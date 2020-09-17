<?php

use function PHPSTORM_META\type;

// $servidor="177.126.240.61:3306";
//     $usuario="NewVersion";
//     $senha="FuARlWRUBGTRgJZw";
//     $dbname="controle_ativacao";

$servidor="localhost:3306";
    $usuario="root";
    $senha="admin";
    $dbname="controleativacao";

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