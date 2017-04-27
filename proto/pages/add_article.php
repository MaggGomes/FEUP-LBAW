<?php
    include_once('../config/init.php');

    $addarticlebody = 'addarticlebody';

    $smarty->assign('addarticlebody', $addarticlebody);
    $smarty->display('add_article.tpl');
?>
