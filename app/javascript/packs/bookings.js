import Vue from 'vue/dist/vue.js'
import Bookings from '../bookings.vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueSweetalert2 from 'vue-sweetalert2';
import Loading from 'vue-loading-overlay';
import VModal from 'vue-js-modal'
import Vuelidate from 'vuelidate'
import Maska from 'maska'


Vue.use(VueSweetalert2);
Vue.use(VueAxios, axios)
Vue.axios.defaults.baseURL =
  process.env.NODE_ENV === "development"
    ? "http://localhost:3001"
    : "https://stayhub.ru";
Vue.component("loading", Loading);
Vue.use(VModal)
Vue.use(Vuelidate)
Vue.use(Maska)
Vue.config.productionTip = false

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
