<?php
    session_start();

    $cssStyle = "../css/account.css";

    require('../templates/common/header.php');
    require('../templates/moderated_articles.php');
    require('../templates/common/footer.php');
?>