// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import _headJS from './assets/js/head.js'
import _RESETCSS from './assets/css/reset.css'
import _COMMONCSS from './assets/css/common.css'

Vue.config.productionTip = false

axios.defaults.baseURL =HOST
axios.defaults.timeout = 1000 * 15
axios.defaults.headers['Content-Type'] = 'application/json'



const VueObj=new Vue()
window.VueObj=VueObj
window.axios=axios
window.HOST=HOST

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
