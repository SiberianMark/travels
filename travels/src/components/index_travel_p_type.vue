<template>
	<div class="travel-place-type sticky">
    	<ul>
    		<li class="travel-place-type-active" index=1>
    		<a href="#"><span  class="travel-place-type-activefont">错峰出国</span></a>
    		</li>
    		<li index=2>
    	<a href="#">	<span>出境游</span></a>
    		</li>
    		<li index=3>
    	<a href="#">	<span>国内游</span></a>
    		</li>
    		<li index=4>
    	<a href="#">	<span>周边游</span></a>
    		</li>
    	</ul>
    	<div class="clear"></div>
    </div>
</template>
<script>
	export default{
		name:'index_travel_p_type'
	}
</script>
<style>
	.travel-place-type ul li{float:left;width:25%;height:100%;text-align: center;line-height: 4.4rem;font-size:1.4rem;}
	.travel-place-type-active{border-bottom:2px solid #d30775;}
	.travel-place-type-activefont{color:#d30775!important;}
	.sticky {  
		position: -webkit-sticky;  
		position: -moz-sticky;  
		position: -ms-sticky;  
		position: sticky;  
		top: 0px; 

		} 
</style>