<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');

    $page = $_GET["page"];
    $name = $_GET["name"];
    $minRating = $_GET["minRating"];
    $limit = $_GET["limit"];
    $offset = $_GET["offset"];
    if(!$limit) $limit = 10;
    if(!$offset) $offset = 1;

    try {
        switch ($page) {
            case 'editProfile':
                $info = accountInfo($_SESSION["id"]);
                $smarty->assign('info', $info);
                $filename = "edit_profile.tpl";
                break;
            case 'followers':
                $followers = getFollowers($_SESSION["id"], $name, $minRating, $limit, $offset);
                $smarty->assign('follows', $followers);
                $filename = "followers.tpl";
                break;
            case 'following':
                $following = getFollowing($_SESSION["id"], $name, $minRating, $limit, $offset);
                $smarty->assign('follows', $following);
                $filename = "following.tpl";
                break;
            case 'articlesModerated':
                $moderated = ownModerated($_SESSION["id"], $name, $minRating, $limit, $offset);
                $smarty->assign('moderated', $moderated);
                $filename = "moderated_articles.tpl";
                break;
            case 'delete':
                $filename = "delete.tpl";
                break;
            case 'notifications':
                $filename = "notifications.tpl";
                break;
            case 'statistics':
                break;
            //check if admin
            case 'listUsers':
                $users = getAllUsers($name, $minRating, $limit, $offset);
                $smarty->assign('users', $users);
                $filename = "list_users.tpl";
                break;
            case 'teamManagement':
                break;
            case 'articlesPending':
                break;
            case 'articlesReported':
                break;
            case 'commentsReported':
                break;
            default:
                # code...
                break;
        }

        $output = $smarty->fetch($BASE_DIR . "templates/account/" . $filename);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }

    echo $output;
?>
