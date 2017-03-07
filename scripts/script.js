$(document).ready(function() {




    // Function to hide sub-menu with categorys
    $(window).scroll(function() {

        var windowWidth = $(window).width();

        console.log(windowWidth);

        if (windowWidth >= 768){
            if ($(this).scrollTop()>200)
            {
                $('.nav-bottom-container').fadeOut('slow');
            }
            else
            {
                $('.nav-bottom-container').fadeIn('slow');
            }
        }
    });
});