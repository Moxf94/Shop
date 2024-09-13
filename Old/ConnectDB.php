<?php

namespace Old;
class ConnectDB
{

// Подключение к базе данных
    private $host = 'localhost';
    private $db = 'shop';
    private $user = 'postgres';
    private $pass = 'admin';
    private $connection;


    public function __construct($host, $db, $user, $pass)
    {
        $this->host = $host;
        $this->db = $db;
        $this->user = $user;
        $this->pass = $pass;
        $this->connect();
    }

    private function connect()
    {
        try {
            $this->connection = new PDO("pgsql:host=$this->host;dbname=$this->db", $this->user, $this->pass);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Connected successfully";
        } catch (PDOException $e) {
            echo "Connected error" . $e->getMessage();
        }
    }

    public function getConnection()
    {
        return $this->connection;
    }

    public function executeQuery($query, $params = [])
    {
        $stmt = $this->connection->prepare($query);
        $stmt->execute($params);
        return $stmt;
    }

    public function fetchALL($query, $params = [])
    {
        $stmt = $this->executeQuery($query, $params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}