{include file='../common/header.tpl'}
{foreach $reportedComments as $comment}
        <div class="row">
                <div class="account-content account-notifications">
                    <article class="col-xs-12 col-sm-12 article-text">
                        <div class="panel panel-default">
                            <div class="panel-body article-text">
                                <div class="profile-header-container">
                                    <div class="row">
                                        <div class="col-xs-10">
                                            <div class="profile-header-img">
                                                {if $comment.userimage == NULL}
                                                    <img class="img-circle" src="{$BASE_URL}upload/user_profile/default.png" />
                                                {else}
                                                    {if strpos($comment.userimage, '://')}
                                                        <img class="img-circle" src="{$comment.userimage}"/>
                                                    {else}
                                                        <img class="img-circle" src="{$BASE_URL}upload/user_profile/{$comment.userimage}"/>
                                                    {/if}
                                                {/if}
                                            </div>
                                            <div class="article-publisher">
                                                <p class="account-notification-description"><a href="{$BASE_URL}pages/profile.php?id={$comment.userid}"><span class="article-author">{$comment.user}</span></a> has reported the following comment on this <a href="read_article.php?id={$comment.idarticle}">article</a>:</p>
                                                <p class=""> {$comment.comment} </p>
                                            </div>
                                        </div>
                                        <div class="col-xs-2 small-text">
                                            <div class="dropdown horizontal-menu">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                                <ul class="dropdown-menu pull-right" role="menu">
                                                    <li><a href="#"><span class="fa fa-check-square-o" aria-hidden="true"></span> &nbsp;Mark as read</a></li>
                                                    <li><a href="#"><span class="fa fa-eye-slash" aria-hidden="true"></span> &nbsp;Hide notification</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
{/foreach}


<div align="center">
    {if $pageNo > 0}
        <button class="btn btn-link" onclick="accountPageNumber--;advancedSearch()"><span class="glyphicon glyphicon-chevron-left"></span>Previous </button>
    {/if}
    {if $limit == $length}
        <button class="btn btn-link" onclick="accountPageNumber++;advancedSearch()">Next <span class="glyphicon glyphicon-chevron-right"></span></button>
    {/if}
</div>
