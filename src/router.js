import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/home',
      name: 'home',
      component: () => import('@/views/Home'),
    },
    {
      path: '/trial',
      name: 'trial',
      component: () => import('@/views/Trial'),
    },
    // {
    //   path: '/',
    //   name: 'index',
    //   component: () => import('@/views/ReactorControls'),
    // },
    {
      path: '/clinic',
      name: 'clinic',
      component: () => import('@/views/Clinic'),
    },
    {
      path: '/patientRecord',
      name: 'patientRecord',
      component: () => import('@/views/PatientRecord'),
    },
    {
      path: '/test',
      name: 'test',
      component: () => import('@/views/Test'),
    },
    {
      path: '*',
      name: 'reroute',
      component: () => import('@/views/Login'),
    },
  ],
});
