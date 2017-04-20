<template>
	<div class="index-swiper-container">
		<!-- 使用其他组件步骤3使用组件标签 -->
		<swiper :options="swiperOption">
			<!-- 幻灯内容 -->
			<div  v-for="swiperli in lilist">	
				<swiperSlide><div><a href="javascript:;"></a><div class="swiper-img"><img :src="contactImgUrl(swiperli.image)" alt=""></div></div></swiperSlide>
			</div>
			<!-- 以下配置均为可选（使用具名slot来确定并应用一些操作控件元素） -->
			  <div class="swiper-pagination"  slot="pagination"></div>
			  <!-- <div class="swiper-button-prev" slot="button-prev"></div>
			  <div class="swiper-button-next" slot="button-next"></div>
			  <div class="swiper-scrollbar"   slot="scrollbar"></div> -->
		</swiper>
	</div>	
</template>
<script>
	/*使用其他组件步骤1，引入组件*/
	import {swiper,swiperSlide,swiperPlugins} from 'vue-awesome-swiper'
	import http from '../../assets/js/axiosHttp'
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
		      },
		      lilist:[]
		  }
	    },
		components:{/*使用其他组件步骤2，注册组件*/
			swiper,
			swiperSlide
		},
		created(){
			this.getSwiperData();
		},
		methods:{
			getSwiperData(){
				this.httpGet(dataApi.indexSwiper)
					.then((res)=>{
						if(res.status==1){
							this.lilist=res.data
							this.swiperOption=this.swiperOption
							console.log('swiper:',res)
						}else{
							console.log('请求失败')
						}
					})
					.catch((error)=>{
						console.log(error)
					})
			},
			contactImgUrl(url){
				return HOST+url;
			}
		},
		computed:{
			
		},
		mixins:[http]//合并模块

	}
</script>
<style>
	.swiper-img img{width:100%;}
</style>