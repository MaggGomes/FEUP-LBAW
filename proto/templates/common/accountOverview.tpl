<div class="account-sidebar">
    <div class="account-userpic">
        <img src="../upload/user_profile/demo-user.png" class="img-responsive" alt="">
    </div>
    <div class="account-usertitle">
        <div class="account-usertitle-name">
            <h3>{$info.name}</h3>
        </div>
        <div class="btn btn-primary btn-staff">
            {$info.permission}
        </div>
    </div>
    <div class="account-presentation row">
        <div class="col-md-12" style="text-align: center"><span class="account-follow">{$info.following}</span> Following &middot; <span class="account-follow">{$info.followers}</span> Followers</div>
    </div>
    <div class="account-usermenu">
        <ul class="nav">

            <ul class="nav">
                <li class="active">
                    <a href="../pages/account.php">
                        <i class="glyphicon glyphicon-home"></i>
                        Overview </a>
                </li>
                <li class="">
                    <a href="../pages/add_article.php">
                        <i class="fa fa-pencil"></i>
                        Write an article </a>
                </li>
                <li class="">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseUser">
                        <i class="fa fa-user-o"></i>
                        Account Settings </a>
                </li>

                <div id="collapseUser" class="panel-collapse collapse account-menu-collapse">
                    <ul class="nav">
                        <li class="">
                            <a href="../pages/edit_profile.php">
                                <i class="fa fa-pencil-square-o"></i>
                                Edit Profile</a>
                        </li>
                        <li class="">
                            <a href="#">
                                <i class="fa fa-users"></i>
                                Followers</a>
                        </li>

                        <li class="">
                            <a href="../pages/following.php">
                                <i class="fa fa-users"></i>
                                Following</a>
                        </li>

                        <li class="">
                            <a href="#">
                                <i class="fa fa-ban"></i>
                                Moderated articles </a>
                        </li>
                        <li class="">
                            <a href="">
                                <i class="fa fa-trash-o"></i>
                                Delete Account </a>
                        </li>
                    </ul>
                </div>

                <li class="">
                    <a href="#">
                        <i class="glyphicon glyphicon-bell"></i>
                        Notifications &nbsp;<span class="badge active">6</span></a>
                </li>

                <li class="">
                    <a href="#">
                        <i class="fa fa-line-chart"></i>
                        Statistics </a>
                </li>
                {if $info.permission != "Publisher"}
                    <li class="">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseAdmin"><i class="fa fa-wrench"></i>Manage Scriba</a>
                    </li>

                    <div id="collapseAdmin" class="panel-collapse collapse account-menu-collapse">
                    <ul class="nav">
                        <li class="">
                            <a href="../pages/list_users.php">
                                <i class="fa fa-user-o"></i>
                                List of registered users</a>
                        </li>
                        <li class="">
                            <a href="#">
                                <i class="fa fa-users"></i>
                                Managing team</a>
                        </li>
                        <li class="">
                            <a href="#">
                                <i class="fa fa-newspaper-o"></i>
                                Pending articles</a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-flag"></i>
                                Reported articles</a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="glyphicon glyphicon-flag"></i>
                                Reported comments</a>
                        </li>
                    </ul>
                </div>
                {/if}
            </ul>
    </div>
</div>
