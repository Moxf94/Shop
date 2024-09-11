<?php require_once 'ConnectDB.php';
$db = new ConnectDB('localhost','shop', 'postgres', 'admin');
$imageData = $db->fetchALL("SELECT data FROM images ORDER BY id");
$names = $db->fetchALL("SELECT name, description FROM pc_components ORDER BY component_id")?>


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
<!--    --><?php //for ($i = 0; $i < count($imageData); $i++) : ?>
    <?php foreach ($imageData as $index => $image): ?>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="image-container">
                <img src="<?php echo htmlspecialchars($image['data'])  ?>" class="card-img-to img-fluid" alt="...">
                    </div>
                <div class="card-body">
                   <h5 class="card-title"><?php echo htmlspecialchars($names[$index]['name']); ?> </h5>
                   <p class="card-text"><?php echo htmlspecialchars($names[$index]['description']); ?></p>
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