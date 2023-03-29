<template>
  <div>
    <section class="services-section">
      <h4 class="services-title">Trials you can join today</h4>
      <div class="services-wrapper">
        <div class="card-services">
          <!-- card-image -->
          <div class="card-content">
            <img
              class="responsive-image"
              src="@/assets/exo.png"
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
              src="@/assets/dna.png"
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

<script>
export default {
  name: "Trials",
};
</script>

<style lang="scss" scoped>
@media only screen and (max-width: 480px) {
  .hero-image-holder {
    position: relative;
    max-height: 500px;
  }

  .hero-image {
    max-width: 250px;
  }

  .responsive-image {
    max-width: 100%;
    height: auto;
    background-size: cover;
  }

  .hero-text {
    text-align: center;
    position: absolute;
    top: 50%;
    left: 80%;
    transform: translate(-50%, -50%);
    font-size: 14px;
    font-weight: 700;
  }

  .page-content {
    padding: 0px 16px 16px;
  }

  .services-section {
    padding: 0px 16px 16px;
  }

  .services-title {
    padding: 12px 0px;
  }

  .services-wrapper {
    display: flex;
    justify-content: space-between;

    overflow-x: scroll;
    overflow-y: hidden;
  }

  .card-services {
    flex: 0 0 240px;
    margin: 16px 24px 0px 0px;
    box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
  }

  .card-image {
    max-width: 100%;
    height: auto;
    background-size: cover;
  }

  .card-title {
    text-align: center;
    font-size: 20px;
    font-weight: 700;
    color: #152b38;
  }

  .card-text {
    padding: 18px;
    text-align: justify;
    font-size: 14px;
  }

  .slots,
  .prices {
    text-align: center;
    margin: 5px 0px;
    font-size: 22px;
  }

  .button {
    margin: 16px auto 0px;
    width: 180px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    white-space: nowrap;
    background-color: #dafff6;
    border: 2px solid #05540d;
    border-radius: 28px;
  }
}
@media only screen and (min-width: 481px) {
  .hero-image-holder {
    position: relative;
    max-height: 500px;
  }

  .hero-image {
    max-width: 555px;
  }

  .responsive-image {
    max-width: 100%;
    height: auto;
    background-size: cover;
  }
  .hero-text {
    text-align: center;
    position: absolute;
    top: 50%;
    left: 70%;
    transform: translate(-50%, -50%);
    font-size: 20px;
    font-weight: 700;
  }

  .services-section {
    padding: 0px 16px 16px;
  }

  .services-title {
    padding: 12px 0px;
  }

  .services-wrapper {
    display: flex;
    justify-content: space-between;

    overflow-x: scroll;
    overflow-y: hidden;
  }

  .card-services {
    flex: 0 0 240px;
    margin: 16px 24px 0px 0px;
    box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
  }

  .card-image {
    max-width: 100%;
    height: auto;
    background-size: cover;
  }

  .card-title {
    text-align: center;
    font-size: 20px;
    font-weight: 700;
    color: #152b38;
  }

  .card-text {
    padding: 18px;
    text-align: justify;
    font-size: 14px;
  }

  .slots,
  .prices {
    text-align: center;
    margin: 5px 0px;
    font-size: 22px;
  }

  .button {
    margin: 16px auto 0px;
    width: 180px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    white-space: nowrap;
    background-color: #dafff6;
    border: 2px solid #05540d;
    border-radius: 28px;
  }
}
@media only screen and (min-width: 992px) {
  // .hero-image-holder {
  //   position: relative;
  //   max-height: 500px;
  // }

  // .hero-image {
  //   max-width: 555px;
  // }

  // .responsive-image {
  //   max-width: 100%;
  //   height: auto;
  //   background-size: cover;
  // }

  .hero-text {
    font-size: 32px;
  }

  // // ?????? DELETE
  // .page-content {
  //   padding: 0px 16px 16px;
  // }

  // .services-section {
  //   padding: 0px 16px 16px;
  // }

  // .services-title {
  //   padding: 12px 0px;
  // }

  // .services-wrapper {
  //   display: initial;
  // }

  // .card-services {
  //   max-width: 300px;
  //   margin: 16px auto 0px;

  //   box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
  // }

  // .card-image {
  //   max-width: 100%;
  //   height: auto;
  //   background-size: cover;
  // }

  // .card-title {
  //   text-align: center;
  //   font-size: 20px;
  //   font-weight: 700;
  //   color: #152b38;
  // }

  // .card-text {
  //   padding: 18px;
  //   text-align: justify;
  //   font-size: 14px;
  // }

  // .slots,
  // .prices {
  //   text-align: center;
  //   margin: 5px 0px;
  //   font-size: 22px;
  // }

  // .button {
  //   margin: 16px auto 0px;
  //   width: 180px;
  //   height: 40px;
  //   display: flex;
  //   align-items: center;
  //   justify-content: center;
  //   white-space: nowrap;
  //   background-color: #dafff6;
  //   border: 2px solid #05540d;
  //   border-radius: 28px;
  // }

  // .services-about-section {
  //   padding: 0px 16px 16px;
  //   text-align: justify;
  // }

  // .hero-text {
  //   font-size: 28px;
  //   font-weight: 700;
  // }
}
</style>
