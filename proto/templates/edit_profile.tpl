{include file='common/header.tpl'}

<section class="central">
    <div class="container">
        <div class="row account">
            <div class="col-md-3">
                <div class="account-sidebar">
                    <div class="account-userpic">
                        <img src="../upload/user_profile/demo-user.png" class="img-responsive" alt="">
                    </div>
                    <div class="account-usertitle">
                        <div class="account-usertitle-name">
                            <h3>Clark Muller</h3>
                        </div>
                        <div class="btn btn-primary btn-staff">
                            Administrator
                        </div>
                    </div>
                    <div class="account-presentation row">
                        <div class="col-md-12" style="text-align: center"><span class="account-follow">88</span> Following &middot; <span class="account-follow">200</span> Followers</div>
                    </div>
                    <div class="account-usermenu">
                        <ul class="nav">
                            <ul class="nav">
                                <li class="">
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
                                        <li class="active">
                                            <a href="../pages/edit_profile.php">
                                                <i class="fa fa-pencil-square-o"></i>
                                                Edit Profile</a>
                                        </li>
                                        <li class="">
                                            <a href="../pages/followers.php">
                                                <i class="fa fa-users"></i>
                                                Followers</a>
                                        </li>

                                        <li class="">
                                            <a href="../pages/followees.php">
                                                <i class="fa fa-users"></i>
                                                Followees</a>
                                        </li>

                                        <li class="">
                                            <a href="../pages/moderated_articles.php">
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
                                    <a href="../pages/notifications.php">
                                        <i class="glyphicon glyphicon-bell"></i>
                                        Notifications &nbsp;<span class="badge active">6</span></a>
                                </li>

                                <li class="">
                                    <a href="../pages/statistics.php">
                                        <i class="fa fa-line-chart"></i>
                                        Statistics </a>
                                </li>
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
                                            <a href="../pages/managing_team.php">
                                                <i class="fa fa-users"></i>
                                                Managing team</a>
                                        </li>
                                        <li class="">
                                            <a href="../pages/pending_articles.php">
                                                <i class="fa fa-newspaper-o"></i>
                                                Pending articles</a>
                                        </li>
                                        <li>
                                            <a href="../pages/reported_articles.php">
                                                <i class="glyphicon glyphicon-flag"></i>
                                                Reported articles</a>
                                        </li>
                                        <li>
                                            <a href="../pages/reported_comments.php">
                                                <i class="glyphicon glyphicon-flag"></i>
                                                Reported comments</a>
                                        </li>
                                    </ul>
                                </div>
                            </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6">


                <div class="account-content account-edit-account">
                    <h3>Edit Profile</h3>
                    <form>
                        <div class="form-group">
                            <div class="form-group has-feedback">
                                <input type="text" class="form-control" placeholder="First name" value="Clark">
                                <span class="fa fa-user-o form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="text" class="form-control" placeholder="Last name" value="Muller">
                                <span class="fa fa-user-o form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="email" class="form-control" placeholder="E-mail address" value="someemail@email.com">
                                <span class="fa fa-envelope-o form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="text" class="form-control" placeholder="Country" value="Portugal">
                                <span class="fa fa-globe form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="password" class="form-control" placeholder="Current Password">
                                <span class="fa fa-lock form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="password" class="form-control" placeholder="New Password">
                                <span class="fa fa-lock form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="password" class="form-control" placeholder="Confirm New Password">
                                <span class="fa fa-lock form-control-feedback"></span>
                            </div>
                            <button type="button" class="btn btn-primary">Update Profile</button>
                        </div>
                    </form>
                </div>

            </div>

            <div class="account-recommended col-md-3">
                <div class="row container-category-title">
                    <h3 class="col-xs-12">Recommended <span class="glyphicon glyphicon-menu-down"></span></h3>
                </div>
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">Lorem ipsum</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">3 days ago</small>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">Lorem ipsum</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">3 days ago</small>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">Lorem ipsum</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">3 days ago</small>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">Lorem ipsum</h4>
                        <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">3 days ago</small>
                    </a>
                </div>
            </div>


        </div>
    </div>
</section>

{include file='common/footer.tpl'}