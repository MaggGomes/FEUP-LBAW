<?php
    include_once('../config/init.php');

    $cssStyle = "../css/home.css";

    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('home.tpl');
?>
