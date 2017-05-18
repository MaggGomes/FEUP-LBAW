<?php
    include_once('../config/init.php');
    include_once('../database/article.php');

    if(!isset($_GET['id']))
        header('Location: home.php');

    try{
        $article = getArticleEdit($_GET['id']);
    }catch(Exception $err){
        die($err);
    }

    if($article['userid'] !== $_SESSION['id'])
        header('Location: home.php');

    $addarticlebody = 'addarticlebody';
    $smarty->assign('addarticlebody', $addarticlebody);
    
    $smarty->assign('article', $article);
    $smarty->display('edit_article.tpl');
?>
