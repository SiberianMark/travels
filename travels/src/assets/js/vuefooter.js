import vue from 'vue';
import footer from '../../components/common/footer';


new Vue({
	el:".footer",
	data(){data:""},
	beforeCreate:function(){
		var Apiurl="./data.json";
		var _self=this;
		_self.$http.get(Apiurl).then(function(data){
			console.log(data);
		},function(res){

		})
	},
	components:{
		footer
	}
})