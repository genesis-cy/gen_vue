
<template>
  <div class="flex justify-center align-items-center">
    <q-form @submit="onSubmit" class="q-gutter-md">

      <h4 class="text-center">CREATE MY RECORD</h4>
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
</template>
