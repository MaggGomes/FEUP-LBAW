<?php

    function getAllArticles() {
        global $conn;

        $stmt = $conn->prepare("SELECT * FROM public.article");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function getArticlesByCategory($category) {
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.date AS articledate,
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.users.photoURL AS userimage
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                LEFT JOIN public.rating ON (public.article.idArticle = public.rating.idArticle AND public.rating.idUser = ?)
                                WHERE public.article.category = ? AND public.article.visibility = ?
                                ORDER BY public.article.date LIMIT 6");

        $stmt->execute(array($_SESSION['id'], $category, 'Visible'));
        $articles = $stmt->fetchAll();

        foreach ($articles as &$article) {

            $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = 1");

            $stmt->execute(array($article['id']));
            $result = $stmt->fetch();

            $article['upvotes'] = $result['upvotes'];

            $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = -1");

            $stmt->execute(array($article['id']));
            $result = $stmt->fetch();

            $article['downvotes'] = $result['downvotes'];
        }

        return $articles;
    }

    function getArticleById($id){
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.content AS content,
                                public.article.date AS articledate,
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.users.photoURL AS userimage,
                                public.rating.value AS rating
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                LEFT JOIN public.rating ON (public.article.idArticle = public.rating.idArticle AND public.rating.idUser = ?)
                                WHERE public.article.idArticle = ?");

        $stmt->execute(array($_SESSION['id'], $id));
        $article = $stmt->fetch();

        $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = 1");

        $stmt->execute(array($article['id']));
        $result = $stmt->fetch();

        $article['upvotes'] = $result['upvotes'];

        $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = -1");

        $stmt->execute(array($article['id']));
        $result = $stmt->fetch();

        $article['downvotes'] = $result['downvotes'];

        return $article;
    }

    function getArticleShortById($id){
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.date AS articledate,
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.users.photoURL AS userimage,
                                public.rating.value AS rating
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                LEFT JOIN public.rating ON (public.article.idArticle = public.rating.idArticle AND public.rating.idUser = ?)
                                WHERE public.article.idArticle = ?");

        $stmt->execute(array($_SESSION['id'], $id));
        $article = $stmt->fetch();

        $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = 1");

        $stmt->execute(array($article['id']));
        $result = $stmt->fetch();

        $article['upvotes'] = $result['upvotes'];

        $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = -1");

        $stmt->execute(array($article['id']));
        $result = $stmt->fetch();

        $article['downvotes'] = $result['downvotes'];

        return $article;

    }

    //TODO not done yet
    function getTopArticle(){

        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.content AS content,
                                public.article.date AS articledate,
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.users.photoURL AS userimage,
                                public.rating.value AS rating
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                LEFT JOIN public.rating ON (public.article.idArticle = public.rating.idArticle AND public.rating.idUser = ?)
                                WHERE public.article.idArticle = ?");

        $stmt->execute();
        return $stmt->fetchAll();
    }

    function getDailyTopArticle(){
        global $conn;

        $numdays = 1;
        do {
            $stmt = $conn->prepare("SELECT idArticle FROM rating
                                    WHERE date_part('day', age(localtimestamp, date)) <= $numdays
                                    GROUP BY idArticle
                                    ORDER BY SUM(value) DESC
                                    LIMIT 7");
            $stmt->execute();
            $result = $stmt->fetchAll();
            $numdays++;
        } while (count($result) < 7);

        $article = array();

        $i = 0;
        $idarticle = $result[$i]['idarticle'];
        $article[$i] = getArticleById($idarticle);

        for($i = 1; $i < count($result); $i++) {
            $idarticle = $result[$i]['idarticle'];

            $article[$i] = getArticleShortById($idarticle);
        }

        /*$idarticle = $result[0]['idarticle'];

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.content AS content,
                                public.article.date AS articledate,
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.users.photoURL AS userimage
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                WHERE public.article.idArticle = ?");

        $stmt->execute(array($idarticle));

        $article = $stmt->fetch();


        $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = 1");

        $stmt->execute(array($article['id']));
        $result = $stmt->fetch();

        $article['upvotes'] = $result['upvotes'];

        $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = -1");

        $stmt->execute(array($article['id']));
        $result = $stmt->fetch();

        $article['downvotes'] = $result['downvotes'];
*/
        return $article;
    }

    function getDailyTopArticleUser($idUser){
        global $conn;

        $numdays = 1;
        do {
            $stmt = $conn->prepare("SELECT idArticle FROM rating
                                    WHERE date_part('day', age(localtimestamp, date)) <= $numdays
                                    GROUP BY idArticle
                                    ORDER BY SUM(value) DESC
                                    LIMIT 7");
            $stmt->execute();
            $result = $stmt->fetchAll();
            $numdays++;
        } while (count($result) < 7);

        $articles = array();

        $i = 0;
        $idarticle = $result[$i]['idarticle'];
        $articles[$i] = getArticleById($idarticle);

        for($i = 1; $i < count($result); $i++) {
            $idarticle = $result[$i]['idarticle'];

            $articles[$i] = getArticleShortById($idarticle);
        }

        foreach ($articles as &$article) {

            $stmt = $conn->prepare("SELECT public.rating.value AS voted
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.iduser = ?");

            $stmt->execute(array($article['id'], $idUser));
            $result = $stmt->fetch();

            $article['voted'] = $result['voted'];
        }

        return $articles;
    }

	function getArticlesByTitle($name){
		global $conn;
		$stmt = $conn->prepare("SELECT public.article.idArticle,
										public.article.title,
										public.article.category,
										public.users.name
										FROM public.article
										LEFT JOIN public.users ON (public.article.idUser = public.users.id)
										LEFT JOIN public.rating ON (public.article.idArticle = public.rating.idArticle)
										WHERE LOWER(public.article.title) LIKE LOWER(?)
										GROUP BY public.article.idArticle, public.users.name
										ORDER BY SUM(public.rating.value) DESC
										LIMIT 4");
		$stmt->execute(array("%".$name."%"));
		$match = $stmt->fetchAll();
		return $match;
	}
?>
