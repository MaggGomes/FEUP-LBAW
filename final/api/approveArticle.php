<?php
    include_once("../config/init.php");
    include_once("../database/article.php");


    $idarticle = $_POST['idarticle'];

    console_log($idarticle);
    approveArticle($idarticle);
?>
