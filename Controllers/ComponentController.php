<?php
declare(strict_types = 1);

namespace Controllers;

use Models\Components;

class ComponentController
{
    public function index(): void
    {
        $model = new Components();

        // Проверяем, есть ли запрос на поиск
        if (isset($_GET['search']) && !empty(trim($_GET['search']))) {
            $searchTerm = trim($_GET['search']);
            $components = $model->searchComponents($searchTerm); // Используем метод поиска
        } else {
            $components = $model->getAllComponents(); // Получаем все компоненты
        }
        $images = $model->getImages();

        include __DIR__ . '/../views/index.php';
    }
}