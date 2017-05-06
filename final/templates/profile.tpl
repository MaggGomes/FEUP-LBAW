{include file='common/header.tpl'}

<div class="container">
    <div class="row">
        <div class="profile-head">
            <div class="profiles col-xs-12 col-sm-10 col-sm-push-1 col-md-8 col-md-push-2 thumbnail">
                <div class="col-xs-12 col-sm-3">
                    <div class="row">
                        {if $user.photourl == NULL}
                            <img class="img-responsive" src="{$BASE_URL}upload/user_profile/default.png"/>
                        {else}
                            {if strpos($user.photourl, '://')}
                                <img class="img-responsive" src="{$user.photourl}"/>
                            {else}
                                <img class="img-responsive" src="{$BASE_URL}upload/user_profile/{$user.photourl}"/>
                            {/if}
                        {/if}
                    </div>
                </div>
                <div class="col-sm-9 profile-description">
                    <div class="row">
                        <span class="col-xs-12"><h2>{$user.name}</h2></span>
                        <div class="col-md-4 col-xs-12 profile-presentation">
                            <div class="row">
                                <div class="col-md-12"><span class="profile-follow">{$user.following}</span> Following &middot; <span class="profile-follow">{$user.followers}</span> Followers</div>
                            </div>
                            <div class="profile-userbuttons">
                                <button type="button" class="btn btn-default"><span class="fa fa-user-plus"> Follow</span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<section class="central profile-central">

    <div class="container profile-articles">
        <div class="row container-category-title">
            <h3 class="col-sm-10 col-sm-push-1 col-md-8 col-md-push-2 ">Articles by {$user.name} <span class="glyphicon glyphicon-menu-down"></span></h3>
        </div>
        <div class="row">
            <div class="col-sm-10 col-sm-push-1 col-md-8 col-md-push-2  profile-article">
                <article class="article-text">
                    <div class="panel panel-default">
                        <div class="panel-body article-text">
                            <div class="page-header">
                                <div class="profile-header-container">
                                    <div class="row">
                                        <div class="col-xs-10">
                                            <div class="profile-header-img">
                                                <img class="img-circle" src="../upload/user_profile/demo-user.png" />
                                            </div>
                                            <div class="article-publisher">
                                                <a href="../pages/read_article.php"><h4 class="article-author">Roy Larsson</h4></a>
                                                <small>March 1</small>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 small-text">
                                            <div class="dropdown horizontal-menu">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                                <ul class="dropdown-menu pull-right" role="menu">
                                                    <li><a href="#"><span class="fa fa-flag" aria-hidden="true"></span> &nbsp;Report article</a></li>
                                                    <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span> &nbsp;Hide article</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h3>Lorem ipsum</h3>
                            <img class="article-image" src="../upload/articles/city.png">
                            <p>Maecenas vulputate luctus nec justo magna, rhoncus a purus quisque justo, vel earum vitae placerat, facilisi nullam.</p>
                        </div>
                        <div class="panel-footer article-footer">
                            <div class="row article-footer-upper">
                                <div class="col-xs-12 small-text">
                                    <span class="glyph-text pull-right">4 comments &middot; 2 shares</span>
                                </div>
                            </div>
                            <div class="row article-footer-lower">
                                <div class="col-xs-5">
                                    <a href="#"><span class="glyphicon glyphicon-thumbs-up"></span><span class="glyph-text"> 30 &nbsp&nbsp</span></a>
                                    <a href="#"><span class="glyphicon glyphicon-thumbs-down"></span><span class="glyph-text"> 10</span></a>
                                </div>
                                <div class="col-xs-7">
                                    <div class="pull-right">
                                        <a href="#"><span class="glyphicon glyphicon-comment"></span><span class="glyph-text"> Comment &nbsp&nbsp</span></a>
                                        <a href="#"><span class="glyphicon glyphicon-share-alt"></span><span class="glyph-text"> Share</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-10 col-sm-push-1 col-md-8 col-md-push-2 profile-article">
                <article class="article-text">
                    <div class="panel panel-default">
                        <div class="panel-body article-text">
                            <div class="page-header">
                                <div class="profile-header-container">
                                    <div class="row">
                                        <div class="col-xs-10">
                                            <div class="profile-header-img">
                                                <img class="img-circle" src="../upload/user_profile/demo-user.png" />
                                            </div>
                                            <div class="article-publisher">
                                                <a href="../pages/read_article.php"><h4 class="article-author">Roy Larsson</h4></a>
                                                <small>March 1</small>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 small-text">
                                            <div class="dropdown horizontal-menu">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                                <ul class="dropdown-menu pull-right" role="menu">
                                                    <li><a href="#"><span class="fa fa-flag" aria-hidden="true"></span> &nbsp;Report article</a></li>
                                                    <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span> &nbsp;Hide article</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h3>Lorem ipsum</h3>
                            <img class="article-image" src="../upload/articles/city.png">
                            <p>Maecenas vulputate luctus nec justo magna, rhoncus a purus quisque justo, vel earum vitae placerat, facilisi nullam.</p>
                        </div>
                        <div class="panel-footer article-footer">
                            <div class="row article-footer-upper">
                                <div class="col-xs-12 small-text">
                                    <span class="glyph-text pull-right">4 comments &middot; 2 shares</span>
                                </div>
                            </div>
                            <div class="row article-footer-lower">
                                <div class="col-xs-5">
                                    <a href="#"><span class="glyphicon glyphicon-thumbs-up"></span><span class="glyph-text"> 30 &nbsp&nbsp</span></a>
                                    <a href="#"><span class="glyphicon glyphicon-thumbs-down"></span><span class="glyph-text"> 10</span></a>
                                </div>
                                <div class="col-xs-7">
                                    <div class="pull-right">
                                        <a href="#"><span class="glyphicon glyphicon-comment"></span><span class="glyph-text"> Comment &nbsp&nbsp</span></a>
                                        <a href="#"><span class="glyphicon glyphicon-share-alt"></span><span class="glyph-text"> Share</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-10 col-sm-push-1 col-md-8 col-md-push-2  profile-article">
                <article class="article-text">
                    <div class="panel panel-default">
                        <div class="panel-body article-text">
                            <div class="page-header">
                                <div class="profile-header-container">
                                    <div class="row">
                                        <div class="col-xs-10">
                                            <div class="profile-header-img">
                                                <img class="img-circle" src="../upload/user_profile/demo-user.png" />
                                            </div>
                                            <div class="article-publisher">
                                                <a href="../pages/read_article.php"><h4 class="article-author">Roy Larsson</h4></a>
                                                <small>March 1</small>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 small-text">
                                            <div class="dropdown horizontal-menu">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                                <ul class="dropdown-menu pull-right" role="menu">
                                                    <li><a href="#"><span class="fa fa-flag" aria-hidden="true"></span> &nbsp;Report article</a></li>
                                                    <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span> &nbsp;Hide article</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h3>Lorem ipsum</h3>
                            <img class="article-image" src="../upload/articles/city.png">
                            <p>Maecenas vulputate luctus nec justo magna, rhoncus a purus quisque justo, vel earum vitae placerat, facilisi nullam.</p>
                        </div>
                        <div class="panel-footer article-footer">
                            <div class="row article-footer-upper">
                                <div class="col-xs-12 small-text">
                                    <span class="glyph-text pull-right">4 comments &middot; 2 shares</span>
                                </div>
                            </div>
                            <div class="row article-footer-lower">
                                <div class="col-xs-5">
                                    <a href="#"><span class="glyphicon glyphicon-thumbs-up"></span><span class="glyph-text"> 30 &nbsp&nbsp</span></a>
                                    <a href="#"><span class="glyphicon glyphicon-thumbs-down"></span><span class="glyph-text"> 10</span></a>
                                </div>
                                <div class="col-xs-7">
                                    <div class="pull-right">
                                        <a href="#"><span class="glyphicon glyphicon-comment"></span><span class="glyph-text"> Comment &nbsp&nbsp</span></a>
                                        <a href="#"><span class="glyphicon glyphicon-share-alt"></span><span class="glyph-text"> Share</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-10 col-sm-push-1 col-md-8 col-md-push-2  profile-article">
                <article class="article-text">
                    <div class="panel panel-default">
                        <div class="panel-body article-text">
                            <div class="page-header">
                                <div class="profile-header-container">
                                    <div class="row">
                                        <div class="col-xs-10">
                                            <div class="profile-header-img">
                                                <img class="img-circle" src="../upload/user_profile/demo-user.png" />
                                            </div>
                                            <div class="article-publisher">
                                                <a href="../pages/read_article.php"><h4 class="article-author">Roy Larsson</h4></a>
                                                <small>March 1</small>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 small-text">
                                            <div class="dropdown horizontal-menu">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                                <ul class="dropdown-menu pull-right" role="menu">
                                                    <li><a href="#"><span class="fa fa-flag" aria-hidden="true"></span> &nbsp;Report article</a></li>
                                                    <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span> &nbsp;Hide article</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h3>Lorem ipsum</h3>
                            <img class="article-image" src="../upload/articles/city.png">
                            <p>Maecenas vulputate luctus nec justo magna, rhoncus a purus quisque justo, vel earum vitae placerat, facilisi nullam.</p>
                        </div>
                        <div class="panel-footer article-footer">
                            <div class="row article-footer-upper">
                                <div class="col-xs-12 small-text">
                                    <span class="glyph-text pull-right">4 comments &middot; 2 shares</span>
                                </div>
                            </div>
                            <div class="row article-footer-lower">
                                <div class="col-xs-5">
                                    <a href="#"><span class="glyphicon glyphicon-thumbs-up"></span><span class="glyph-text"> 30 &nbsp&nbsp</span></a>
                                    <a href="#"><span class="glyphicon glyphicon-thumbs-down"></span><span class="glyph-text"> 10</span></a>
                                </div>
                                <div class="col-xs-7">
                                    <div class="pull-right">
                                        <a href="#"><span class="glyphicon glyphicon-comment"></span><span class="glyph-text"> Comment &nbsp&nbsp</span></a>
                                        <a href="#"><span class="glyphicon glyphicon-share-alt"></span><span class="glyph-text"> Share</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>

    </div>
</section>



{include file='common/footer.tpl'}