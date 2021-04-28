require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "../stylesheets/application"
import toastr from 'toastr'
window.toastr = toastr

// global.toastr = require("toastr")

toastr.options.closeButton = true;
toastr.options.timeOut = 100;
toastr.options.progressBar = true;
toastr.options = {
  "positionClass": "toast-top-full-width"
}

require("trix")
require("@rails/actiontext")


