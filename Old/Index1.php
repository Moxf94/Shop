<?php
include 'functions.php';
include 'db.php';

$type = "Видеокарта"; // Пример выбранной категории
$filters = getFilters($type, $conn);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Фильтры</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Фильтры для <?php echo $type; ?></h1>
    <form method="POST" action="">
        <div class="form-group">
            <label>Производитель</label>
            <?php foreach ($filters['name'] as $manufacturer): ?>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="manufacturer[]" value="<?php echo $manufacturer; ?>" <?php if (isset($_POST['manufacturer']) && in_array($manufacturer, $_POST['manufacturer'])) echo 'checked'; ?>>
                    <label class="form-check-label"><?php echo $manufacturer; ?></label>
                </div>
            <?php endforeach; ?>
        </div>
        <button type="submit" class="btn btn-primary">Применить фильтры</button>
    </form>

    <h2>Результаты</h2>
    <div id="product-list">
        <?php
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            include 'update_products.php';
        }
        ?>
    </div>
</div>
</body>
</html>