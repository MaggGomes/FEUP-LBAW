<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    try {
        if (isset($_SESSION["id"]))
            $article = getArticleByIdUser($_GET['id'], $_SESSION["id"]);
        else
            $article = getArticleById($_GET['id']);

    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $cssStyle = "../css/article.css";

    $smarty->assign('article', $article);
    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('read_article.tpl');
?>