<?php
declare(strict_types = 1);

namespace Models;

use Config\Database;

class Components{
    private $db;

    public function __construct(){
        $this->db = (new Database())->connect();
    }
    public function getAllComponents(): false|array
    {
        $query = ("SELECT * FROM pc_components ORDER BY component_id");
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function searchComponents($searchTerm): false|array
    {
        $query = "SELECT * FROM pc_components WHERE name ILIKE :searchTerm"; // Используем ILIKE для нечувствительного поиска
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':searchTerm', '%' . $searchTerm . '%', \PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll(); // Возвращает массив найденных записей
    }
    public function getImages(): false|array{
        $query = ("SELECT * FROM images ORDER BY id ");
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
