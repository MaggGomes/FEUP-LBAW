<div class="panel panel-default">
    <div class="panel-body article-text">
        <div class="page-header">
            <div class="profile-header-container">
                <div class="row">
                    <div class="col-xs-10">
                        <div class="profile-header-img">
                            {if $article.userimage == NULL}
                                <img class="img-circle" src="{$BASE_URL}upload/user_profile/default.png"/>
                            {else}
                                <img class="img-circle" src="{$BASE_URL}upload/user_profile/{$article.userimage}"/>
                            {/if}
                        </div>
                        <div class="article-publisher">
                            <a href="{$BASE_URL}pages/profile.php?id={$article.userid}"><h4 class="article-author">{$article.username}</h4></a>
                            <small>March 1</small>
                        </div>
                    </div>
                    <div class="col-xs-2 small-text">
                        <div class="dropdown horizontal-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                            <ul class="dropdown-menu pull-right" role="menu">
                                <li><a href="#report-article" data-toggle="modal"><span class="fa fa-flag" aria-hidden="true"></span>
                                        &nbsp;Report article</a></li>
                                <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span> &nbsp;Hide article</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {if $article.content == NULL}
            <a href="{$BASE_URL}pages/read_article.php?id={$article.id}" class="article-title"><h4>{$article.title}</h4>
            </a>
            <img class="article-image article-image-small" src="../upload/articles/{$article.articleimage}">
            <div class="article-abstract">
                <p>{$article.abstract}</p>
            </div>
        {else}
            <h3>{$article.title}</h3>
            <img class="article-image" src="../upload/articles/{$article.articleimage}">
            <p>{$article.content}</p>
        {/if}
    </div>
    <div class="panel-footer article-footer">
        <div class="row article-footer-upper">
            <div class="col-xs-12 small-text">
                <span class="glyph-text pull-right">4 comments &middot; 2 shares</span>
            </div>
        </div>
        <div class="row article-footer-lower">
            <div class="col-xs-5">
                <a href="#" class="thumbs-up" data-value="{$article.id}"><span class="glyphicon glyphicon-thumbs-up"></span><span
                            class="glyph-text"> {$article.upvotes} &nbsp&nbsp</span></a>
                <a href="#" class="thumbs-down" data-value="{$article.id}"><span class="glyphicon glyphicon-thumbs-down"></span><span
                            class="glyph-text"> {$article.downvotes}</span></a>
            </div>
            <div class="col-xs-7">
                <div class="pull-right">
                    <a href="#"><span class="glyphicon glyphicon-comment"></span><span class="glyph-text"> Comment &nbsp&nbsp</span></a>
                    <a href="#"><span class="glyphicon glyphicon-share-alt"></span><span
                                class="glyph-text"> Share</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
