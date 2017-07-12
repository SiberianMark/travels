/*
*模块化开发core模块
*实现对Ajax的封装
*creator:JM 
*time:2017.05.09 15:08
*
* 1.声明结果对象
* 2.声明结果对象的属性信息数组
* 3.循环信息数组
* 	3.1 将信息数组的每一项的name作为结果对象的属性
* 	3.2 利用自执行(循环执行闭包函数传入对应的i并返回对应函数
* 4.输出结果数组
* 
* 
**/

(function(){

	function create(_url,_method,_data,_async,_dataType){
		if(_url.indexOf('?')>-1){
			_url=_url + '&rnd=' + Math.random();
		}else {
            _url = _url + '?rnd=' + Math.random();
        }

        _url += '&_ajax=1';
        return $.ajax({
        	url:_url,
        	method:_method,
        	data:_data,
        	async:_async,
        	dataType:_dataType
        });
	}

	var ajax={},
		method=[
			{
				name:'get',
				method:'get',
				async:true,
				dataType:'json'
			},
			{
				name:'post',
				method:'post',
				async:true,
				dataType:'json'
			},
			{
				name:'syncGet',
				method:'get',
				async:false,
				dataType:'json'
			},
			{
				name:'syncPost',
				method:'post',
				async:false,
				dataType:'json'
			},
			{
				name:'getHmtl',
				method:'get',
				async:false,
				dataType:'html'
			}
		]
	for(var i=0;i<method.length;i++){
		ajax[method[i].name]=(function(i){
			return function(){
				var _url=arguments[0],
				_data=arguments[1],
				_dataType=arguments[2] || method[i].dataType;
				return create(_url, methods[i].method, _data, methods[i].async, _dataType);
			}			
		})(i);
	}
	return ajax;
})();