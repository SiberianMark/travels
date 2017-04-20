import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import index from '@/components/index/index'
import login from '@/components/login/login'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/index',
      name: 'index',
      component: index
    },
    {
      path: '/',
      name: 'Hello',
      component: Hello
    },
    {
      path:'/login',
      component:login,
    }
  ]
})
