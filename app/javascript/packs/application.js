/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// require("turbolinks").start()
console.log("Hello World from Webpacker");
// import 'sweetalert2/src/sweetalert2.scss'
// import 'vue-loading-overlay/dist/vue-loading.css';
// import 'sweetalert2/dist/sweetalert2.min.css';
require("trix")
require("@rails/actiontext")
import { } from 'jquery-ujs'
import 'bootstrap/dist/js/bootstrap';
import "./jquery.bxslider.min"
import "application.scss";
// import "counters.js";
const images = require.context("../images", true);
import "rateyo";

// document.addEventListener("turbolinks:load", function () {
document.addEventListener("DOMContentLoaded", () => {
  var $topp = $(".header").offset().top;
  function scrl() {
    if ($(document).scrollTop() > $topp) {
      $(".header").addClass("fixed");
    } else {
      $(".header").removeClass("fixed");
    }
  }
  scrl();
  $(document).scroll(function () {
    scrl();
  });

  $(".block8 .cha1 .spis_prei .prei .zz").click(function () {
    $(this).toggleClass("opened");
    $(this).parent().find("p").slideToggle();
    return false;
  });

  $(".header .gorod > a").click(function () {
    $(".header .gorod .vipad").slideToggle();
    return false;
  });
  $(".header .gorod .vipad a").click(function () {
    $(".header .gorod .vipad").slideUp();
    $(".header .gorod .vipad a").removeClass("active");
    $(this).addClass("active");
    // $(".header .gorod span").text($(this).text());
    // return false;
  });

  $(".content .pricee .txt .more, .block6 .spis_ot .ot1 .more").click(
    function () {
      $(this).slideUp();
      $(this).parent().find(".moree").slideToggle();
      return false;
    }
  );

  $(".content .bl_dostavka .more").click(function () {
    $(this).slideUp();
    $(this).parent().parent().find(".moree").slideToggle();
    return false;
  });

  $(".block_vopros .vopros .vop").click(function () {
    $(this).toggleClass("active");
    $(this).parent().find(".otv").slideToggle();
    return false;
  });

  $(".content.for_spis .filter .vid_spis#flash_cars_vid .vid1").click(function () {
    $(".content.for_spis .filter .vid_spis#flash_cars_vid a").removeClass("active");
    $(this).addClass("active");
    $(".block4.var2#flash_cars .spis_avto").removeClass("active");
    $(".block4.var2#flash_cars .spis_avto#spis1").addClass("active");
    return false;
  });
  $(".content.for_spis .filter .vid_spis#flash_cars_vid .vid2").click(function () {
    $(".content.for_spis .filter .vid_spis#flash_cars_vid a").removeClass("active");
    $(this).addClass("active");
    $(".block4.var2#flash_cars .spis_avto").removeClass("active");
    $(".block4.var2#flash_cars .spis_avto#spis2").addClass("active");
    return false;
  });

  $(".content.for_spis .filter .vid_spis#not_flash_cars_vid .vid1").click(function () {
    $(".content.for_spis .filter .vid_spis#not_flash_cars_vid a").removeClass("active");
    $(this).addClass("active");
    $(".block4.var2#not_flash_cars .spis_avto").removeClass("active");
    $(".block4.var2#not_flash_cars .spis_avto#spis1").addClass("active");
    return false;
  });
  $(".content.for_spis .filter .vid_spis#not_flash_cars_vid .vid2").click(function () {
    $(".content.for_spis .filter .vid_spis#not_flash_cars_vid a").removeClass("active");
    $(this).addClass("active");
    $(".block4.var2#not_flash_cars .spis_avto").removeClass("active");
    $(".block4.var2#not_flash_cars .spis_avto#spis2").addClass("active");
    return false;
  });

  var touchDevice = false;
  if (
    navigator.userAgent.match(
      /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/
    )
  ) {
    touchDevice = true;
  }
  $(".content .cartochka .pl1 .bxslider").bxSlider({
    touchEnabled: touchDevice,
    minSlides: 4,
    maxSlides: 4,
    moveSlides: 1,
    slideWidth: 800,
    //infiniteLoop: false
  });
  // setInterval(function () {
  //   //$(".block2 .pere .bx-next").click();
  // }, 10000);

  $(".content .cartochka .pl1 li a").click(function () {
    $(".content .cartochka .pl1 .bl_img_full").css(
      "background-image",
      "url(" + $(this).attr("href") + ")"
    );
    return false;
  });

  $(".content .cartochka .bl_hara .zagol span").click(function () {
    $(".content .cartochka .bl_hara .cc1").slideToggle();
    return false;
  });

  // $(".block2 form .filtry").click(function () {
  //   $(".block2 form .vipad_filtr").slideToggle();
  //   return false;
  // });

  $(".header #menu_tg2").click(function () {
    $(".menu_mob").slideToggle();
    return false;
  });

  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
  })
  // Фильтр тип машин
  var all_cars = $('div#flash_cars div#spis1 div.avto1')
  var all_cars2 = $('div#flash_cars div#spis2 div.avto1')
  var hatchback = $('div#flash_cars div#spis1 div.hatchback').clone(true);
  var hatchback2 = $('div#flash_cars div#spis2 div.hatchback').clone(true);
  var sedan = $('div#flash_cars div#spis1 div.sedan').clone(true);
  var sedan2 = $('div#flash_cars div#spis2 div.sedan').clone(true);
  var universal = $('div#flash_cars div#spis1 div.universal').clone(true);
  var universal2 = $('div#flash_cars div#spis2 div.universal').clone(true);
  var cupe = $('div#flash_cars div#spis1 div.cupe').clone(true);
  var cupe2 = $('div#flash_cars div#spis2 div.cupe').clone(true);
  var crossover = $('div#flash_cars div#spis1 div.crossover').clone(true);
  var crossover2 = $('div#flash_cars div#spis2 div.crossover').clone(true);
  var jeep = $('div#flash_cars div#spis1 div.jeep').clone(true);
  var jeep2 = $('div#flash_cars div#spis2 div.jeep').clone(true);
  var minivan = $('div#flash_cars div#spis1 div.minivan').clone(true);
  var minivan2 = $('div#flash_cars div#spis2 div.minivan').clone(true);
  var cabrio = $('div#flash_cars div#spis1 div.cabrio').clone(true);
  var cabrio2 = $('div#flash_cars div#spis2 div.cabrio').clone(true);

  $("#car_type").on("change", function () {
    $("#car_kpp option[value='0']").prop('selected', true);
    var sel = $(this).val()
    if (sel == 1) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      sedan.prependTo("div#flash_cars div#spis1.spis_avto");
      sedan2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 2) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      hatchback.prependTo("div#flash_cars div#spis1.spis_avto");
      hatchback2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 3) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      universal.prependTo("div#flash_cars div#spis1.spis_avto");
      universal2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 4) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      cupe.prependTo("div#flash_cars div#spis1.spis_avto");
      cupe2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 5) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      crossover.prependTo("div#flash_cars div#spis1.spis_avto");
      crossover2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 6) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      jeep.prependTo("div#flash_cars div#spis1.spis_avto");
      jeep2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 7) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      minivan.prependTo("div#flash_cars div#spis1.spis_avto");
      minivan2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 9) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      cabrio.prependTo("div#flash_cars div#spis1.spis_avto");
      cabrio2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      all_cars.prependTo("div#flash_cars div#spis1.spis_avto");
      all_cars2.prependTo("div#flash_cars div#spis2.spis_avto");
    }
  });

  // Фильтр кпп машин
  var all_cars = $('div#flash_cars div#spis1 div.avto1')
  var all_cars2 = $('div#flash_cars div#spis2 div.avto1')
  var akpp = $('div#flash_cars div#spis1 div.akpp').clone(true);
  var akpp2 = $('div#flash_cars div#spis2 div.akpp').clone(true);
  var mkpp = $('div#flash_cars div#spis1 div.mkpp').clone(true);
  var mkpp2 = $('div#flash_cars div#spis2 div.mkpp').clone(true);
  var vkpp = $('div#flash_cars div#spis1 div.vkpp').clone(true);
  var vkpp2 = $('div#flash_cars div#spis2 div.vkpp').clone(true);

  $("#car_kpp").on("change", function () {
    $("#car_type option[value='0']").prop('selected', true);
    var sel = $(this).val()
    if (sel == 1) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      akpp.prependTo("div#flash_cars div#spis1.spis_avto");
      akpp2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 2) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      mkpp.prependTo("div#flash_cars div#spis1.spis_avto");
      mkpp2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else if (sel == 3) {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      vkpp.prependTo("div#flash_cars div#spis1.spis_avto");
      vkpp2.prependTo("div#flash_cars div#spis2.spis_avto");
    } else {
      $('div#flash_cars div#spis1 div.avto1').remove();
      $('div#flash_cars div#spis2 div.avto1').remove();
      all_cars.prependTo("div#flash_cars div#spis1.spis_avto");
      all_cars2.prependTo("div#flash_cars div#spis2.spis_avto");
    }
  });

  // not flash cars
  var not_flash_all_cars = $('div#not_flash_cars div#spis1 div.avto1')
  var not_flash_all_cars2 = $('div#not_flash_cars div#spis2 div.avto1')
  var not_flash_hatchback = $('div#not_flash_cars div#spis1 div.hatchback').clone(true);
  var not_flash_hatchback2 = $('div#not_flash_cars div#spis2 div.hatchback').clone(true);
  var not_flash_sedan = $('div#not_flash_cars div#spis1 div.sedan').clone(true);
  var not_flash_sedan2 = $('div#not_flash_cars div#spis2 div.sedan').clone(true);
  var not_flash_universal = $('div#not_flash_cars div#spis1 div.universal').clone(true);
  var not_flash_universal2 = $('div#not_flash_cars div#spis2 div.universal').clone(true);
  var not_flash_cupe = $('div#not_flash_cars div#spis1 div.cupe').clone(true);
  var not_flash_cupe2 = $('div#not_flash_cars div#spis2 div.cupe').clone(true);
  var not_flash_crossover = $('div#not_flash_cars div#spis1 div.crossover').clone(true);
  var not_flash_crossover2 = $('div#not_flash_cars div#spis2 div.crossover').clone(true);
  var not_flash_jeep = $('div#not_flash_cars div#spis1 div.jeep').clone(true);
  var not_flash_jeep2 = $('div#not_flash_cars div#spis2 div.jeep').clone(true);
  var not_flash_minivan = $('div#not_flash_cars div#spis1 div.minivan').clone(true);
  var not_flash_minivan2 = $('div#not_flash_cars div#spis2 div.minivan').clone(true);
  var not_flash_cabrio = $('div#not_flash_cars div#spis1 div.cabrio').clone(true);
  var not_flash_cabrio2 = $('div#not_flash_cars div#spis2 div.cabrio').clone(true);

  $("#not_flash_car_type").on("change", function () {
    $("#not_flash_car_kpp option[value='0']").prop('selected', true);
    var sel = $(this).val()
    if (sel == 1) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_sedan.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_sedan2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 2) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_hatchback.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_hatchback2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 3) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_universal.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_universal2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 4) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_cupe.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_cupe2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 5) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_crossover.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_crossover2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 6) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_jeep.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_jeep2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 7) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_minivan.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_minivan2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 9) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_cabrio.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_cabrio2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_all_cars.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_all_cars2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    }
  });

  // Фильтр кпп машин
  var not_flash_all_cars = $('div#not_flash_cars div#spis1 div.avto1')
  var not_flash_all_cars2 = $('div#not_flash_cars div#spis2 div.avto1')
  var not_flash_akpp = $('div#not_flash_cars div#spis1 div.akpp').clone(true);
  var not_flash_akpp2 = $('div#not_flash_cars div#spis2 div.akpp').clone(true);
  var not_flash_mkpp = $('div#not_flash_cars div#spis1 div.mkpp').clone(true);
  var not_flash_mkpp2 = $('div#not_flash_cars div#spis2 div.mkpp').clone(true);
  var not_flash_vkpp = $('div#not_flash_cars div#spis1 div.vkpp').clone(true);
  var not_flash_vkpp2 = $('div#not_flash_cars div#spis2 div.vkpp').clone(true);

  $("#not_flash_car_kpp").on("change", function () {
    $("#not_flash_car_type option[value='0']").prop('selected', true);
    var sel = $(this).val()
    if (sel == 1) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_akpp.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_akpp2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 2) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_mkpp.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_mkpp2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else if (sel == 3) {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_vkpp.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_vkpp2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    } else {
      $('div#not_flash_cars div#spis1 div.avto1').remove();
      $('div#not_flash_cars div#spis2 div.avto1').remove();
      not_flash_all_cars.prependTo("div#not_flash_cars div#spis1.spis_avto");
      not_flash_all_cars2.prependTo("div#not_flash_cars div#spis2.spis_avto");
    }
  });

  $(function () {
    $("#rateYo").rateYo({
      rating: 5,
      fullStar: true,
      onChange: function (rating, rateYoInstance) {
        document.getElementById('star_counter').value = rating
      }
    })
    $(function () {
      let yaRating = $("#YaRaiting").text()
      let googleRating = $("#GoogleRaiting").text()
      $("#rateYoYa").rateYo({
        rating: yaRating,
        readOnly: true,
        ratedFill: "#ef7f1a"
      });
      $("#rateYoGoogle").rateYo({
        rating: googleRating,
        readOnly: true,
        ratedFill: "#ef7f1a"
      });
    });
  })
});
