<?php

use function PHPSTORM_META\type;

// $servidor="177.126.240.61:3306";
//     $usuario="NewVersion";
//     $senha="FuARlWRUBGTRgJZw";
//     $dbname="controle_ativacao";

$servidor="177.52.246.165:3306";
    $usuario="fael_st";
    $senha="Adm#vivas2009sp";
    $dbname="score_control_db";

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