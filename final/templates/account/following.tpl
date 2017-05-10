{if sizeof($follows) > 0}
    {foreach $follows as $follow}
        <div class="row">
            <article class="col-xs-12 col-sm-12 article-text">
                <div class="panel panel-default">
                    <div class="panel-body article-text">
                        <div class="profile-header-container">
                            <div class="row">
                                <div class="col-xs-10">
                                    <div class="profile-header-img">
                                        {if $follow.photourl == NULL}
                                            <img class="img-circle" src="{$BASE_URL}upload/user_profile/default.png"/>
                                        {else}
                                            {if strpos($follow.photourl, '://')}
                                                <img class="img-circle" src="{$follow.photourl}"/>
                                            {else}
                                                <img class="img-circle" src="{$BASE_URL}upload/user_profile/{$follow.photourl}"/>
                                            {/if}
                                        {/if}
                                    </div>
                                    <div class="article-publisher">
                                        <a href="{$BASE_URL}pages/profile.php?id={$follow.idfollowed}"><h4 class="article-author">{$follow.name}</h4></a>
                                        <small>Member since 2017</small>
                                    </div>
                                </div>
                                <div class="col-xs-2 small-text">
                                    <div class="dropdown horizontal-menu">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="#"><span class="fa fa-arrow-circle-o-up" aria-hidden="true"></span> &nbsp;Promote to Moderator</a></li>
                                            <li><a href="#"><span class="fa fa-arrow-circle-o-down" aria-hidden="true"></span> &nbsp;Demote to Publisher</a></li>
                                            <li><a href="#"><span class="fa fa-ban" aria-hidden="true"></span> &nbsp;Ban user</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    {/foreach}
{else}
    <div class="row">
        <article class="col-xs-12 col-sm-12 article-text">
            <div class="panel panel-default">
                <div class="panel-body article-text">
                    <div class="profile-header-container">
                        <div class="row">
                            <article class="col-xs-12 follow-results">
                                <i class="fa fa-frown-o" aria-hidden="true"></i>
                                <p>No results found.</p>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </div>
{/if}


