<template>
  <q-layout view="hHh lpR fFf">
    <q-header reveal bordered class="bg-white text-white" height-hint="98">
      <q-toolbar>
        <img class="logo" src="@/assets/genIcon.png" />
        <q-space />
        <q-tabs v-model="tab" class="text-teal">
          <router-link to="/">Gen Card</router-link>
          <router-link to="/Trials">Trials</router-link>
          <router-link to="/Clinics">Clinic</router-link>
          <!-- <q-tab name="two" @click="tab = 'two'" label="Gen Card" />
          <q-tab name="one" @click="tab = 'one'" label="Trials" />
          <q-tab name="three" @click="tab = 'three'" label="Clinic" /> -->
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
          Connect wallet
          <q-avatar
            color="white"
            text-color="primary"
            icon="power_settings_new"
          />
        </q-btn>
      </q-toolbar>
    </q-header>

    <router-view />
  </q-layout>
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

import { mapActions, mapGetters, mapState } from "vuex";
export default {
  name: "Aleph-Beit",
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

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
