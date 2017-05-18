<?php
    include_once('../config/init.php');
    include_once('../database/article.php');

    if(!isset($_GET['id']))
        header('Location: home.php');

    try{
        $article = getArticleById($_GET['id']);
    }catch(Exception $err){
        die($err);
    }

    if($article['userid'] !== $_SESSION['id'])
        console_log("oh belho");

    $smarty->assign('article', $article);
    $smarty->display('edit_article.tpl');
?>
