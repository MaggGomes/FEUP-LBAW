<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body article-text">
                    <div class="page-header comment-header">
                        <div class="profile-header-container">
                            <div class="row">
                                <div class="col-xs-9">
                                    <div class="profile-header-img">
                                        {if $comment.userimage == NULL}
                                            <img class="img-circle" src="{$BASE_URL}upload/user_profile/default.png"/>
                                        {elseif strpos($comment.userimage, '://')}
                                            <img class="img-circle" src="{$comment.userimage}"/>
                                        {else}
                                            <img class="img-circle"
                                                 src="{$BASE_URL}upload/user_profile/{$comment.userimage}"/>
                                        {/if}
                                    </div>
                                    <div class="article-publisher">
                                        <a href="{$BASE_URL}pages/profile.php?id={$comment.userid}"><h4
                                                    class="article-author">{$comment.username}</h4></a>
                                        <h4 class="article-author">{$comment.name}</h4>
                                        <small>{$comment.commentmonth} {$comment.commentday}, {$comment.commentyear}</small>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                        <div class="show-reply small-text glyph-text pull-right" onclick="displayEditForm({$comment.idcomment})">
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="comment{$comment.idcomment}">
                        <p>{$comment.text}</p>
                    </div>
                    <div class="editComment{$comment.idcomment} reply-comment">
                        <form action="../actions/edit_comment.php" method="post">
                            <input type="text" name="idcomment" value="{$comment.idcomment}" hidden="hidden">
                            <input type="text" name="idarticle" value="{$comment.idarticle}" hidden="hidden">
                            <input class="form-edit-comment col-xs-9" type="text" name="text" value="{$comment.text}">
                            <button class="btn-edit-comment btn btn-primary col-xs-2 pull-right" type="submit">Edit</button>
                        </form>
                    </div>
                </div>

                <div class="panel-footer article-footer comment-footer">
                    <div class="row article-footer-lower comment-footer">
                        <div class="col-xs-5">
                            <div class="thumbs-up small-text {if $article.rating == 1} voted {/if}"
                                 data-value="{$article.id}"
                                 onclick=""><span class="glyphicon glyphicon-thumbs-up"></span>
                                <span> </span><span class="glyph-text">{$comment.upvotes}</span><span> &nbsp&nbsp</span>
                            </div>
                            <div class="thumbs-down small-text {if $article.rating == -1} voted {/if}"
                                 data-value="{$article.id}" onclick=""><span
                                        class="glyphicon glyphicon-thumbs-down"></span>
                                <span> </span><span class="glyph-text">{$comment.downvotes}</span></div>
                        </div>
                        <div class="col-xs-7">
                            <div class="pull-right show-reply" onclick="replyComment(this, {$smarty.session.id});">
                                <span class="glyphicon glyphicon-comment"></span><span class="glyph-text"> Comment</span>
                            </div>
                        </div>
                    </div>
                    {if $smarty.session.id != null}
                        <div class="reply-comment">
                            <form action="../actions/reply_comment.php" method="post">
                                <input class="form-control" type="text"
                                       placeholder="Write a comment..." name="comment">
                                <input type="text" name="idarticle" value="{$article.id}" hidden="hidden">
                                <input type="text" name="idReply" value="{$comment.idcomment}" hidden="hidden">
                                <button class="btn btn-primary" type="submit">Comment</button>
                            </form>
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
    {foreach $comment.replies as $reply}
        <div class="row">
            <div class="col-xs-11 col-xs-offset-1 col-md-8 col-md-offset-1">
                {include file='common/reply_comment.tpl'}
            </div>
        </div>
    {/foreach}
</div>
