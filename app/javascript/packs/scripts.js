// $(document).on('turbolinks:load', function(){
document.addEventListener("DOMContentLoaded", () => {
    $(".block6 .col1 .pere .za").click(function(){
        if($(this).parent().hasClass("opened")) {
            $(this).parent().removeClass("opened");
            $(this).parent().find(".skrito").slideToggle();
        } else {
            $(this).parent().addClass("opened");
            $(this).parent().find(".skrito").slideToggle();
        }
        return false;
    });

    var $topp = $(".header .menu_top").offset().top;

    function fixed() {
        if($(document).scrollTop()>$topp) {
            $(".polosa:not(.ne_lipko)").addClass("fixed");
        } else {
            $(".polosa:not(.ne_lipko)").removeClass("fixed");
        }
    }
    fixed();
    $(document).scroll(function(){
        fixed();
    });

    $(".content .bl_avto .bl_perekl a").click(function(){
        $(this).parent().find("a").removeClass("active");
        $(this).addClass("active");
        $(".content .bl_avto .perek").removeClass("active");
        $(".content .bl_avto .perek#"+$(this).attr("data-per")).addClass("active");
        return false;
    });

    // $("#menu_tg1").click(function(){
    //     $(".header .menu_top").slideUp();
    //     $("#menu_tg2").removeClass("opened");
    //     $(".header .addr, .header .phone, .header .vrem").slideToggle();
    //     return false;
    // });
    // $("#menu_tg2").click(function(){
    //     $(".header .addr, .header .phone, .header .vrem").slideUp();
    //     $(".header .menu_top").slideToggle();
    //     $("#menu_tg2").toggleClass("opened");
    //     return false;
    // });

    // $(".header .menu_top li a span").click(function(){
    //     $(this).parent().parent().toggleClass("opened");
    //     return false;
    // });
});



