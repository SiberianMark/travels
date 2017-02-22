<template>
	<div class="index-header">
		<div class="choose-city">
			<span class="com-logo">logo</span>
		</div>
		<div class="search">
            <i class=" icon iconfont icon-search"></i>
			<p>目的地/景点/酒店/游轮</p>
		</div>
		<div class="my-center">
			<a href="#"></a>
			<i class=" icon iconfont icon-my"></i>
		</div>
	</div>
</template>

<script>
	export default {
	  name: 'vue_header'
	}
</script>

<style src='../../assets/css/iconfont.css' lang="css">
</style>
<style>
	body{-webkit-tap-highlight-color: rgba(0,0,0,0);background: #f0f0f0;}
	body,p{padding:0;margin:0;}
.index-header{height:3rem;padding:0.35rem 0.5rem;line-height: 3rem;background:#d30775;color:#fff; }
.index-header>div.choose-city,.search{float:left;}
.index-header>div.choose-city{width:15%;text-align: center;}
.index-header>div.search{width:72%;}
.index-header>div.search p{width: 100%;height:3rem;border-radius: 4px;line-height: 3rem;font-size: 1.4rem;}
.index-header>div.my-center{float:right;width:9%;}
.my-center .icon{width:1.5rem;height:1.5rem;vertical-align: -0.4em;}
.search{position: relative;}
.search p{display: inline-block;}
.search i{position:absolute;top:0.1rem;left:3rem;}
</style>