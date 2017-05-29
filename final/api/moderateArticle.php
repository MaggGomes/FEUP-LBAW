<?php
    include_once("../config/init.php");
    include_once("../database/article.php");

    $idarticle = $_POST['idarticle'];
    $idreport = $_POST['idreport'];
    $reportstate = $_POST['reportstate'];
    $articlevisibility = $_POST['articlevisibility'];

    moderateArticle($idarticle, $idreport, $reportstate, $articlevisibility);
?>
