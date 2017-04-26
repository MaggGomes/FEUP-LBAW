<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    try {
        if (isset($_SESSION["id"])) {
            $dailyTopArticle = getDailyTopArticleUser($_SESSION["id"]);
            $articlesWorld = getArticlesByCategoryAndUser('World', $_SESSION["id"]);
            $articlesSports = getArticlesByCategoryAndUser('Sports', $_SESSION["id"]);
            $articlesTechnology = getArticlesByCategoryAndUser('Technology', $_SESSION["id"]);
            $articlesPolitics = getArticlesByCategoryAndUser('Politics', $_SESSION["id"]);
            $articlesCulture = getArticlesByCategoryAndUser('Culture', $_SESSION["id"]);
            $articlesScience = getArticlesByCategoryAndUser('Science', $_SESSION["id"]);
            $articlesMiscellaneous = getArticlesByCategoryAndUser('Miscellaneous', $_SESSION["id"]);
        } else {
            $dailyTopArticle = getDailyTopArticle();
            $articlesWorld = getArticlesByCategory('World');
            $articlesSports = getArticlesByCategory('Sports');
            $articlesTechnology = getArticlesByCategory('Technology');
            $articlesPolitics = getArticlesByCategory('Politics');
            $articlesCulture = getArticlesByCategory('Culture');
            $articlesScience = getArticlesByCategory('Science');
            $articlesMiscellaneous = getArticlesByCategory('Miscellaneous');
        }
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $articles = array('World' => $articlesWorld,
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
