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


// Vue.use(TurbolinksAdapter)
// Vue.use(Vuelidate)
// document.addEventListener("DOMContentLoaded", () => {
//   const node = document.getElementById('booking')
//   const props = JSON.parse(node.getAttribute('data'))
//   const app = new Vue({
//     el: '#booking',
//     components: { 
//       App
//      }
//   })
// });

// document.addEventListener('DOMContentLoaded', () => {
//   // Get the properties BEFORE the app is instantiated
//   const node = document.getElementById('hello-vue')
//   const props = JSON.parse(node.getAttribute('data'))

//   // Render component with props
//   new Vue({
//     render: h => h(App, { props })
//   }).$mount('#hello-vue');
// })

// document.addEventListener('turbolinks:load', () => {
  // const app = new Vue({
  //   el: '#booking',
  //   components: { 
  //     App
  //    }
  // })
// })
