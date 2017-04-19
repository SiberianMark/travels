<template>
	<div class="index-menu-container">
		<div class="travel-menu">         
	        <ul class="flex">  
	            <li class="flex-c"><a href="./web/abroad.html"><i class="iconfont icon icon-lvyouxianlu"></i><p>出境游</p></a></li>  
	            <li class="flex-c"><a href="./web/domestic.html"><i class="iconfont icon icon-lvxing"></i><p>国内游</p></a></li>  
	            <li class="flex-c"><a href="./web/around.html"><i class="iconfont icon icon-jiaoyou"></i><p>周边游</p></a></li>  
	            <li class="flex-c"><a href="./web/gat.html"><i class="iconfont icon icon-xianggang"></i><p>港澳游</p></a></li>          
	        </ul>
	    </div>
    </div>
</template>
<script>
	export default {

	}
</script>

<style>
	.travel-menu{padding:0.5rem 0 0.5rem 0.5rem;font-size: 1.8rem;}

	.travel-menu ul{display: -webkit-box; -webkit-box-orient:horizontal;display: flex; }
	.travel-menu ul li{color:#fff;flex:1;text-align: center;background:#f8791c;font-size:1.4rem;margin-right:0.5rem;height: 5rem;padding:1.2rem 0 0; border-radius: 4px;}
	.travel-menu ul li:nth-child(2){background:#ec4c40}
	.travel-menu ul li:nth-child(3){background:#f8791c}
	.travel-menu ul li:nth-child(4){background:#c672e1}
	.travel-menu ul li .icon{    font-size: 2rem;color:#fff;}
	.travel-menu ul li p{color:#fff;    padding:0.5rem 0;}
</style>