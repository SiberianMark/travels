<template>
<div class="index-first-menu-container">
	<div class="travel-place-type"> <ul>   <li class="travel-place-type-active travel-place-type-activefont" index="1" tag1id="1"> <span class="">周边游</span> </li>    <li index="2" tag1id="2"> <span class="">国内游</span> </li>    <li index="3" tag1id="3"> <span class="">出境游</span> </li>    <li index="4" tag1id="4"> <span class="">港澳游</span> </li>   </ul></div>
</div>
</template>
<script>
	

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
</style>