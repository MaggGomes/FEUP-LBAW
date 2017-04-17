<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    $articles = getAllArticles();

    echo $articles[0];

    $cssStyle = "../css/home.css";

    //$smarty->assign('cssStyle', $cssStyle);
    //$smarty->display('home.tpl');
?>
