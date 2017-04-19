<template>
	<div class="index-header">
		<div class="logo">
            <img v-bind:src="mobilelogo" alt="">
        </div>
        <div class="search"><i class="iconfont icon icon-search"></i>
            <p>目的地/景点/关键字</p>
        </div>
        <div class="my-center">
            <a href="#"></a><i class="iconfont icon icon-my"></i> 
        </div>
	</div>
</template>
<script>
//import logo from '../../assets/logo.png'
import http from '../../assets/js/axiosHttp'
export default{
	data(){
		return {
			/*在webpack内所有自由都是模块，直接用链接找不到文件
			/mobilelogo:'../../assets/logo.png'*/
			mobilelogo:''
		}
	},
	methods:{
		getHeaderData:function(){
			this.httpGet('/Home/APITravel/web_info/').then((res)=>{
				if(res.status=200){
					this.mobilelogo=HOST+res.data.data.mobile_logo
					console.log(res)
				}else{
					console.log('请求失败')
				}
			}).catch((error)=>{
				console.log(error)
			})
				
		}
	},
	created(){
		this.getHeaderData();
	},
	mouted(){

	},
	mixins:[http]
}
</script>
<style>
	.index-header {
	  height: 3rem!important;
	  padding: 1.05rem 0.5rem!important;
	  line-height: 3rem!important;
	}
	.index-header {
	  height: 3rem;
	  padding: 1.05rem 0.5rem;
	  line-height: 3rem;
	  color: #099fde;
	  background: #fff;
	}
	.logo {
	  float: left;
	  height: 2.4rem;
	  margin-right: 2.5rem;
	  margin-top: 0.4rem;
	}
	.index-header .logo img {
	  height: 2.4rem;
	}
	.index-header > div.choose-city,
	.search {
	  float: left;
	}
	.search {
	  border: 1px solid #aaa;
	  color: #aaa;
	  border-radius: 6px;
	  position: relative;
	  
	}
	.search i {
	  position: absolute;
	  left: 1rem;
	  top: 0rem;
	  font-size: 2rem!important;
	}
	.index-header > div.choose-city {
	  width: 15%;
	  text-align: center;
	}
	.index-header > div.search {
	  width: 72%;
	  text-align: center;
	}
	.index-header > div.search p {
	  width: 80%;
	  height: 3rem;
	  border-radius: 4px;
	  line-height: 3rem;
	  font-size: 1.4rem;
	  margin-left: 3rem;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  white-space: nowrap;
	  font-size: 1.6rem;
	}
	.index-header > div.my-center {
	  float: right;
	  width: 9%;
	}
	.my-center .icon {
	  width: 1.5rem;
	  height: 1.5rem;
	  /*vertical-align: -0.4em;*/
	  font-size: 2.4rem!important;
	}
</style>