<template>
<div class="index-first-menu-container">
	<div class="travel-place-type">
	   <ul>
		<div>
			 <li  v-for="(item,index) in firstMenu"> <span  v-if="index==0" class="travel-place-type-active travel-place-type-activefont place-con" :index="index" :tag1id="item.id">{{item.name}}</span>
				<span class=""  v-if="index!=0" class="place-con" :index="index" :tag1id="item.id">{{item.name}}</span>
			 </li>
			
		</div>           
	    </ul>
	</div>
</div>
</template>
<script>
	import http from '../../assets/js/axiosHttp'
	export default {
		data(){
			return {
				firstMenu:[]
			}
		},
		created(){
			this.getfirstMenu();
		},
		methods:{
			getfirstMenu(){
				this.httpGet(dataApi.indexFirstMenu)
					.then((res)=>{
						console.log(res)
						this.firstMenu=res.data;
					})
					.catch((error)=>{
						console.log(error)
					})
			}
		},
		mixins:[http]
	}
</script>
<style>
	.travel-place-type{padding:0.5rem;height:4.4rem;background: #fff;z-index:999;font-size: 1.8rem;color:#333; }

	.travel-place-type ul li{float:left;width:25%;height:100%;text-align: center;line-height: 4.4rem;}
	.travel-place-type-active{border-bottom:2px solid #ec4c40;}
	.travel-place-type-activefont{color:@topic-color!important;}
	.travel-place{padding-left: 0.5rem;background-color: #fff;}
	.travel-place ul li{float:left;width:25%;height:3.5rem;text-align: center;line-height: 3rem;font-size:1.3rem;border-bottom:1px solid #eee;border-right:1px solid #eee;margin-right:-3px;}
	.travel-place ul li i{display: inline-block;width:5.5rem;padding:0.2rem 0;}
	.first-important{border-radius: 25px;background: #ec4c40;padding:0.5rem;color:#fff!important;}
	.travel-place ul li.border-right-clear{border-right:none;}
	.border-none{border-right:1px solid #fff!important;}
	.clear{clear:both;}
	.place-con{    height: 100%;display: inline-block;width: 100%;}
</style>