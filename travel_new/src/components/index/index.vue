<template>
	<div className="index-content">
		<indexHeader></indexHeader>
		<indexSwiper></indexSwiper>
		<indexMenu></indexMenu>
		<indexttype></indexttype>
		<indexLine></indexLine>
		
	</div>

</template>
<script>
	import indexSwiper from './index_swiper.vue'
	import indexHeader from './index_header.vue'
	import indexMenu from './index_menu.vue'
	import indexttype from './index_travel_type.vue'
	import indexLine from './index_line.vue'
	export default{
		components:{
			
			indexHeader,
			indexSwiper,
			indexMenu,
			indexttype,
			indexLine
		}
	}
</script>
<style>
	
</style>