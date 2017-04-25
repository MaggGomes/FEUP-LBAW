$(document).ready(function() {

    /* Function to hide sub-menu with categorys */
    $(window).scroll(function() {

        var windowWidth = $(window).width();

        if (windowWidth >= 768){
            if ($(this).scrollTop()>200)
            {
                $('.nav-bottom-container').slideUp();
            }
            else
            {
                $('.nav-bottom-container').slideDown();
            }
        }
    });

    /*$(function () {
        $('a[href="#search"]').on('click', function(event) {
            event.preventDefault();
            $('#search').addClass('open');
            $('#search > form > input[type="search"]').focus();
        });

        $('#search, #search button.close').on('click keyup', function(event) {
            if (event.target == this || event.target.className == 'close' || event.keyCode == 27) {
                $(this).removeClass('open');
            }
        });
    });*/


    /* Functions to work with menu search */
    (function(window) {
        'use strict';

        function classReg(className) {
            return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
        }

        var hasClass, addClass, removeClass;

        if ('classList' in document.documentElement ) {
            hasClass = function(elem, c) {
                return elem.classList.contains(c);
            };
            addClass = function(elem, c) {
                elem.classList.add(c);
            };
            removeClass = function(elem, c) {
                elem.classList.remove(c);
            };
        }
        else {
            hasClass = function(elem, c) {
                return classReg(c).test(elem.className);
            };
            addClass = function(elem, c) {
                if (!hasClass(elem, c) ) {
                    elem.className = elem.className + ' ' + c;
                }
            };
            removeClass = function(elem, c) {
                elem.className = elem.className.replace( classReg( c ), ' ' );
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
            input =expandSearch.querySelector('input.expandsearch-input'),
            ctrlClose = expandSearch.querySelector('span.expandsearch-close'),
            isOpen = isAnimating = false,

            toggleSearch = function(evt) {
                // return if open and the input gets focused
                if(evt.type.toLowerCase() === 'focus' && isOpen) return false;
                var offsets = expandSearch.getBoundingClientRect();
                if(isOpen) {
                    classie.remove(expandSearch, 'open' );

                    if( input.value !== '' ) {
                        setTimeout(function() {
                            classie.add( expandSearch, 'hideInput' );
                            setTimeout(function() {
                                classie.remove( expandSearch, 'hideInput' );
                                input.value = '';
                            }, 300 );
                        }, 500);
                    }
                    input.blur();
                }
                else {
                    classie.add(expandSearch, 'open' );
                }
                isOpen = !isOpen;
            };
        // events
        $('#search').click(toggleSearch);

        input.addEventListener('focus', toggleSearch );
        ctrlClose.addEventListener('click', toggleSearch );
        // esc key closes search overlay
        // keyboard navigation events
        document.addEventListener('keydown', function(event) {
            var keyCode = event.keyCode || event.which;
            if( keyCode === 27 && isOpen ) {
                toggleSearch(event);
            }
        } );

    })();




    // TODO - CORRIGIR - VERSAO QUE VERIFICA SE USER ESTÁ LOGADO
    /*$(".thumbs-up").click(function() {
        var rating;

        $.getJSON("../api/session_status.php", function(log) {
            if (log.logged) { // User is logged
                $.ajax({
                    url: "../api/update_rating.php",
                    type: "post",
                    data: {
                        value: 1,
                        date: '04/05/17',
                        idArticle: $(this).data('value')
                    },
                    success: function(result) {
                        rating = result;
                    },

                    async: false
                });

                $(this).html('<span class="glyphicon glyphicon-thumbs-up"></span><span class="glyph-text"> '+rating+' &nbsp&nbsp</span>');
            } else
                $("#signin").show();

        });
    });*/

    // Updates article upvotes
    $(".thumbs-up").click(function() {
        var rating;
        $.ajax({
            url: "../api/update_rating.php",
            type: "post",
            data: {
                value: 1,
                idArticle: $(this).data('value')
            },
            success: function(result) {
                rating = result;
            },

            async: false
        });

        $(this).html('<span class="glyphicon glyphicon-thumbs-up"></span><span class="glyph-text"> '+rating+' &nbsp&nbsp</span>');
    });

    // Updates article downvotes
    $(".thumbs-down").click(function() {
        var rating;
        $.ajax({
            url: "../api/update_rating.php",
            type: "post",
            data: {
                value: -1,
                idArticle: $(this).data('value')
            },
            success: function(result) {
                rating = result;
            },

            async: false
        });

        $(this).html('<span class="glyphicon glyphicon-thumbs-down"></span><span class="glyph-text"> '+rating+'</span>');
    });
});

function searchByTitle(value){
    if(value.length >= 3){
        $.get("../api/searchTitleTag.php", {"name": value}, showResults);
    }
}

function showResults(data){
    console.log(data);
}
