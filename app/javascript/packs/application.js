require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "../stylesheets/application"

global.toastr = require("toastr")

toastr.options.closeButton = true;
toastr.options.timeOut = 100;
toastr.options.progressBar = true;
toastr.options = {
  "positionClass": "toast-top-full-width"
}

require("trix")
require("@rails/actiontext")

// import flatpickr from "flatpickr"
// require("flatpickr/dist/flatpickr.css")


// document.addEventListener("turbolinks:load", () => {
//   console.log("Hello from applicaton.js!")
//   flatpickr("[data-behavior='flatpickr']", {
//     altInput: true,
//     altFormat: "F j, Y",
//     dateFormat: "Y-m-d",
//   })
// })
// document.addEventListener("DOMContentLoaded", () => {
//   $(".block6 .col1 .pere .za").click(function(){
//     if($(this).parent().hasClass("opened")) {
//         $(this).parent().removeClass("opened");
//         $(this).parent().find(".skrito").slideToggle();
//     } else {
//         $(this).parent().addClass("opened");
//         $(this).parent().find(".skrito").slideToggle();
//     }
//     return false;
//   });
// });
