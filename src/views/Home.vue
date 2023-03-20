<template>
  <div>
    <q-layout view="hHh lpR fFf">
      <q-page-container>
        <q-page>
          <div class="main">
            <template>
              <div class="">
                <div class="hero-image-holder">
                  <img
                    class="hero-image"
                    src="@/assets/home_banner.svg"
                    alt="Gen Card Mint Your Record"
                    loading="lazy"
                  />

                  <p class="hero-text">
                    GenLife Card - client medical record “Your GenLife card acts
                    as an access card to your trials and to your data ”
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
                          improving epigentic age 6 weeks 6 treatments
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
                          improving epigentic age 6 weeks 6 treatments
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
                          improving epigentic age 6 weeks 6 treatments
                          <div class="slots">20/100</div>
                          <div class="prices">$5000</div>
                          <button class="button">Learn More</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </section>
              </div>
            </template>
          </div>
        </q-page>
      </q-page-container>
    </q-layout>
  </div>
</template>

<script>
export default {
  name: "Home",
  components: {},
};
</script>
