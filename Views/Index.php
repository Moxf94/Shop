<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Шаблон сайта</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Public/Style.css">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-9">
            <!-- Строка поиска -->
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Поиск..." aria-label="Поиск" aria-describedby="button-search">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="button" id="button-search">Поиск</button>
                </div>
            </div>

            <!-- Результаты поиска -->
            <h5>Результаты поиска</h5>

            <?php if (isset($components)): ?>
                <?php foreach ($components as $component): ?>
                    <?php
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
                    <div class="result-container mb-4">
                        <div class="result-image-container">
                            <?php if ($imageData): ?>
                                <img src="<?php echo htmlspecialchars($imageData); ?>" class="img-fluid result-image" alt="<?php echo htmlspecialchars($component['name']); ?>">
                            <?php else: ?>
                                <span>Нет изображения</span>
                            <?php endif; ?>
                        </div>
                        <div>
                            <h6 class="card-title"><?php echo htmlspecialchars($component['name']); ?></h6>
                            <p class="card-text"><?php echo htmlspecialchars($component['description']); ?></p>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>Нет данных для отображения.</p>
            <?php endif; ?>
        </div>

        <div class="col-md-3">
            <!-- Контейнер с фильтрами -->
            <div class="filters-container mb-4">
                <div class="filters-box">
                    <h5>Фильтры</h5>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="filter1">
                        <label class="form-check-label" for="filter1">
                            Фильтр 1
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="filter2">
                        <label class="form-check-label" for="filter2">
                            Фильтр 2
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="filter3">
                        <label class="form-check-label" for="filter3">
                            Фильтр 3
                        </label>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>