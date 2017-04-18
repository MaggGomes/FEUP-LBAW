<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    $articlesWorld = array_slice(getArticlesByCategory('World'), 0, 6);
    $articlesSports = array_slice(getArticlesByCategory('Sports'), 0, 6);
    $articlesTechnology = array_slice(getArticlesByCategory('Technology'), 0, 6);
    $articlesPolitics = array_slice(getArticlesByCategory('Politics'), 0, 6);
    $articlesCulture = array_slice(getArticlesByCategory('Culture'), 0, 6);
    $articlesScience = array_slice(getArticlesByCategory('Science'), 0, 6);
    $articlesMiscellaneous = array_slice(getArticlesByCategory('Miscellaneous'), 0, 6);

    $articles = array('World' => $articlesWorld,
                        'Sports' => $articlesSports,
                        'Technology' => $articlesTechnology,
                        'Politics' => $articlesPolitics,
                        'Culture' => $articlesCulture,
                        'Science' => $articlesScience,
                        'Miscellaneous' => $articlesMiscellaneous);

    $cssStyle = "../css/home.css";

    $smarty->assign('articles', $articles);
    $smarty->assign('cssStyle', $cssStyle);
    $smarty->display('home.tpl');
?>
