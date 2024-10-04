<?php
declare(strict_types=1);

namespace Controller;

use Model\Components;

class ComponentController
{
    public function index(): void
    {
        $model = new Components();
        $selected_filters = $_GET['filters'] ?? [];
        $searchTerm = $_GET['search'] ?? '';
        $limit = 5; // Количество продуктов на странице
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $offset = ($page - 1) * $limit;
        $productType = $_GET['search'] ?? '';
        #var_dump($productType);
//        var_dump($selected_filters);

        // Получение продуктов с учетом поиска
        $pagination = $this->getProducts($model, $selected_filters, $searchTerm, $offset, $limit, $productType);

        #$filter = $this->filterComponents($selected_filters,$productType,$model);
        // Получаем общее количество продуктов
        $count_pagination = $model->getTotalCount();
        $total_pages = ceil($count_pagination / $limit);

        // Получаем уникальные свойства для фильтрации
        $unique_properties = $this->getUniqueProperties($pagination, $model);

        // Получаем изображения продуктов
        $images = $model->getImages();

        // Получаем детали для каждого продукта
        foreach ($pagination as $key => $product) {
            $pagination[$key]['properties'] = $model->getPropertiesDetails($product['id']);
        }

        include __DIR__ . '/../View/index.php';
    }

    protected function getProducts(Components $model, array $selected_filters, string $searchTerm, int $offset, int $limit): array
    {
        if (!empty(trim($searchTerm))) {
            return $model->getComponentsPagination($offset, $limit, $searchTerm);
        } elseif (!empty($selected_filters)) {

            var_dump($selected_filters);

            return $model->filterComponents($selected_filters, $searchTerm);
        }

        // Если searchTerm пуст, получаем все компоненты
        return $model->getComponentsPagination($offset, $limit);
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
        $unique_properties = [];
        foreach ($properties as $group => $values) {
            $unique_properties[$group] = array_unique($values);
        }
        return $unique_properties;
    }
}
//    public function filterComponents(array $filters, string $productType, Components $model): false|array
//    {
//        if($filters) {
//            $f = $model->filterComponents($filters, $productType);
//        }
//        // Вывод отладочной информации
//        var_dump('Product Type:', $productType);
//        var_dump($filters);
//       return $f;
//    }
//}