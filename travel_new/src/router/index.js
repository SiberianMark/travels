import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import index from '@/components/index/index'
import login from '@/components/login/login'
import iSecondMenu from '@/components/index/index_line_second_menu.vue'
import iLineList from '@/components/index/index_line_list.vue'
Vue.use(Router)

export default new Router({
  mode: 'history',
  base: __dirname,
  routes: [
    {
      path: '/index',
      name: 'index',
      component: index,
      children:[
        {
          path: ':tag1id',
          name: 'indexTag1',
          component: iSecondMenu,
          children:[
            {
              path: ':tag2id',
              name: 'indexTag2',
              component: iLineList,
            }
          ]
        },
        {path:'iSecondMenu/',component:iSecondMenu,name:'iSecondMenu'}
      ]
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
