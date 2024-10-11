<?php
declare(strict_types = 1);

namespace Config;

use PDO;
use PDOException;

class Database {
    private string $host = 'db';
    private string $db = 'shop';
    private string $user = 'postgres';
    private string $pass = 'admin';

    public function connect(): ?PDO
    {
        try {
            $connection = new PDO("pgsql:host={$this->host};dbname={$this->db}", $this->user, $this->pass);
            $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $connection;
        } catch (PDOException $e) {
            echo "Ошибка подключения: " . $e->getMessage();
            return null;
        }
    }
}
