<template>
  <div>
    <q-layout view="genView">
      <q-page-container>
        <q-page>
          <div class="main">
            <template>
              <div class="">
                <section class="services-section">
                  <h4 class="services-title">Trials you can join today</h4>
                  <div class="services-wrapper">
                    <div class="card-services">
                      <!-- card-image -->
                      <div class="card-content">
                        <img
                          class="responsive-image"
                          src="@/assets/icon2.png"
                          alt="Reprogram"
                          loading="lazy"
                          width="300px"
                        />
                        <div class="card-title">GenAge</div>
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
                          src="@/assets/exo2.png"
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
                          src="@/assets/exo.png"
                          alt="Redesign"
                          loading="lazy"
                        />
                        <div class="card-title">Plasma</div>
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
  name: "Trials",
};
</script>

<style lang="scss" scoped></style>
