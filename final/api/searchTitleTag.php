<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    $search = $_GET["name"];
	$limit = $_GET["limit"];
	$offset = $_GET["offset"];

    $titles = getArticlesByTitle($search, $limit, $offset);

    $smarty->assign('articles', $titles);
	$output = $smarty->fetch("list_articles.tpl");
    echo $output;
 ?>
