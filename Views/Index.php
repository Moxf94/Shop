<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Комплектующие ПК</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4 text-center">
    <h1>Поиск</h1>

    <!-- Форма поиска -->
    <form method="GET" action="">
        <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Поиск комплектующих" name="search" id="search" value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Поиск</button>
            </div>
        </div>
    </form>
    <div class="container text-center">
        <?php if (isset($components)): ?>
            <?php foreach ($components as $component): ?>
                <?php
                // Найдем изображение по имени компонента
                $imageData = null; // Инициализируем переменную для хранения данных изображения
                if (isset($images)) {
                    foreach ($images as $image) {
                        if ($image['id'] === $component['component_id']) { // Сравниваем имя изображения с именем компонента
                            $imageData = $image['data']; // Сохраняем данные изображения
                            break; // Выходим из цикла, если нашли соответствующее изображение
                        }
                    }
                }
                ?>
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="image-container">
                                <?php if ($imageData): ?>
                                    <img src="<?php echo htmlspecialchars($imageData); ?>" class="card-img-top img-fluid" alt="<?php echo htmlspecialchars($component['name']); ?>" style="max-width: 300px; height: auto">
                                <?php else: ?>
                                    <span>Нет изображения</span>
                                <?php endif; ?>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title"><?php echo htmlspecialchars($component['name']); ?></h5>
                                <p class="card-text"><?php echo htmlspecialchars($component['description']); ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>Нет данных для отображения.</p>
        <?php endif; ?>
    </div>
    </div>
<!---->
<!--    <ul>-->
<!--        --><?php //if (isset($components)): ?>
<!--            --><?php //foreach ($components as $component): ?>
<!--                <li>--><?php //echo htmlspecialchars($component['name']); ?><!-- - --><?php //echo htmlspecialchars($component['description']); ?><!--</li>-->
<!--            --><?php //endforeach; ?>
<!--        --><?php //else: ?>
<!--            <li>Нет комплектующих для отображения.</li>-->
<!--        --><?php //endif; ?>
<!--    </ul>-->
<!--</div>-->
</body>
</html>