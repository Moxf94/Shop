<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <title>Поиск на PHP</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Brand</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <form class="d-flex" role="search" method="GET" action="">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="query" id="searchInput">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div class="container mt-3">
    <h2>Результаты поиска:</h2>
    <div id="searchResults">
        <?php
        // Пример массива данных для поиска
        $data = [
            "Apple",
            "Banana",
            "Cherry",
            "Date",
            "Elderberry",
            "Fig",
            "Grape",
            "Honeydew"
        ];

        // Проверка, был ли отправлен запрос
        if (isset($_GET['query'])) {
            // Получаем и обрабатываем поисковый запрос
            $searchTerm = strtolower(trim($_GET['query'])); // Приводим к нижнему регистру и убираем лишние пробелы
            $results = []; // Массив для хранения результатов поиска

            // Поиск по массиву данных
            foreach ($data as $item) {
                // Проверяем, содержится ли поисковый запрос в элементе массива
                if (stripos($item, $searchTerm) !== false) {
                    $results[] = $item; // Добавляем найденный элемент в массив результатов
                }
            }

            // Отображение результатов
            if (!empty($results)) {
                foreach ($results as $result) {
                    echo "<div class='alert alert-info'>$result</div>"; // Выводим каждый найденный элемент
                }
            } else {
                echo "<div class='alert alert-warning'>Ничего не найдено.</div>"; // Сообщение, если ничего не найдено
            }
        }
        ?>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>