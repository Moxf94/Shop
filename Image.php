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
    // Запрос для извлечения изображений
    $query = "SELECT id, data FROM images";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $images = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $imageData = [];
        foreach ($images as $image) {
            if(is_string([$image['data']])) {
                $imageData[] = base64_encode($image['data']);
            }
        }
    return $imageData;
}
function getNamesFromDb($pdo) {
    $stmt = $pdo->prepare("SELECT name, description FROM pc_components"); // Измените на вашу таблицу
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC); // Возвращаем все найденные имена
}
$names= getNamesFromDb($pdo);
$imageData = getImagesFromdb($pdo);
    foreach ($imageData as $data) {
        if($data !== null){
            ?>
            <div class="col-md-3 mb-4"> <!-- Измените col-md-3 на нужный размер -->
                        <div class="card">
                            <img src="data:image/jpeg;base64,<?php echo $data; ?>" class="card-img-top" alt="Image">
                        </div>
                    </div>
<?php }} ?>
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
    <?php foreach ($names as $value): ?>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mb-4">
                <img src="" class="card-img-top" alt="...">
                <div class="card-body">
                   <h5 class="card-title"><?php echo htmlspecialchars($value['name']); ?> </h5>
                   <p class="card-text"><?php echo htmlspecialchars($value['description']); ?></p>
                </div>
            </div>
        </div>
    </div>
    <?php endforeach; ?>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>