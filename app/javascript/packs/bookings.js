import Vue from 'vue/dist/vue.js'
import Bookings from '../bookings.vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueSweetalert2 from 'vue-sweetalert2';
import Loading from 'vue-loading-overlay';
import VModal from 'vue-js-modal'


Vue.use(VueSweetalert2);
Vue.use(VueAxios, axios)
Vue.component("loading", Loading);
Vue.use(VModal)

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    el: '#bookings',
    data: () => {
      return {
        phone: null,
        name: null,
        text: null,
        showModal: false
      }
    },
    components: { Bookings },
    methods: {
      sendBooking() {
        console.log(this.phone, this.name, this.text)
      }
    }
  })
})