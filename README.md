# Shop app

## Описание
Проект-тестовое задание. Создан на PHP+postgres. С 
использованием Javascript, HTML(с использованием bootstrap).

## Установка
Инструкции по установке зависимостей и запуску проекта.

```bash
# Установка зависимостей
composer install
composer require --dev phpunit/phpunit

# Запуск тестов
docker-compose exec app bash 
vendor/bin/phpunit Tests/ComponentControllerTest.php

# Установка доп. ПО
docker desktop

# Запуск приложения
docker-compose up

# Развертывание БД
psql -U postgres -d shop -f db.sql
password:admin