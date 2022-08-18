import { createRouter, createWebHistory } from 'vue-router'
import mapView from '../views/mapView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: mapView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/aboutView.vue')
    },
    {
      path: '/resource',
      name: 'resource',
      component: () => import('../views/resourceView.vue')
    },
    {
      path: '/family',
      name: 'family',
      component: () => import('../views/familyView.vue')
    },
    {
      path: '/map',
      name: 'map',
      component: () => import('../views/mapView.vue')
    }
  ]
})

export default router
