<template>
	<div class="index-ll-container">
		<div class="goodlists-box">
		    <div class="goodslist" tagid="1" tag2id="1"> 
		    	<ul>  
		    		<li v-for="(value,index) in linelist" :goodid="value.id">                 
			    		<div> <div class="good-img"> <div class="good-imgjpg"><img :src="contactImgUrl(value.img)" alt=""></div> <div class="good-type"><span>{{value.line_type}} | {{value.start_palce}}出发</span></div> <div class="good-price"><small>￥</small><span>{{value.price}}</span>起</div> </div>  </div> <div class="good-desc"> <div> <p class="good-title">{{value.main_name}}</p> <p class="sub-title">{{value.sub_name}}</p> </div> <div class="good-labels">  <ul class="good-label">  <li
			    		v-for="labelV in value.label">{{labelV}}</li>  </ul> </div> </div> 
		    		</li>   
		    	</ul> 
		    </div></div>
	</div>
</template>
<script>
	import http from '../../assets/js/axiosHttp'
	export default {
		data(){
			return {
				linelist:[]
			}
			
		},
		created(){
			this.getLineList()
		},
		methods:{
			getLineList(){
				//var LinelistUrl=dataApi.indexLineList+'?tag1='+'1'+"&tag2="+'1'+'&page='+'1'
				const data = {
		          params: {
		            tag1: 1,
		            tag2:1,
		            page: 1
		          }
		        }
				this.httpGet(dataApi.indexLineList,data)
					.then((res)=>{
						if(res.status==1){
							console.log(res)
							this.linelist=res.data.lists
						}else{
							console.log('请求失败')
						}
					})
					.catch((error)=>{
						console.log(error)
					})	
			},
			contactImgUrl(url){
				return HOST+url
			}
		},
		mixins:[http]
	}
</script>
<style>
	.goodslist{background: #fff;}
	.goodslist>ul>li{border-bottom:4px solid #eee;}
	.swiper-img{height:210px; position: relative;overflow: hidden;}
	.goodslist>ul>li .good-imgjpg{height:400px; position: relative;overflow: hidden;}
	.goodslist>ul>li .good-imgjpg img{position: absolute;top: 50%;left: 0;width: 100%;-webkit-transform: translateY(-50%);transform: translateY(-50%);}
	.scrollFixedTop{position:fixed;top:0;}
	.scrollFixedTopfix{margin-top: 4.4rem}
	/*.goodlists-box .goodslist{display: none;}*/
	.goodslist ul li{text-align: left;}
	.goodslist ul li .good-img{position:relative;}
	.goodslist ul li .good-img img{width:100%;}
	.goodslist ul li .good-type{position:absolute;top:0.5rem;left:1rem;line-height: 2rem; font-size:1rem;text-align: center;background: #333;opacity: 0.8;color:#fff;padding:0 0.5rem;}
	.goodslist ul li .good-price{border-radius:4px 0 0 4px;position:absolute;bottom:1rem;right:0rem;height:3rem;line-height: 3.2rem;font-size: 1.4rem;text-align: center; background:#f8791c;padding:0 0.5rem;color:#fff;}
	.goodslist ul li .good-price span{font-size: 2.2rem;}
	.goodslist ul li .good-desc{padding:1rem 1rem;}
	.goodslist ul li .good-desc .good-title{padding:0.2rem 0;font-size:1.6rem;color:#333;width:100%;text-overflow:ellipsis;overflow: hidden;white-space: nowrap;}
	.goodslist ul li .good-desc .sub-title{ padding:0.2rem 0;   font-size: 1.3rem;line-height: 1.4rem;color: #666;text-overflow:ellipsis;overflow: hidden;white-space: nowrap;}
	.goodslist ul li .good-desc div>p.sell-charge{color:#f8791c;border:1px solid #f8791c;display: inline; padding: 0.1rem;}
	.goodslist ul li .good-desc .good-labels{margin-top:0.3rem;font-size: 1rem;padding:0.2rem;}
	.goodslist ul li .good-desc .good-label{display: inline;}
	.goodslist ul li .good-desc .good-label p{padding: 0.1rem 0!important;}
	.goodslist ul li .good-desc .good-label li{display: inline-block;border:1px solid #999;font-size:1rem; color:#999;padding:0.2rem;}
	#load-data{text-align: center;font-size: 1rem;color: #aaa;width: 100%;height: 2rem;line-height: 2rem;}

</style>