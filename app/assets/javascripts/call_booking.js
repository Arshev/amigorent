document.addEventListener("turbolinks:load", function() {
  var app = new Vue({
    el: '#app',
    data: {
      phone: null,
      name: null,
      text: null,
      showModal: false
    }
  })
  Vue.use(VueAxios, axios)
  // register modal component
  Vue.component("modal", {
    template: "#modal-template",
  });
})