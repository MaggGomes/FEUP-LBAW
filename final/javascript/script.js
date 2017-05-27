$(document).ready(function () {

    /* Function to hide sub-menu with categorys */
    $(window).scroll(function () {

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
    (function (window) {
        'use strict';

        function classReg(className) {
            return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
        }

        var hasClass, addClass, removeClass;

        if ('classList' in document.documentElement) {
            hasClass = function (elem, c) {
                return elem.classList.contains(c);
            };
            addClass = function (elem, c) {
                elem.classList.add(c);
            };
            removeClass = function (elem, c) {
                elem.classList.remove(c);
            };
        } else {
            hasClass = function (elem, c) {
                return classReg(c).test(elem.className);
            };
            addClass = function (elem, c) {
                if (!hasClass(elem, c)) {
                    elem.className = elem.className + ' ' + c;
                }
            };
            removeClass = function (elem, c) {
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

    (function () {
        var expandSearch = document.getElementById('expandsearch'),
            input = expandSearch.querySelector('input.expandsearch-input'),
            ctrlClose = expandSearch.querySelector('span.expandsearch-close'),
            isOpen = isAnimating = false,

            toggleSearch = function (evt) {
                // return if open and the input gets focused
                if (evt.type.toLowerCase() === 'focus' && isOpen) return false;
                var offsets = expandSearch.getBoundingClientRect();
                if (isOpen) {
                    classie.remove(expandSearch, 'open');

                    if (input.value !== '') {
                        setTimeout(function () {
                            classie.add(expandSearch, 'hideInput');
                            setTimeout(function () {
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
        document.addEventListener('keydown', function (event) {
            var keyCode = event.keyCode || event.which;
            if (keyCode === 27 && isOpen) {
                toggleSearch(event);
            }
        });

    })();

    $('.btn-signin').click(function () {
        $("#login").modal();
    });

    $('.btn-register').click(function () {
        $("#register").modal();
    });

    /* Sign in */
    $('#sigin-submit').click(function () {
        var userEmail = $('#signin-email').val();
        var userPassword = $('#signin-password').val();

        $.post("../actions/base/login.php", {
                email: userEmail,
                password: userPassword
            },
            function (result) {
                console.log(result);
                if (result == 200) {
                    location.reload();
                } else {
                    $('#modal-message-login').html('<div class="modal-message-content">Incorrect e-mail and/or password.</div>');
                }
            });
    });

    /* Register */
    $('#register-submit').click(function () {
        var userName = $('#register-name').val();
        var userEmail = $('#register-email').val();
        var userPassword = $('#register-password').val();
        var userConfirmPassword = $('#register-confirmpassword').val();

        if (!/^([A-Za-z0-9]*)$/.test($("#register-name").val()) && /^\S/.test($("#register-name").val())){
            $('#modal-message-register').html('<div class="modal-message-content">Invalid name. Special characters like # ; > < ! - = ? * are not allowed.</div>');
            return;
        }

        if (!/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test($("#register-email").val())) {
            $('#modal-message-register').html('<div class="modal-message-content">Invalid e-mail address.</div>');
            return;
        }

        if (userPassword.length < 8) {
            $('#modal-message-register').html('<div class="modal-message-content">Password must be at least 6 characters long.</div>');
            return;
        }

        if (userPassword != userConfirmPassword) {
            $('#modal-message-register').html('<div class="modal-message-content">Passwords don\'t match.</div>');
            return;
        }

        $.post("../actions/base/register.php", {
                name: userName,
                email: userEmail,
                password: userPassword
            },
            function (result) {
                console.log(result);
                if (result == 200) {
                    location.reload();
                } else {
                    $('#modal-message-register').html('<div class="modal-message-content" style="text-align: left">E-mail already in use.</div>');
                }
            });
    });


    /* Cleans modal inputs */
    $('.modal').on('hidden.bs.modal', function () {
        $('#signin-email').val('');
        $('#signin-password').val('');
        $('#modal-message-login').html('');
    });

    /* Third party login scripts */

    //Google

    var googleUser = {};
    var startGoogleApp = function () {
        gapi.load('auth2', function () {
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
        auth2.attachClickHandler(element, {
                prompt: 'consent'
            },
            function (googleUser) {
                updateSession(googleUser.getBasicProfile().getName(), googleUser.getBasicProfile().getEmail(), googleUser.getBasicProfile().getImageUrl(), "google");
            },
            function (error) {
            });
    }

    $("#google_login").click(
        startGoogleApp()
    );

    $("#logout_button").click(
        function () {
            /*
             var auth2 = gapi.auth2.getAuthInstance();
             console.log(auth2.currentUser.get());
             auth2.signOut();*/
        });


    // Facebook
    window.fbAsyncInit = function () {
        FB.init({
            appId: '1664589083847513',
            xfbml: true,
            version: 'v2.9'
        });

        FB.getLoginStatus(function (response) {
            if (response.status === "connected") {
                console.log("connected");
            } else if (response.status === "not_authorized") {
                console.log("not connected");
            } else {
                console.log("not logged with a facebook account");
            }
        });

        FB.AppEvents.logPageView();
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;

        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    $("#facebook_login").click(function () {
        $("#signin").modal('hide');
        FB.login(function (response) {
            console.log("facebook login");
            if (response.status === "connected") {
                console.log("connected");

                FB.api('/me', 'GET',
                    {fields: 'name, email, picture.width(300).height(300)'}, function (data) {
                        console.log(data.name);
                        console.log(data.email);
                        console.log(data.picture.data.url);

                        updateSession(data.name, data.email, data.picture.data.url, "facebook");
                    }
                )
            } else if (response.status === "not_authorized") {
                console.log("not connected");
            } else {
                console.log("not logged with a facebook account");
            }
        });
    });

    //functions to work with report
    $(".reportCheck").click(
        function () {
            $("#submitRep").attr("disabled", !($(".reportCheck#repC1")[0].checked || $(".reportCheck#repC2")[0].checked || $(".reportCheck#repC3")[0].checked));
        });

    $("#submitRep").click(
        function () {
            var descr = "";
            if ($(".reportCheck#repC1")[0].checked)
                descr += "Contains abusive language;\n";
            if ($(".reportCheck#repC2")[0].checked)
                descr += "Contains not apropriate content for Scriba;\n";
            if ($(".reportCheck#repC3")[0].checked)
                descr += "It's spam;\n";

            console.log(descr);
            console.log($("input#repID").val());
            $.post({
                url: "../actions/report_article.php",
                //type: "post",
                data: {
                    artID: $("input#repID").val(),
                    description: descr
                },
                success: function (data) {
                    console.log(data);
                }
            });
        });
});

window.onload = function () {
    $(".add-article-tags a").click(function () {
        $("#tags").css("display", "inline")
    });
}

/*  Searchs an article by title */
function searchByTitle(value) {
    if (value.length >= 3) {
        $.get("../api/searchTitleTag.php", {
            "name": value,
            "limit": 4,
            "offset": 0
        }, function (results) {
            $(".expandsearch-content").html(results);
            console.log(results);
        });
    } else {
        $(".expandsearch-content").html("");
    }
}

/* Show results */
function showResults(data) {
    console.log(data);
}

/* Changes rating og an article*/
function changeRating(html, value, idSession) {
    if (idSession) {
        $.post("../api/update_rating.php", {
                value: value,
                idArticle: $(html).data('value')
            },
            function (result) {
                if ($(html).hasClass("voted")) {
                    $(html).removeClass("voted");
                } else {
                    $(html).addClass("voted");
                }
                if (value > 0) {
                    $(html).html('<span class="glyphicon glyphicon-thumbs-up"></span><span> </span><span class="glyph-text">' + result + '</span><span> &nbsp&nbsp</span>');
                    if ($(html).next().hasClass("voted")) {
                        $(html).next().removeClass("voted");
                        $(html).next().children()[2].innerHTML = $(html).next().children()[2].innerHTML - 1;
                    }
                } else {
                    $(html).html('<span class="glyphicon glyphicon-thumbs-down"></span><span> </span><span class="glyph-text">' + result + '</span>');
                    if ($(html).prev().hasClass("voted")) {
                        $(html).prev().removeClass("voted");
                        $(html).prev().children()[2].innerHTML = $(html).prev().children()[2].innerHTML - 1;
                    }
                }
            });
    } else {
        // Show modal for login
        $("#signin").modal();
    }
}

/* Updates follow/following button */
function follow(html, idPerson, idSession) {
    if (idSession) {
        $.post("../api/editFollow.php", {
                idPerson: idPerson
            },
            function (result) {
                $(html).toggleClass("btn-primary");
                $(html).toggleClass("btn-default");
                if (result) {
                    $(html).html("<span class=\"fa fa-user\"> Following</span>");
                    $("#user-follower").html(parseInt($("#user-follower").html()) + 1);
                } else {
                    $(html).html("<span class=\"fa fa-user-plus\"> Follow</span>");
                    $("#user-follower").html(parseInt($("#user-follower").html()) - 1);
                }
            });
    } else {
        // Show modal for login
        $("#signin").modal();
    }
}

function reportArticle(id) {
    $("input#repID").val(id);
}

/* Allows account pages to be shown dynamically*/
function accountPage(html, page) {
    $.get("../api/accountPage.php", {
            page: page
        },
        function (data) {
            $("#page").html(data);
            console.log(data);
            $("li.active").removeClass("active");
            $(html).parent().addClass("active");

        });
}

function changePermissions(permission, userId) {
    $.get("../api/changePermission.php", {
            permission: permission
        },
        function (data) {

        });
}

function updateSession(usName, email, image, platf) {
    $.post({
        url: "../actions/base/3rd_party_login.php",
        data: {
            username: usName,
            email: email,
            imageUrl: image,
            platform: platf
        },
        success: function (data) {
            location.reload();
        }
    });
}

$("#advancedSearchForm").change(function () {
    console.log("aqui");
});

function advancedSearch() {
    console.log("entrou");
    $("#advancedSearchForm").serialize();
}
