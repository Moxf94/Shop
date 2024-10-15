# Shop app

## Описание
Проект-тестовое задание. Создан на PHP+postgres. С 
использованием Javascript, HTML(с использованием bootstrap).

## Установка
Инструкции по установке зависимостей и запуску проекта.

```bash
# Установка доп. ПО
docker desktop

# Запуск приложения
docker-compose up
# Получение ID контейнера(container_id)
docker ps
# Подключение к контейнеру
docker exec -it *container_id* bash
# Установка зависимостей
composer install - композер
composer require --dev phpunit/phpunit - для тестов

# Переходим в папку для запуска тестов
docker-compose exec app bash 
# Запускаем тесты
vendor/bin/phpunit Tests/ComponentControllerTest.php

# Развертывание БД
psql -U postgres -d shop -f db.sql
password:admin