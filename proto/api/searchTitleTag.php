<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    $search = $_GET["name"];

    $titles = getArticlesByTitle($search);
    echo json_encode($titles);
 ?>
