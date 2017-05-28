<div class="panel panel-default">
    <div class="panel-body article-text">
        <div class="page-header comment-header">
            <div class="profile-header-container">
                <div class="row">
                    <div class="col-xs-10">
                        <div class="profile-header-img">
                            {if $reply.userimage == NULL}
                                <img class="img-circle" src="{$BASE_URL}upload/user_profile/default.png"/>
                            {elseif strpos($reply.userimage, '://')}
                                <img class="img-circle" src="{$reply.userimage}"/>
                            {else}
                                <img class="img-circle" src="{$BASE_URL}upload/user_profile/{$reply.userimage}"/>
                            {/if}
                        </div>
                        <div class="article-publisher">
                            <a href="{$BASE_URL}pages/profile.php?id={$reply.userid}"><h4 class="article-author">{$reply.username}</h4></a>
                            <h4 class="article-author">{$reply.name}</h4>
                            <small>{$reply.commentmonth} {$reply.commentday}, {$reply.commentyear}</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <p>{$reply.text}</p>
    </div>
    <div class="panel-footer article-footer comment-footer">
        <div class="row article-footer-lower comment-footer">
            <div class="col-xs-5">
                <div class="thumbs-up small-text {if $article.rating == 1} voted {/if}" data-value="{$article.id}" onclick=""><span class="glyphicon glyphicon-thumbs-up"></span>
                    <span> </span><span class="glyph-text">{$reply.upvotes}</span><span> &nbsp&nbsp</span></div>
                <div class="thumbs-down small-text {if $article.rating == -1} voted {/if}" data-value="{$article.id}" onclick=""><span class="glyphicon glyphicon-thumbs-down"></span>
                    <span> </span><span class="glyph-text">{$reply.downvotes}</span></div>
            </div>
        </div>
    </div>
</div>
