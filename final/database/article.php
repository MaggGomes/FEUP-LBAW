<?php

    function getArticlesByCategory($category) {
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                date_part('day', public.article.date) AS articleday,
                                to_char(public.article.date, 'Month') AS articlemonth,
                                date_part('year', public.article.date) AS articleyear,
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
                                date_part('day', public.article.date) AS articleday,
                                to_char(public.article.date, 'Month') AS articlemonth,
                                date_part('year', public.article.date) AS articleyear,
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
                                date_part('day', public.article.date) AS articleday,
                                to_char(public.article.date, 'Month') AS articlemonth,
                                date_part('year', public.article.date) AS articleyear,
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

    function getDailyTopArticle(){
        global $conn;

        $numdays = 1;
        do {
            $stmt = $conn->prepare("SELECT public.rating.idArticle FROM public.rating
                                    LEFT JOIN public.article ON (public.rating.idArticle = public.article.idArticle)
                                    WHERE public.article.visibility = ? AND date_part('day', age(localtimestamp, public.rating.date)) <= $numdays
                                    GROUP BY public.rating.idArticle
                                    ORDER BY SUM(value) DESC
                                    LIMIT 7");
            $stmt->execute(array('Visible'));
            $result = $stmt->fetchAll();
            $numdays++;
        } while (count($result) < 7);

        $article = array();

        for($i = 0; $i < count($result); $i++) {
            $idarticle = $result[$i]['idarticle'];
            $article[$i] = getArticleShortById($idarticle);
        }

        return $article;
    }

    function getArticlesByUser($userId){
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                date_part('day', public.article.date) AS articleday,
                                to_char(public.article.date, 'Month') AS articlemonth,
                                date_part('year', public.article.date) AS articleyear,
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.rating.value AS rating,
                                public.users.photoURL AS userimage
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                LEFT JOIN public.rating ON (public.article.idArticle = public.rating.idArticle AND public.rating.idUser = ?)
                                WHERE public.article.idUser = ? AND public.article.visibility = 'Visible'
                                ORDER BY public.article.date LIMIT 6");

        $stmt->execute(array($_SESSION['id'], $userId));
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

	function getArticlesByTitle($name, $limit, $offset){
		global $conn;
		$stmt = $conn->prepare("SELECT public.article.idArticle AS id,
										public.article.title,
										public.article.category,
										public.users.name,
										date_part('day', public.article.date) AS articleday,
                                        to_char(public.article.date, 'Month') AS articlemonth,
                                        date_part('year', public.article.date) AS articleyear,
										SUM(public.rating.value) AS rating
										FROM public.article
										LEFT JOIN public.users ON (public.article.idUser = public.users.id)
										LEFT JOIN public.rating ON (public.article.idArticle = public.rating.idArticle)
										WHERE public.article.visibility = ? AND LOWER(public.article.title) LIKE LOWER(?)
										GROUP BY public.article.idArticle, public.users.name
										ORDER BY rating DESC
										LIMIT ?
										OFFSET ?");
		$stmt->execute(array('Visible', "%".$name."%", $limit, $offset));
		$match = $stmt->fetchAll();
		return $match;
	}
?>
