<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/rating.php');

    header('Content-Type: application/json');

    try {
        createRatingComment($_POST['value'], $_POST['idComment'], $_SESSION['id']);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $rating = getRatingByArticleId($_POST['idComment']);

    if($_POST['value'] > 0)
        echo json_encode(1);
    else
        echo json_encode(-1)
?>