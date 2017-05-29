<?php
    include_once 'comment.php';
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

            $article['numcomments'] = getNumberComments($article['id']);
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

        $article['numcomments'] = getNumberComments($id);


        $stmt = $conn->prepare("SELECT tag AS tag FROM tags LEFT JOIN linktag ON tags.id = linktag.idtag
                                                                 WHERE linktag.idarticle = ?");
        $stmt->execute(array($id));
        $tags = $stmt->fetchAll();


        $article['tags'] = $tags;

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

        $article['numcomments'] = getNumberComments($article['id']);

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

    function getMostRecentArticles(){
        global $conn;

        $stmt = $conn->prepare("SELECT article.idArticle AS id,
                                article.title AS title,
                                article.abstract AS abstract,
                                DATE_PART('day', LOCALTIMESTAMP - article.date) AS daydiff,
                                DATE_PART('hour', LOCALTIMESTAMP - article.date) AS hourdiff,
                                DATE_PART('minute', LOCALTIMESTAMP - article.date) AS minutediff
                                FROM public.article
                                WHERE article.visibility = 'Visible'
                                ORDER BY article.date DESC LIMIT 8");

        $stmt->execute();
        $articles = $stmt->fetchAll();

        return $articles;
    }

	function getArticlesByTitle($name, $limit, $offset){
		global $conn;
		$stmt = $conn->prepare("SELECT public.article.idArticle AS id,
										public.article.title,
										public.article.category,
										public.users.photoURL AS userimage,
										public.users.name,
										public.users.id AS userid,
										date_part('day', public.article.date) AS articleday,
                                        to_char(public.article.date, 'Month') AS articlemonth,
                                        date_part('year', public.article.date) AS articleyear,
										SUM(public.rating.value) AS rating
										FROM public.article
										LEFT JOIN public.users ON (public.article.idUser = public.users.id)
										LEFT JOIN public.rating ON (public.article.idArticle = public.rating.idArticle)
										WHERE public.article.visibility = ? AND LOWER(public.article.title) LIKE LOWER(?)
										GROUP BY public.article.idArticle, public.users.name, public.users.id, public.users.photoURL
										ORDER BY rating DESC
										LIMIT ?
										OFFSET ?");
		$stmt->execute(array('Visible', "%".$name."%", $limit, $offset));
		$match = $stmt->fetchAll();
		return $match;
	}

    function getArticleEdit($id){
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.content AS content,
                                public.article.category AS category,
                                public.users.id AS userid
                                FROM public.article
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                WHERE public.article.idArticle = ?");

        $stmt->execute(array($id));
        $article = $stmt->fetch();


        $stmt = $conn->prepare("SELECT tag AS tag FROM tags LEFT JOIN linktag ON tags.id = linktag.idtag
                                                                 WHERE linktag.idarticle = ?");
        $stmt->execute(array($id));
        $tags = $stmt->fetchAll();

        $stringtag;
        foreach ($tags as $tag) {
            $stringtag = $stringtag . ' ' . $tag['tag'];
        }
        $article['tags'] = $stringtag;

        return $article;
    }

    function getReportedArticles($offset){
        global $conn;

        $stmt = $conn->prepare("SELECT article.title AS title,
                                       article.idarticle AS id,
                                       users.photourl AS userimage,
                                       users.name AS user,
                                       users.id AS userid,
                                       report.description AS report,
                                       report.id AS reportid
                                       FROM report JOIN article ON report.idArticle = article.idArticle
                                                   JOIN users ON users.id = report.idUser
                                                   WHERE report.state = ? LIMIT 8");

        $stmt->execute(array("Pending"));
        $articles = $stmt->fetchAll();

        return $articles;
    }

    function getHiddenArticles($offset){

        global $conn;

        $stmt = $conn->prepare("SELECT article.title AS title,
                                       article.idarticle AS id,
                                       users.photourl AS userimage,
                                       users.name AS user,
                                       users.id AS userid
                                       FROM article JOIN users ON users.id = article.iduser
                                       WHERE article.visibility = 'Hidden' LIMIT 8");

        $stmt->execute();
        $articles = $stmt->fetchAll();

        return $articles;
    }

    function uploadArticlePhoto(){
        $name = $_FILES['articlePicture']['name'];

        $target = '../upload/articles/' . $_FILES['articlePicture']['name'];

		if(strpos(mime_content_type($_FILES['articlePicture']['tmp_name']), 'image') === false){
			echo "File uploaded is not an image";
			return false;
		}

		if ($_FILES['articlePicture']['size'] > 1000000) {
            echo 'Sorry, your file is too large.';
			return false;
        }

		if(file_exists($target)){
            $randNumb = rand(0, 10000);
            $name = $randNumb . $_FILES['articlePicture']['name'];
            $target = '../upload/articles/' . $randNumb . $_FILES['articlePicture']['name'];
		}

		if(!move_uploaded_file($_FILES['articlePicture']['tmp_name'], $target)){
			echo "There was an error uploading your file, please try again";
			return false;
		}

		return $name;
    }

    function advancedArticleSearch($search, $category, $author, $content, $tags, $order, $limit, $offset){
        global $conn;
        $params = " WHERE";
        $string = "SELECT article.idArticle AS id, article.title, article.category, users.name,  SUM(rating.value) AS rating FROM article JOIN users ON users.id = article.idUser
            JOIN rating ON rating.idArticle = article.idArticle";


        if($content){
            $params .= " to_tsvector(content) @@ to_tsquery('". $content . "')
            OR to_tsvector(abstract) @@ to_tsquery('". $content . "')
            OR to_tsvector(title) @@ to_tsquery('". $content . "')";
            $has = true;
        }
        if($search){
            if($has)
                $params .= " AND ";
            $params .= " LOWER(title) LIKE LOWER('%".$search ."%')";
            $has = true;
        }
        if($author){
            if($has)
                $params .= " AND ";
            $params .= " LOWER(name) LIKE LOWER('%".$author ."%')";
            $has = true;
        }
        if($category){
            if($has)
                $params .= " AND ";
            $params .= " article.category = '" . $category."'";
            $has = true;
        }
        $group = " GROUP BY article.idArticle, users.id ";
        if($has)
            $string .= $params;
        $string .= $group . $order . " LIMIT ? OFFSET ? ";
        console_log($string);
        console_log($limit);
        console_log($offset);

        $stmt = $conn->prepare($string);
        $stmt->execute(array($limit, ($offset-1)*$limit));
        return $stmt->fetchAll();
        }

        function approveArticle($idArticle){
            global $conn;

            $stmt = $conn->prepare('UPDATE "article" SET visibility = ?
                                           WHERE idarticle = ?');

            $stmt->execute(array("Visible", $idArticle));
            $stmt->fetch();
        }

        function moderateArticle($idarticle, $idreport, $reportstate, $articlevisibility){
            global $conn;

            $stmt = $conn->prepare('UPDATE "article" SET visibility = ?
                                           WHERE idarticle = ?');

            $stmt->execute(array($articlevisibility, $idarticle));
            $stmt->fetch();


            $stmt = $conn->prepare('UPDATE "report" SET state = ?
                                           WHERE id = ?');

            $stmt->execute(array($reportstate, $idreport));
            $stmt->fetch();
        }
?>
