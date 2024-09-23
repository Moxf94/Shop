<?php
function getFilters($type, $conn) {
    $filters = [];

    // Получаем уникальные значения для производителей
    $sql = "SELECT DISTINCT name FROM products_type";
    $result = pg_query($conn, $sql);
    $filters['name'] = [];
    while ($row = pg_fetch_assoc($result)) {
        $filters['name'][] = $row['name'];
    }

    // Получаем уникальные значения для других категорий, если нужно
    // ...

    return $filters;
}
