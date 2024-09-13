<?php
declare(strict_types = 1);

namespace Config;

use PDO;
use PDOException;

class Database {
    private $host = 'localhost';
    private $db = 'shop';
    private $user = 'postgres';
    private $pass = 'admin';
    private $connection;

    public function connect() {
        try {
            $this->connection = new PDO("pgsql:host={$this->host};dbname={$this->db}", $this->user, $this->pass);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $this->connection;
        } catch (PDOException $e) {
            echo "Ошибка подключения: " . $e->getMessage();
            return null;
        }
    }
}
