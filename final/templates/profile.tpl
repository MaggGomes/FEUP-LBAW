{include file='common/header.tpl'}

<div class="container">
    <div class="row">
        <div class="profile-head background-gradient">
            <div class="profiles col-xs-12 col-sm-10 col-sm-push-1 col-md-8 col-md-push-2 thumbnail">
                    <div class="row profile-row-img">
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

                    <div class="row profile-description"">
                        <span class="col-xs-12"><h2>{$user.name}</h2></span>
                        <div class="col-xs-12 profile-presentation">
                            <div class="row">
                                <div class="col-md-12"><span id="user-following" class="profile-follow">{$user.following}</span> Following &middot; <span id="user-follower" class="profile-follow">{$user.followers}</span> Followers</div>
                            </div>
                            <div class="profile-userbuttons">
                                {if $user.profilefollow}
                                    <button type="button" onclick="follow(this, {$user.id})" class="btn btn-primary"><span class="fa fa-user"> Following</span></button>
                                {else}
                                    <button type="button" onclick="follow(this, {$user.id})" class="btn btn-default"><span class="fa fa-user-plus"> Follow</span></button>
                                {/if}
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
        {$largeArticleImage = true}
        {foreach $articles as $article}
            <div class="row">
                <div class="col-sm-10 col-sm-push-1 col-md-8 col-md-push-2  profile-article">
                    <article class="article-text">
                        {include file="common/article.tpl"}
                    </article>
                </div>
            </div>
        {/foreach}
        {$largeArticleImage = false}
    </div>
</section>

{include file='common/footer.tpl'}