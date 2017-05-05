<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');

    isLogin($_SESSION["id"]);

    try{
        $info = accountInfo($_SESSION["id"]);
    }catch(Exception $err){
        die($err);
    }

    $smarty->assign('info', $info);
    $smarty->display('account/account.tpl');
?>
