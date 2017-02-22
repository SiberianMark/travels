<template>
	<div id="footer" class="footer">
    	<div class="travel-nav">
    		<ul>
    			<li>客服</li>
    			<li>登录</li>
    			<li>注册</li>
    			<li>电脑版</li>
    			<li>回到首页</li>
    		</ul>
    	</div>
    	<div class="copyright-info">
    		<p>{{resdata}}</p>
    		<p>深圳市含香伙计旅行有限公司</p>
    		<p>Copyright  @2015 恒博旅行网</p>
    		<p>经营许可编号：粤ICP备 13456765</p>
    	</div>
    </div>
</template>
<script>
import Vue from 'vue';
import VueResource from 'vue-resource';
export default{
	name:"vue_footer"
}
Vue.use(VueResource);
window.onload = function () {
    var footers =new Vue({
	el:"#footer",
	data(){
		return {
			resdata:{
				company_addr:"深圳市龙岗区中心城",
				company_name:"深圳市海外国际旅行社有限公司益田假日世界营业部",
				id:"1",
				main_color:"#209de6",
				mobile_logo:"/Public/Upload/image/58a6fcec9474e.jpg",
				pc_logo:"/Public/Upload/image/58a6fdac8129f.jpg",
				web_id:"粤ICP-备133562",
				web_keywords:"出境旅游,国内旅游_周边自驾游,国际旅行社,放假去哪儿好玩,港澳台游,海外国际旅行社益田假日营业部",
				web_tel:"0755-82222695",
				web_title:"旅游_旅游网_旅游线路_自驾游_旅行社_海外国际旅行社益田假日营业部"
			}
		}
	},
	beforeCreate:function(){
		var Apiurl="http://hyu2594430001.my3w.com/Home/APITravel/web_info";
		var _self=this;
		_self.$http.jsonp(Apiurl).then(function(res){
			console.log(res.body.data);
			_self.resdata=res.body.data;
		},function(res){
			console.log('error');
		})
	}
})
}




</script>
<style>
	.footer .travel-nav{margin:0.5rem;padding:0.5rem;}
	.footer .travel-nav ul{display:-webkit-box;-webkit-box-orient: vertical;display: flex;}
	.footer .travel-nav ul li{flex:1;text-align: center;}

	.footer .copyright-info{text-align: center;}

	.footer .copyright-info p{padding:0.5rem 0;}
</style>