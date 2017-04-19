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

    $(".thumbs-up").click(function() {
        $.getJSON("../scripts/session_status.php", function(result) {
            if (result.logged) // User is logged
                $("#modal-uploadrestaurantphoto").toggle("show");
            else
                $("#modal-login").show();

        });
    });

    $(".thumbs-down").click(function() {
        $.getJSON("../scripts/session_status.php", function(result) {
            if (result.logged) // User is logged
                $("#modal-uploadrestaurantphoto").toggle("show");
            else
                $("#modal-login").show();

        });
    });

    function userAv(user) {
        var tempUser = user;
        $.ajax({
            url: "../scripts/valid_user.php",
            type: "get",
            data: {
                username: tempUser
            },
            success: function (temp) {
                if ($("#reg-user").val() == null || $("#reg-user").val() == "") {
                    bUser = false;
                    $("#reg-user").css("border", "1px solid #ccc");
                } else if (temp == "true" && /^([A-Za-z0-9]*)$/.test($("#reg-user").val()) && /^\S/.test($("#reg-user").val())) {
                    bUser = true;
                    $("#reg-user").css("border", "1px solid #3fa246");
                } else {
                    bUser = false;
                    $("#reg-user").css("border", "1px solid #c21212");
                }
            },
            async: false
        });
    }




});