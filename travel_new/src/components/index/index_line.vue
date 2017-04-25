<template>
	<div class="travel-info-container sticky JMsticky" style="background: #fff;z-index: 10000;">
		<lineFMenu></lineFMenu>
		<lineList></lineList>
    </div>
</template>
<script>
	import lineFMenu from './index_line_fist_menu.vue'
	
	import lineList from './index_line_list.vue'
	export default {
		components:{
			lineFMenu,

			lineList
		}
	}
</script>
<style>
	
</style>