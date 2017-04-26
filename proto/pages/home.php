<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    try {
        $dailyTopArticle = getDailyTopArticle();
        $articlesWorld = getArticlesByCategory('World');
        $articlesSports = getArticlesByCategory('Sports');
        $articlesTechnology = getArticlesByCategory('Technology');
        $articlesPolitics = getArticlesByCategory('Politics');
        $articlesCulture = getArticlesByCategory('Culture');
        $articlesScience = getArticlesByCategory('Science');
        $articlesMiscellaneous = getArticlesByCategory('Miscellaneous', 0, 6);
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
