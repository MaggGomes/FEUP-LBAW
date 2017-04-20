$(document).ready(function() {

    // Function to hide sub-menu with categorys
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
                date: '04/05/17',
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
                date: '04/05/17',
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