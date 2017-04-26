<template>
<div class="index-first-menu-container">
	<div class="travel-place-type">
	   <ul>
		<div>
		<template>
			 <li  v-for="(item,index) in firstMenu" :tag1id="item.id" @click="changeTag(item.id)">
			    <router-link :to="{path:'/index/iSecondMenu/',query: {Totag1id:item.id}}">
				  <span  v-if="index==curTag-1" v-bind:class="[tagActive,TagplaceCon]" :index="index" >{{item.name}}</span>
				  <span class=""  v-if="index!=curTag-1" v-bind:class="[TagplaceCon]" :index="index" :tag1id="item.id">{{item.name}}</span>
				</router-link>
			 </li>
		</template>			
		</div>           
	    </ul>
	</div>
	<transition name="fade" mode="out-in" appear>
		<router-view :Totag1id="Totag1id"></router-view>
	</transition>
	<div v-if="InitisActive==true"><lineSMenu :Totag1id="Totag1id"></lineSMenu></div>
	
</div>
</template>
<script>
	import http from '../../assets/js/axiosHttp'
	import lineSMenu from './index_line_second_menu.vue'
	
	export default {
		data(){
			return {
				firstMenu:[],
				Totag1id:1,
				secondMenuRouter:'index/iSecondMenu/:',
				InitisActive:true,
				tagActive:'active',
				TagplaceCon:'place-con',
				curTag:1 //切换当前tag
			}
		},

		components:{
			lineSMenu
		},
		created(){
			if(this.InitisActive==true && this.Totag1id!=1){
					this.InitisActive=false;
			}
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
			},
			changeSMenu(url){
				router.push(url)
			},
			changeTag(tag1id){
				if(this.InitisActive==true){
					this.InitisActive=false;
				}
				 this.curTag=tag1id
				 this.Totag1id=tag1id
				// router.go({path : '/index/iSecondMenu/' , query: { Totag1id:this.Totag1id}})
				console.log(this.Totag1id)


			}
		},
		mixins:[http]
	}
</script>
<style>
	.travel-place-type{padding:0.5rem;height:4.4rem;background: #fff;z-index:999;font-size: 1.8rem;color:#333; }
	.travel-place-type ul li{float:left;width:25%;height:100%;text-align: center;line-height: 4.4rem;}
	.travel-place-type-active{}
	.travel-place-type-activefont{color:@topic-color!important;}
	.travel-place{padding-left: 0.5rem;background-color: #fff;}
	.travel-place ul li{float:left;width:25%;height:3.5rem;text-align: center;line-height: 3rem;font-size:1.3rem;border-bottom:1px solid #eee;border-right:1px solid #eee;margin-right:-3px;}
	.travel-place ul li i{display: inline-block;width:5.5rem;padding:0.2rem 0;}
	.first-important{border-radius: 25px;background: #ec4c40;padding:0.5rem;color:#fff!important;}
	.travel-place ul li.border-right-clear{border-right:none;}
	.border-none{border-right:1px solid #fff!important;}
	.clear{clear:both;}
	.place-con{    height: 100%;display: inline-block;width: 100%;}
	.travel-place-type ul li .active{border-bottom:2px solid #ec4c40;color:#ec4c40;}
	.noActive{display: none;}
</style>