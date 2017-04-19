<template>
	<div class="travel-info-container sticky JMsticky" style="background: #fff;z-index: 10000;">
		<lineFMenu></lineFMenu>
		<lineSMenu></lineSMenu>
		<lineList></lineList>
    </div>
</template>
<script>
	import lineFMenu from './index_line_fist_menu.vue'
	import lineSMenu from './index_line_second_menu.vue'
	import lineList from './index_line_list.vue'
	export default {
		components:{
			lineFMenu,
			lineSMenu,
			lineList
		}
	}
</script>
<style>
	
</style>