<template>
	 <div class="travel-type">
    	<ul>
    		<li>
    			<div>
	    			<a href="#">
	    			<i class="icon iconfont icon-qianzheng"></i>

						<span>签证</span>
					</a>
				</div>
    		</li>
    		<li>
    			<div>
    			<a href="#">
    			<i class="icon iconfont icon-zijiayou"></i>
				<span>自驾游</span>
			</a>
			</div>
    		</li>
    		<li>
    			<div>
    			<a href="#">
    			<i class="icon iconfont icon-gaoduandingzhiyou"></i>
				</svg>
				<span>定制游</span>
				</a>
			</div>
    		</li>
    		<li>
    			<div>
    			<a href="#">
    			<i class="icon iconfont icon-zhutiyou"></i>
			<span>主题游</span>
			</a>
			</div>
    		</li>
    	</ul>
    	<div class="clear"></div>
    </div>
</template>
<script>
		export default{
		name:'index_travel_type'
	}
</script>
<style src='../assets/css/iconfont.css' lang="css"></style>
<style>

	.travel-type{padding:0.5rem;height:4.4rem;background: #fff;margin-top: 0.5rem;}
	.travel-type ul li{float:left;width:25%;height:100%;text-align: center;line-height: 4.4rem;font-size:1.4rem;}
	.travel-type ul li .icon{width:1.5rem;height:1.5rem;margin-left:5px;}
	.travel-type ul li:nth-child(1) .icon{color:#d30775;}
	.travel-type ul li:nth-child(2) .icon{color:#ec4c40;}
	.travel-type ul li:nth-child(3) .icon{color:#f8791c;}
	.travel-type ul li:nth-child(4) .icon{color:#c672e1;}
</style>