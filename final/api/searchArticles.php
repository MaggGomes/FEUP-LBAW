<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    $search = $_GET["title"];
	$limit = $_GET["limit"];
	$offset = $_GET["offset"];
    $category = $_GET["category"];
    $author = $_GET["author"];
    $content = $_GET["content"];
    $tags = $_GET["tags"];
    $order = $_GET["order"];

    if(!$author) $author = "";
    if(!$search) $search = "";
    if(!$content) $content = "";

    switch ($category) {
        case 1:
            $category = "World";
            break;
        case 2:
            $category = "Sports";
            break;
        case 3:
            $category = "Technology";
            break;
        case 4:
            $category = "Politics";
            break;
        case 5:
            $category = "Culture";
            break;
        case 6:
            $category = "Science";
            break;
        default:
            $category = null;
            break;
    }

    switch ($order) {
        case 1:
            $order = "ORDER BY article.title ASC";
            break;
        case 2:
            $order = "ORDER BY article.title DESC";
            break;
        case 3:
            $order = "ORDER BY rating DESC";
            break;
        case 4:
            $order = "ORDER BY rating ASC";
            break;
        default:
            $order = "ORDER BY article.title ASC";
            break;
    }

    $titles = advancedArticleSearch($search, $category, $author, $content, $tags, $order, $limit, $offset);

    $smarty->assign('articles', $titles);
	$output = $smarty->fetch("advancedResults.tpl");
    echo $output;
 ?>
