<?php
$host = "localhost"; // Ваш хост
$port = "5432"; // Порт по умолчанию для PostgreSQL
$dbname = "Shop"; // Имя вашей базы данных
$user = "postgres"; // Ваше имя пользователя
$password = "admin"; // Ваш пароль

try {
    $conn = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Ошибка подключения: " . $e->getMessage();
    exit;
}

// Функция для извлечения двух имен из базы данных
function getTwoNames($conn) {
    $stmt = $conn->prepare("SELECT name FROM pc_components"); // Измените на вашу таблицу
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC); // Возвращаем все найденные имена
}

// Извлечение имен из базы данных
$names = getTwoNames($conn);

$conn = null; // Закрываем соединение с базой данных
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Имена из БД</title>
</head>
<body>

<!-- Первый HTML-код для первого имени -->
<div>
    <h1>Первое имя:</h1>

    <p><?php echo htmlspecialchars($names[0]['name']); ?></p>
</div>

<!-- Второй HTML-код для второго имени -->
<div>
    <h1>Второе имя:</h1>
    <p><?php echo htmlspecialchars($names[1]['name']); ?></p>
</div>

</body>
</html>
