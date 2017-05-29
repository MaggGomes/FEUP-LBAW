{include file='../common/header.tpl'}

{foreach $hiddenArticles as $article }
<div class="row">
        <div class="account-content account-notifications">
                <article class="col-xs-12 col-sm-12 article-text pending{$article.id}">
                    <div class="panel panel-default">
                        <div class="panel-body article-text">
                            <div class="profile-header-container">
                                <div class="row">
                                    <div class="col-xs-10">
                                        <div class="profile-header-img">
                                            {if $article.userimage == NULL}
                                                <img class="img-circle"
                                                     src="{$BASE_URL}upload/user_profile/default.png"/>
                                            {else}
                                                {if strpos($article.userimage, '://')}
                                                    <img class="img-circle" src="{$article.userimage}"/>
                                                {else}
                                                    <img class="img-circle"
                                                         src="{$BASE_URL}upload/user_profile/{$article.userimage}"/>
                                                {/if}
                                            {/if}
                                        </div>
                                        <div class="article-publisher">
                                            <p class="account-notification-description"><a
                                                        href="{$BASE_URL}/pages/profile.php"><span
                                                            class="article-author">{$article.user}</span></a></p>
                                            <p class="pending-articles-notification"> has created an article and needs
                                                approval.</p>
                                        </div>
                                    </div>
                                    <div class="col-xs-2 small-text">
                                        <div class="dropdown horizontal-menu">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                                                        class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a onclick="approveArticle({$article.id})" href="#"><span
                                                                class="fa fa-check-circle-o" aria-hidden="true"></span>
                                                        &nbsp;Approve article</a></li>
                                                <li><a href="#"><span class="fa fa-flag" aria-hidden="true"></span>
                                                        &nbsp;Report article</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h4><a href="read_article.php?id={$article.id}">{$article.title}</a></h4>
                        </div>
                    </div>
                </article>

        </div>
</div>
{/foreach}


{include file='../common/footer.tpl'}
