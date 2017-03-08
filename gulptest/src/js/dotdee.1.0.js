$(document).ready(function() {
	$("[doTDom]").each(function(){
		var dotDom = $(this).find('script');
		var ModeStr = dotDom[0].innerHTML;
		var Source = eval($(this).attr('doTDom'));
		var doTtmpl = doT.template(ModeStr);
		$(this).html(doTtmpl(Source));
		// $(this).removeAttr('doTDom');
	});
    $('.balance-foot .com').on('click',function(){
        $('.balance-foot .com').attr('data-str','');
        $(this).attr('data-str','on');
        var balanceType = $(this).attr('balance');
        if( balanceType == "com-tg" ){
            Interface('gotoWBExtsion');
        }else if ( balanceType == "com-sy" ) {
            Interface('gotoBrokerage');
        }else if ( balanceType == "com-dd" ) {
            Interface('gotoOrderList');
        }else if ( balanceType == "com-mh" ) {
            Interface('gotoMallHome');
        };
    });

    $('.float_SendGifts').on('click',function () {
        Interface('gotoSendGiftsList');
    });
    $('.float_RecpGifts').on('click',function () {
        Interface('gotoRecpGiftsList');
    });
    $('.float_ShopCart').on('click',function () {
        Interface('gotoShopCart');
    });

    $('.FBrand-Nav #goHome').on('tap click', function () {
        var obj = M();
        obj.userid = getUserid();
        Interface('gotoIndex',obj);
    });
    $('.FBrand-Nav #goMall').on('tap click', function () {
        Interface('gotoMallHome');
    });
    $('.FBrand-Nav #gzHome').on('tap click', function () {
        Interface('gotoMallEwm');
    });
    $('.FBrand-Nav .close').on('tap click', function () {
        $('.FBrand-Nav').remove();
    });

	try{
		onload();
	}catch(e){
	}

});
function GetStates (id){
    var Sid = parseInt(id);
    var State_Tip = {'shop':'','user':'','donee':'','donor':'','sid':Sid};
    //5个值分别代表商户端订单状态,用户端订单状态,收礼方列表状态,送礼方列表状态,订单状态id.
    switch(Sid){
        case 1:
            //对应文档第1点场景:(用户提交订单，但未付款.)
            State_Tip = {'shop':'等待买家付款','user':'等待买家付款','donee':'','donor':'','sid':Sid};
            break;
        case 2:
            //对应文档第2点场景:(取消订单.)
            State_Tip = {'shop':'交易已关闭','user':'交易已关闭','donee':'','donor':'','sid':Sid};
            break;
        case 3:
            //对应文档第3、6点场景:(用户付款完成.ps:未冻结,未退款,未发货或受赠人未接收礼物.)
            State_Tip = {'shop':'等待卖家发货','user':'等待卖家发货','donee':'','donor':'已领取0/1','sid':Sid};
            break;
        case 4:
            //对应文档第11、14点场景:(商户发货.ps:未冻结,未退款,买家未收货.)
            State_Tip = {'shop':'等待买家收货','user':'卖家已发货','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 5:
            //对应文档第15点场景:(确认收货或7天自动收货.)
            State_Tip = {'shop':'交易已完成','user':'交易已完成','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 6:
            //对应文档第4点场景:(后台冻结.ps:已付款,未发货或受赠人未填写地址.)
            State_Tip = {'shop':'交易已冻结','user':'冻结中','donee':'','donor':'已领取0/1','sid':Sid};
            break;
        case 7:
            //对应文档第12点场景:(后台冻结.ps:已付款,已发货,未收货.)
            State_Tip = {'shop':'交易已冻结','user':'冻结中','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 8:
            //对应文档第5点场景:(退款成功.ps:已付款,未发货或受赠人未接收礼物.)
            State_Tip = {'shop':'退款成功','user':'退款成功','donee':'','donor':'已领取0/1','sid':Sid};
            break;
        case 9:
            //对应文档第7、10点场景:(收方填写地址.ps:已付款,受赠人确认接收礼物,未冻结,未退款.)
            State_Tip = {'shop':'等待卖家发货','user':'等待卖家发货','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 10:
            //对应文档第8点场景:(后台冻结.ps:已付款,受赠人确认接收礼物.未发货)
            State_Tip = {'shop':'交易已冻结','user':'冻结中','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 11:
            //对应文档第9、13点场景:(已退款.ps:已付款,受赠人确认接收礼物.未发货为第9点,已发货未第13点.)
            State_Tip = {'shop':'退款成功','user':'退款成功','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 12:
            State_Tip = {'shop':'已收货，待评价','user':'已收货，待评价','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 13:
            State_Tip = {'shop':'已收货，待回复','user':'已收货，已评价','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 0:
            //可能存在文档中或程序中未知的某个状态.
            State_Tip = {'shop':'未知状态','user':'未知状态','donee':'未知状态','donor':'未知状态','sid':Sid};
            break;
        default:
            //状态获取异常.
            State_Tip = {'shop':'状态异常','user':'状态异常','donee':'状态异常','donor':'状态异常','sid':Sid};
            break;
    }
    return State_Tip;
}

//订单管理
function GetStatesMag (id){
    var Sid = parseInt(id);
    var State_Tip = {'shop':'','user':'','donee':'','donor':'','sid':Sid};
    //5个值分别代表商户端订单状态,用户端订单状态,收礼方列表状态,送礼方列表状态,订单状态id.
    switch(Sid){
        case 1:
            //对应文档第1点场景:(用户提交订单，但未付款.)
            State_Tip = {'shop':'','user':'等待买家付款','donee':'','donor':'','sid':Sid};
            break;
        case 2:
            //对应文档第2点场景:(待发货.)
            State_Tip = {'shop':'等待卖家发货','user':'等待卖家发货','donee':'','donor':'','sid':Sid};
            break;
        case 3:
            //对应文档第3点场景:(用户付款完成.ps:未冻结,未退款,未发货或受赠人未接收礼物.)
            State_Tip = {'shop':'卖家已发货','user':'等待买家收货','donee':'','donor':'已领取0/1','sid':Sid};
            break;
        case 4:
            //对应文档第4点场景:(商户发货.ps:未冻结,未退款,买家已收货,待评价.)
            State_Tip = {'shop':'卖家已发货','user':'买家已收货','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 5:
            //对应文档第5点场景:(确认收货或7天自动收货.)
            State_Tip = {'shop':'交易已完成','user':'已评价，待回复','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 6:
            //对应文档第 点场景:(后台冻结.ps:已付款,未发货或受赠人未填写地址.)
            State_Tip = {'shop':'交易已完成','user':'交易已完成','donee':'','donor':'已领取0/1','sid':Sid};
            break;
        case 7:
            //对应文档第 点场景:(后台冻结.ps:已付款,已发货,未收货.)
            State_Tip = {'shop':'交易已冻结','user':'退款中','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 8:
            //对应文档第 点场景:(已退款.ps:已付款,未发货或受赠人未接收礼物.)
            State_Tip = {'shop':'已退款','user':'已退款','donee':'','donor':'已领取0/1','sid':Sid};
            break;
        case 9:
            //对应文档第 点场景:(收方填写地址.ps:已付款,受赠人确认接收礼物,未冻结,未退款.)
            State_Tip = {'shop':'交易已关闭','user':'交易已关闭','donee':'已领取','donor':'已领取1/1','sid':Sid};
            break;
        case 0:
            //可能存在文档中或程序中未知的某个状态.
            State_Tip = {'shop':'未知状态','user':'未知状态','donee':'未知状态','donor':'未知状态','sid':Sid};
            break;
        default:
            //状态获取异常.
            State_Tip = {'shop':'状态异常','user':'状态异常','donee':'状态异常','donor':'状态异常','sid':Sid};
            break;
    }
    return State_Tip;
}
function formatDate(date, format) {
    if (!date) return;
    if (!format) format = "yyyy-MM-dd";
    switch(typeof date) {
        case "string":
            if(isNaN(Number(date))){
                date = new Date(date.replace(/-/g, "/"));
            }else{
                date = new Date(Number(date));
            }
            break;
        case "number":
            date = new Date(date);
            break;
    }
    if (!date instanceof Date) return;
    var dict = {
        "yyyy": date.getFullYear(),
        "M": date.getMonth() + 1,
        "d": date.getDate(),
        "H": date.getHours(),
        "m": date.getMinutes(),
        "s": date.getSeconds(),
        "MM": ("" + (date.getMonth() + 101)).substr(1),
        "dd": ("" + (date.getDate() + 100)).substr(1),
        "HH": ("" + (date.getHours() + 100)).substr(1),
        "mm": ("" + (date.getMinutes() + 100)).substr(1),
        "ss": ("" + (date.getSeconds() + 100)).substr(1)
    };
    return format.replace(/(yyyy|MM?|dd?|HH?|ss?|mm?)/g, function() {
        return dict[arguments[0]];
    });
}
/*
 *获取友好的日期提示信息
 *added by billyhero
 *2016-01-28 17:33
 *参数，字符串：2016-01-28 17:21:30
 *返回：2分钟前，2天前...
*/
var minute = 1000 * 60;
var hour = minute * 60;
var day = hour * 24;
var month = day * 30;
var year = month * 12;
function getFrendlyDate(dateTimeStamp,type){
    var type = arguments[1] ? arguments[1] : false;
    if(dateTimeStamp == "" || typeof(dateTimeStamp) == 'undefined'){
        return '';
    }
    var now = new Date().getTime();
    var diffValue = 0;
    var result = '';
    try{
        diffValue = now - Date.parse(dateTimeStamp.replace(/-/gi,"/"));
    }catch(e){
        console.log('getFrendlyDate(); 异常:' + e.message);
        return result;
    }
    if(diffValue < 0){
        //结束日期不能小于开始日期！
        return result;
    }
    dateTimeStamp = dateTimeStamp.replace(/-/g,"/");
    dateTimeStamp = new Date(dateTimeStamp);
    var yearC =diffValue/year;
    var monthC =diffValue/month;
    var weekC =diffValue/(7*day);
    var dayC =diffValue/day;
    var hourC =diffValue/hour;
    var minC =diffValue/minute;
    var yearG =dateTimeStamp.getFullYear();
    var monthG =dateTimeStamp.getMonth()+1;
    var dayG =dateTimeStamp.getDate();
    if(monthG <=9){                                     //如果小于9的话，则需要加上0
        monthG = "0" + monthG;
    }
    if(dayG <=9){                                     //如果小于9的话，则需要加上0
        dayG = "0" + dayG;
    }
    if(yearC>=1){
        if(type){
            result=yearG+"-"+monthG+"-"+dayG;
        }else {
            result=parseInt(yearC) + "年前";
        }
    }
    else if(monthC>=1){
        if(type){
            result=monthG+"-"+dayG;
        }else {
            result = parseInt(monthC) + "个月前";
        }
    }
    else if(weekC>=1){
        if(type){
            result=monthG+"-"+dayG;
        }else {
            result = parseInt(weekC) + "周前";
        }
    }
    else if(dayC>=1){
        if(type){
            result=monthG+"-"+dayG;
        }else {
            result=parseInt(dayC) +"天前";
        }
    }
    else if(hourC>=1){
        result=parseInt(hourC) +"个小时前";
    }
    else if(minC>=1){
        result=parseInt(minC) +"分钟前";
    }else{
        result="刚刚";
    }
    return result;
}

function doTer(data,obj){
	var dotDom = obj.find('script');
	var ModeStr = dotDom[0].innerHTML;
	var doTtmpl = doT.template(ModeStr);
	obj.html(doTtmpl(data));
}

function doTAppend(data,obj){	//append元素
	var dotDom = obj.find('script');
	var ModeStr = dotDom[0].innerHTML;
	var doTtmpl = doT.template(ModeStr);
	obj.append(doTtmpl(data));
}

/**
 * 公共提示框方法
 * edit by 何变 2016-04-21
 * 修改扩展功能:
 * 1.加入显示图标（可选）arguments[2]设置是否显示ICON，arguments[3]设置显示ICON的类型
 * 2.提示框常驻不会消失，需手动让其消失(arguments[1]:time设置为-1)(项目中已有多场景需要此功能)
 * 3.以上修改不影响原方法的使用
 */
/*测试提示框功能*/
/*$(document).ready(function(){
    inputTipsText('this is test!',-1,true,-6);
});*/
var is_tipstext_timeout;
function inputTipsText(text,time){
    var showIcon = arguments[2]?arguments[2]:false;//是否显示图标
    var icon_num = arguments[3]?arguments[3]:1;//图标样式icon1,icon2,icon3....
    var effect = Math.abs(icon_num);//动画效果id
    var hide=true;
    var icon_src = '/web/assets/image/seckill/icon'+icon_num+'.png';
    if($('.inputTipsText').length==0){
        if(!showIcon){
            $('body').append("<div class='inputTipsText hide'><div><span></span></div></div>");
        }else if(icon_num>0){
            $('body').append("<div class='inputTipsText hide'><div><p><img src='"+icon_src+"'></p><span></span></div></div>");
        }else{//不使用icon img，而是显示css3生成的动画效果
            $('body').append("<div class='inputTipsText hide'><div><p></p><span></span></div></div>");
            createLoadingEffect(effect);
        }
    }else if(!showIcon){
        $('.inputTipsText>div>p').remove();
    }else if(showIcon){
        $('.inputTipsText>div>p').remove();
        //if(!$('.inputTipsText>div').has('p').length)
        if(icon_num>0){
            $('.inputTipsText>div').prepend("<p><img src=''/></p>");
            $('.inputTipsText>div>p>img').attr('src',icon_src);
        }else{
            $('.inputTipsText>div').prepend("<p></p>");
            createLoadingEffect(effect);
        }
    }
	if(typeof(arguments[1])=='undefined'){
		time=3000;//默认2秒自动隐藏提示框
	}else if(arguments[1]==-1){
        hide=false;//当参数 time == -1时，提示框常驻不会消失,需手动让其消失
    }
    if($('.inputTipsText').attr('class').indexOf('hide')>-1){//当提示框隐藏时
        $('.inputTipsText>div>span').html(text);
        $('.inputTipsText').removeClass('hide');
        if(hide){
            is_tipstext_timeout=setTimeout(function(){
              $('.inputTipsText').addClass('hide');
            },time);
        }
    }else{//提示框正在显示时
        clearTimeout(is_tipstext_timeout);  //清除上一个倒计时
        $('.inputTipsText>div>span').html(text);
        $('.inputTipsText').removeClass('hide');
        if(hide){
            is_tipstext_timeout=setTimeout(function(){
              $('.inputTipsText').addClass('hide');
            },time);
        }
    }
}
/**
 * [createLoadingEffect 生成提示框loading动画]
 * @param  {[number]} effect [动画序号]
 * @author 何变
 * @return {[null]}
 */
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
    $('.inputTipsText>div>p').append(html);
}
/*
*根据js模版ID获取渲染函数
*@param id - 模版的ID
*如果id不存在抛出异常
*/
function getRender(id){
	var tmpl = document.getElementById(id);
	if(tmpl != undefined){
		var doTtmpl = doT.template(tmpl.innerHTML);
		return doTtmpl;
	}else{
		throw new Error('template: ['+id+'] is not exsits!');
	}
}

$(document).on('touchstart touchmove touchend touchcancel','.hv',function (e) {
    var o_hv = $(this);
    var dd_hv_start_X=0;
    var dd_hv_start_Y=0;
    var dd_hv_end_X=0;
    var dd_hv_end_Y=0;
    var dd_hv_move_X=0;
    var dd_hv_move_Y=0;
    if(e.type=='touchstart'){
        o_hv.addClass('hving');
        dd_hv_start_X = e.originalEvent.targetTouches[0].pageX;
        dd_hv_start_Y = e.originalEvent.targetTouches[0].pageY;

    }else if(e.type=='touchend'||e.type=='touchcancel'){
        o_hv.removeClass('hving');
    }else{
        dd_hv_end_X = e.originalEvent.targetTouches[0].pageX;
        dd_hv_end_Y = e.originalEvent.targetTouches[0].pageY;
        dd_hv_move_X = Math.abs(dd_hv_end_X-dd_hv_start_X);
        dd_hv_move_Y = Math.abs(dd_hv_end_Y-dd_hv_start_Y);
        if(dd_hv_move_Y>3||dd_hv_move_X>3){
            o_hv.removeClass('hving');
        }
    }
});

/**
*初始化mui_js组件
*getData(),上拉或下拉触发后加载数据都执行该方法
*p_type p_type = 0; //普通列表刷新
*p_type = 1;        //首页刷新(首页刷新动作是重新加载整个页面)
*r_timeout=1500；   //默认上下拉刷新触发间隔时间
*/
var p_type=0;
var r_timeout=1500;
var pull_action="";
function _initMui(){
    var setStop = arguments[0] ? arguments[0] : false;
    mui.init({
        pullRefresh: {
            container: '#pullrefresh',
            down: {
                contentinit:'下拉刷新',
                contentdown:'下拉刷新',
                contentover:'释放刷新',
                contentrefresh: '正在刷新...',
                callback: pulldownRefresh
            },
            up: {
                contentrefresh: '正在加载...',
                callback: pullupRefresh
            }
        }
    });
    if(!setStop){
        p_type = 0;//普通列表刷新
        mui('#pullrefresh').pullRefresh().setStopped(true);
    }else{
        mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
        r_timeout = 1500;
        p_type = 1;//首页刷新，首页刷新动作是重新加载整个页面
    }
}
/**
*mui_js 下拉触发刷新函数
*/
function pulldownRefresh() {
    console.log('pulldownRefresh down');
    pull_action = 'down';
    page =1;
    setTimeout(function() {
        if(p_type == 0){
            getData();
            mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
            mui('#pullrefresh').pullRefresh().refresh(true);
        }else if(p_type == 1){
            //window.location.reload();
            onStart();
            mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
            $('.mui-pull-bottom-pocket').removeClass('mui-visibility');
        }
    },r_timeout);
}
/**
*mui_js 上拉触发加载函数
*/
function pullupRefresh() {
    console.log('pullupRefresh up');
    pull_action = 'up';
    setTimeout(function() {
        if(p_type == 0){
            getData();
        }else if(p_type == 1){
            mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
        }
    },r_timeout);
}

/**
 * 控制用户返回的方法
 */
function changeBackUrl(url,param){
    param.share=I('share');
    if(typeof(param)=='object'){
    param=JSON.stringify(param).replace(/\{|\}|\"|\'/g,'').replace(/,/g,'&').replace(/:/g,'=');
    }else{
        try{
            param=param.toString().replace(',','&').replace(/:/g,'=').replace(/\"|\'/g,'');
        }catch(e){}
    }
    var path="/web/wechat/"+url+".html?"+param;
    history.replaceState(null, null, path);
}

function changeBackUrlL(url,param){
    param.share=I('share');
    if(typeof(param)=='object'){
    param=JSON.stringify(param).replace(/\{|\}|\"|\'/g,'').replace(/,/g,'&').replace(/:/g,'=');
    }else{
        try{
            param=param.toString().replace(',','&').replace(/:/g,'=').replace(/\"|\'/g,'');
        }catch(e){}
    }
    var path="/web/"+url+".html?"+param;
    history.replaceState(null, null, path);
}
/**
 * 一元抢购进度条方法
 */
function setLine(){
    $('.lottery-percent').each(function(){
        var num=parseInt($(this).find('.lotterycolor-orange').text());
        var totalnum=parseInt($(this).find('.lotterycolor-black').text());
        var parcent=num>=totalnum?totalnum/num:num/totalnum;
        $(this).find('.lottery-percent-line').css('width',parcent*100+"%");
    });
}

/*
*js String prototype
*字符串处理,emoji表情转义和反转等
*2016-02-26 added by 何变
*/
//是否为空或null
isNullOrEmpty = function(s) {
    return s === undefined || s === null || s === "" || typeof s === 'undefined';
}
js = {lang:{}};
js.lang.String=function(){
    this.REGX_CHINESE=/^[\u0391-\uFFE5]+$/i;
    this.REGX_EX_CHINESE=!/^[\x00-\xff]*$/;
    this.REGX_TRIM = /(^\s*)|(\s*$)/g;
    this.REGX_MOBILE = /^1[3|4|5|7|8]\d{9}$/i;
    this.REGX_TEL=/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i;
    this.REGX_EMAIL=/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;

    //反转义实体编号
    this.decodeHtml=function(s){
        s = (s != undefined) ? s : this.toString();
        var d = document.createElement('div');
        d.innerHTML = s;
        return d.innerText;
    };
    /**
     * 用于把用utf16编码的字符转换成实体字符，以供后台存储
     * @param  {string} str 将要转换的字符串，其中含有utf16字符将被自动检出
     * @return {string}     转换后的字符串，utf16字符将被转换成&#xxxx;形式的实体字符
     */
    this.utf16toEntities=function(s){
        var patt=/[\ud800-\udbff][\udc00-\udfff]/g; // 检测utf16字符正则
        s = (s != undefined) ? s : this.toString();
        return (typeof s != "string") ? s :
        s.replace(patt, function(char){
            var H, L, code;
            if (char.length===2) {
                H = char.charCodeAt(0); // 取出高位
                L = char.charCodeAt(1); // 取出低位
                code = (H - 0xD800) * 0x400 + 0x10000 + L - 0xDC00; // 转换算法
                return "&#" + code + ";";
            } else {
                return char;
            }
        });
    };
    //去前后空格
    this.trim = function(s){
        s = (s != undefined) ? s : this.toString();
        return (typeof s != "string") ? s :
            s.replace(this.REGX_TRIM, "");
    };
    //取字符长度，中文字符2，英文1
    this.gblen=function(s){
        s = (s != undefined) ? s : this.toString();
        var len = 0;
        for (var i=0; i<s.length; i++) {
            if (s.charCodeAt(i)>127 || s.charCodeAt(i)==94) {
                len += 2;
            } else {
                len ++;
            }
        }
        return len;
    }
    //去除字符串左边的空格，返回处理后副本，并不改变原有的字符串。
    this.ltrim=function(){
        return this.replace(/(^\s*)/g, "");
    }
    //去除字符串右边的空格，返回处理后副本，并不改变原有的字符串。
    this.rtrim=function(){
        return this.replace(/(\s*$)/g, "");
    }
    //是否是手机号
    this.isMobile=function(){
        return isNullOrEmpty(this) ? false : this.REGX_MOBILE.test(this);
    }
    //是否是电话
    this.isTelOrFax=function(){
        return isNullOrEmpty(this) ? false : this.REGX_TEL.test(this);
    }
    //是否是邮箱地址
    this.isMail=function(){
        return isNullOrEmpty(this) ? false : this.REGX_EMAIL.test(this);
    }
    //判断字符串是否全是汉字
    this.isChinese=function(){
        return isNullOrEmpty(this) ? false : this.REGX_CHINESE.test(this);
    }
    //判断字符串是否存在汉字
    this.isExistChinese=function(){
        return isNullOrEmpty(this) ? false : this.REGX_EX_CHINESE.test(this);
    }
    //字符串转int
    this.toInt=function () {
        return isNaN(parseInt(this)) ? 0 : parseInt(this);
    }
    //字符串转float
    this.toFloat=function () {
        return isNaN(parseFloat(this)) ? 0.0 : parseFloat(this);
    }
    //将字符串日期转换成日期类型
    this.toDate=function () {
        try { return new Date(this.replace(/-/g, "\/")); }
        catch (e) { return null; }
    }
    //将数字字符串转换成字符串日期
    this.toDateString=function (s) {
        s = (s != undefined) ? s : 'yyyy-MM-dd HH:mm:ss';
        return formatDate(this.toString(),s);
    }
    //将数字字符串转换成字符串日期
    this.toYYYString=function (s) {
        s = (s != undefined) ? s : 'yyyy/MM/dd';
        return formatDate(this.toString(),s);
    }
    //拆分小数
    //参数0：获取小数点前面部分
    //参数1：获取小数点后面部分
    this.splitNumber=function (index) {
        if(this.toString().indexOf('.')<0) {
            return this.toString();
        }
        if(Number(index)==0) {
            return Math.floor(this);
        }else  if(Number(index)==1) {
            return this.toString().substr(this.toString().indexOf('.')+1);
        }else{
            return Math.floor(this);
        }
    }
};
js.lang.String.call(String.prototype);//扩展String的prototype

/*
 -- 悬浮菜单 --
*/
$(document).ready(function() {
    $('.sus-mall-icon').html("首页");
    $('#sus-mall-icon,.goto-mall').on('click tap',function (event) {
        event.stopPropagation();
        InterfaceTap('gotoMallHome');
    });
    $('#sus-shopcart-icon').on('click',function (event) {
        event.stopPropagation();
        isLogin(function(ret){
			if(ret){
				InterfaceTap('gotoShopCart');
			}
        });
    });
    $('#sus-user-icon').on('click',function (event) {
        event.stopPropagation();
		isLogin(function(ret){
			if(ret){
	            InterfaceTap('gotoMainDidi');
			}
        });
    });
    $('.suspension-menu').on('click','#sus-user-onebuy',function (event) {
        console.log('sus-user-onebuy click');
        event.stopPropagation();
        if(I('pub_acct')==1){
            var obj=M();
            obj.car_public=1;
            InterfaceTap('gotoCarMyInfo',obj);
        }else{
            InterfaceTap('gotoOneBuyMainlottery');
        }
    });
    $('.onepai-home').on('click tap',function (event) {
        event.stopPropagation();
        InterfaceTap('gotoOneBuyIndex');
    });
    $('.one-pai,#onepai-home').on('click tap',function (event) {
        event.stopPropagation();
        if(I('pub_acct')==1){
            InterfaceTap('gotoMyOneAuction');
        }else{
            InterfaceTap('gotoAides');
        }
    });
    $('.down-app').on('click tap',function (event) {
        event.stopPropagation();
        InterfaceTap('downApp');
    });
    $('#onepai-home').next().find('.sus-nun').hide();
    $('#onepai-home').next().show();
    $('.suspension-menu').on('click','#goto-cart',function (event) {
        event.stopPropagation();
        if(I('pub_acct')==1){
            var obj=M();
            obj.source='car-shop-cart';
            InterfaceTap('gotoOneBuyShopCart',obj);
        }else{
            InterfaceTap('gotoOneBuyShopCart');
        }
    });
    $('.suspension-menu img').on('click',function (event) {
        event.stopPropagation();
        event.preventDefault();
        $(".sus-list").toggle();
        var oSrc = '/web/assets/image/float_mesu/float-menu.png';
        if ($(this).attr('src')==oSrc){
            $(this).attr('src', '/web/assets/image/float_mesu/float-menu-hv.png');
        }else{
            $(this).attr('src', '/web/assets/image/float_mesu/float-menu.png');
        }
        return false;
    });
    /*$(document).on('click tap',function () {
        $(".sus-list").hide();
        $('.suspension-menu img').attr('src', '/web/assets/image/float_mesu/float-menu.png');
    });*/
});

/* $('.foot-buy').on('tap','.goto-cart *',function () {
        var obj = M();
        obj.userid = getUserid();
        InterfaceTap('gotoOneBuyShopCart',JSON.stringify(obj));
        // body...
    })*/


// -- 立即关注 --
$(document).ready(function() {
    if(is_weixn(true)){
    }else{
        $('.attention-now').addClass('attention-web');
    }

    $('.attention-now,.attention-now2').on('click tap',function () {
        if(is_weixn(true)){
            $('body').append(attentMask());
            if ($(this).attr('class')=='attention-now') {
                $('.ddcode').show();
                $('.onebuycode').hide();
            } else{
                $('.ddcode').hide();
                $('.onebuycode').show();
            }
        }else{
            Interface('downApp');
        }
    });

    $('.attention-now a,.attention-now2 a').on('click tap',function (event){
        event.stopPropagation();
        $('.attention-now,.attention-now2').hide();
        onShareClose();
    });

    $(document).on('click','.codePic-close',function (event){
        event.stopPropagation();
        $('.attent-mask').hide();
    });
    $(document).on('click','.attent-mask',function (event){
        event.stopPropagation();
    });
});

function attentMask() {
    var codeMask = "";
    codeMask += "<div class='attent-mask'>";
    codeMask += "<div class='code-pic'>";
    codeMask += "<a href='javascript:;' class='codePic-close'></a>";
    codeMask += "<img class='ddcode' style='display:none;' src='/web/assets/image/float_mesu/ddcode.png'>";
    codeMask += "<img class='onebuycode' style='display:none;' src='/web/assets/image/float_mesu/onebuycode.png'>";
    codeMask += "</div>";
    codeMask += "</div>";
    return codeMask;
}

/*--底部导航--*/
$(document).ready(function() {
    $(".goto-mall,.down-app").removeAttr("border")
    $(".foot-nav .goto-home").click(function(){
        Interface('gotoMallHome');
    })
    $(".foot-nav .goto-feilei").click(function(){
        Interface('gotoBrandClassMenu');
    })
    $(".foot-nav .goto-shopcart").click(function(){
		isLogin(function(ret){
			if(ret){
	            Interface('gotoShopCart');
			}
        });
    })
    $(".foot-nav .goto-my").click(function(){
		isLogin(function(ret){
			if(ret){
	            Interface('gotoMainDidi');
			}
        });
    })

    /*$('.foot-nav span').click(function(){
        var nSrc = $(this).find("img").attr("src").replace("icon","icon-hv");
        $(this).siblings().find('img').attr("src").replace("icon-hv","icon");

        $(this).find('p').css("color","#f55");
        $(this).siblings().find('p').css("color","#272636");
        $(this).find('img').attr("src",nSrc);
    })*/
})
/*
*add by 何变 20160714
*公用方法
*生成一元拍页面底部导航和版权信息 《页面仅保留<div class='Foot-brand'></div>自动生成内容》
*参数 type 0 一元拍平台使用，1专属公众号使用
*参数 laws false 不显示服务协议按钮，true 显示服务协议
*服务协议链接点击跳转事件已在此方法处理。
*/
function OnepayCopyright(){
    var type = arguments[0]?arguments[0]:0;
    var laws = arguments[1]?arguments[1]:false;
    var html='';
    var eventType='click';
    if(type==0){
        html='';
        html+='<p class="foot-addnav" style="text-align:center;">';
        html+='    <a class="goto-mall" href="javascript:;" border="right,ccc">神马集市</a>';
        html+='    <a class="one-pai" href="javascript:;">神马互动</a>';
        html+='    <a class="down-app"  href="http://www.didi365.com" border="left,ccc">下载APP</a>';
        html+='</p>';
        html+='<p class="ensure">本平台已由 深圳市点嘀互联网络有限公司 承保</p>';
        html+='<p class="p-tel" style="text-align: center;height: 1rem;line-height: 1rem;color: #999;">';
        html+='    <a id="law" href="#" style="color: #8fb6e3;display:none;">服务协议</a> 服务热线:&nbsp;&nbsp;';
        html+='    <a href="javascript:;" class="a-tel" style="color: #999;text-decoration: none;">400-880-1621</a>';
        html+='</p>';
    }else if(type==1){
        html='<p class="didi_sup"></p><p class="ensure">本平台已由 深圳市点嘀互联网络有限公司 承保</p>';
    }
    if($('.Foot-line').length<=0){
        $('.Foot-brand').before("<div class='Foot-line'></div>")
    }
    $('.Foot-brand').html(html);
    if(!is_weixn()){
        $('.down-app').hide();
        $('.foot-addnav').css('text-align','center');
    }
    if(laws){
        $('#law').show();
        $('#law').after('&nbsp;|&nbsp;');
    }
    console.log('law',$('#law:visible').length);
    if($('#law:visible').length>0){
        if($('#law').parents('.mui-scroll').length>0){
            eventType='tap';//点击绑定事件类型
        }
        console.log('#law has bind event '+eventType);
        $('#law').on(eventType,function(e){//服务协议点击跳转
            var obj=M();
            obj.code="SMYYP";
            Interface('gotoServiceAgrement',JSON.stringify(obj));
        });
    }
}
/*
*一元拍自动生成底部菜单.
*专属公众号也有相应一元拍功能，但首页有区别，故修改此方法以兼容。
*2016-07-14 edit by 何变
*参数type 当前激活的菜单
*参数 is_pub_acct 是否为专属公众号特殊页面(页面地址，跳转参数和一元拍有差异)
*/
function OnepayFoot (type) {
    type = parseInt(type);
    var is_pub_acct = arguments[1]?true:false;//是否为专属公众号特殊页面
    var Foots = [
        {'type':0,'name':'首页','gotostr':is_pub_acct?'gotoPubOneBuyIndex':'gotoOneBuyIndex'},
        {'type':1,'name':'正在进行','gotostr':is_pub_acct?'gotoOneBuyPubLotteriesList':'gotoOneBuyLotteriesList'},
        {'type':2,'name':'最新揭晓','gotostr':is_pub_acct?'gotoOneBuyPubLotteriesList':'gotoOneBuyLotteriesList'},
        {'type':3,'name':'我的记录','gotostr':'gotoOneBuyMainlottery'},
        {'type':4,'name':'购物车','gotostr':'gotoOneBuyShopCart'}
    ]
    var FootList;
    var footnav;
    if($('.lotteries-footnav').length<=0){
        if (is_weixn(true)) {
            FootList = [ Foots[0],Foots[2],Foots[1],Foots[4],Foots[3] ]// 底部菜单排序.
            footnav = $("<div class='lotteries-footnav clearfix' />").appendTo($("body"));
            var footli ;
            for (var i = 0; i < FootList.length; i++) {
                footli = $('<div class="hv" type="'+FootList[i].type+'"><div></div><span>'+FootList[i].name+'</span></div>');
                if(type == FootList[i].type){
                    footli.attr('class','active');
                }
                if(i==3){
                    footli.find('div').append($('<p num="0">0</p>'))
                }
                footnav.append(footli);//添加
            }
        }else {
            FootList = [ Foots[0],Foots[2],Foots[1],Foots[3] ]// 底部菜单排序.
            footnav = $("<div class='lotteries-footnav' />").appendTo($(".app-foot"));
            var footli ;
            for (var i = 0; i < FootList.length; i++) {
                footli = $('<div class="hv" type="'+FootList[i].type+'"><span>'+FootList[i].name+'</span></div>');
                if(type == FootList[i].type){
                    footli.attr('class','active');
                }
                footnav.append(footli);//添加
            }
            $('.barrageinfo').css('top','4.8rem');
        }
    }
    if(type != 4 ){
        GetCartGoodNum(4);//更新底部导航栏数字
    }
    $('.lotteries-footnav div[type]').on('click',function (e) {//给底部菜单添加点击事件
        var _type = parseInt($(this).attr('type'));
        var obj = M();
        if( [1,2].indexOf(_type)>=0 ){
            if([1,2].indexOf(type)>=0){
                return ; //正在进行和最新揭晓页面之间互相跳转的方法很特殊,就不写在公共方法里面了.在页面内重写了一个点击事件.
            }
            obj.type = _type;
        }
        obj.target = '_self' ;
        InterfaceTap( Foots[_type].gotostr, JSON.stringify(obj));
    });
}


function GetCartGoodNum () {
    var obj = M();
    obj.userid = getUserid();
    if(arguments[0]){                   //goods_type为4指的是一元拍订单.
        obj.goods_type = arguments[0];
    }
    is_login(function(ret){
        if(ret){
            jsonAjax(API.API_LIST.GET_CART_GOOD, obj,function(data){
                if(data.status==1){
                    RenewCartNum ( parseInt(data.data.totalNum) );
                }
            });
        }
    });
}

function AddToCart (_obj) {//
    //console.log(isLogin());
    //if(!isLogin()){
    //    return;
    //}
    is_login(function(ret){
        if(ret){
            var callback = arguments[1]?arguments[1]:null;
            jsonAjax(API.API_LIST.CART_ADDTOCART, _obj ,function(data){
                if(data.status == 1){
                    if(_obj.goods_type==4){
                        inputTipsText('加入购物车成功',300);//一元拍购物车提示语
                    }else{
                        inputTipsText('已成功加入到礼品车',300);//商城礼品车提示语
                    }
                    RenewCartNum ( parseInt(data.data.totalNum) );
                    setTimeout(function () {
                        $('.addcart-tip').animate({opacity:'0.9'},"slow").animate({opacity:'0'},"slow");
                    }, 300);
                    if(callback){//加入购物车的回调函数.
                        var obj = M();
                        obj.num = parseInt(data.data.totalNum);
                        doCallback(eval(callback),obj);
                    }
                }else{
                    inputTipsText(data.info);
                }
            });
        }
    });
}
function RenewCartNum (num) {
    $('.lotteries-footnav p[num]').attr('num',num);
    num = num>99 ? '99+':num;
    $('.lotteries-footnav p[num]').html(num);
    $('.sus-nun').show().html(num);
    if(num<=0){
        $('.sus-nun').hide();
    }
}

//返回顶部
$(document).ready(function() {
    $("a[href='#top']").on("click",function() {
        mui('#pullrefresh').pullRefresh().scrollTo(0,0,1000);
        window.scrollTo(0, 1000);
        $(".top").hide();
        return false;
    });
});



// 这个方法的作用是生成神马假日底部下载栏
// 参数node表示页面元素节点;
// 第三个参数表示下载栏所在位置,若不传，则在底部，传float,则在离底部4.4rem的位置;
// 第三个参数表示需要触发的事件，不传表示支持click事件，需要支持tap事件的请传tap
//
var share_ornot = I('share_ornot',0);
function downloadApp(node){
    console.log('share_ornot:',share_ornot);
    if(I('share_ornot')==1){
        return;
    }
	var type=arguments[1] ||'bottom';
	var func=arguments[2] ||'click';
	var downloadTml='';
	downloadTml+='<div class="app-download">'
        		+'<img src="/web/assets/image/smdg/logo.png" alt="" class="logo">'
        		+'<div class="down_detail">'
            	+'<p class="down_appname">神马嘀嘀</p>'
            	+'<p class="">人.车.生活移动互联社区</p>'
        		+'</div>'
		        +'<div class="down_btn vc">立即使用</div>'
		        +'<img src="/web/assets/image/smdg/close.png" alt="" class="close vc">'
    			+'</div>';
	$(node).append(downloadTml);
	if(type=='bottom'){
		$(".app-download").css("bottom","0");
	}else {
		$(".app-download").css("bottom","4.4rem");
	}
	$('.app-download .close').on(func,function(){
        share_ornot=1;
        $(this).parent('.app-download').remove();
	});
	$(".down_btn").on(func,function(){
		Interface('downApp');
	});
};

//这个方法的作用是生成商城顶部华唐教育的导航栏
function gotoEdu(){
    var arr='body';
    var headEdu='';
    var channel_identifier = I('channel_identifier','0');//不为空。
    if(channel_identifier!='0' && channel_identifier !=''){
        headEdu+='<div class="huatang">'
                +'<div class="gotoHt"><img src="/web/assets/image/wechat/huatang@2x.png" alt=""></div>'
                +'<div class="changeMt"><img src="/web/assets/image/wechat/duihuanmati@2x.png" alt=""></div>'
                +'<img class="beClose" src="/web/assets/image/wechat/clear-button@2x.png" alt="">'
                +'</div>';
        if($('.attention-now').length>0||$('.attention-now2').length>0){
            $('.attention-now').remove();
            $('.attention-now2').remove();
        }
        if($('.huatang').length==0){
          $(arr).prepend(headEdu);
          $('.huatangjiaoyu').html(headEdu);
        }
        $('.huatang').css({'width':'100%','height':'5rem','position':'relative','background':'url(/web/assets/image/wechat/bg@2x.png) no-repeat','background-size':'100% 100%;','display':'-webkit-box','display':'-webkit-flex','display':'flex','z-index':'2000'});
        $('.gotoHt,.changeMt').css({'display':'-webkit-box','display':'-webkit-flex','display':'flex','-webkit-box-flex':'1','-webkit-flex':'1','flex':'1','-webkit-box-pack':'center','-webkit-justify-content':'center','justify-content':'center','-webkit-box-align':'center','-webkit-align-items':'center','align-items':'center'})
        $('.gotoHt>img,.changeMt>img').css({'width':'53.4%','height':'2.6rem'});
        $('.beClose').css({'width':'1.8rem','height':'1.8rem','position':'absolute','right':'0.75rem','top':'50%','margin-top':'-0.9rem'});

        $('.beClose').on('click tap',function(){
            $('.huatang').remove();
        });

        $('.gotoHt').on('click tap','img',function(){
            var param = M();
            redirect('http://www.huatangjiaoyu.com/app/index.jsp',param);
        });
        $('.changeMt').on('click tap','img',function(){
            var param = M();
            Interface('gotoChangeMT',param);
        });

    }
}
