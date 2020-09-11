<?php 


class connectioDbVoalle {
    private $server = '';
    private $user = '';
    private $pass = '';
    private $dbName = 'dbemp00250';

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
