<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');
    include_once($BASE_DIR .'database/article.php');

    $id = $_GET['id'];

    try {
        $user = accountInfo($id);
        $articles = getArticlesByUser($id);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $smarty->assign('articles', $articles);
    $smarty->assign('user', $user);
    $smarty->display('profile.tpl');
?>