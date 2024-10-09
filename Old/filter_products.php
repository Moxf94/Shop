<?php
// Пример массива товаров
$products = [
    ['id' => 1, 'name' => 'Товар 1', 'category' => 1, 'price' => 100],
    ['id' => 2, 'name' => 'Товар 2', 'category' => 2, 'price' => 200],
    ['id' => 3, 'name' => 'Товар 3', 'category' => 1, 'price' => 150],
    ['id' => 4, 'name' => 'Товар 4', 'category' => 2, 'price' => 250],
];

// Получаем данные из запроса
$categories = $_POST['categories'] ?? [];
$prices = $_POST['prices'] ?? [];

// Фильтруем товары
$filteredProducts = array_filter($products, function($product) use ($categories, $prices) {
    $categoryMatch = empty($categories) || in_array($product['category'], $categories);
    $priceMatch = empty($prices) || in_array($product['price'], $prices);
    return $categoryMatch && $priceMatch;
});

// Выводим отфильтрованные товары
foreach ($filteredProducts as $product) {
    echo '<div>';
    echo '<h3>' . htmlspecialchars($product['name']) . '</h3>';
    echo '<p>Категория: ' . htmlspecialchars($product['category']) . '</p>';
    echo '<p>Цена: ' . htmlspecialchars($product['price']) . '</p>';
    echo '</div>';
}
?>