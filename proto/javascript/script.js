$(document).ready(function() {

  /* Function to hide sub-menu with categorys */
  $(window).scroll(function() {

    var windowWidth = $(window).width();

    if (windowWidth >= 768) {
      if ($(this).scrollTop() > 200) {
        $('.nav-bottom-container').slideUp();
      } else {
        $('.nav-bottom-container').slideDown();
      }
    }
  });

  /* Functions to work with menu search */
  (function(window) {
    'use strict';

    function classReg(className) {
      return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
    }

    var hasClass, addClass, removeClass;

    if ('classList' in document.documentElement) {
      hasClass = function(elem, c) {
        return elem.classList.contains(c);
      };
      addClass = function(elem, c) {
        elem.classList.add(c);
      };
      removeClass = function(elem, c) {
        elem.classList.remove(c);
      };
    } else {
      hasClass = function(elem, c) {
        return classReg(c).test(elem.className);
      };
      addClass = function(elem, c) {
        if (!hasClass(elem, c)) {
          elem.className = elem.className + ' ' + c;
        }
      };
      removeClass = function(elem, c) {
        elem.className = elem.className.replace(classReg(c), ' ');
      };
    }

    function toggleClass(elem, c) {
      var fn = hasClass(elem, c) ? removeClass : addClass;
      fn(elem, c);
    }

    var classie = {
      // full names
      hasClass: hasClass,
      addClass: addClass,
      removeClass: removeClass,
      toggleClass: toggleClass,
      // short names
      has: hasClass,
      add: addClass,
      remove: removeClass,
      toggle: toggleClass
    };

    if (typeof define === 'function' && define.amd) {
      // AMD
      define(classie);
    } else {
      // browser global
      window.classie = classie;
    }

  })(window);

  (function() {
    var expandSearch = document.getElementById('expandsearch'),
      input = expandSearch.querySelector('input.expandsearch-input'),
      ctrlClose = expandSearch.querySelector('span.expandsearch-close'),
      isOpen = isAnimating = false,

      toggleSearch = function(evt) {
        // return if open and the input gets focused
        if (evt.type.toLowerCase() === 'focus' && isOpen) return false;
        var offsets = expandSearch.getBoundingClientRect();
        if (isOpen) {
          classie.remove(expandSearch, 'open');

          if (input.value !== '') {
            setTimeout(function() {
              classie.add(expandSearch, 'hideInput');
              setTimeout(function() {
                classie.remove(expandSearch, 'hideInput');
                input.value = '';
              }, 300);
            }, 500);
          }
          input.blur();
        } else {
          classie.add(expandSearch, 'open');
        }
        isOpen = !isOpen;
      };
    // events
    $('#search').click(toggleSearch);

    input.addEventListener('focus', toggleSearch);
    ctrlClose.addEventListener('click', toggleSearch);
    // esc key closes search overlay
    // keyboard navigation events
    document.addEventListener('keydown', function(event) {
      var keyCode = event.keyCode || event.which;
      if (keyCode === 27 && isOpen) {
        toggleSearch(event);
      }
    });

  })();

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
    auth2.attachClickHandler(element, {},
      function(googleUser) {
        $.post({
          url: "../actions/base/3rd_party_login.php",
          //type: "post",
          data: {
            username: googleUser.getBasicProfile().getName(),
            email: googleUser.getBasicProfile().getEmail(),
            imageUrl: googleUser.getBasicProfile().getImageUrl(),
            platform: "google"
          },
          success: function(data) {
            console.log(googleUser.getBasicProfile());
            location.reload();
          }
        });
      },
      function(error) {

      });
  }

  $("#google_login").click(startGoogleApp());
});

window.onload = function() {
    $(".add-article-tags a").click(function() { $("#tags").css("display", "inline")  });
}

function searchByTitle(value) {
  if (value.length >= 3) {
    $.get("../api/searchTitleTag.php", {
      "name": value,
	  "limit": 4,
	  "offset": 0
    }, showResults);
  }
}

function showResults(data) {
  console.log(data);
}

function changeRating(html, value, idSession){
    if(idSession){
        console.log($(html).children()[0]);
        console.log($(html).children()[1]);
        $.post("../api/update_rating.php", {
            value:value,
            idArticle: $(html).data('value')
        },
        function(result){
            if($(html).hasClass("voted")){
                $(html).removeClass("voted");
            } else{
                $(html).addClass("voted");
            }
            if(value > 0){
                $(html).html('<span class="glyphicon glyphicon-thumbs-up"></span><span> </span><span class="glyph-text">' + result + '</span><span> &nbsp&nbsp</span>');
                if($(html).next().hasClass("voted")){
                    $(html).next().removeClass("voted");
                    $(html).next().children()[2].innerHTML = $(html).next().children()[2].innerHTML - 1 ;
                }
            }else{
                $(html).html('<span class="glyphicon glyphicon-thumbs-down"></span><span> </span><span class="glyph-text">' + result + '</span>');
                if($(html).prev().hasClass("voted")){
                    $(html).prev().removeClass("voted");
                    $(html).prev().children()[2].innerHTML = $(html).prev().children()[2].innerHTML - 1;
                }
            }
        });
    }
}
