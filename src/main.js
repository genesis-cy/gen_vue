import Vue from 'vue'
import App from './App.vue'
import store from "./store/index"
import './quasar-user-options.js'
import Toasted from 'vue-toasted';

Vue.use(Toasted, {
  theme: "outline",
  duration: 3000,
  position: "top-center",
})

Vue.config.productionTip = false

new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
