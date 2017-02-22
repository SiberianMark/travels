<template>
	 <div class="travel-place index1">
    	<ul>
    		<li>
    			<div>

    			<a href=""  class="first-important">
					<i>全部1</i>
				</a></div>
    		</li>
    		<li>
    			<div>
    			<a href="#">
					<i>自驾游</i>
				</a></div>
			
    		</li>
    		<li>
    			<div>
    			<a href="#">
					<i>主题游</i>
				</a></div>
			
    		</li>
    		<li  class="border-none">
    		<div>
    			<a href="#">
					<i>攻略</i>
				</a>
			</div>
    		</li>
    		<li>
    			<div>
    			<a href="">
					<i>全部</i>
				</a></div>
    		</li>
    		<li>
    			<div>
    			<a href="#">
					<i>自驾游</i>
				</a></div>
			
    		</li>
    		<li>
    			<div>
    			<a href="#">
					<i>主题游</i>
				</a></div>
			
    		</li>
    		<li  class="border-none">
    		<div>
    			<a href="#">
					<i>攻略</i>
				</a>
				</div>
    		</li>
    	</ul>
    	<div class="clear"></div>
    </div>
</template>
<script>
	export default{
		name:'index_travel_place'
	}
</script>
	
<style>
	.travel-place{padding-left: 0.5rem;background-color: #fff;}
	.travel-place ul li{float:left;width:25%;height:4.4rem;text-align: center;line-height: 4.4rem;font-size:1rem;border-bottom:1px solid #eee;border-right:1px solid #eee;margin-right:-3px;}
	.travel-place ul li i{display: inline-block;width:3.5rem;padding:0.2rem 0;}
	.first-important{border-radius: 25px;background: #d30775;padding:0.5rem;color:#fff!important;}
	.border-none{border-right:1px solid #fff!important;}
	.clear{clear:both;}
</style>