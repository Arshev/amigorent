// import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Vuelidate from 'vuelidate'

import App from '../app.vue'

Vue.use(Vuelidate)
document.addEventListener("DOMContentLoaded", () => {
  const node = document.getElementById('app')
  const props = JSON.parse(node.getAttribute('data'))
  new Vue({
    render: h => h(App, { props })
  }).$mount('#booking');
});
