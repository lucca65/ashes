// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
// import 'node_modules/semantic-ui-css/semantic.min.css'
import 'semantic-css'
// import 'semantic-js'

import devtools from '@vue/devtools'
import Vue from 'vue'
import App from '@/App.vue'
// import router from '@/router'
// import store from '@/store'

Vue.config.productionTip = false
if (process.env.NODE_ENV === 'development') {
  devtools.connect('localhost', '8098')
}
/* eslint-disable no-new */
new Vue({
  el: '#app',
  // store,
  // router,
  template: '<App/>',
  components: { App }
})
