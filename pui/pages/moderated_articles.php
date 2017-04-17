<?php
    session_start();

    $cssStyle = "../styles/account.css";

    require('../templates/header.php');
    require('../templates/moderated_articles.php');
    require('../templates/footer.php');
?>