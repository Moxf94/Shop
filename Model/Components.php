<?php
declare(strict_types = 1);

namespace Model;

use Config\Database;
use PDO;

class Components{
    protected PDO $db;

    public function __construct(){
        $this->db = (new Database())->connect();
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
  AND p.type ILIKE :searchTerm OR p.name ILIKE :searchTerm");
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':searchTerm', '%' . $searchTerm . '%');
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function filterComponents(array $filters, string $productType): false|array
    {
        $query = 'SELECT DISTINCT p.*
                 FROM products p
                  JOIN product_properties pp ON p.id = pp.product_id
                  WHERE p.type = :productType';
        $params = [':productType' => $productType]; // Параметры для запроса

        // Добавляем фильтры
        if (!empty($filters)) {
            foreach ($filters as $filter) {
                $query .= " AND EXISTS (
                            SELECT 1
                            FROM product_properties pp
                            WHERE pp.product_id = p.id
                              AND pp.value ILIKE :filter
                        )";
                $params[":filter"] = '%' . $filter . '%'; // Добавляем фильтры в параметры
            }
        }

        $stmt = $this->db->prepare($query);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
            }

    public function getPropertiesDetails($productId): false|array
    {
        $query = ("SELECT pr.name, pp.value
FROM product_properties pp
         JOIN properties pr ON pp.property_id = pr.id
WHERE pp.product_id = :productId ORDER BY pp.property_id");
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':productId', $productId, PDO::PARAM_INT);
        $stmt->execute([$productId]);

        return  $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getComponentsPagination(int $offset, int $limit, string $searchTerm = null): false|array
    {
        $query = "SELECT * FROM products";
        if ($searchTerm) {
            $query .= " WHERE name ILIKE :searchTerm
            OR type ILIKE :searchTerm"; // Используйте подходящий SQL для поиска
        }
        $query .= " ORDER BY id LIMIT :limit OFFSET :offset";

        $stmt = $this->db->prepare($query);
        if ($searchTerm) {
            $stmt->bindValue(':searchTerm', '%' . $searchTerm . '%');
        }
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function getTotalCount(string $searchTerm = null): int
    {
        $query = "SELECT COUNT(id) FROM products";
        if ($searchTerm) {
            $query .= " WHERE name ILIKE :searchTerm
            OR type ILIKE :searchTerm"; // Используйте подходящий SQL для поиска
        }
        $stmt = $this->db->prepare($query);
        if ($searchTerm) {
            $stmt->bindValue(':searchTerm', '%' . $searchTerm . '%');
        }
        $stmt->execute();
        return (int)$stmt->fetchColumn();
    }

}