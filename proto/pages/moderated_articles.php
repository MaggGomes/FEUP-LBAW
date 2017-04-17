<?php
    include_once('../config/init.php');

    $cssStyle = "../css/account.css";

    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('moderated_articles.tpl');
?>