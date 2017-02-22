<template>
	<div class="travel-menu">
        <ul>
            <li>
				<i class=" icon iconfont icon-diqiu"></i>
            	<p>出境游</p>
            </li>
            <li>
				<i class=" icon iconfont icon-qiche"></i>
            	<p>周边游</p>
            </li>
            <li>
				<i class=" icon iconfont icon-zhoubianyou"></i>
           		<p>周边游</p>
           	</li>    
            <li>
				<i class=" icon iconfont icon-jingdian"></i>
				<p>景点门票</p></li>    
        </ul>
    </div>
</template>
<script>
	export default{
		name:'index_menu'
	}
</script>
<style src='../assets/css/iconfont.css' lang="css"></style>
<style>

ul{padding:0; margin:0;}
ul li{list-style: none;}
.icon{width:5rem!important;height:5rem!important;}
.travel-menu{padding:0.5rem 0 0.5rem 0.5rem;background: #fff;margin-top:1rem;}

.travel-menu ul{display: -webkit-box; -webkit-box-orient:horizontal;display: flex;}
.travel-menu ul li{color:#fff;flex:1;text-align: center;background:#d30775;font-size:1.4rem;margin-right:0.5rem;height: 4.4rem;padding:1.5rem 0; border-radius: 4px;}
.travel-menu ul li:nth-child(2){background:#ec4c40}
.travel-menu ul li:nth-child(3){background:#f8791c}
.travel-menu ul li:nth-child(4){background:#c672e1}
.travel-menu ul li .icon{width:3rem;height:3rem;color:#fff;}
</style>