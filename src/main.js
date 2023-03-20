import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
// import "./quasar-user-options.js";
import Toasted from "vue-toasted";

Vue.use(Toasted, {
  theme: "outline",
  duration: 3000,
  position: "top-center",
});

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
