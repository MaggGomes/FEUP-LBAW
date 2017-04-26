<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    try {
        $dailyTopArticle = getDailyTopArticle();
        $articlesWorld = array_slice(getArticlesByCategory('World'), 0, 6);
        $articlesSports = array_slice(getArticlesByCategory('Sports'), 0, 6);
        $articlesTechnology = array_slice(getArticlesByCategory('Technology'), 0, 6);
        $articlesPolitics = array_slice(getArticlesByCategory('Politics'), 0, 6);
        $articlesCulture = array_slice(getArticlesByCategory('Culture'), 0, 6);
        $articlesScience = array_slice(getArticlesByCategory('Science'), 0, 6);
        $articlesMiscellaneous = array_slice(getArticlesByCategory('Miscellaneous'), 0, 6);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $articles = array(  'World' => $articlesWorld,
        'Sports' => $articlesSports,
        'Technology' => $articlesTechnology,
        'Politics' => $articlesPolitics,
        'Culture' => $articlesCulture,
        'Science' => $articlesScience,
        'Miscellaneous' => $articlesMiscellaneous);

    $smarty->assign('dailyTopArticle', $dailyTopArticle);
    $smarty->assign('articles', $articles);
    $smarty->display('home.tpl');
?>
