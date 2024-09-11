<?php
// Подключение к базе данных
$host = 'localhost';
$db = 'Shop';
$user = 'postgres';
$pass = 'admin';


// Подключение к PostgreSQL через PDO
$dsn = "pgsql:host=$host;dbname=$db;";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    throw new PDOException($e->getMessage(), (int)$e->getCode());
}

//// Проверяем, передан ли параметр 'name' в URL
//if (isset($_GET['name'])) {
//    $name = $_GET['name'];
//
//    // Получение изображения по его ID
//    $stmt = $pdo->prepare('SELECT id, data FROM images WHERE name = :name');
//    $stmt->execute(['name' => $name]);
//    $image = $stmt->fetch();
//

//    if ($image) {
//        // Очищаем буфер вывода
//        ob_clean();
//
//        // Преобразуем данные изображения
//        $data = stream_get_contents($image['data']);
//
//        // Устанавливаем правильный заголовок
//        header('Content-Type: image/png'); // Замените на нужный формат
//
//        // Выводим изображение
//        echo $data;
//        exit;
//     else {
//        echo 'Изображение не найдено';
//    }

function getImagesFromdb($pdo)
{
    $imageDataArray = [];
    // Запрос для извлечения изображений
    $query = "SELECT data FROM images";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $images = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $images;
}

function getNamesFromDb($pdo) {
    $stmt = $pdo->prepare("SELECT name, description FROM pc_components"); // Измените на вашу таблицу
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC); // Возвращаем все найденные имена
}
$names= getNamesFromDb($pdo);
$imageData = getImagesFromdb($pdo);
?>
<style>
    .custom-img {
        width: 150px;  /* Задайте нужную ширину */
        height: 200px; /* Задайте нужную высоту */
        object-fit: cover; /* Это свойство позволяет сохранить пропорции изображения */
    }
</style>


<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Поиск комплектующих для ПК</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5 mb-4">
    <h1 class="text-center">Поиск</h1>
    <form action="search.php" method="GET" class="form-inline justify-content-center">
        <label>
            <input type="text" name="search" class="form-control mr-2" placeholder="Введите название комплектующего" required>
        </label>
        <button type="submit" class="btn btn-primary">Поиск</button>
    </form>
</div>

<div class="container">
    <?php for ($i = 0; $i < count($imageData); $i++) : ?>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mb-4">
                <img src="<?php echo htmlspecialchars($imageData[$i]['data'])  ?>" class="card-img-top custom-img" alt="...">
                <div class="card-body">
                   <h5 class="card-title"><?php echo htmlspecialchars($names[$i]['name']); ?> </h5>
                   <p class="card-text"><?php echo htmlspecialchars($names[$i]['description']); ?></p>
                </div>
            </div>
        </div>
    </div>
    <?php endfor; ?>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>