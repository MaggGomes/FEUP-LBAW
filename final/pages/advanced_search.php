<?php
    include_once('../config/init.php');
	include_once($BASE_DIR .'database/article.php');

	$search = $_GET['search'];
	if(!($pageNo = $_GET['pageNo']))
		$pageNo = 0;

	if(!($limit = $_GET['limit']))
		$limit = 10;


	$articles = getArticlesByTitle($search, $limit, $pageNo*$limit);

	$smarty->assign('limit', $limit);
	$smarty->assign('pageNo', $pageNo);
	$smarty->assign('search', $search);
	$smarty->assign('articlesLength', count($articles));
	$smarty->assign('articles', $articles);
    $smarty->display('advanced_search.tpl');
?>
