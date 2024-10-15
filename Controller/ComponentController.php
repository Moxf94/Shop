<?php
declare(strict_types=1);

namespace Controller;

use Model\Components;

class ComponentController
{
    public function index(): void
    {
        $model = new Components();
        $searchTerm = $_GET['search'] ?? '';
        $limit = 5; // Количество продуктов на странице
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $offset = ($page - 1) * $limit;


        // Получение товаров с учетом поиска
        $pagination = $this->getProducts($model, $searchTerm, $offset, $limit);

        // Получаем общее количество товаров
        $countPagination = $model->getTotalCount();
        $totalPages = ceil($countPagination / $limit);

        // Получаем уникальные свойства для фильтрации
        $uniqueProperties = $this->getUniqueProperties($pagination, $model);


        // Получаем изображения продуктов
        $images = $model->getImages();

        // Получаем детали для каждого товара
        foreach ($pagination as $key => $product) {
            $pagination[$key]['properties'] = $model->getPropertiesDetails($product['id']);
        }

        include __DIR__ . '/../View/index.php';
    }

    public function getProducts(Components $model, string $searchTerm, int $offset, int $limit): array
    {
        $productType = $_GET['search'] ?? '';
        $selectedFilters = $_GET['filters'] ?? [];

        if (!empty($selectedFilters)) {
            // Вызов метода фильтрации с переданными фильтрами и типом продукта
            return $model->filterComponents($selectedFilters, $productType);
        }
        // Если searchTerm пуст, получаем все компоненты
        return $model->getComponentsPagination($offset, $limit, $searchTerm);
    }

    public function getUniqueProperties(array $products, Components $model): array
    {
        $properties = [];
        foreach ($products as $product) {
            $productProperties = $model->getProperties($product['name']);
            foreach ($productProperties as $property) {
                $properties[$property['name']][] = $property['value'];
            }
        }

        // Уникальные свойства
        $uniqueProperties = [];
        foreach ($properties as $group => $values) {
            $uniqueProperties[$group] = array_unique($values);
        }
        return $uniqueProperties;
    }
}