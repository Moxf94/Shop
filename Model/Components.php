<?php
declare(strict_types = 1);

namespace Model;

use Config\Database;

class Components{
    private $db;

    public function __construct(){
        $this->db = (new Database())->connect();
    }
    public function getAllComponents(): false|array
    {
        $query = ("SELECT * FROM products ORDER BY id");
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function searchComponents($searchTerm): false|array
    {
        $query = "SELECT * FROM products WHERE name ILIKE :searchTerm"; // Используем ILIKE для нечувствительного поиска
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':searchTerm', '%' . $searchTerm . '%', \PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll(); // Возвращает массив найденных записей
    }
    public function getImages(): false|array{
        $query = ("SELECT * FROM images ORDER BY product_id ");
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function getProperties($searchTerm): false|array
    {
        $query = ("SELECT DISTINCT pr.name, pp.value
FROM properties pr
         JOIN product_type_properties ptp ON pr.id = ptp.property_id
         JOIN product_types pt ON ptp.product_type_id = pt.id
         JOIN product_properties pp ON pr.id = pp.property_id
         JOIN products p ON pp.product_id = p.id
WHERE pt.name = p.type
  AND p.name ILIKE :searchTerm");
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':searchTerm', '%' . $searchTerm . '%', \PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
