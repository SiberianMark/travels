<template>
	<!-- 使用其他组件步骤3使用组件标签 -->
	<swiper :options="swiperOption">
		<!-- 幻灯内容 -->
		<swiperSlide><div><a href="javascript:;"></a><div class="swiper-img"><img src="http://hyu2594430001.my3w.com/Public/Upload/line/58c55575bef64.jpg" alt=""></div></div></swiperSlide>
		<swiperSlide><div><a href="javascript:;"></a><div class="swiper-img"><img src="http://hyu2594430001.my3w.com/Public/Upload/line/58c55575bef64.jpg" alt=""></div></div></swiperSlide>
		<swiperSlide><div><a href="javascript:;"></a><div class="swiper-img"><img src="http://hyu2594430001.my3w.com/Public/Upload/line/58c55575bef64.jpg" alt=""></div></div></swiperSlide>
		<swiperSlide><div><a href="javascript:;"></a><div class="swiper-img"><img src="http://hyu2594430001.my3w.com/Public/Upload/line/58c55575bef64.jpg" alt=""></div></div></swiperSlide>
		<!-- 以下配置均为可选（使用具名slot来确定并应用一些操作控件元素） -->
		  <div class="swiper-pagination"  slot="pagination"></div>
		  <!-- <div class="swiper-button-prev" slot="button-prev"></div>
		  <div class="swiper-button-next" slot="button-next"></div>
		  <div class="swiper-scrollbar"   slot="scrollbar"></div> -->
	</swiper>
</template>
<script>
	/*使用其他组件步骤1，引入组件*/
	import {swiper,swiperSlide,swiperPlugins} from 'vue-awesome-swiper'
	export default {
		/*使用其他组件步骤4，配置操作组件*/
		name: 'carrousel',
	    data() {
		    return {
		      swiperOption: {
		        // 如果你后续需要找到当前实例化后的swiper对象以对其进行一些操作的话，可以自定义配置一个名字
		        name: 'currentSwiper',
		        // 所有配置均为可选（同Swiper配置）
		        autoplay: 3000,
		        direction : 'horizontal',
		        grabCursor : true,
		        setWrapperSize :true,
		        autoHeight: true,
		        mousewheelControl : true,
		        observeParents:true,
		        // if you need use plugins in the swiper, you can config in here like this
		        debugger: true,
		        // swiper callbacks
		        onTransitionStart: function(swiper){
		          console.log(swiper)
		        },
		        // more Swiper config ...
		        // ...
		      }
		  }
	    },
		components:{/*使用其他组件步骤2，注册组件*/
			swiper,
			swiperSlide
		}
	}
</script>
<style>
	.swiper-img img{width:100%;}
</style>