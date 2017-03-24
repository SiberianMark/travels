var jObj = new Object();
var pull_action='down';
var tag1=1,//一级菜单id
    tag2=1;//二级菜单id
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
    			eval(callback(data));  		
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
      var url='';
      if (params != '') {
        if (PAGE[_page].indexOf('?') > -1) {
            url = PAGE[_page] + '&' + objToUrl(params).substr(1);
        } else {
            url = PAGE[_page] + '?' + objToUrl(params).substr(1);
        }
    }
	location.href=url;
}

//JS对象转URL参数
function objToUrl(obj,key,encode){
    if(obj==null) return '';
    var objStr='';
    var t= typeof(obj);
    if(t === 'string' || t=== 'number' || t==='boolean'){
        objStr+='&'+key+'='+((encode==null|| encode)?encodeURIComponent(obj):obj);
    }else {
        for (var i in obj) {
            var k = key == null ? i : key + (obj instanceof Array ? '[' + i + ']' : '.' + i);
            objStr += objToUrl(obj[i], k, encode);
        }
    }
    return objStr;
}

//验证表单
// function checkInput(type,params){
//     if(typeof params != "object") return;
//     var result=true;
//     var phoneFilter=/^1\d{10}/;    
//     if(!phoneFilter.test(params.phone)) return "请输入正确格式的手机号";
    
//     if(params.passwd!=undefined && (params.passwd.length<4 || params.passwd.length>16)) return "密码位数不合适,请重新输入";
//     if(type =="RegR"){
//         if(params.valid==undefined || params.valid=="") return "请输入验证码！";
//     }
//     if(type == 'RegR' || type == 'LogL' || type=='findL'){
//         if(params.verify==undefined || params.verify=="") return "请输入手机验证码！";
//     }   
//     return true; 
//    // return true;
// }

var is_tipstext_timeout;
function tipsLayer(text,time){
    var layerIcon=arguments[2]?arguments[2]:false;//是否显示图标
    var iconNum=arguments[3]?arguments[3]:1;
    var effect=Math.abs(iconNum);
    var iconSrc='/web/travels/img/icon'+iconNum+'.png';
    var hide=true;
    if($('.tipsLayer').length==0){
        if(!layerIcon){
            $('body').append('<div class="tipsLayer hide"><div><span></span></div></div>');
        }else if(iconNum>0){
            $('body').append("<div class='tipsLayer hide'><div><p><img src='"+iconSrc+"'></p><span></span></div></div>");
        }else{
            $('body').append("<div class='tipsLayer hide'><div><p></p><span></span></div></div>");
            createLoadingEffect(effect);
        }   
    }else if(!layerIcon){
         $('.tipsLayer>div>p').remove();
    }else if(layerIcon){
        $('.tipsLayer>div>p').remove();
        //if(!$('.inputTipsText>div').has('p').length)
        if(iconNum>0){
            $('.tipsLayer>div').prepend("<p><img src=''/></p>");
            $('.tipsLayer>div>p>img').attr('src',iconSrc);
        }else{
            $('.tipsLayer>div').prepend("<p></p>");
            createLoadingEffect(effect);
        }
    }
    if(typeof(arguments[1])=='undefined'){
        time=3000;//默认2秒自动隐藏提示框
    }else if(arguments[1]==-1){
        hide=false;//当参数 time == -1时，提示框常驻不会消失,需手动让其消失
    }
    if($('.tipsLayer').attr('class').indexOf('hide')>-1){//当提示框隐藏时
        $('.tipsLayer>div>span').html(text);
        $('.tipsLayer').removeClass('hide');
        if(hide){
            is_tipstext_timeout=setTimeout(function(){
              $('.tipsLayer').addClass('hide');
            },time);
        }
    }else{//提示框正在显示时
        clearTimeout(is_tipstext_timeout);  //清除上一个倒计时
        $('.tipsLayer>div>span').html(text);
        $('.tipsLayer').removeClass('hide');
        if(hide){
            is_tipstext_timeout=setTimeout(function(){
              $('.tipsLayer').addClass('hide');
            },time);
        }
    }

}
function createLoadingEffect(effect){
    var html="<div class='loading_eff_"+effect+"'>";
    var load_inner_count = 0;
    switch(effect){
        case 1:
        case 2:
            load_inner_count=8;
            break;
        case 3:
        case 4:
        case 6:
            load_inner_count=3;
            break;
        case 5:
            load_inner_count=5;
            break;
        default:
            load_inner_count=8;
            break;
    }
    for(var i=0;i<load_inner_count;i++){html+='<div></div>'}
    html+='</div>';
    $('.tipsLayer>div>p').append(html);
}

function isLogin(goparam){
    var result= false;
    if($.cookie('user_id')){
        result= true; 
    }else{
        var obj={};
        obj=goparam;
        PageGoto('login',obj);
    };
    return result;
}

/**
 * 获取userid
 */
