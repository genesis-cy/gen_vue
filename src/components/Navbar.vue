<template>
  <header id="header-navbar" aria-label="Primary Navigation" role="banner">
    <!-- HEADER NAVBAR MAIN -->

    <nav class="header-navbar-main">
      <!-- NAVBAR MAIN LEFT -->

      <div class="header-navbar-main-left">
        <!-- Navbar Logo -->

        <router-link to="/" class="header-navbar-logo-link">
          <picture class="header-navbar-logo-container">
            <source
              media="(min-width: 992px)"
              srcset="@/assets/Logo.svg"
              sizes="100vw"
            />
            <img
              class="header-navbar-logo"
              src="@/assets/Logo.svg"
              alt="Genesis Logo"
              loading="lazy"
            />
          </picture>
        </router-link>
      </div>

      <!-- NAVBAR MAIN RIGHT -->
      <div
        class="header-navbar-main-right"
        :class="{ [`header-navbar-main-right--collapsed`]: !showFullNavbar }"
      >
        <div class="header-navbar-sub-content-holder">
          <ul class="header-navbar-sub-content">
            <li
              v-for="navItem in navItems"
              :key="navItem.name"
              class="header-navbar-sub-nav-item"
            >
              <!-- v-ripple="{ color: 'rgba(57, 30, 30, .4)' }" -->
              <router-link
                class="header-navbar-sub-nav-item-link"
                class-active="active"
                :to="navItem.link"
                >{{ navItem.name }}</router-link
              >
              <div class="element"></div>
            </li>
          </ul>
          <button v-if="userAccount" class="btn-connect button">
            {{ addrTruncation(userAccount) }}
          </button>
          <button v-else class="btn-connect button" @click="onConnect">
            JOIN TRIAL
          </button>
        </div>
      </div>
    </nav>
  </header>
</template>
<script>
import Web3 from "web3";
import Web3Modal from "web3modal";
// IMPORT STORE DATA
import { mapActions, mapGetters, mapState } from "vuex";
// IMPORTS

// COMPONENTS & MODULES

// SVG ICONS
// import SvgIconHamburgerMenu from "@/components/GlobalComponents/SvgComponents/SvgIconHamburgerMenu.vue";

