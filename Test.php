<?php
$host = "localhost"; // Ваш хост
$port = "5432"; // Порт по умолчанию для PostgreSQL
$dbname = "Shop"; // Имя вашей базы данных
$user = "postgres"; // Ваше имя пользователя
$password = "admin"; // Ваш пароль



$pdo = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $user, $password);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

function test($pdo)
{
    $query = "SELECT data FROM images";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $images = $stmt->fetchAll(PDO::FETCH_ASSOC);


foreach ($images as $image) {
    if($image){
    $data = stream_get_contents($image['data']);
    $data = base64_encode($data);

        }
    }
    return $data;
}
$dataTest = test($pdo);

?>
<div class="col-md-3 mb-4">
    <div class="card">
        <img src="data:image/jpeg;base64,<?php echo $dataTest; ?>" class="card-img-top" alt="Image">
    </div>
</div>