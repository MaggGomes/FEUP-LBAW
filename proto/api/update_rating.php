<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/rating.php');

    try {
        createRating($_POST['value'], $_POST['date'], $_POST['idArticle'], $_SESSION['id']);
    } catch (PDOException $e) {
        die($e->getMessage());
    }


?>