<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');
    include_once($BASE_DIR .'database/comment.php');

    try {
        $article = getArticleById($_GET['id']);
        $comments = getArticleComments($_GET['id']);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $smarty->assign('article', $article);
    $smarty->assign('comments', $comments);
    $smarty->display('read_article.tpl');
?>
