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

  <link type="text/css" rel="stylesheet" href="../css/font-awesome.css" />
  <link href="../css/bootstrap.css" rel="stylesheet">
  <link href="../css/bootstrap-theme.css" rel="stylesheet">
  <link href="../css/style.css" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="{$cssStyle}" />

  <!--script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="../javascript/bootstrap.js"></script>
  <script src="../javascript/script.js"></script>
  <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->

  <!-- HTML5 shim and Respond.scripts for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  <!-- scripts for login with google account-->
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <meta name="google-signin-client_id" content="702080112341-73p7rf48svsdsjjggajealjjcsa4njcm.apps.googleusercontent.com">

  <!--TESTES LOGIN GOOGLE REVER-->

  <script src="https://apis.google.com/js/api:client.js"></script>

  <script>
    var googleUser = {};
    var startGoogleApp = function() {
      gapi.load('auth2', function() {
        // Retrieve the singleton for the GoogleAuth library and set up the client.
        auth2 = gapi.auth2.init({
          client_id: '702080112341-73p7rf48svsdsjjggajealjjcsa4njcm.apps.googleusercontent.com',
          cookiepolicy: 'single_host_origin',
          // Request scopes in addition to 'profile' and 'email'
          //scope: 'additional_scope'
        });
        attachSignin(document.getElementById('google_login'));
      });
    };

    function attachSignin(element) {
      console.log(element.id);
      auth2.attachClickHandler(element, {},
        function(googleUser) {
          $.ajax({
            url: "",
            type: "post",
            data: {
              username: googleUser.getBasicProfile().getName(),
              email: googleUser.getBasicProfile().getEmail(),
              imageUrl: googleUser.getBasicProfile().getImageUrl()
            },
            success: function(data){

            }
          })
        },
        function(error) {

        });
    }
  </script>

</head>

