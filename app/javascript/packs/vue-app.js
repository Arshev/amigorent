import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Vuelidate from 'vuelidate'

import App from '../app.vue'


Vue.use(TurbolinksAdapter)
Vue.use(Vuelidate)
document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    el: '#booking',
    components: { 
      App
     }
  })
});

// document.addEventListener('turbolinks:load', () => {
  // const app = new Vue({
  //   el: '#booking',
  //   components: { 
  //     App
  //    }
  // })
// })
