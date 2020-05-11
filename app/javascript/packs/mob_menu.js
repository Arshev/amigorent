// $(document).on('turbolinks:load', function(){
  document.addEventListener("DOMContentLoaded", () => {
    $("#menu_tg1").click(function(){
        $(".header .menu_top").slideUp();
        $("#menu_tg2").removeClass("opened");
        $(".header .addr, .header .phone, .header .vrem").slideToggle();
        return false;
    });
    $("#menu_tg2").click(function(){
        $(".header .addr, .header .phone, .header .vrem").slideUp();
        $(".header .menu_top").slideToggle();
        $("#menu_tg2").toggleClass("opened");
        return false;
    });

    $(".header .menu_top li a span").click(function(){
        $(this).parent().parent().toggleClass("opened");
        return false;
    });
});
