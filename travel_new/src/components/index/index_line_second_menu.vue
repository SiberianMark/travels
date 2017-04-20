<template>
	<div class="index-ls-menu-container">
		<div class="travel-place-box">
			<div class="travel-place" tag1id="1">
				<ul>
				    <li v-for="(value,index) in lsMenu">
					     <div v-if="index==0" :tag2id="value.id"> <a href="javascript:" class="first-important"> <i>{{value.name}}</i> </a></div>
					     <div v-else :tag2id="value.id"> <a href="javascript:" class=""> <i>{{value.name}}</i> </a></div>
				    </li>          
				</ul> 
				<div class="clear"></div> 
			</div>
		</div>
	</div>
</template>
<script>
	import http from '../../assets/js/axiosHttp'
	export default{
		data(){
			return {
				lsMenu:[]
			}			
		},
		created(){
			this.getlsMenu()
		},
		methods:{
			
			getlsMenu(){
				var secondMenuUrl=dataApi.indexSecondMenu+'?tag1='+'1'
				this.httpGet(secondMenuUrl)
					.then((res)=>{
						if(res.status==1){
							console.log(res)
							this.lsMenu=res.data.lists
						}else{
							console.log('请求失败')
						}
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
	
</style>