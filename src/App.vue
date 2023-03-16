<template>
  <q-layout view="hHh lpR fFf">
    <q-header reveal bordered class="bg-white text-white" height-hint="98">
      <q-toolbar>
        <img class="logo" src="@/assets/logo.png" />
        <q-space />
        <q-tabs v-model="tab" class="text-teal">
          <q-tab name="one" @click="tab = 'one'" label="JOIN TRIAL" />
          <q-tab name="two" @click="tab = 'two'" label="MY RECORD" />
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

    <q-drawer
      v-model="leftDrawerOpen"
      side="left"
      overlay
      behavior="desktop"
      bordered
    >
      <q-list>
        <q-item clickable>
          <q-item-section>
            <img src="@/assets/1.png" />
          </q-item-section>
        </q-item>
        <q-item clickable>
          <q-item-section>
            <img src="@/assets/2.png" />
          </q-item-section>
        </q-item>
        <q-item clickable>
          <q-item-section>
            <img src="@/assets/3.png" />
          </q-item-section>
        </q-item>
        <q-item clickable>
          <q-item-section>
            <img src="@/assets/4.png" />
          </q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <q-page-container>
      <q-page>
        <div class="main">

          <!-- <template v-if="getUserAccount">


            <div
              v-if="tab === 'one'"
              class="flex justify-center align-items-center"
              style="height: 100%"
            >
            <div><img class="logo" src="@/assets/mc.png" width="200" /></div>


              <q-btn
                round
                size="lg"
                color="primary"
                class="q-ma-md"
                icon="add"
                @click="tab = 'two'"
              />
              <div><img class="logo" src="@/assets/Garm.png" width="200" /></div>
              <q-btn
                round
                size="lg"
                color="primary"
                class="q-ma-md"
                icon="add"
                @click="tab = 'two'"
              />

            <div><img class="logo" src="@/assets/fountain+.png" width="200" /></div>
              <q-btn
                round
                size="lg"
                color="primary"
                class="q-ma-md"
                icon="add"
                @click="tab = 'two'"
              />
            </div>
            <div v-else>
              <div class="flex justify-center align-items-center">
                <q-form @submit="onSubmit" class="q-gutter-md">
                  <img class="logo" src="@/assets/waterfall_nft.png" width="600" />

                  <h4 class="text-center">MY RECORD</h4>
                  <q-input outlined v-model="name" label="Full name" />
                  <q-input outlined v-model="dob" label="Date of Birth">
                    <template v-slot:prepend>
                      <q-icon name="event" class="cursor-pointer">
                        <q-popup-proxy
                          transition-show="scale"
                          transition-hide="scale"
                        >
                          <q-date v-model="dob" mask="YYYY-MM-DD HH:mm">
                            <div class="row items-center justify-end">
                              <q-btn
                                v-close-popup
                                label="Close"
                                color="primary"
                                flat
                              />
                            </div>
                          </q-date>
                        </q-popup-proxy>
                      </q-icon>
                    </template>
                  </q-input>
                  <q-input
                    outlined
                    type="number"
                    v-model="height"
                    label="Height (cm)"
                  />
                  <q-input
                    outlined
                    type="number"
                    v-model="weight"
                    label="Weight (Kg)"
                  />
                  <q-input
                    outlined
                    v-model="overview"
                    type="textarea"
                    label="Health overview"
                  />
                  <div>
                    <q-btn
                      label="Mint Record"
                      size="lg"
                      class="q-px-lg"
                      type="submit"
                      color="primary"
                    />
                  </div>
                </q-form>
              </div>
            </div>
          </template> -->
          <template >
            <div class="">
 <div class="hero-image-holder">
      
        <img
          class="hero-image"
          src="@/assets/home_banner.svg"
          alt="Gen Card Mint Your Record"
          loading="lazy"
        />
      
      <p class="hero-text">
       GenLife Card  -  patient medical record “Your GenLife card acts as an access card to your trials and to your data”
      </p>
    </div>
    <section class="services-section">
      <h4 class="services-title">Trials you can join today</h4>
      <div class="services-wrapper">
        <div class="card-services">
          <!-- card-image -->
          <div class="card-content">
            <img
              class="responsive-image"
              src="@/assets/dna.png"
              alt="Reprogram"
              loading="lazy"
            />
            <div class="card-title">Plasmapheresis</div>
            <div class="card-text">
              improving epigentic age
6 weeks 6 treatments
            <div class="slots">20/100</div>
            <div class="prices">$5000</div>
            <button class="button">Learn More</button>
            </div>
          </div>
        </div>
        <div class="card-services">
          <!-- card-image -->
          <div class="card-content">
            <img
              class="responsive-image"
              src="@/assets/molecule.png"
              alt="Reshape"
              loading="lazy"
            />
            <div class="card-title">Exosomes</div>
            <div class="card-text">
               improving epigentic age
6 weeks 6 treatments
            <div class="slots">20/100</div>
            <div class="prices">$5000</div>
            <button class="button">Learn More</button>
            </div>
          </div>
        </div>
        <div class="card-services">
          <!-- card-image -->
          <div class="card-content">
            <img
              class="responsive-image"
              src="@/assets/atom.png"
              alt="Redesign"
              loading="lazy"
            />
            <div class="card-title">AKG</div>
            <div class="card-text">
              improving epigentic age
6 weeks 6 treatments
                        <div class="slots">20/100</div>
            <div class="prices">$5000</div>
            <button class="button">Learn More</button>
            </div>
          </div>
        </div>
      </div>
    </section>


              <!-- <video height="600px" controls autoplay loop style="margin: auto">
                <source src="@/assets/Fountain_NFT.mp4" type="video/mp4" />
              </video> -->
            </div>
            <!-- <div class="flex">
            <q-card class="ml">
              <h4>Treatments</h4>
              <p><span>8-28-21</span> GHRH Plasmid Injection</p>
              <p><span>10-28-21</span> GHRH Plasmid Injection</p>
              <p><span>9-4-21</span> Exosome Injection</p>
              <p><span>11-22-21</span> Exosome injection</p>
              <p><span>9-16-21</span> Spice IV Injection</p>
              <p><span>12-1-21</span> Spice IV Injection</p>
              <img class="abs" src="@/assets/preview_1.png" alt="" />
            </q-card>
            <q-card>
              <h4>Diagnostics</h4>
              <p><span>8-28-21</span> DEXA Scan - LINK</p>
              <p><span>10-28-21</span>Blood Labs - LINK</p>
              <p><span>9-4-21</span>Genome Panel - LINK</p>
              <p><span>11-22-21</span>Genome Panel - LINK</p>
              <p><span>9-16-21</span>Blood Labs - LINK</p>
              <p><span>12-1-21</span>DEXA Scan - LINK</p>
              <img class="abs" src="@/assets/preview_2.png" alt="" />
            </q-card>
          </div> -->
          </template>
        </div>
        <!-- <img class="last-img" src="@/assets/footer.png" alt="" /> -->
      </q-page>
    </q-page-container>
  </q-layout>
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
.header-class {
  background-color: black;
  color: white;
}
.account-show {
  border: 1px solid;
  border-radius: 50px;
  padding: 10px 25px;
}
</style>
