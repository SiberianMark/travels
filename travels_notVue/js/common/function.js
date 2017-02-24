var jObj = new Object();

function ajaxJson(_url,param){
	var callback = arguments[2]?arguments[2]:"ajaxCallback";
	var type=arguments[3]?arguments[3]:config.JSONMETHOD;
	var dataType=arguments[4]?arguments[4]:'json';
	var async=arguments[5]?arguments[5]:false;

	_url = config.SERVER_URL  + _url + '/?callback=?';  //服务器请求地址

	//设置平台 IOS， Android
	if(jObj.platform== undefined || jObj.platform == ''){
		jObj.platform ==config.PLATFORM;
	}else{
		jObj.platform ==jObj.platform;
	}
	//经度
    if (jObj.longitude != undefined && jObj.longitude != '') {
        param.longitude = jObj.longitude;
    }
    //纬度
    if (jObj.latitude != undefined && jObj.latitude != '') {
        param.latitude = jObj.latitude;
    }
    //微信端登录令牌
    if (jObj.logintoken == undefined || jObj.logintoken == '') {
        param.logintoken = $.cookie('logintoken');
        if (typeof(param.logintoken) == "undefined" || param.logintoken == '') {
            param.logintoken = I('logintoken', '');
        }
    } else {
        param.logintoken = jObj.logintoken;
    }
    //微信公众号id
    if (jObj.wxappid == undefined || jObj.wxappid == '') {
        param.wxappid = $.cookie('wxappid');
        if (typeof(param.wxappid) == "undefined" || param.wxappid == '') {
            param.wxappid = IurlParam('wxappid', '');
        }
    } else {
        param.wxappid = jObj.wxappid;
    }
    var ajaxdo=$.ajax({
    	url:_url,
    	type:type,
    	timeout:config.TIMEOUT,
    	data:param,
    	dataType:dataType,
    	async:async,
    	success:function(data){
    		if(data.status==1){
    			eval(callback(data));
    		}else{
    			alert(data.info);
    		}    		
    	},
    	error:function(){
    		return false;
    	}
    });

}



//页面加载完的回调函数，做所有页面公共处理的地方
window.onload=function(){
	//设置userid
    // setUserid();
    // setMid();
    // //处理微信环境
    // if (is_weixn(true)) {
    //     //设置openid
    //     setOpenid();
    // }
    $('body').append(loadgif());
	appStart();
}


//页面加载中gif
function Endload(){
	$('#loader_model').remove();
}
//在页面加载完之后插入loading动画
function loadgif(){
	var loadgif='<div id="loader_model" style="position: fixed;bottom:0; top:0;left:0;right:0;background: url(./img/loading.gif);z-index: 999;background-position: -130px 50px"></div>'
	return loadgif;
}


/**
 * 获取url参数
 */
function IurlParam(name) {
    var def;  //默认值
    if (typeof(arguments[1]) == "undefined") {
        def = '';
    } else {
        def = arguments[1];
    }
    var param = window.location.search;  //URL参数
    if (param == '') {
        return def;
    }
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = param.substr(1).match(reg);
    if (r == null) {
        return def;
    }
    return (r[2]);
}

//构建引擎模板

function getDotRender(_id){
	var template =document.getElementById(_id);
	if(template != undefined){
		var doTTmp=doT.template(template.innerHTML);
		return doTTmp;
	}
}

//页面跳转

function PageGoto(_page,params){
	window.location.hostname+"/"+_page+'.html?';
}