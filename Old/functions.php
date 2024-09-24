<?php
function getFilters($type, $conn) {
    $filters = [];

    // Получаем уникальные значения для производителей
    $sql = "SELECT DISTINCT value FROM products_property";
    $result = pg_query($conn, $sql);
    $filters['name'] = [];
    while ($row = pg_fetch_assoc($result)) {
        $filters['value'][] = $row['value'];
    }

    // Получаем уникальные значения для других категорий, если нужно
    // ...

    return $filters;
}
