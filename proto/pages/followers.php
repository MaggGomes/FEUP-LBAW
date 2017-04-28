<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');

    try{
        $info = accountInfo($_SESSION["id"]);
		$followers = getFollowers($_SESSION["id"]);
    }catch(Exception $err){
        die($err);
    }

	$smarty->assign('follows', $followers);
    $smarty->assign('info', $info);
    $smarty->display('following.tpl');
?>
