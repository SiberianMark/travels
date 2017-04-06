<template>
	<div className="index-content">
		<indexHeader></indexHeader>
		<indexSwiper></indexSwiper>
	</div>
</template>
<script>
	import indexSwiper from './index_swiper.vue'
	import indexHeader from './index_header.vue'
	export default{
		components:{
			
			indexHeader,
			indexSwiper
		}
	}
</script>
<style>
	
</style>