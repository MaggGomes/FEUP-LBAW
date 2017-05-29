<?php
    include_once("../config/init.php");
    include_once("../database/article.php");


    $idarticle = $_POST['idarticle'];

    approveArticle($idarticle);
?>
