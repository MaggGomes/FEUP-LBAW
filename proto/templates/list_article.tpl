<article class="col-md-4 article-text">
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
                                <a href="../pages/article.php"><h4 class="article-author">Clark Muller</h4></a>
                                <small>March 1</small>
                            </div>
                        </div>
                        <div class="col-xs-2 small-text">
                            <div class="dropdown horizontal-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li><a href="#report-article" data-toggle="modal"><span class="fa fa-flag" aria-hidden="true"></span> &nbsp;Report article</a></li>
                                    <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span> &nbsp;Hide article</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="{$BASE_URL}pages/article.php?id={$article[$i].id}" class="article-title"><h4>{$article[$i].title}</h4></a>
            <img class="article-image article-image-small" src="../upload/articles/{$article[$i].imageurl}">
            <div class="article-abstract">
                <p>{$article[$i].abstract}</p>
            </div>
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