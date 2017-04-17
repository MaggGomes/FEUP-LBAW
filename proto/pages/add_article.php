<?php
    include_once('../config/init.php');

    $cssStyle = "../css/add_article.css";

    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('add_article.tpl');
?>
