<template>
  <div id="app">
   <vueheader></vueheader>
   <vueswiper></vueswiper>
   <indexmenu></indexmenu>
   <indextraveltype></indextraveltype>
   <indextravelptype></indextravelptype>  
   <indextravelplace></indextravelplace>
   <goodlist></goodlist>
   <vuefooter></vuefooter>
    <!-- <router-view></router-view> -->
  </div>
</template>
<script src="./assets/js/head.meta.js"></script>
<script src="./assets/js/head.css.js"></script>
<script src="./assets/js/head.js.js"></script>

<script>
// 导入二级插件
import vue_header from './components/common/vue_header';
import vue_swiper from './components/common/vue_swiper';
import index_menu from './components/index_menu';
import index_travel_p_type from './components/index_travel_p_type';
import index_travel_type from './components/index_travel_type';
import index_travel_place from './components/index_travel_place';
import goodlist from './components/goodlist';
import vuefooter from './components/common/footer';
import commeta from "./assets/js/head.meta.js";
import comcss from "./assets/js/head.css.js";
import comjs from "./assets/js/head.js.js";
export default {
  name: 'app',
  components:{
    vueheader: vue_header,
    vueswiper: vue_swiper,
    indexmenu: index_menu,
    indextravelptype:index_travel_p_type,
    indextraveltype:index_travel_type,
    indextravelplace:index_travel_place,
    goodlist:goodlist,
    vuefooter:vuefooter
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  
}
clear:both;
a,a:hover,a:active,a:visited{text-decoration: none;color:#000;}
</style>
