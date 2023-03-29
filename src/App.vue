<template>
  <div view="genView" class="top" id="app">
    <Navbar />
    <!-- <q-header reveal bordered class="bg-white text-white" height-hint="98">
      <q-toolbar>
        <img class="logo" src="@/assets/genIcon.png" />
        <q-space />
        <q-tabs v-model="tab" class="text-teal">
          <router-link to="/">GenCard | </router-link>
          <router-link to="/Trials">Trials | </router-link>
          <router-link to="/Clinics">Clinic | </router-link>
          <router-link to="/About">About | </router-link>
          <router-link to="/Form">Form | </router-link>
          <router-link to="/Patient">Patient | </router-link>
          <router-link to="/ExoTrial">EXO | </router-link>
          <router-link to="/Consent">Consent</router-link>

          <q-tab name="two" @click="tab = 'two'" label="Gen Card" />
          <q-tab name="one" @click="tab = 'one'" label="Trials" />
          <q-tab name="three" @click="tab = 'three'" label="Clinic" />
        </q-tabs>

        <q-btn
          v-if="userAccount"
          rounded
          unelevated
          color="primary"
          class="btn-connect"
        >
          {{ addrTruncation(userAccount) }}
          <q-avatar
            color="white"
            text-color="primary"
            icon="power_settings_new"
          />
        </q-btn>
        <q-btn
          v-else
          rounded
          unelevated
          color="primary"
          class="btn-connect"
          @click="onConnect"
        >
          JOIN TRIAL
          <q-avatar
            color="white"
            text-color="primary"
            icon="power_settings_new"
          />
        </q-btn>
      </q-toolbar>
    </q-header> -->

    <router-view class="page" />
  </div>
  <!-- <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
    </div>
    <router-view />
  </div> -->
</template>

<script>
import Web3 from "web3";
import Web3Modal from "web3modal";

import Navbar from "@/components/Navbar.vue";

import { mapActions, mapGetters, mapState } from "vuex";
export default {
  name: "Aleph-Beit",

  // COMPONENTS
  components: { Navbar },

  data() {
    return {
      tab: "one",
      name: "",
      dob: "",
      height: "",
      weight: "",
      overview: "",
      web3: null,
      web3Modal: null,
      leftDrawerOpen: true,
      selectedAccount: null,
    };
  },
  mounted() {
    this.web3Modal = new Web3Modal({
      cacheProvider: false,
      disableInjectedProvider: false,
    });
  },
  methods: {
    ...mapActions("wallet", ["SET_WEB3", "SET_USER_ACCOUNT"]),
    addrTruncation(addr) {
      return addr.slice(0, 6) + "…" + addr.slice(addr.length - 4, addr.length);
    },
    async onConnect() {
      try {
        let provider = await this.web3Modal.connect();
        this.web3 = new Web3(provider);
        this.SET_WEB3(this.web3);
        let accounts = await this.web3.eth.getAccounts();
        this.selectedAccount = accounts[0];
        this.SET_USER_ACCOUNT(accounts[0]);
        this.$toasted.show("Metamask Wallet Connected!");
      } catch (e) {
        console.log("Could not get a wallet connection", e);
        return;
      }
    },
    onSubmit() {
      this.$toasted.show("Your form is submitted");
    },
  },
  computed: {
    ...mapGetters("wallet", ["getWeb3", "getUserAccount"]),
    ...mapState("wallet", ["userAccount"]),
  },
};
</script>

<style>
@import "./styles/quasar.scss";

@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap");

#app {
  font-family: "Open Sans", Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
}
body {
  padding: 0px;
  margin: 0px;
}
.page {
  padding-top: 108px;
  width: 100%;
  max-width: 1200px;
  margin: auto;
}
</style>
