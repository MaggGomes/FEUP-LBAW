<?php
    include_once('../config/init.php');

    header('Content-Type: application/json');

    if (isset($_SESSION['username']))
        echo json_encode(['logged' => true]);
    else
        echo json_encode(['logged' => false]);
?>