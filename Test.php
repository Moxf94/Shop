<?php
$host = 'localhost';
$db = 'Shop'; // Замените на имя вашей базы данных
$user = 'postgres';     // Замените на ваше имя пользователя
$pass = 'admin';     // Замените на ваш пароль

try {
    $pdo = new PDO("pgsql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Ошибка подключения: " . $e->getMessage();
}
$sql = "SELECT * FROM pc_components"; // Ваш SQL-запрос
$stmt = $pdo->prepare($sql);
$stmt->execute();

$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($results as $row) {
    echo "Название: " . htmlspecialchars($row['name']) . "<br>";
}

