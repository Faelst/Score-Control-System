<?php 


class connectioDbVoalle {
    private $server = '177.52.245.161:3306';
    private $user = "cliente_s";
    private $pass = "T?JVFu=fc35@";
    private $dbName = "dbemp00250";

    public function getServer(){
        return $this->server;
    }

    public function getUser(){
        return $this->user;
    }

    public function getPass(){
        return $this->pass;
    }
    
    public function getDbName(){
        return $this->dbName;
    }

}
?>
