<?php
    include_once('../config/init.php');

    $cssStyle = "../css/advanced_search.css";

    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('advanced_search.tpl');
?>
