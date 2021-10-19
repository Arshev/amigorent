// import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.js'
import Search from '../search_main.vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueSweetalert2 from 'vue-sweetalert2';
import Loading from 'vue-loading-overlay';
// import 'vue-loading-overlay/dist/vue-loading.css';
// import 'flatpickr/dist/flatpickr.css';


// If you don't need the styles, do not connect
// import 'sweetalert2/dist/sweetalert2.min.css';


Vue.use(VueSweetalert2);
// Vue.use(TurbolinksAdapter)
Vue.use(VueAxios, axios)
Vue.component("loading", Loading);

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#search_main',
    data: () => {
      return {
        phone: null,
        name: null,
        text: null,
        showModal: false
      }
    },
    components: { Search },
    methods: {
      sendBooking() {
        console.log(this.phone, this.name, this.text)
      }
    }
  })
})
// Turbolinks.start()