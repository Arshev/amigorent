// import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.js'
import SearchCars from '../search_cars.vue'
import VueSweetalert2 from 'vue-sweetalert2';


// If you don't need the styles, do not connect
// import 'sweetalert2/dist/sweetalert2.min.css';
// import 'flatpickr/dist/flatpickr.css';


Vue.use(VueSweetalert2);
// Vue.use(TurbolinksAdapter)

// document.addEventListener('turbolinks:load', () => {
document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    el: '#search_cars',
    data: () => {
      return {
        phone: null,
        name: null,
        text: null,
        showModal: false
      }
    },
    components: { "search_cars": SearchCars }
  })
})
// Turbolinks.start()