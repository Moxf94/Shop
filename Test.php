<?php
$host = "localhost"; // Ваш хост
$port = "5432"; // Порт по умолчанию для PostgreSQL
$dbname = "Shop"; // Имя вашей базы данных
$user = "postgres"; // Ваше имя пользователя
$password = "admin"; // Ваш пароль



$pdo = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $user, $password);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


$query = "SELECT data FROM images";
$stmt = $pdo->prepare($query);
$stmt->execute();
$images = $stmt->fetchAll(PDO::FETCH_ASSOC);


//// Вывод изображений
//foreach ($images as $image) {
//// Проверяем, что данные изображения существуют
//    if (isset($image['data'])) {
//        // Получаем путь к изображению
//        $imagePath = $image['data'];
//    }




?>
<div class="col-md-3 mb-4">
    <div class="card">
        <?php foreach ($images as $image): ?>
        <img src="<?php echo $image['data'] ; ?>" class="card-img-top" alt="Image">
    </div>
</div>
<?php endforeach; ?>