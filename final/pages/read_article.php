<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    try {
        $article = getArticleById($_GET['id']);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $smarty->assign('article', $article);
    $smarty->display('read_article.tpl');
?>