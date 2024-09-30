<?php
declare(strict_types = 1);

namespace Controller;

use Model\Components;

class ComponentController
{
    public function index(): void
    {
        $model = new Components();

        // Проверяем, есть ли запрос на поиск
        if (isset($_GET['search']) && !empty(trim($_GET['search']))) {
            $searchTerm = trim($_GET['search']);
            $products = $model->searchComponents($searchTerm); // Используем метод поиска
            $properties = $model->getProperties($searchTerm);
        } else {
            $products = $model->getAllComponents(); // Получаем все компоненты
        }
        $images = $model->getImages();
        include __DIR__ . '/../view/index.php';
    }
}