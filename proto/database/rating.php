<?php
    function createRating($value, $idArticle, $idUser) {
        global $conn;

        $stmt = $conn->prepare("SELECT id, value FROM rating WHERE idArticle = ? AND idUser = ?");
        $stmt->execute(array($idArticle, $idUser));

        $result = $stmt->fetch();
        $oldValue = $result['value'];
        $id = $result['id'];
        if($result){
            if($oldValue != $value){ //changes the new value
                $stmt = $conn->prepare("UPDATE public.rating SET value = ?
                    WHERE public.rating.id = ?");
                $stmt->execute(array($value, $id));
            } else{ //cancels the vote made previously
                $stmt = $conn->prepare("DELETE FROM public.rating WHERE public.rating.id = ?");
                $stmt->execute(array($id));
            }
        } else{
            //in case it doesn't exist
            $stmt = $conn->prepare("INSERT INTO public.rating (value,date,idArticle,idUser) VALUES(?, LOCALTIMESTAMP, ?, ?)");
            $stmt->execute(array($value, $idArticle, $idUser));
        }
    }

    function getRatingByArticleId($id){
        global $conn;

        $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = 1");

        $stmt->execute(array($id));
        $result = $stmt->fetch();

        $article['upvotes'] = $result['upvotes'];

        $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = -1");

        $stmt->execute(array($id));
        $result = $stmt->fetch();

    $article['downvotes'] = $result['downvotes'];

    return $article;
}
?>
