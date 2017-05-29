<div class="panel panel-default">
    <div class="panel-body article-text">
        <div class="page-header">
            <div class="profile-header-container">
                <div class="row">
                    <div class="col-xs-10">
                        <div class="profile-header-img" onclick="location.href='{$BASE_URL}pages/profile.php?id={$article.userid}'">
                            {if $article.userimage == NULL}
                                <img class="img-circle" src="{$BASE_URL}upload/user_profile/default.png" />
                            {else}
                                {if strpos($article.userimage, '://')}
                                    <img class="img-circle" src="{$article.userimage}"/>
                                {else}
                                    <img class="img-circle" src="{$BASE_URL}upload/user_profile/{$article.userimage}"/>
                                {/if}
                            {/if}
                        </div>
                        <div class="article-publisher">
                            <a href="{$BASE_URL}pages/profile.php?id={$article.userid}"><h4 class="article-author">{$article.username}</h4></a>
                            <small>{$article.articlemonth} {$article.articleday}, {$article.articleyear}</small>
                        </div>
                    </div>
                    <div class="col-xs-2 small-text">
                        <div class="dropdown horizontal-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                            <ul class="dropdown-menu pull-right" role="menu">
                                {if $smarty.session.id == $article.userid}
                                    <li><a href="edit_article.php?id={$article.id}"><span class="fa fa-pencil-square-o" aria-hidden="true"></span><span class="menu-text"> &nbsp;Edit article</span></a></li>
                                {/if}
                                {if $smarty.session.id == null}
                                  <li><a href="#report-article"  onclick="openRepArticle(false,{$article.id})"><span class="fa fa-flag" aria-hidden="true"></span>
                                {else}
                                  <li><a href="#report-article" data-toggle="modal" onclick="openRepArticle(true,{$article.id})"><span class="fa fa-flag" aria-hidden="true"></span>
                                {/if}
                                        <span class="menu-text"> &nbsp;Report article</span></a></li>
                                <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span><span class="menu-text"> &nbsp;Hide article</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {if $article.content == NULL}
            {if $largeArticleImage == true}
                <a href="{$BASE_URL}pages/read_article.php?id={$article.id}" class="article-title"><h3>{$article.title}</h3>
                </a>
                <img class="article-image" src="../upload/articles/{$article.articleimage}">
                <div class="article-abstract">
                    <p>{$article.abstract}</p>
                </div>
            {else}
                <a href="{$BASE_URL}pages/read_article.php?id={$article.id}" class="article-title"><h4>{$article.title}</h4>
                </a>
                <img class="article-image article-image-small" src="{$BASE_URL}upload/articles/{$article.articleimage}">
                <div class="article-abstract">
                    <p>{$article.abstract}</p>
                </div>
            {/if}
        {else}
            <h3>{$article.title}</h3>
            <img class="article-image" src="{$BASE_URL}upload/articles/{$article.articleimage}">
            <p>{$article.content}</p>
        {/if}
    </div>
    <div class="panel-footer article-footer">
        <div class="row article-footer-upper">
            <div class="col-xs-12 small-text">
                {if $article.numcomments == 1}
                    <span class="glyph-text pull-right">{$article.numcomments} comment <!--&middot; 2 shares--></span>
                {else}
                    <span class="glyph-text pull-right">{$article.numcomments} comments <!--&middot; 2 shares--></span>
                {/if}
            </div>
        </div>
        <div class="row article-footer-lower">
            <div class="col-xs-5">
                {if $smarty.session.id != $article.userid}
                    <div class="thumbs-up small-text {if $article.rating == 1} voted {/if}" data-value="{$article.id}" onclick="changeRating(this, 1, {$smarty.session.id});"><span class="glyphicon glyphicon-thumbs-up"></span>
                        <span> </span><span class="glyph-text">{$article.upvotes}</span><span> &nbsp&nbsp</span></div>
                    <div class="thumbs-down small-text {if $article.rating == -1} voted {/if}" data-value="{$article.id}" onclick="changeRating(this, -1, {$smarty.session.id});"><span class="glyphicon glyphicon-thumbs-down"></span>
                        <span> </span><span class="glyph-text">{$article.downvotes}</span></div>
                {else}
                    <div class="thumbs-up small-text {if $article.rating == 1} voted {/if}" data-value="{$article.id}"><span class="glyphicon glyphicon-thumbs-up"></span>
                        <span> </span><span class="glyph-text">{$article.upvotes}</span><span> &nbsp&nbsp</span></div>
                    <div class="thumbs-down small-text {if $article.rating == -1} voted {/if}" data-value="{$article.id}"><span class="glyphicon glyphicon-thumbs-down"></span>
                        <span> </span><span class="glyph-text">{$article.downvotes}</span></div>
                {/if}
            </div>
            <div class="col-xs-7">
                <div class="pull-right">
                    <a href="{$BASE_URL}pages/read_article.php?id={$article.id}"><span class="glyphicon glyphicon-comment"></span><span class="glyph-text"> Comment &nbsp&nbsp</span></a>
                    <a href="#"><span class="glyphicon glyphicon-share-alt"></span><span class="glyph-text"> Share</span></a>
                </div>
            </div>
        </div>
    </div>
</div>
