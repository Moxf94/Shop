<?php
use Controller\ComponentController;
use Model\Components;
use PHPUnit\Framework\TestCase;

class ComponentControllerTest extends TestCase
{
    protected ComponentController $controller;
    protected Components $model;

    protected function setUp(): void
    {
        $this->controller = new ComponentController();
        $this->model = $this->createMock(Components::class);
    }

    public function testGetProductsWithFilters()
    {
        $filters = ['filter1', 'filter2'];
        $productType = 'someType';
        $this->model->method('filterComponents')->willReturn([]);

        $result = $this->invokeMethod($this->controller, 'getProducts', [$this->model, $productType, 0, 5]);

        $this->assertIsArray($result);
        $this->assertEmpty($result);
    }

    public function testGetProductsWithoutFilters()
    {
        $searchTerm = 'test';
        $this->model->method('getComponentsPagination')->willReturn([]);

        $result = $this->invokeMethod($this->controller, 'getProducts', [$this->model, $searchTerm, 0, 5]);

        $this->assertIsArray($result);
        $this->assertEmpty($result);
    }

    private function invokeMethod($obj, $name, $args)
    {
        $reflection = new ReflectionClass($obj);
        $method = $reflection->getMethod($name);
        return $method->invokeArgs($obj, $args);
    }

    public function testGetProductsWithValidFilters()
    {
        $productType = 'someType'; // Тип продукта
        $filters = ['filter1', 'filter2'];

        // Настраиваем мок для метода модели
        $this->model->method('filterComponents')
            ->with($filters, $productType) // Ожидаем, что вызов будет с фильтрами и типом продукта
            ->willReturn(['product1', 'product2']); // Возвращаем ожидаемый результат

        // Устанавливаем параметры GET
        $_GET['filters'] = $filters; // Устанавливаем фильтры
        $_GET['search'] = $productType; // Устанавливаем тип продукта в строку поиска

        // Вызываем метод контроллера
        $result = $this->invokeMethod($this->controller, 'getProducts', [$this->model, '', 0, 5]);

        // Проверяем, что результат - массив с ожидаемыми продуктами
        $this->assertIsArray($result);
        $this->assertCount(2, $result);
        $this->assertEquals(['product1', 'product2'], $result);
    }

}

