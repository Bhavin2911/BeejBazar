$(document).ready(function() {


 // Animate On Scroll

    AOS.init();



    // Back to top button

    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function() {
        $('html, body').animate({ scrollTop: 0 }, 2000, 'easeInOutExpo');
    });




    // sticky-Header

    $(window).scroll(function() {
        if ($(window).scrollTop() > 100) {
            $('.header-sticky').addClass('is-sticky');
        } else {
            $('.header-sticky').removeClass('is-sticky');
        }
    });


   

   

   


});