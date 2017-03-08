  /**
 * 公共JS文件
 */
var jsObj = new Object();
var C = new Object(); //系统配置对象

//屏蔽页面复制效果
function clearCopy() {
    if(!is_weixn(true)){
        return;
    }
    document.body.oncontextmenu = function () {
        return false;
    };
    document.body.ondragstart = function () {
        return false;
    };
    document.body.onselectstart = function () {
        return false;
    };
    document.body.onbeforecopy = function () {
        return false;
    };
    document.body.onselect = function () {
        if(document.selection){
            document.selection.empty();
        }else{
            window.getSelection().empty();
        }
    };
    document.body.oncopy = function () {
         if(document.selection){
            document.selection.empty();
        }else{
            window.getSelection().empty();
        }
    };
}
window.onload = clearCopy;

//常用函数
function hasClass(elements, cName) {
    return !!elements.className.match(new RegExp("(\\s|^)" + cName + "(\\s|$)"));
}
function addClass(elements, cName) {
    if (!hasClass(elements, cName)) {
        elements.className += " " + cName;
    }
}
function removeClass(elements, cName) {
    if (hasClass(elements, cName)) {
        elements.className = elements.className.replace(new RegExp("(\\s|^)" + cName + "(\\s|$)"), " ");
    }
}

function preDefault() {
    event.preventDefault();
}
function forBidMove() {	//禁止touchmove
    document.getElementsByTagName('body')[0].addEventListener('touchmove', preDefault);
}
function allowMove() {	//恢复touchmove
    document.getElementsByTagName('body')[0].removeEventListener('touchmove', preDefault);
}


//js开始加载
function onJsStart(status, msg) {
    var obj = new Object();
    obj.status = status;
    obj.msg = msg;
    if (arguments[2] != undefined) {
        obj.info = arguments[2];
    } else {
        obj.info = '';
    }
    if (arguments[3] != undefined) {
        obj.data = arguments[3];
    } else {
        obj.data = '';
    }
    Interface('onJsStart', JSON.stringify(obj));
    $('body').append(loadWrite());
}

function loadWrite() {
    var loadDemoStr = "";
    loadDemoStr += "<div class='modal fade' id='modal_loader'>";
    loadDemoStr += "<div class='modal-content'>";
    loadDemoStr += "<div id='didi_loader'>";
    loadDemoStr += "<span></span><span></span><span></span><span></span>";
    loadDemoStr += "</div>";
    loadDemoStr += "<div id='tips_loader'></div>";
    loadDemoStr += "</div>";
    loadDemoStr += "</div>";
    return loadDemoStr;
}

function loadEnd() {
    $("#modal_loader").remove();
    imgWait();
}

function imgWait() {
    var fSize = document.body.clientWidth / 32;
    var defImg = '/web/assets/image/default_ico.svg';
    var defUsrImg='/web/assets/image/user_head_64x64.png';
    $('img[srcs]').load(function () {
        //console.log('img.load');
        if ($(this).attr('src') != defImg) {
            $(this).css('padding', '0');
        }
        $(this).attr('src', $(this).attr('srcs')).removeAttr('srcs');
        $(this).closest('a').attr('href', defImg);
    });
    $('img').error(function () {
        console.log('img.error', $(this).attr('src'), $(this).attr('srcs'));
        if($(this).hasClass('smUsrImg')){
            $(this).attr('src', defUsrImg).removeAttr('srcs');
            $(this).closest('a').attr('href', defUsrImg);
        }else {
            $(this).attr('src', defImg).removeAttr('srcs');
            $(this).closest('a').attr('href', defImg);
        }
    })
    $('img[srcs]').each(function () {
        //console.log('img.each');
        var imgH = $(this).height();
        var imgW = $(this).width();
        var padH = (imgH - (5 * fSize)) / 2;
        var padW = (imgW - (5 * fSize)) / 2;
        if (padH > 0 && padW > 0) {
            $(this).css('padding-top', padH);
            $(this).css('padding-left', padW);
            $(this).css('padding-right', padW);
            $(this).css('padding-bottom', padH);
        }
        $(this).attr('src', defImg);
    });
}

function showLoad(msg) {
    inputTipsText(msg);
}
//js加载完成
function onJsLoad(status, msg) {
    var obj = new Object();
    obj.status = status;
    obj.msg = msg;
    if (arguments[2] != undefined) {
        obj.info = arguments[2];
    } else {
        obj.info = '';
    }
    if (arguments[3] != undefined) {
        obj.data = arguments[3];
    } else {
        obj.data = '';
    }
    Interface('onJsLoad', JSON.stringify(obj));
    if (status == -1) {
        if (is_weixn(true)) {
            var pageUrl = location.href.split('#')[0];
            if(pageUrl.indexOf('/web/ddshop/')>0){
                //嘀嘀店通商家端
                redirect('/web/ddshop/login.html');
                return false;
            }
            event_link(API.SERVER_URL + API.APP_LICATION + API.API_LIST.LOGIN_WEChAT + '?url=' + encodeURIComponent(pageUrl));
        }else if(is_smdd()){
            event_link(API.SERVER_URL + 'sdp/login/binding?userid=' + getUserid());
        }else{
            //第三方平台 显示登录窗口
            loginDialog();
        }
        return false;
    }else if (status == -3) {
        loadEnd();
        inputTipsText(msg);
    }
}

//动态回调函数
function doCallback(fn, args) {
    fn.apply(this, [args]);
}

