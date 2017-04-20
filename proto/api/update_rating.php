<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/rating.php');

    header('Content-Type: application/json');

    try {
        createRating($_POST['value'], $_POST['date'], $_POST['idArticle'], 1);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $rating = getRatingByArticleId($_POST['idArticle']);

    if($_POST['value'] > 0)
        echo json_encode($rating['upvotes']);
    else
        echo json_encode($rating['downvotes']);
?>