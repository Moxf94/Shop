<?php
declare(strict_types=1);

namespace Controller;

use Model\Components;

class ComponentController
{
    public function index(): void
    {
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);

        $model = new Components();
        #$selected_filters = $_GET['filters'] ?? [];
        $searchTerm = $_GET['search'] ?? '';
        $limit = 5; // Количество продуктов на странице
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $offset = ($page - 1) * $limit;
        #$productType = $_GET['search'] ?? '';
        #var_dump($productType);
        #var_dump($selected_filters);

        #$products = $model->filterComponents($selected_filters, $productType);
        #echo "Тип продукта: $productType <br>";
        #echo "Фильтры: <pre>" . print_r($selected_filters, true) . "</pre>";


        // Получение продуктов с учетом поиска
        $pagination = $this->getProducts($model, $searchTerm, $offset, $limit);
        #echo "Вызов filteredProducts: <pre>" . print_r($pagination, true) . "</pre>";

        // Получаем общее количество продуктов
        $count_pagination = $model->getTotalCount();
        $total_pages = ceil($count_pagination / $limit);

        // Получаем уникальные свойства для фильтрации
        $unique_properties = $this->getUniqueProperties($pagination, $model);

        #echo "Уникальные свойства: <pre>" . print_r($unique_properties, true) . "</pre>";

        // Получаем изображения продуктов
        $images = $model->getImages();

        // Получаем детали для каждого продукта
        foreach ($pagination as $key => $product) {
            $pagination[$key]['properties'] = $model->getPropertiesDetails($product['id']);
        }

        include __DIR__ . '/../View/index.php';
    }

    protected function getProducts(Components $model, string $searchTerm, int $offset, int $limit): array
    {
        $productType = $_GET['search'] ?? '';
        $selected_filters = $_GET['filters'] ?? [];

//        if (!empty(trim($searchTerm))) {
//             var_dump($model->getComponentsPagination($offset,$limit,$searchTerm)); #return $model->getComponentsPagination($offset, $limit, $searchTerm);
//        }
        if (!empty($selected_filters)) {
            // Вызов метода фильтрации с переданными фильтрами и типом продукта
            return $model->filterComponents($selected_filters, $productType);
        }
        // Если searchTerm пуст, получаем все компоненты
        return $model->getComponentsPagination($offset, $limit, $searchTerm);
    }

        public
        function getUniqueProperties(array $products, Components $model): array
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

