<?php
require_once '../autoload.php';

use Controllers\ComponentController;

$controller = new ComponentController();
$controller->index();
