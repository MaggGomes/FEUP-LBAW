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
});