<?php
    include_once('../config/init.php');

    $cssStyle = "../css/article.css";

    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('article.tpl');
?>