<body>
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
        <div class="navbar-brand" id="brand-title" href="#">scriba</div>
      </div>

      <div id="morphsearch" class="morphsearch">
        <form class="morphsearch-form">
          <input class="morphsearch-input" type="search" placeholder="Search..."/>
          <button class="morphsearch-submit" type="submit">Search</button>
        </form>
        <div class="morphsearch-content">
          <div class="dummy-column">
            <h2>People</h2>
            <a class="dummy-media-object" href="http://twitter.com/SaraSoueidan">
              <img class="round" src="http://0.gravatar.com/avatar/81b58502541f9445253f30497e53c280?s=50&d=identicon&r=G" alt="Sara Soueidan"/>
              <h3>Sara Soueidan</h3>
            </a>
            <a class="dummy-media-object" href="http://twitter.com/rachsmithtweets">
              <img class="round" src="http://0.gravatar.com/avatar/48959f453dffdb6236f4b33eb8e9f4b7?s=50&d=identicon&r=G" alt="Rachel Smith"/>
              <h3>Rachel Smith</h3>
            </a>
            <a class="dummy-media-object" href="http://www.twitter.com/peterfinlan">
              <img class="round" src="http://0.gravatar.com/avatar/06458359cb9e370d7c15bf6329e5facb?s=50&d=identicon&r=G" alt="Peter Finlan"/>
              <h3>Peter Finlan</h3>
            </a>
            <a class="dummy-media-object" href="http://www.twitter.com/pcridesagain">
              <img class="round" src="http://1.gravatar.com/avatar/db7700c89ae12f7d98827642b30c879f?s=50&d=identicon&r=G" alt="Patrick Cox"/>
              <h3>Patrick Cox</h3>
            </a>
            <a class="dummy-media-object" href="https://twitter.com/twholman">
              <img class="round" src="http://0.gravatar.com/avatar/cb947f0ebdde8d0f973741b366a51ed6?s=50&d=identicon&r=G" alt="Tim Holman"/>
              <h3>Tim Holman</h3>
            </a>
            <a class="dummy-media-object" href="https://twitter.com/shaund0na">
              <img class="round" src="http://1.gravatar.com/avatar/9bc7250110c667cd35c0826059b81b75?s=50&d=identicon&r=G" alt="Shaun Dona"/>
              <h3>Shaun Dona</h3>
            </a>
          </div>
          <div class="dummy-column">
            <h2>Popular</h2>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/08/05/page-preloading-effect/">
              <img src="img/thumbs/PagePreloadingEffect.png" alt="PagePreloadingEffect"/>
              <h3>Page Preloading Effect</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/05/28/arrow-navigation-styles/">
              <img src="img/thumbs/ArrowNavigationStyles.png" alt="ArrowNavigationStyles"/>
              <h3>Arrow Navigation Styles</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/06/19/ideas-for-subtle-hover-effects/">
              <img src="img/thumbs/HoverEffectsIdeasNew.png" alt="HoverEffectsIdeasNew"/>
              <h3>Ideas for Subtle Hover Effects</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/07/14/freebie-halcyon-days-one-page-website-template/">
              <img src="img/thumbs/FreebieHalcyonDays.png" alt="FreebieHalcyonDays"/>
              <h3>Halcyon Days Template</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/05/22/inspiration-for-article-intro-effects/">
              <img src="img/thumbs/ArticleIntroEffects.png" alt="ArticleIntroEffects"/>
              <h3>Inspiration for Article Intro Effects</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/06/26/draggable-dual-view-slideshow/">
              <img src="img/thumbs/DraggableDualViewSlideshow.png" alt="DraggableDualViewSlideshow"/>
              <h3>Draggable Dual-View Slideshow</h3>
            </a>
          </div>
          <div class="dummy-column">
            <h2>Recent</h2>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/10/07/tooltip-styles-inspiration/">
              <img src="img/thumbs/TooltipStylesInspiration.png" alt="TooltipStylesInspiration"/>
              <h3>Tooltip Styles Inspiration</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/09/23/animated-background-headers/">
              <img src="img/thumbs/AnimatedHeaderBackgrounds.png" alt="AnimatedHeaderBackgrounds"/>
              <h3>Animated Background Headers</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/09/16/off-canvas-menu-effects/">
              <img src="img/thumbs/OffCanvas.png" alt="OffCanvas"/>
              <h3>Off-Canvas Menu Effects</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/09/02/tab-styles-inspiration/">
              <img src="img/thumbs/TabStyles.png" alt="TabStyles"/>
              <h3>Tab Styles Inspiration</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/08/19/making-svgs-responsive-with-css/">
              <img src="img/thumbs/ResponsiveSVGs.png" alt="ResponsiveSVGs"/>
              <h3>Make SVGs Responsive with CSS</h3>
            </a>
            <a class="dummy-media-object" href="http://tympanus.net/codrops/2014/07/23/notification-styles-inspiration/">
              <img src="img/thumbs/NotificationStyles.png" alt="NotificationStyles"/>
              <h3>Notification Styles Inspiration</h3>
            </a>
          </div>
        </div><!-- /morphsearch-content -->
        <span class="morphsearch-close"></span>
      </div><!-- /morphsearch -->
      <header class="codrops-header">
        <h1>Morphing Search <span>A search input that morphs into a fullscreen search page.</span></h1>
        <div class="codrops-links">
          <a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/WobblySlideshowEffect/"><span>Previous Demo</span></a>
          <a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=21106"><span>Back to the Codrops Article</span></a>
        </div>
      </header>
      <div class="overlay"></div>
    </div>

      <ul class="nav navbar-nav menu-right navbar-right pull-right">
        <li><a href="#search"><span class="glyphicon glyphicon-search menu-top"></span></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-bell menu-top"></span></a></li>
        <button class="navbar-toggle" data-toggle="collapse" data-target=".menu-user">
                <span class="glyphicon glyphicon-user menu-top"></span>
            </button>

        <li id="menu-user-dropdown" class="dropdown">
          <a class="dropdown-toggle" href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-user menu-top"></span></a>
          <ul class="dropdown-menu collapse">
            {if !$USERNAME}
            <li><a href="#signin" data-toggle="modal"><span class="fa fa-user-o"> &nbsp;Sign In</a></li>
            <li><a href="#register" data-toggle="modal"><span class="fa fa-sign-in"> &nbsp;Register</a></li>
            {else}
            <li><a href="../pages/account.php" data-toggle="modal"><span class="fa fa-user-o"> &nbsp;My Profile</a></li>
            <li><a href="../pages/add_article.php" data-toggle="modal"><span class="fa fa-pencil"> &nbsp;Create Article</a></li>
            <li><a href="../actions/base/logout.php" data-toggle="modal"><span class="fa fa-sign-out"> &nbsp;Log out</a></li>
            {/if}
          </ul>
        </li>
      </ul>
    </div>


    <!-- Collapsable menu user for resolutions < 768px -->
    <div class="container menu-user-container">
      <div class="collapse navbar-collapse menu-user">
        <ul class="nav navbar-nav">
          <li><a href="#signin" data-toggle="modal"><span class="fa fa-user-o"> &nbsp;Sign In</a></li>
          <li><a href="#register" data-toggle="modal"><span class="fa fa-sign-in"> &nbsp;Register</a></li>
        </ul>
      </div>
    </div>


    <script>
      (function() {
        var morphSearch = document.getElementById( 'morphsearch' ),
                input = morphSearch.querySelector( 'input.morphsearch-input' ),
                ctrlClose = morphSearch.querySelector( 'span.morphsearch-close' ),
                isOpen = isAnimating = false,
        // show/hide search area
                toggleSearch = function(evt) {
                  // return if open and the input gets focused
                  if( evt.type.toLowerCase() === 'focus' && isOpen ) return false;

                  var offsets = morphsearch.getBoundingClientRect();
                  if( isOpen ) {
                    classie.remove( morphSearch, 'open' );

                    // trick to hide input text once the search overlay closes
                    // todo: hardcoded times, should be done after transition ends
                    if( input.value !== '' ) {
                      setTimeout(function() {
                        classie.add( morphSearch, 'hideInput' );
                        setTimeout(function() {
                          classie.remove( morphSearch, 'hideInput' );
                          input.value = '';
                        }, 300 );
                      }, 500);
                    }

                    input.blur();
                  }
                  else {
                    classie.add( morphSearch, 'open' );
                  }
                  isOpen = !isOpen;
                };

        // events
        input.addEventListener( 'focus', toggleSearch );
        ctrlClose.addEventListener( 'click', toggleSearch );
        // esc key closes search overlay
        // keyboard navigation events
        document.addEventListener( 'keydown', function( ev ) {
          var keyCode = ev.keyCode || ev.which;
          if( keyCode === 27 && isOpen ) {
            toggleSearch(ev);
          }
        } );


        /***** for demo purposes only: don't allow to submit the form *****/
        morphSearch.querySelector( 'button[type="submit"]' ).addEventListener( 'click', function(ev) { ev.preventDefault(); } );
      })();
    </script>




    <div id="nav-bottom-container" class="container nav-bottom-container">
      <div class="collapse navbar-collapse nav-bottom">
        <ul class="nav navbar-nav">
          <li><a href="../pages/home.php">Home</a></li>
          <li><a href="#">Top Articles</a></li>
          <li><a href="#">World</a></li>
          <li><a href="#">Sports</a></li>
          <li><a href="#">Technology</a></li>
          <li><a href="#">Politics</a></li>
          <li><a href="#">Culture</a></li>
          <li><a href="#">Science</a></li>
          <li><a href="#">Recommended</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <div id="signin" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
      <div class="modal-content">
        <div class="modal-body">
          <div class="modal-social-icons">
            <button class="btn btn-default facebook"><i class="fa fa-facebook modal-icons"></i> Sign In with Facebook </button>
            <button class="btn btn-default google" id="google_login" data-dismiss="modal"><img src="../images/google-logo.png">Sign In with Google</button>
            <script>
              startGoogleApp();
            </script>

            <button class="btn btn-default sigarra"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Sign In with Sigarra U.Porto</button>
          </div>
          <div class="login-or">
            <hr class="hr-or">
            <span class="span-or">or</span>
          </div>
          <form action="../actions/base/login.php" method="post">
            <div class="form-group has-feedback">
              <input type="text" class="form-control" name="email" placeholder="E-mail address">
              <span class="fa fa-envelope-o form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
              <input type="password" class="form-control" name="password" placeholder="Password">
              <span class="fa fa-lock form-control-feedback"></span>
            </div>
            <input type="submit" class="btn btn-primary btn-submit-dialog" value="Sign In">
          </form>

          <div class="remember-password">
            <input type="checkbox" checked="checked"> Remember me
            <a href="#" class="pull-right">Forgot password?</a>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-default">Register</button>
        </div>
      </div>
    </div>
  </div>


  <!-- Register -->

  <div id="register" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
      <div class="modal-content">
        <div class="modal-body">
          <div class="modal-social-icons">
            <button class="btn btn-default facebook"><i class="fa fa-facebook modal-icons"></i> Continue with Facebook </button>
            <button class="btn btn-default google"><img src="../images/google-logo.png">Continue with Google</button>
            <button class="btn btn-default sigarra"><i class="fa fa-graduation-cap" aria-hidden="true"></i> Continue with Sigarra U.Porto</button>
          </div>
          <div class="login-or">
            <hr class="hr-or">
            <span class="span-or">or</span>
          </div>
          <form action="../actions/base/register.php" method="post">
            <div class="form-group">
              <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="Name" name="name">
                <span class="fa fa-user-o form-control-feedback"></span>
              </div>
              <div class="form-group has-feedback">
                <input type="email" class="form-control" placeholder="E-mail address" name="email">
                <span class="fa fa-envelope-o form-control-feedback"></span>
              </div>
              <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Password" name="password">
                <span class="fa fa-lock form-control-feedback"></span>
              </div>
              <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Confirm Password">
                <span class="fa fa-lock form-control-feedback"></span>
              </div>
            </div>
            <input type="submit" class="btn btn-primary btn-submit-dialog" value="Register">
          </form>

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
            <input type="checkbox" name="vehicle" value=""> Contains abusive language.<br>
            <input type="checkbox" name="vehicle" value=""> Contains not apropriate content for Scriba<br>
            <input type="checkbox" name="vehicle" value=""> It's spam. <br> <br>
          </form>
          <button type="button" class="btn btn-primary btn-submit-dialog" disabled>Submit</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Menu Search bar -->
  <!--<div id="search">
    <button type="button" class="close">×</button>
    <form>
      <input type="search" value="" placeholder="type keyword(s) here" />
      <button type="submit" class="btn btn-primary">Search</button>
    </form>
  </div>-->
