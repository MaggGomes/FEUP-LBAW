<?php
    include_once('../config/init.php');

    $cssStyle = "../css/profile.css";

    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('profile.tpl');
?>