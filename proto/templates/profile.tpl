{include file='common/header.tpl'}

<div class="container">
    <div class="row">
        <div class="profile-head">
            <div class="profiles col-xs-12 col-sm-10 col-sm-push-1 col-md-8 col-md-push-2 thumbnail">
                <div class="col-xs-12 col-sm-3">
                    <div class="row">
                        <img src="{$BASE_URL}upload/user_profile/demo-user.png" class="img-responsive" />
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
                                <button type="button" onclick="follow({$user.id})" class="btn btn-default"><span class="fa fa-user-plus"> Follow</span></button>
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
        {foreach $articles as $article}
            <div class="row">
                <div class="col-sm-10 col-sm-push-1 col-md-8 col-md-push-2  profile-article">
                    <article class="article-text">
                        {include file="common/article.tpl"}
                    </article>
                </div>
            </div>
        {/foreach}
    </div>
</section>



{include file='common/footer.tpl'}
