<template>
	<div class="index-t-t-c">
		<div class="travel-type">
		 <ul class="flex">
			   <li class="flex-c"><i class="iconfont icon icon-zhoubianyou"></i><p>自由行</p></li>
			     <li class="flex-c"><i class="iconfont icon icon-travel"></i><p>海岛游</p></li>
			     <li class="flex-c"><i class="iconfont icon icon-qinziyou15"></i><p>亲子游</p></li>
			     <li class="flex-c"><i class="iconfont icon icon-hotspring"></i><p>温泉季</p></li>
			  </ul>
		</div>
	</div>
</template>

<script>
	export default {
		
	}
</script>

<style>
	.travel-type{/*padding:0.5rem 0;    margin: 0.5rem 0 1rem 0;*/    margin-bottom: 0.3rem;height:4.4rem;font-size: 1.4rem;color:#333;}
	.travel-type ul li{ background: #fff;   width: 24.1%;height: 100%;text-align: center;line-height: 4rem;border: 1px solid #eee;border-radius: 4px;}
	.travel-type ul li p{display: inline-block;margin-left: 0.5rem;}
	.travel-type ul li:first-child{margin-left: 0;}
	.travel-type ul li .icon{vertical-align: middle;font-size: 1.4rem!important;}
	.travel-type ul li:nth-child(1) i{color:@topic-color;}
	.travel-type ul li:nth-child(2) i{color:#ec4c40;}
	.travel-type ul li:nth-child(3) i{color:#f8791c;}
	.travel-type ul li:nth-child(4) i{color:#c672e1;}
	// .travel-type ul li:nth-child(1) {border-color:@topic-color;}
	// .travel-type ul li:nth-child(2) {border-color:#ec4c40;}
	// .travel-type ul li:nth-child(3) {border-color:#f8791c;}
	// .travel-type ul li:nth-child(4) {border-color:#c672e1;}
	.travel-type ul li span{    padding: 0 0.5rem;}
</style>