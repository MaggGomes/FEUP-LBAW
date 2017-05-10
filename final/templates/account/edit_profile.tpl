<div class="account-edit-account">
    <h3>Edit Profile</h3>
    <form action="{$BASE_URL}actions/update_profile.php" method="post">
        <div class="form-group">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name = "name" placeholder="Name" value="{$info.name}">
                <span class="fa fa-user-o form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" class="form-control" name = "email" placeholder="E-mail address" value="{$info.email}">
                <span class="fa fa-envelope-o form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name = "country" placeholder="Country" value="{$info.country}">
                <span class="fa fa-globe form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name = "password" placeholder="Current Password">
                <span class="fa fa-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name = "newpassword" placeholder="New Password">
                <span class="fa fa-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name = "confirmnewpassword" placeholder="Confirm New Password">
                <span class="fa fa-lock form-control-feedback"></span>
            </div>
            <input type="submit" class="btn btn-primary" value="Update Profile">
        </div>
    </form>
</div>



