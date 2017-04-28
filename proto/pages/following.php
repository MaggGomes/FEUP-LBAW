<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');

    try{
        $info = accountInfo($_SESSION["id"]);
		$following = getFollowing($_SESSION["id"]);
    }catch(Exception $err){
        die($err);
    }

	$smarty->assign('follows', $following);
    $smarty->assign('info', $info);
    $smarty->display('following.tpl');
?>
