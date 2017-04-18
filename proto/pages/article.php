<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    $id = $_GET['id'];

    try {
        $article = getArticleById($id);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $cssStyle = "../css/article.css";

    $smarty->assign('article', $article);
    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('article.tpl');
?>