function InterfaceTap(action) {
    //为tap跳转事件做延迟处理.
    var param = arguments[1] ? arguments[1] : '';
    setTimeout(function () {
        Interface(action, param);
    }, 320);
}
function Interface2(action, param) {
    alert('[Interface2~~~~~]');
    Interface(action, param);
}
//js调用app接口  action 方法名  param  参数 json字符串
function Interface(action) {
    try {
        var param = arguments[1] ? arguments[1] : '';
        if (param != '') {
            if (typeof param != 'object') {
                param = JSON.parse(param);
            }
        } else {
            param = M();
        }
        switch (action) {
            case 'onJsStart':
                break;
            case 'onJsLoad':
                break;
            default:
                doCallback(eval(action), param);
                break;
        }
    } catch (e) {
        alert('异常:' + e.message);
    }
}
function PageJump(action) {
    try {
        var param = arguments[1] ? arguments[1] : '';
        if (param != '') {
            if (typeof param != 'object') {

                param = JSON.parse(param);

            }
        } else {
            param = M();
        }
        switch (action) {
            case 'onJsStart':
                break;
            case 'onJsLoad':
                break;
            default:
                gotolink(action,param);
                break;
        }
    } catch (e) {
        alert('异常:' + e.message);
    }
}
function PageJumpTap(action) {
    //为tap跳转事件做延迟处理.
    var param = arguments[1] ? arguments[1] : '';
    setTimeout(function () {
        PageJump(action, param);
    }, 320);
}
/**
 * 页面加载完回调事件
 */
$(document).ready(function () {
    //设置userid
    setUserid();
    setMid();
    //处理微信环境
    if (is_weixn(true)) {
        //设置openid
        setOpenid();
    }
    onJsStart(1, '开始加载');
    if(window.location.href.indexOf('web/car-service')>0){
        try{
            is_login(function(ret){
                if(ret){
                    try{
                        getUserInfo();
                    }catch(e){}//汽车服务 - 获取用户信息
                }else{console.log('not login');}
                onStart(); //回调ajax请求方法
            });
        }catch(e){}
    }else{
        try{
           gotoEdu();
        }catch(e){}
        //嘀嘀店通 获取登录信息
        try{
            getLoginInfo();
        }catch(e){}
        // if (window.location.protocol != 'https:'){
        //     window.location.href = 'https:' + window.location.href.substring(window.location.protocol.length);
        // }
        onStart(); //回调ajax请求方法
    }
});

/**
 * ajax post提交
 * @param url
 * @param param
 * @param datat 为html,json,text
 * @param callback回调函数
 * @return
 */
function jsonAjax(url, param) {
    var callback = arguments[2] ? arguments[2] : 'ajaxcallback';
    var type = arguments[3] ? arguments[3] : METHOD;
    var datat = arguments[4] ? arguments[4] : 'json';
    var host_type = arguments[5] ? arguments[5] : 0;
    var len = (url.split('/')).length - 1;
    var lication = '';
    var async = arguments[5]==1 ? false : true;
    if (len <= 1) {
        lication = API.APP_LICATION;
    }
    if(host_type==0){
        url = API.SERVER_URL + lication + url + '/?callback=?';  //服务器请求地址
    }else if(host_type==1){
        url = API.RECENG_URL + lication + url + '?callback=?';  //服务器请求地址
    }
    //appid 1 用户端  2商户端
    if (jsObj.appid == undefined || jsObj.appid == '') {
        param.appid = API.APPID;
    } else {
        param.appid = jsObj.appid;
    }
    //platform 平台 ios  android
    if (jsObj.platform == undefined || jsObj.platform == '') {
        param.platform = API.PLATFORM;
    } else {
        param.platform = jsObj.platform;
    }
    //当前版本号
    if (jsObj.version == undefined || jsObj.version == '') {
        param.version = API.VERSION;
    } else {
        param.version = jsObj.version;
    }
    //1  App Store  2 企业版
    if (jsObj.apptype == undefined || jsObj.apptype == '') {
        param.apptype = 1;
    } else {
        param.apptype = jsObj.apptype;
    }
    //经度
    if (jsObj.longitude != undefined && jsObj.longitude != '') {
        param.longitude = jsObj.longitude;
    }
    //纬度
    if (jsObj.latitude != undefined && jsObj.latitude != '') {
        param.latitude = jsObj.latitude;
    }
    //登录令牌
    if (jsObj.logintoken == undefined || jsObj.logintoken == '') {
        param.logintoken = $.cookie('logintoken');
        if (typeof(param.logintoken) == "undefined" || param.logintoken == '') {
            param.logintoken = I('logintoken', '');
        }
    } else {
        param.logintoken = jsObj.logintoken;
    }
    //微信公众号id
    if (jsObj.wxappid == undefined || jsObj.wxappid == '') {
        param.wxappid = $.cookie('wxappid');
        if (typeof(param.wxappid) == "undefined" || param.wxappid == '') {
            param.wxappid = I('wxappid', '');
        }
    } else {
        param.wxappid = jsObj.wxappid;
    }
    // console.log(url,JSON.stringify(param));
    var ajaxTimeout = $.ajax({
        type: type,    //请求方式  get  post
        url: url,      //请求url
        timeout: TIMEOUT, //超时时间设置，单位毫秒 30秒
        data: param,    //请求参数
        dataType: datat,  //返回类型
        async:async,//同步 异步
        success: function (data, textStatus) {
            //强制登录
            if (data.status == -1) {
                onJsLoad(data.status, data.info);
                return false;
            }
            //强制更新
            if (data.status == -2) {
                Interface('onJsLoad', '{"status":"' + data.status + '","msg":"' + data.info + '","url":"' + data.data.url + '"}');
                return false;
            }
            eval(callback(data));
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (textStatus == 'timeout') {//超时,status还有success,error等值的情况
                ajaxTimeout.abort();
                //onJsLoad(-3, '网络异常,请稍后再试');
                return false;
            }
            //onJsLoad(-3, '网络异常,请稍后再试');
            return false;
        }
    });
}