function getUserid() {
    var userid = I('travelsUserId', '');
    if (userid == '') {
        userid = $.cookie('travelsUserId');
    }
    if (typeof(userid) == "undefined" || userid == 0) {
        userid = 0;
    }
    return userid;
}

/**
 * 获取url参数
 */
function I(name) {
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
//url参数转化为对象
function urlparamToobj(){
    var param=window.location.search.substring(1);
    var params = param.split('&');
    var res = {};
    for(var i = 0;i<params.length;i++){
        var str = params[i].split('=');
        res[str[0]]=str[1];
    }
    return res
        
}

    // 日期弹窗配置
 function datetimeDateInit(monthSelected) {
        $(function (monthSelected) {

            // Mobiscroll Date & Time initialization
            $('#datetimeInvalid-riqizao').mobiscroll().date({
                theme: 'Mobiscroll',      // Specify theme like: theme: 'ios' or omit setting to use default
                lang: 'zh',    // Specify language like: lang: 'pl' or omit setting to use default
                display:'bottom',  // Specify display mode like: display: 'bottom' or omit setting to use default
                mode: 'scroller'         // More info about mode: https://docs.mobiscroll.com/3-0-0_beta3/datetime#!opt-mode
            });
               $('#datetimeInvalid-riqiwan').mobiscroll().date({
                theme: 'Mobiscroll',      // Specify theme like: theme: 'ios' or omit setting to use default
                lang: 'zh',    // Specify language like: lang: 'pl' or omit setting to use default
                display:'bottom',  // Specify display mode like: display: 'bottom' or omit setting to use default
                mode: 'scroller'         // More info about mode: https://docs.mobiscroll.com/3-0-0_beta3/datetime#!opt-mode
            });

            $('.datetimeInvalid-zuizao').click(function () {
                
                $('#datetimeInvalid-riqizao').mobiscroll('show');
                return false;
            });
            $('.datetimeInvalid-zuiwan').click(function () {
                $('#datetimeInvalid-riqiwan').mobiscroll('show');
                return false;
            });

            $('#datetimeDate-clear').click(function () {
                $('#datetimeInvalid-riqi').mobiscroll('clear');
                return false;
            });

        });    
}

//原生实现固定钉子功能
function JMsticky(){
    var sticky = document.querySelector('.JMsticky');  
    var origOffsetY = sticky.offsetTop;  
      
    function onScroll(e) {  
      window.scrollY >= origOffsetY ? sticky.classList.add('fixed') :  
                                      sticky.classList.remove('fixed');  
    }       
    document.addEventListener('scroll', onScroll);  
}
function loadModernizr(){
    console.log('下载兼容性检测库Modernizr');
}

//mui上拉下拉刷新初始化
function mui_init(){
    mui.init({
      pullRefresh : {
        container:"#refreshContainer",//下拉刷新容器标识，querySelector能定位的css选择器均可，比如：id、.class等
        // down : {//下拉配置
        //   height:50,//可选,默认50.触发下拉刷新拖动距离,
        //   auto: true,//可选,默认false.自动下拉刷新一次
        //   contentdown : "下拉可以刷新",//可选，在下拉可刷新状态时，下拉刷新控件上显示的标题内容
        //   contentover : "释放立即刷新",//可选，在释放可刷新状态时，下拉刷新控件上显示的标题内容
        //   contentrefresh : "正在刷新...",//可选，正在刷新状态时，下拉刷新控件上显示的标题内容
        //   callback :pullDown //必选，刷新函数，根据具体业务来编写，比如通过ajax从服务器获取新数据；
        // },
        up : {//上拉配置
          height:50,//可选.默认50.触发上拉加载拖动距离
          auto:true,//可选,默认false.自动上拉加载一次
          contentrefresh : "正在加载...",//可选，正在加载状态时，上拉加载控件上显示的标题内容
          //contentnomore:'没有更多数据了',//可选，请求完毕若没有更多数据时显示的提醒内容；
          callback :pullUp //必选，刷新函数，根据具体业务来编写，比如通过ajax从服务器获取新数据；
        }

      }
    });
    //普通列表刷新设置停止上次刷新
    mui('#refreshContainer').pullRefresh().setStopped(true);
}
// //下拉业务处理函数
// function pullDown(){
//     console.log('pulldownRefresh down');
//     pull_action='down';
//     getData(tag1,tag2);
//     // 加载完数据之后结束正在加载字样
//     mui('#refreshContainer').pullRefresh().endPulldownToRefresh();
//     //重置上拉刷新
//     mui('#refreshContainer').pullRefresh().refresh(true);
    
// }
//上拉业务处理函数
function pullUp(){
    console.log('pulldownRefresh up');
    pull_action='up';
    getData(tag1,tag2);
    // 加载完数据之后结束正在加载字样
    mui('#refreshContainer').pullRefresh().endPulldownToRefresh();
    //重置上拉刷新
    mui('#refreshContainer').pullRefresh().refresh(true);
}
