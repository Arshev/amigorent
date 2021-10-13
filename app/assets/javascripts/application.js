// //= require turbolinks
// //= require jquery
// //= require jquery.rateyo.min
// //= require_tree .

// document.addEventListener("turbolinks:load", function() {
//   // $( document ).ready(function() {
//     var $topp = $(".header").offset().top;
//     function scrl() {
//       if($(document).scrollTop()>$topp) {
//         $(".header").addClass("fixed");
//       } else {
//         $(".header").removeClass("fixed");
//       }
//     }
//     scrl();
//     $(document).scroll(function(){
//       scrl();
//     });
  
//     $(".block8 .cha1 .spis_prei .prei .zz").click(function(){
//       $(this).toggleClass("opened");
//       $(this).parent().find("p").slideToggle();
//       return false;
//     });
  
//     $(".header .gorod > a").click(function(){
//       $(".header .gorod .vipad").slideToggle();
//       return false;
//     });
//     $(".header .gorod .vipad a").click(function(){
//       $(".header .gorod .vipad").slideUp();
//       $(".header .gorod .vipad a").removeClass("active");
//       $(this).addClass("active");
//       $(".header .gorod span").text($(this).text());
//       return false;
//     });
  
//     $(".content .pricee .txt .more, .block6 .spis_ot .ot1 .more").click(function(){
//       $(this).slideUp();
//       $(this).parent().find(".moree").slideToggle();
//       return false;
//     });
  
//     $(".content .bl_dostavka .more").click(function(){
//       $(this).slideUp();
//       $(this).parent().parent().find(".moree").slideToggle();
//       return false;
//     });
  
//     $(".block_vopros .vopros .vop").click(function(){
//       $(this).toggleClass("active");
//       $(this).parent().find(".otv").slideToggle();
//       return false;
//     });
  
//     $(".content.for_spis .filter .vid_spis .vid1").click(function(){
//       $(".content.for_spis .filter .vid_spis a").removeClass("active");
//       $(this).addClass("active");
//       $(".block4.var2 .spis_avto").removeClass("active");
//       $(".block4.var2 .spis_avto#spis1").addClass("active");
//       return false;
//     });
//     $(".content.for_spis .filter .vid_spis .vid2").click(function(){
//       $(".content.for_spis .filter .vid_spis a").removeClass("active");
//       $(this).addClass("active");
//       $(".block4.var2 .spis_avto").removeClass("active");
//       $(".block4.var2 .spis_avto#spis2").addClass("active");
//       return false;
//     });
  
//     var touchDevice = false;
//     if (navigator.userAgent.match(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/)) {
//           touchDevice = true;
//     }
//       $(".content .cartochka .pl1 .bxslider").bxSlider({
//           touchEnabled: touchDevice,
//           minSlides: 4,
//           maxSlides: 4,
//           moveSlides: 1,
//           slideWidth: 800,
//           //infiniteLoop: false
//       });
//       setInterval(function(){
//           //$(".block2 .pere .bx-next").click();
//       }, 10000);
  
//       $(".content .cartochka .pl1 li a").click(function(){
//         $(".content .cartochka .pl1 .bl_img_full").css("background-image", "url("+$(this).attr("href")+")");
//         return false;
//       });
  
//       $(".content .cartochka .bl_hara .zagol span").click(function(){
//         $(".content .cartochka .bl_hara .cc1").slideToggle();
//         return false;
//       });
  
//       $(".block2 form .filtry").click(function(){
//         $(".block2 form .vipad_filtr").slideToggle();
//         return false;
//       });
  
//       $(".header #menu_tg2").click(function(){
//         $(".menu_mob").slideToggle();
//         return false;
//       });
//   // });
// })
