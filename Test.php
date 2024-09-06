<?php
$host = "localhost"; // Ваш хост
$port = "5432"; // Порт по умолчанию для PostgreSQL
$dbname = "shop"; // Имя вашей базы данных
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
    $stmt = $conn->prepare("SELECT name,description FROM pc_components"); // Измените на вашу таблицу
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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>Вывод записей</title>
</head>
<body>
<div class="container">
    <div class="row">
        <?php foreach ($names as $record): ?>
            <div class="col-md-4 mb-4"> <!-- Колонка для каждой записи -->
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo htmlspecialchars($record['name']); ?></h5>
                        <p class="card-text"><?php echo htmlspecialchars($record['description']); ?></p>
                        <a href="#" class="btn btn-primary">Действие</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
