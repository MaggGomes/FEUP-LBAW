{include file='../common/header.tpl'}

<section class="central">
    <div class="container">
        <div class="row account">
            <div class="col-md-3">
                {include file='account/accountOverview.tpl'}
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

{include file='../common/footer.tpl'}
