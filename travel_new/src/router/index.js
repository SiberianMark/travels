import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import index from '@/components/index/index'

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
    }
  ]
})
