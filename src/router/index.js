import vue from 'vue'
import vueRouter from 'vue-router'
import home from '../views/home.vue'

vue.use(vueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: home
  }
]

const router = new vueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
