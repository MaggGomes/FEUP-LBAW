<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/rating.php');

    header('Content-Type: application/json');

    try {
        createRatingComment($_POST['value'], $_POST['idComment'], $_SESSION['id']);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

if($_POST['value'] > 0)
    echo json_encode($_POST['idComment']);
else
    echo json_encode($_POST['idComment'])

    /*$rating = getRatingByArticleId($_POST['idArticle']);

    if($_POST['value'] > 0)
        echo json_encode($rating['upvotes']);
    else
        echo json_encode($rating['downvotes'])*/
?>