<?php
$host = 'localhost';
$db = 'shop'; // Замените на имя вашей базы данных
$user = 'postgres';     // Замените на ваше имя пользователя
$pass = 'admin';     // Замените на ваш пароль

$conn = new PDO("pgsql:host=$host;dbname=$db", $user, $pass);

// Запрос к базе данных
$stmt = $conn->prepare("SELECT image FROM pc_components");
$stmt->execute();

$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
foreach ($results as $result) {
   $s = $result['image'];
}
?>
<!--<!DOCTYPE html>-->
<!--<html lang="ru">-->
<!--<head>-->
<!--    <meta charset="UTF-8">-->
<!--    <title>Вывод изображения</title>-->
<!--</head>-->
<!--<body>-->
<?php //if ($s): ?>
<!--    <img src="--><?php //= htmlspecialchars($s) ?><!--" alt="Изображение">-->
<?php //else: ?>
<!--    <p>Изображение не найдено.</p>-->
<?php //endif; ?>
<!--</body>-->
<!--</html>-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<body>
<div class="card" style="width: 20rem;">
    <?php if ($s): ?>
<img src="<?= htmlspecialchars($s) ?>" class="card-img-top" alt="Картинка" width="75" height="150">
    <?php endif; ?>
<div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
</div>
</div>

</body>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>