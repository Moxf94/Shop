<?php
require_once 'autoload.php';
#require_once '/../vendor/autoload.php';

use Controller\ComponentController;

$controller = new ComponentController();
$controller->index();
