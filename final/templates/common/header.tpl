<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="description" content="Beyond the words" />
  <meta name="author" content="">

  <title>Scriba</title>
  <link rel="shortcut icon" href="../images/logo.png">

  <!-- Bootstrap core CSS -->
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <!--link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet"-->

  <link type="text/css" rel="stylesheet" href="../css/font-awesome.min.css" />
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/bootstrap-theme.min.css" rel="stylesheet">
  <link href="../css/style.css" rel="stylesheet">
  <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet">

  <!--script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="../javascript/bootstrap.min.js"></script>
  <script src="../javascript/script.js"></script>
  <script src="../javascript/bootstrap-datetimepicker.js"></script>
  <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->

  <!-- HTML5 shim and Respond.scripts for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- scripts for login with google account-->
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <meta name="google-signin-client_id" content="702080112341-73p7rf48svsdsjjggajealjjcsa4njcm.apps.googleusercontent.com">
  <script src="https://apis.google.com/js/api:client.js"></script>
</head>

<body class="{$addarticlebody}">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" data-toggle="collapse" data-target=".nav-bottom">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home.php">
        <img alt="Brand" src="../images/logo.png">
      </a>
      <a href="home.php" class="navbar-brand brand-title">scriba</a>
    </div>

    <ul class="nav navbar-nav menu-right navbar-right pull-right">
      <li><a href="#" id="search"><span class="glyphicon glyphicon-search menu-top"></span></a></li>
      <li><a href="#"><span class="glyphicon glyphicon-bell menu-top"></span></a></li>
      <button class="navbar-toggle" data-toggle="collapse" data-target=".menu-user">
        {if !$USERNAME}
          <span class="glyphicon glyphicon-user menu-top"></span>
        {else}
          {if !$PHOTO}
            <img class="img-circle menu-photo" src="{$BASE_URL}upload/user_profile/default.png"/>
          {else}
            {if strpos($PHOTO, '://')}
              <img class="img-circle menu-photo" src="{$PHOTO}"/>
            {else}
              <img class="img-circle menu-photo" src="{$BASE_URL}upload/user_profile/{$PHOTO}"/>
            {/if}
          {/if}
        {/if}
      </button>

      <li id="menu-user-dropdown" class="dropdown">
        <a class="dropdown-toggle" href="#" data-toggle="dropdown">
          {if !$USERNAME}
            <span class="glyphicon glyphicon-user menu-top"></span>
          {else}
            {if !$PHOTO}
              <img class="img-circle menu-photo" src="{$BASE_URL}upload/user_profile/default.png"/>
            {else}
              {if strpos($PHOTO, '://')}
                <img class="img-circle menu-photo" src="{$PHOTO}"/>
              {else}
                <img class="img-circle menu-photo" src="{$BASE_URL}upload/user_profile/{$PHOTO}"/>
              {/if}
            {/if}
          {/if}
        </a>
        <ul class="dropdown-menu collapse">
          {if !$USERNAME}
            <li><a href="#signin" data-toggle="modal"><span class="fa fa-user-o"><span class="menu-text"> &nbsp;Sign In</span></a></li>
            <li><a href="#register" data-toggle="modal"><span class="fa fa-sign-in"><span class="menu-text"> &nbsp;Register</span></a></li>
          {else}
            <li><a href="{$BASE_URL}pages/account.php" data-toggle="modal"><span class="fa fa-user-o"><span class="menu-text"> &nbsp;My Profile</span></a></li>
            <li><a href="{$BASE_URL}pages/add_article.php" data-toggle="modal"><span class="fa fa-pencil"><span class="menu-text"> &nbsp;Create Article</span></a></li>
            <li><a href="{$BASE_URL}actions/base/logout.php" id="logout" data-toggle="modal"><span class="fa fa-sign-out"><span class="menu-text"> &nbsp;Log out</span></a></li>
          {/if}
        </ul>
      </li>
    </ul>

    <!-- Menu search -->
    <div class="home-search">
      <div id="expandsearch" class="expandsearch">
        <form method="get" action="{$BASE_URL}pages/advanced_search.php" class="expandsearch-form">
          <input class="expandsearch-input" name="search" spellcheck="false" autocomplete="off" onkeyup="searchByTitle(this.value)" type="search" placeholder="Search ..."/>
          <button class="expandsearch-submit" type="submit">Search</button>
        </form>
        <div class="expandsearch-content"></div>
        <span class="expandsearch-close"></span>
      </div>
      <div id="normalSearch" class="overlay"></div>
    </div>
  </div>

  <!-- Collapsable menu user for resolutions < 768px -->
  <div class="container menu-user-container">
    <div class="collapse navbar-collapse menu-user">
      <ul class="nav navbar-nav">
        {if !$USERNAME}
          <li><a href="#signin" data-toggle="modal"><span class="fa fa-user-o"><span class="menu-text"> &nbsp;Sign In</span></a></li>
          <li><a href="#register" data-toggle="modal"><span class="fa fa-sign-in"><span class="menu-text"> &nbsp;Register</span></a></li>
        {else}
          <li><a href="../pages/account.php" data-toggle="modal"><span class="fa fa-user-o"><span class="menu-text"> &nbsp;My Profile</span></a></li>
          <li><a href="../pages/add_article.php" data-toggle="modal"><span class="fa fa-pencil"><span class="menu-text"> &nbsp;Create Article</span></a></li>
          <li><a href="../actions/base/logout.php" data-toggle="modal"><span class="fa fa-sign-out"><span class="menu-text"> &nbsp;Log out</span></a></li>
        {/if}
      </ul>
    </div>
  </div>

  <div id="nav-bottom-container" class="container nav-bottom-container">
    <div class="collapse navbar-collapse nav-bottom">
      <ul class="nav navbar-nav">
        <li><a href="../pages/home.php"><span>Home</span></a></li>
        <li><a href="home.php#World"><span class="menu-text">World</span></a></li>
        <li><a href="home.php#Sports"><span class="menu-text">Sports</span></a></li>
        <li><a href="home.php#Technology"><span class="menu-text">Technology</span></a></li>
        <li><a href="home.php#Politics"><span class="menu-text">Politics</span></a></li>
        <li><a href="home.php#Culture"><span class="menu-text">Culture</span></a></li>
        <li><a href="home.php#Science"><span class="menu-text">Science</span></a></li>
        <li><a href="home.php#Miscellaneous"><span class="menu-text">Miscellaneous</span></a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Sign In -->