export default {
  // NAME
  name: "NavBar",

  // COMPONENTS
  components: {},

  // DATA
  data() {
    return {
      // SCROLL HANDLER CAN REMOVE WHEN MADE INTO DIRECTIVE
      showFullNavbar: true,
      lastScrollPosition: 0,
      // END OF SCROLL HANDLER
      navItems: [
        {
          name: "Trial",
          link: "/trials",
        },

        {
          name: "Clinics",
          link: "/clinics",
        },
        {
          name: "About",
          link: "/about",
        },
      
        // {
        //   name: "Form",
        //   link: "/form",
        // },
        // {
        //   name: "Patient",
        //   link: "/patient",
        // },
        // {
        //   name: "Exotrial",
        //   link: "/exotrial",
        // },
        // {
        //   name: "Consent",
        //   link: "/consent",
        // },

      ],
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

  // COMPUTED
  computed: {
    ...mapGetters("wallet", ["getWeb3", "getUserAccount"]),
    ...mapState("wallet", ["userAccount"]),
  },

  // MOUNTED LIFECYCLE
  // SCROLL HANDLER CAN REMOVE WHEN MADE INTO DIRECTIVE
  mounted() {
    window.addEventListener("scroll", this.onScroll);
    this.web3Modal = new Web3Modal({
      cacheProvider: false,
      disableInjectedProvider: false,
    });
  },
  // END OF SCROLL HANDLER

  // SCROLL HANDLER CAN REMOVE WHEN MADE INTO DIRECTIVE
  // BEFORE DESTROY LIFECYCLE
  beforeDestroy() {
    window.removeEventListener("scroll", this.onScroll);
  },
  // END OF SCROLL HANDLER

  // CREATED LIFECYCLE
  created() {},

  // METHODS
  methods: {
    // SCROLL HANDLER CAN REMOVE WHEN MADE INTO DIRECTIVE
    onScroll() {
      const currentScrollPosition =
        window.pageYOffset || document.documentElement.scrollTop;
      if (currentScrollPosition < 0) {
        return;
      }
      // Stop executing this function if the difference between
      // current scroll position and last scroll position is less than some offset
      if (Math.abs(currentScrollPosition - this.lastScrollPosition) < 60) {
        return;
      }
      this.showFullNavbar = currentScrollPosition < this.lastScrollPosition;
      this.lastScrollPosition = currentScrollPosition;
    },
    // END OF SCROLL HANDLER
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
};
</script>

<style lang="scss" scoped>
// SELF FLEX PROPERITES
// FLEX
// FLEX PROPERTIES

// DEAFULT SM (unamed) is upto 480px with some rules upto 360px below for icons

//
// HEADER NAVBAR START
//

#header-navbar {
  // Positioning
  background-color: white;
  position: fixed;
  top: 0px;
  left: 0px;
  // Dimensions
  // Height for mobile 54px + 54px + 54px middle section pushes down to make 3rd row on mobile environments === 162 need to consider 3px background image bottom of nav
  // min-height: 54 * 2px; // doesnt work on resize nav animation
  // height: 54 * 3px; // changed to this for scroll animation
  width: 100%;
  // background-color: $colour-nav-background;
  box-shadow: 0px 1px 6px rgba(41, 3, 0, 0.3);
  z-index: 10;
  // padding: 0 16px;
  transition: 0.3s all ease-out; // needed for animating between changing themes
  // Background Image
}

.header-navbar-main {
  position: relative; // this used to be for AppModals can remove as will nest modals in NavBar Sections
  // min-height: 54px;
  width: 100%;
  max-width: 1200px;
  margin: auto;
  // FLEX
  display: flex;
  // FLEX PROPERTIES
  flex-wrap: wrap;
  // justify-content: space-between;
}

.header-navbar-main-left {
  height: 54px;
  // FLEX
  display: flex;
  // FLEX PROPERTIES
  align-items: center;
}

.hamburger-menu-button-container {
  // OVERFLOW FOR RIPPLE EFFECT
  overflow: hidden;
  // SELF FLEX PROPERITES
  flex: 0 0 36px;
  height: 48px;
  min-width: 36px; // hack needed for inner flex items not overlapping
  // FLEX
  display: flex;
  // FLEX PROPERTIES
  align-items: center;
  justify-content: center;
}

.header-navbar-logo-link {
  // OVERFLOW FOR RIPPLE EFFECT
  overflow: hidden;
  margin-left: 4px;
  height: 48px;
  display: flex;
  align-items: center;
}

.header-navbar-logo-container {
  // FLEX
  display: flex;
  // FLEX PROPERTIES
  align-items: center;
  justify-content: center;
}
.router-link-active + .element {
  // content: "";
  // position: absolute;
  width: 100%;
  height: 3px;
  background-color: #126d57;
}
.header-navbar-logo {
  height: 24px;
  height: 32px;
}

.header-navbar-main-right {
  // SELF FLEX PROPERITES
  flex: 1 0 100%;
  order: 5;
  // FLEX
  display: flex;
  // FLEX PROPERTIES
  align-items: center;
  overflow: hidden; // for collapsing element for nav scroll animation
  height: 54px;
  // ADDED for Scroll animation
  transition: height 280ms ease-out;

  &--collapsed {
    height: 0;
    transition: height 280ms ease-out;
  }
}

.header-navbar-sub {
  height: 54px;
  width: 100%;
  max-width: 1200px;
  margin: auto;
  overflow: hidden; // for collapsing element for nav scroll animation
  // ADDED for Scroll animation
  transition: height 280ms ease-out;

  &--collapsed {
    height: 0px;
    transition: height 280ms ease-out;
  }
}

.header-navbar-sub-content-holder {
  // FLEX
  display: flex;
  // FLEX PROPERTIES
  flex-wrap: nowrap;
  align-items: center;
  // justify-content: space-between;
  // makes scrollable
  white-space: nowrap;
  overflow-x: scroll;
  overflow-y: hidden;

  &::-webkit-scrollbar {
    display: none;
  }
}

.header-navbar-sub-content {
  list-style-type: none;
  margin-block-start: 0em;
  margin-block-end: 0em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  padding-inline-start: 0px;
  min-height: 54px;
  // FLEX
  display: flex;
  // FLEX PROPERTIES
  flex-wrap: nowrap;
  align-items: center;
  // justify-content: space-between;
  // makes scrollable
  // white-space: nowrap;
  // overflow-x: scroll;
  // overflow-y: hidden;

  &::-webkit-scrollbar {
    display: none;
  }
}

.header-navbar-sub-nav-item {
  height: 48px;
}

.header-navbar-sub-nav-item-link {
  // FLEX
  text-decoration: none;
  display: flex;
  // FLEX PROPERTIES
  align-items: center;
  height: 48px;
  // display: block;
  overflow: hidden;
  padding: 0 10px;
}

.button {
  margin: 0px auto 0px;
  width: 150px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  white-space: nowrap;
  background-color: #dafff6;
  border: 2px solid #05540d;
  border-radius: 28px;
  font-size: 14px;
  font-family: "Open Sans";
}

// SMALL
// 481

// MEDIUM
// 768px

// LARGE
// 992px

.header-navbar-logo-link {
  margin-left: 16px;
  // @include margin-right(16px);
}

.hamburger-menu-button-container {
  // SELF FLEX PROPERITES
  flex: 0 0 48px;
  min-width: 48px; // hack needed for inner flex items not overlapping
}

.header-navbar-main-right {
  flex: initial;
  // flex-basis: initial;
  order: 0;
  flex-wrap: nowrap;

  &--collapsed {
    height: 54px;
  }
}

.regional-settings-dropdown-button {
  display: flex;
}

.header-navbar-sub {
  &--collapsed {
    height: 54px;
  }
}
</style>
