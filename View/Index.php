<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Поисковик</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../Public/Style.css">
</head>
<body>

<div class="container mt-5">
    <div class="row mb-3">
        <div class="col-md-9">
            <div class="search-filters-container">
                <!-- Строка поиска -->
                <form method="GET" action="" class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Поиск комплектующих" name="search" id="search" value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit">Поиск</button>
                    </div>
                </form>
            </div>
            <!-- Результаты поиска -->
            <h5>Результаты поиска</h5>
            <div id="searchResults">
                <?php if (isset($pagination)): ?>
                    <?php foreach ($pagination as $product): ?>
                        <?php
                        // Найдем изображение по имени компонента
                        $imageData = null; // Инициализируем переменную для хранения данных изображения
                        if (isset($images)) {
                            foreach ($images as $image) {
                                if ($image['product_id'] === $product['id']) { // Сравниваем имя изображения с именем компонента
                                    $imageData = $image['data']; // Сохраняем данные изображения
                                    break; // Выходим из цикла, если нашли соответствующее изображение
                                }
                            }
                        }
                        ?>
                        <div class="result-container mb-4">
                            <div class="result-image-container">
                                <?php if ($imageData): ?>
                                    <img src="<?php echo htmlspecialchars($imageData); ?>" class="img-fluid result-image" alt="<?php echo htmlspecialchars($product['name']); ?>">
                                <?php else: ?>
                                    <span>Нет изображения</span>
                                <?php endif; ?>
                            </div>
                            <div>
                                <div class="product-details">
                                    <h5 class="card-title"><?php echo htmlspecialchars($product['type']) ?> <?php echo htmlspecialchars($product['name']); ?></h5>
                                    <?php if (!empty($product['properties'])): ?>
                                        <?php foreach ($product['properties'] as $property): ?>
                                            <p class="card-text"><b><?php echo htmlspecialchars($property['name']); ?>:</b>
                                                <?php echo htmlspecialchars($property['value']); ?></p>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p>Нет данных для отображения.</p>
                <?php endif; ?>
            </div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <?php if (isset($page) && $page > 1): ?>
                        <li class="page-item">
                            <a class="page-link" href="?page=<?php echo $page - 1; ?>">Назад</a>
                        </li>
                    <?php endif; ?>

                    <?php if (isset($total_pages)): ?>
                        <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                            <li class="page-item <?php echo (isset($page) && $i === $page) ? 'active' : ''; ?>">
                                <a class="page-link" href="?page=<?php echo $i; ?>"><?php echo $i; ?></a>
                            </li>
                        <?php endfor; ?>
                    <?php endif; ?>

                    <?php if (isset($page) && isset($total_pages) && $page < $total_pages): ?>
                        <li class="page-item">
                            <a class="page-link" href="?page=<?php echo $page + 1; ?>">Вперед</a>
                        </li>
                    <?php endif; ?>
                </ul>
            </nav>
        </div>
        <?php if (isset($_GET['search']) && !empty(trim($_GET['search'])) && isset($unique_properties)): ?>
        <div class="col-md-3">
            <!-- Контейнер с фильтрами -->
            <div class="filters-box bg-white p-3 border">
                <h5>Фильтры</h5>
                <form method="GET" action="">
                    <input type="hidden" name="search" value="<?php echo htmlspecialchars($_GET['search']); ?>">
                    <?php ?>
                        <?php foreach ($unique_properties as $group => $values): ?>
                            <h6><?php echo htmlspecialchars($group); ?></h6>
                            <?php foreach ($values as $index => $value): ?>
                                <div class="form-check">
                                    <input class="form-check-input filter-checkbox" type="checkbox" name="filters[]" value="<?php echo htmlspecialchars($value); ?>" id="filter_<?php echo $group; ?>_<?php echo $index; ?>" data-group="<?php echo htmlspecialchars($group); ?>"
                                        <?php echo (isset($selected_filters) && in_array($value, $selected_filters)) ? 'checked' : ''; ?>>
                                    <label class="form-check-label" for="filter_<?php echo $group; ?>_<?php echo $index; ?>">
                                        <?php echo htmlspecialchars($value); ?>
                                    </label>
                                </div>
                            <?php endforeach; ?>
                        <?php endforeach; ?>
                    <?php ?>
                    <button type="submit" class="btn btn-primary">Применить фильтры</button>
                </form>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const filterCheckboxes = document.querySelectorAll('.filter-checkbox');

        filterCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const group = this.getAttribute('data-group');
                const otherCheckboxes = document.querySelectorAll(`.filter-checkbox[data-group="${group}"]`);

                if (this.checked) {
                    otherCheckboxes.forEach(otherCheckbox => {
                        if (otherCheckbox !== this) {
                            otherCheckbox.disabled = true;
                        }
                    });
                } else {
                    otherCheckboxes.forEach(otherCheckbox => {
                        otherCheckbox.disabled = false;
                    });
                }
            });
        });
    });
</script>

</body>
</html>
