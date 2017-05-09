{foreach $users as $user}
    <div class="row">
        <article class="col-xs-12 article-text">
            <div class="panel panel-default">
                <div class="panel-body article-text">
                    <div class="profile-header-container">
                        <form method="get" action="profile.php" class="row">
                            <input type="hidden" name="id" value={$user.id}>
                            <div type="submit">
                                <div class="col-xs-10">
                                    <div class="profile-header-img">
                                        <img class="img-circle" src="../upload/user_profile/demo-user.png" />
                                    </div>
                                    <div class="article-publisher">
                                        <a href="../pages/profile.php?id={$user.id}">
                                            <h4 class="article-author">{$user.name}</h4>
                                            <small>Rating: {$user.rating}</small>
                                            <small>Permission: {$user.permission}</small>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-2 small-text">
                                    <div class="dropdown horizontal-menu">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-option-horizontal pull-right"></span></a>

                                        <ul class="dropdown-menu pull-right" role="menu">
                                            {if $user.permission == "Publisher"}
                                                <li><a href="#"><span class="fa fa-arrow-circle-o-up" aria-hidden="true"></span> &nbsp;Promote to Moderator</a></li>
                                            {elseif $user.permission == "Moderator"}
                                                <li><a href="#"><span class="fa fa-arrow-circle-o-up" aria-hidden="true"></span> &nbsp;Promote to Administrator</a></li>
                                                <li><a href="#"><span class="fa fa-arrow-circle-o-down" aria-hidden="true"></span> &nbsp;Demote to Publisher</a></li>
                                            {else}
                                                <li><a href="#"><span class="fa fa-arrow-circle-o-down" aria-hidden="true"></span> &nbsp;Demote to Moderator</a></li>
                                            {/if}
                                            <li><a href="#"><span class="fa fa-ban" aria-hidden="true"></span> &nbsp;Ban user</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </article>
    </div>
{/foreach}

<div align="center">
    {if $pageNo > 0}
        <a href="?pageNo={$pageNo-1}"><span class="glyphicon glyphicon-chevron-left"></span>Previous </a>
    {/if}
    {if $limit == $usersLength}
        <a href="?pageNo={$pageNo+1}">Next <span class="glyphicon glyphicon-chevron-right"></span></a>
    {/if}
</div>