<div id="signin" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-footer modal-title">
        <div class="navbar-brand brand-title">scriba</div>
        <div class="modal-close" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></div>
      </div>
      <div class="modal-body">
        <div id="modal-message-signin"></div>
        <div class="modal-social-icons">
          <button class="btn btn-default facebook" id="facebook_login"><i class="fa fa-facebook modal-icons"></i> Continue with Facebook </button>
          <button class="btn btn-default google" id="google_login" data-dismiss="modal"><img src="../images/google-logo.png"> Continue with Google</button>
          <a href="{$BASE_URL}actions/sigarra/login_sigarra.php"><button class="btn btn-default sigarra"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Continue with Sigarra U.Porto</button></a>
        </div>
        <div class="login-or">
          <hr class="hr-or">
          <span class="span-or">or</span>
        </div>
        <h4 class="useemail">Or use your  e-mail address</h4>
        <button type="button" data-dismiss="modal" class="btn-bottom btn btn-primary btn-signin">Sign in</button>
        <button type="button" data-dismiss="modal" class="btn-bottom btn btn-default btn-register">Register</button>

        <!--<div class="remember-password">
          <input type="checkbox" checked="checked"> Remember me
          <a href="#" class="pull-right">Forgot password?</a>
        </div>-->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Log in -->
<div id="login" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-footer modal-title">
        <div class="navbar-brand brand-title">scriba</div>
        <div class="modal-close" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></div>
      </div>
      <div class="modal-body">
        <div id="modal-message-login"></div>
          <div class="form-group has-feedback">
            <input id="signin-email" type="email" class="form-control" name="email" placeholder="E-mail address">
            <span class="fa fa-envelope-o form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input id="signin-password" type="password" class="form-control" name="password" placeholder="Password">
            <span class="fa fa-lock form-control-feedback"></span>
          </div>
          <button id="sigin-submit" class="btn btn-primary btn-submit-dialog">Sign In</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        <button type="button" data-dismiss="modal" class="btn btn-default btn-register">Register</button>
      </div>
    </div>
  </div>
</div>


<!-- Register -->

<div id="register" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-footer modal-title">
        <div class="navbar-brand brand-title">scriba</div>
        <div class="modal-close" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></div>
      </div>
      <div class="modal-body">
        <div id="modal-message-register"></div>
        <div class="form-group">
          <div class="form-group has-feedback">
            <input id="register-name" type="text" class="form-control" pattern="" placeholder="Name" name="name">
            <span class="fa fa-user-o form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input id="register-email" type="email" class="form-control" placeholder="E-mail address" name="email">
            <span class="fa fa-envelope-o form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input id="register-password" type="password" class="form-control" placeholder="Password" name="password">
            <span class="fa fa-lock form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input id="register-confirmpassword" type="password" class="form-control" placeholder="Confirm Password">
            <span class="fa fa-lock form-control-feedback"></span>
          </div>
        </div>
        <button id="register-submit" class="btn btn-primary btn-submit-dialog">Register</button>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Report Article -->

<div id="report-article" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <h4>Reason for report:</h4>
        <form>
          <input type="checkbox" name="vehicle" class="reportCheck" id="repC1" value=""> Contains abusive language.<br>
          <input type="checkbox" name="vehicle" class="reportCheck" id="repC2" value=""> Contains not apropriate content for Scriba.<br>
          <input type="checkbox" name="vehicle" class="reportCheck" id="repC3" value=""> It's spam. <br> <br>
          <textarea id="repAdditional" placeholder="Additional information"></textarea>
          <input type="text"id="repID" value="-1" hidden="true">
        </form>
        <button type="button" class="btn btn-primary btn-submit-dialog" id="submitRep" disabled>Submit</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Report Comment -->

<div id="report-comment" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <h4>Reason for report:</h4>
        <form>
          <input type="checkbox" name="vehicle" class="repComCheck" id="repCom1" value=""> Contains abusive language.<br>
          <input type="checkbox" name="vehicle" class="repComCheck" id="repCom2" value=""> Contains not apropriate content for Scriba.<br>
          <input type="checkbox" name="vehicle" class="repComCheck" id="repCom3" value=""> It's spam. <br> <br>
          <textarea id="repComAdditional" placeholder="Additional information"></textarea>
          <input type="text"id="repComID" value="-1" hidden="true">
        </form>
        <button type="button" class="btn btn-primary btn-submit-dialog" id="submitRepComment" disabled>Submit</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="banUser" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
            <div style="overflow:hidden;">
            <form id="banInfo" class="form-group">
                <div class='input-group date' id='datetimepicker'>
                    <input type='text' name="date" class="form-control" required/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar">
                        </span>
                    </span>
                    <input type="hidden" id="banUserId" name="id" value=""/>
                </div>
                <br>
                <div>
                    <label for="">Reason for suspension:</label>
                    <br>
                    <input type="text" name="reason" value="">
                </div>
            </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" onclick="ban()" class="btn btn-primary" data-dismiss="modal">Ban</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>


  </div>
</div>
