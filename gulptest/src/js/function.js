/**
 * 公共函数文件
 */

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

/**
 * 创建一个空对象
 */
function M() {
    console.log('gulp test');
    return new Object();
}

/**
 * 获取url参数数组
 */
function GetUrlPars() {
    var url = location.search;
    var Request = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            var sTemp = strs[i].split("=");
            Request[sTemp[0]] = (sTemp[1]);
        }
    }
    return Request;
}

/**
 * 获取微信openid
 */
function getOpenid() {
    if(is_weixn(true)){
        var openid = I('openid', '');
        if (openid == '') {
            openid = $.cookie('wx_openid');
        }
        if (typeof(openid) == "undefined" || openid == '') {
            var pageUrl = location.href.split('#')[0];
            event_link(API.SERVER_URL + API.APP_LICATION + API.API_LIST.LOGIN_WEChAT + '?url=' + encodeURIComponent(pageUrl));
            return false;
        }
        return openid;
    }else{
        return;
    }
}

/**
 * 设置微信openid
 */
function setOpenid() {
    var openid = I('openid', '');
    if (openid == '') {
        openid = getOpenid();
    }
    if (openid != '') {
        $.cookie('wx_openid', openid, {expires: 30, path: '/'});
    } else {
        $.cookie('wx_openid', '', {expires: 30, path: '/'});
    }
}

/**
 * 获取userid
 */
function getUserid() {
    var userid = I('userid', '');
    if (userid == '') {
        userid = $.cookie('userid');
    }
    if (typeof(userid) == "undefined" || userid == 0) {
        userid = 0;
    }
    return userid;
}

/**
 * 获取userid
 */
function getDidiNumber() {
    var didinumber = I('didinumber', '');
    if (didinumber == '') {
        didinumber = $.cookie('didinumber');
    }
    if (typeof(didinumber) == "undefined" || didinumber == 0) {
        didinumber = 0;
    }
    return didinumber;
}

/**
 * 获取logintoken
 */
function getLogintoken() {
    var logintoken = I('logintoken', '');
    if (logintoken == '') {
        logintoken = $.cookie('logintoken');
    }
    if (typeof(logintoken) == "undefined" || logintoken == '') {
        logintoken = '';
    }
    return logintoken;
}
/**
 * [getWxappid 获取微信公众号id]
 * @return {[type]} [获取微信公众号id]
 */
function getWxappid(){
    var wxappid='';
    if (jsObj.wxappid == undefined || jsObj.wxappid == '') {
        wxappid = $.cookie('wxappid');
        if (typeof(wxappid) == "undefined" || wxappid == '') {
            wxappid = I('wxappid', '');
        }
    }else {
        wxappid = jsObj.wxappid;
    }
    return wxappid;
}

/**
 * 设置userid
 */
function setUserid() {
    var userid = arguments[0] ? arguments[0] : 0;
    var logintoken = arguments[1] ? arguments[1] : '';
    if (userid > 0) {
        $.cookie('userid', userid, {expires: 30, path: '/'});
        $.cookie('logintoken', logintoken, {expires: 30, path: '/'});
    } else {
        var userid = I('userid', null);
        var logintoken = I('logintoken', '');
        var didinumber = I('didinumber', '');//推荐人嘀嘀号
        var qwt_from = I('qwt_from', '');//全网通注册来源
        if (userid == null) {
            userid = getUserid();
        }
        if (userid > 0) {
            $.cookie('userid', userid, {expires: 30, path: '/'});
        } else {
            $.cookie('userid', 0, {expires: 30, path: '/'});
        }
        if (logintoken == '') {
            logintoken = getLogintoken();
        }
        if (logintoken != '') {
            $.cookie('logintoken', logintoken, {expires: 30, path: '/'});
        } else {
            $.cookie('logintoken', '', {expires: 30, path: '/'});
        }
        if (didinumber != '') {
            $.cookie('didinumber', didinumber, {expires: 30, path: '/'});
        }
        if (qwt_from != '') {
            $.cookie('qwt_from', qwt_from, {expires: 30, path: '/'});
        }
    }
}

/**
 * 获取 mid
 */
function getMid() {
    var mid = I('mid', '');
    if (mid == '') {
        mid = $.cookie('mid');
    }
    if (typeof(mid) == "undefined" || mid == 0) {
        mid = 0;
    }
    return mid;
}

/**
 * 设置mid
 */
function setMid() {
    var mid = arguments[0] ? arguments[0] : 0;
    if (mid > 0) {
        $.cookie('mid', mid, {expires: 30, path: '/'});
    } else {
        var mid = I('mid', null);
        if (mid == null) {
            mid = getMid();
        }
        if (mid > 0) {
            $.cookie('mid', mid, {expires: 30, path: '/'});
        } else {
            $.cookie('mid', 0, {expires: 30, path: '/'});
        }
    }
}
function is_login(){
    var call = arguments[0] ? arguments[0] : undefined;
    var call2 = arguments[1] ? arguments[1] : undefined;
    var userid = getUserid();
    if (userid == '' || userid <= 0) {
        if(call){
            eval(call(false));
        }
        return false;
    }
    var ret = false;
    $.ajax({
        async:call?true:false,//同步
        timeout: 30000,//超时
        url:  API.SERVER_URL+'gold/'+API.API_LIST.LOGIN_USER+ '/?callback=?',//URL参数
        type: 'GET',//请求方法
        data:{userid:userid,logintoken:getLogintoken()},//参数
        dataType: 'json',//返回数据类型
        success: function(data,textStatus){
            if(data.status==1){//已登录
                ret = true;
            }else{//未登录
                ret = false;
            }
            if(call){
                eval(call(ret));
            }
            if(call2){
                eval(call2(ret));
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            ret = false;
            if(call){
                eval(call(ret));
            }
            if(call2){
                eval(call2(ret));
            }
        }
    });
    return ret;
    /*jsonAjax(API.API_LIST.LOGIN_USER, {userid:userid,logintoken:getLogintoken()}, function (data) {
        if(data.status==1){//已登录
            ret = true;
        }else{//未登录
            ret = false;
        }
        if(call){
            console.log('is_login ret:'+ret);
            eval(call(ret));
        }
        if(call2){
            eval(call2(ret));
        }
    });*/
}
/**
 * 判断是否登录
 */
function isLogin() {console.log('islogin-----'+new Date());
    var call = arguments[0] ? arguments[0] : undefined;
    setUserid();
    var userid = getUserid();
    var result=false;
    if (userid == '' || userid <= 0) {
        if (is_weixn(true)) {
            var pageUrl = location.href.split('#')[0];
            event_link(API.SERVER_URL + API.APP_LICATION + API.API_LIST.LOGIN_WEChAT + '?url=' + encodeURIComponent(pageUrl));
        }else if(is_smdd()){
            event_link(API.SERVER_URL + 'sdp/login/binding?userid=' + getUserid());
        }else if(is_apppartner()){
            event_link(API.SERVER_URL + 'sdp/login/binding?userid=' + getUserid());
        }else{
            //第三方平台 显示登录窗口
            loginDialog();
        }
        if(call){
            eval(call(result));
        }
        return result;
    }else{
        return is_login(call,function(ret){
            result=ret;
            if(!ret){
                if (is_weixn(true)) {
                    var pageUrl = location.href.split('#')[0];
                    event_link(API.SERVER_URL + API.APP_LICATION + API.API_LIST.LOGIN_WEChAT + '?url=' + encodeURIComponent(pageUrl));
                }else if(is_smdd()){
                    event_link(API.SERVER_URL + 'sdp/login/binding?userid=' + getUserid());
                }else if(is_apppartner()){
                    event_link(API.SERVER_URL + 'sdp/login/binding?userid=' + getUserid());
                }else{
                    //第三方平台 显示登录窗口
                    loginDialog();
                }
            }
        });
    }
    return result;
}

/**
 * 判断是否为空
 */
function empty(data) {
    if (typeof data == 'object') {
        if (data == '') {
            return true;
        }
    } else if (typeof data == 'array') {
        if (data.length == 0) {
            return true;
        }
    } else if (typeof data == 'string') {
        if (data == '') {
            return true;
        }
    }
    return false;
}

/**
 * 获取访问终端
 */
function getDeviceType() {
    if (DEBUG == 1) {
        return "web";
    }
    //判断访问终端
    var browser = {
        versions: function () {
            var u = navigator.userAgent, app = navigator.appVersion;
            return {
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
                iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
            };
        }(),
        language: (navigator.browserLanguage || navigator.language).toLowerCase()
    }
    if (!(browser.versions.mobile || browser.versions.android || browser.versions.ios)) {
        return "web";
    }

    if (browser.versions.android) {
        return "android";
    }

    if (browser.versions.ios) {
        return "ios";
    }
}

/**
 * 判断是否是微信
 */
function is_weixn() {
    var iswx = arguments[0] ? arguments[0] : false;//真正的微信客户端判断
    var ua = navigator.userAgent.toLowerCase();
    if(iswx){
        if (ua.match(/MicroMessenger/i) == "micromessenger") {
            return true;
        } else {
            return false;
        }
    }else{
        //在微信，或者非神马嘀嘀客户端都认为是微信（为了支付都统一跳转网页收银台）
        if (ua.match(/MicroMessenger/i) == "micromessenger" || !ua.match(/shenmadidi/i)) {
            return true;
        } else {
            return false;
        }
    }
}

/**
 * 判断是否是神马嘀嘀
 */
function is_smdd() {
    var ua = navigator.userAgent.toLowerCase();
    if (ua.match(/shenmadidi/i) == "shenmadidi") {
        return true;
    } else {
        return false;
    }
}

/**
 * 判断是否第三方APP
 */
function is_apppartner() {
    var ua = navigator.userAgent.toLowerCase();
    if (ua.match(/apppartner/i) == "apppartner") {
        return true;
    } else {
        return false;
    }
}

/**
 * 加载微信对象
 */
function loadWxObject() {
    var sdk = API.API_LIST.WECHAT_JSSDK;
    var isShare = arguments[0] ? arguments[0] : false;
    var isonlyfriend = arguments[1] ? arguments[1] : false;
    var show = arguments[2] ? arguments[2] : false;//参数为true，弹出app的分享框
    console.log('call loadWxObject',isShare,isonlyfriend);
    if (is_weixn(true)) {
        //初始化JS-SDK对象
        jsonAjax(sdk, {'url': encodeURIComponent(location.href.split('#')[0])}, function (data) {
            if (data.status == 1) {
                //data.data.debug=true;
                wx.config(data.data);
                wx.ready(function () {
                    wx.hideOptionMenu(); //隐藏分享按钮
                    if (isShare) {
                        if (isonlyfriend) {
                            onWxShare(true);  //开始分享
                        } else {
                            onWxShare();  //开始分享
                        }
                    }
                    try {
                        onWxReady();
                    } catch (e) {
                        //alert('异常:' + e.message);
                    }
                });
                wx.error(function (res) {
                    //inputTipsText('微信分享参数:'+JSON.stringify(res));
                });
            }
        });
    }else {
        if (isShare && is_smdd()) {
            try {
                var jsonObj=null;
                try{
                    jsonObj=JSON.parse(WxShare.link);
                }catch(e){jsonObj=null;}
                var shareParam='{"title":"' + WxShare.title + '","desc":"' + WxShare.desc + '","pic":"' + WxShare.imgUrl + '","url":"' + (jsonObj?'':WxShare.link) + '","share_web":"' + (jsonObj?jsonObj.web:'') + '","share_wechat":"' + (jsonObj?jsonObj.wechat:'') + '","show":"' + show + '"}';
                JavaScriptInterface.openShared(shareParam);  //设置微信分享信息-APP端
            } catch (e) {
                //alert('异常:' + e.message);
            }
        }
        try {
            onWxReady();
        }catch (e) {
            //alert('异常:' + e.message);
        }
    }
}

//开启分享菜单
function onWxShare() {
    var isonlyfriend = arguments[0] ? arguments[0] : false;
    var show = arguments[1] ? arguments[1] : false;//参数为true，弹出app的分享框
    /*if (isonlyfriend) {
        var list = ['menuItem:share:timeline'];
    } else {
        var list = ['menuItem:share:appMessage', 'menuItem:share:timeline'];'menuItem:share:QZone',
    }*/
    var list = [
        'menuItem:share:appMessage',
        'menuItem:share:timeline',
        'menuItem:share:qq',
        'menuItem:share:weiboApp',
        'menuItem:copyUrl'
    ];
    if(window.location.href.indexOf('web/car-service')>0||window.location.href.indexOf('web/pub-acct')>0){
        list.splice(2,3);//专属公众号去掉分享qq，复制链接功能
    }
    if (is_weixn(true)) {
        wx.showMenuItems({
            menuList: list // 要显示的菜单项，所有menu项见附录3
        });
        wxShare(WxShare);  ////设置微信分享信息
    }else {
        if (is_smdd()) {
            try {
                var jsonObj=null;
                try{
                    jsonObj=JSON.parse(WxShare.link);
                }catch(e){jsonObj=null;}
                var shareParam='{"title":"' + WxShare.title + '","desc":"' + WxShare.desc + '","pic":"' + WxShare.imgUrl + '","url":"' + (jsonObj?'':WxShare.link) + '","share_web":"' + (jsonObj?jsonObj.web:'') + '","share_wechat":"' + (jsonObj?jsonObj.wechat:'') + '","show":"' + show + '"}';
                JavaScriptInterface.openShared(shareParam);  //设置微信分享信息-APP端
            } catch (e) {
                //alert('异常:' + e.message);
            }
        }
    }
}

function getShreFromParam(){
    var url=location.href;
    var p=1;
    if(url.indexOf('web/wechat')>0){
        if(url.indexOf('web/wechat/seckill')>0){
            p=7;//神马D价购
        }else{
            p=2;//神马商城
        }
    }else if(url.indexOf('web/lottery')>0){
        p=5;//神马一元拍
    }else if(url.indexOf('web/interact/guess')>0){
        p=6;//神马竞猜
    }else if(url.indexOf('web/interact/fight_exps')>0){
        p=8;//表情包
    }else if(url.indexOf('web/smdg')>0){
        if( url.indexOf('smholiday.html')>0||
            url.indexOf('activity-detail.html')>0||
            url.indexOf('artical-detail.html')>0||
            url.indexOf('live-Interactive')>0){
            p=9;//神马假日 from_page=smholiday
        }else if(url.indexOf('home-carnival.html')>0||
            url.indexOf('carnival-detail.html')>0||
            url.indexOf('carnival-msg.html')>0||
            url.indexOf('carnival.html')>0||
            url.indexOf('activity-inform.html')>0||
            url.indexOf('entryRecord.html')>0||
            url.indexOf('driver-info.html')>0||
            url.indexOf('carnival-score.html')>0||
            url.indexOf('carnival-rank.html')>0){
            p=10;//神马嘉年华 from_page=smcarnival
        }else if(url.indexOf('Voucher.html')>0){
            if(url.indexOf('from_page=smcarnival')>0){
                p=10;
            }else if(url.indexOf('from_page=smholiday')>0){
                p=9;
            }
        }
    }
    return p;
}

function getShareLink(){
    var url=location.href.split('#')[0];
    var p=getShreFromParam();
    if(url.indexOf('?')>0){
        url+='&didinumber='+getUserid();
        url+='&qwt_from='+p;
        url+='&share=1';
    }else{
        url+='?didinumber='+getUserid();
        url+='?qwt_from='+p;
        url+='&share=1';
    }
    return url;
}

/**
 * 微信分享
 */
function wxShare(data) {
    var linkObj=null;
    try{
        linkObj=JSON.parse(data.link);
    }catch(e){linkObj=null;}
    if (is_weixn(true)) {
        wx.onMenuShareQQ({
            title: data.title, // 分享标题
            desc: data.desc, // 分享描述
            link: data.linkUrl?data.linkUrl:linkObj.web, // 分享链接
            imgUrl: data.imgUrl, // 分享图标
            success: function () {
               // 用户确认分享后执行的回调函数
               $('.modal').removeClass('fade');
                //inputTipsText("分享成功");
                try {
                    JumpAfterSharing();
                } catch (e) {}
                try {
                    afterShareTimeLine();
                } catch (e) {}
                try {
                    afterShareFlaunt();
                } catch (e) {}
            },
            cancel: function () {
               // 用户取消分享后执行的回调函数
               $('.modal').removeClass('fade');
            }
        });
        wx.onMenuShareWeibo({
            title: data.title, // 分享标题
            desc: data.desc, // 分享描述
            link: data.linkUrl?data.linkUrl:linkObj.web, // 分享链接
            imgUrl: data.imgUrl, // 分享图标
            success: function () {
               // 用户确认分享后执行的回调函数
               $('.modal').removeClass('fade');
                //inputTipsText("分享成功");
                try {
                    JumpAfterSharing();
                } catch (e) {}
                try {
                    afterShareTimeLine();
                } catch (e) {}
                try {
                    afterShareFlaunt();
                } catch (e) {}
            },
            cancel: function () {
               // 用户取消分享后执行的回调函数
               $('.modal').removeClass('fade');
            }
        });
        try{
        wx.onMenuShareQZone({
            title: data.title, // 分享标题
            desc: data.desc, // 分享描述
            link: data.linkUrl?data.linkUrl:linkObj.web, // 分享链接
            imgUrl: data.imgUrl, // 分享图标
            success: function () {
               $('.modal').removeClass('fade');
                //inputTipsText("分享成功");
                try {
                    JumpAfterSharing();
                } catch (e) {}
                try {
                    afterShareTimeLine();
                } catch (e) {}
                try {
                    afterShareFlaunt();
                } catch (e) {}
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                $('.modal').removeClass('fade');
            }
        });}catch(e){}
        //分享到朋友圈
        wx.onMenuShareTimeline({
            title: data.title, // 分享标题
            link: linkObj.wechat, // 分享链接
            imgUrl: data.imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
                $('.modal').removeClass('fade');
                //inputTipsText("分享成功");
                try {
                    JumpAfterSharing();
                } catch (e) {}
                try {
                    afterShareTimeLine();
                } catch (e) {}
                try {
                    afterShareFlaunt();
                } catch (e) {}
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                $('.modal').removeClass('fade');
                //inputTipsText("取消分享");
            }
        });
        //分享给盆友
        wx.onMenuShareAppMessage({
            title: data.title, // 分享标题
            desc: data.desc, // 分享描述
            link: linkObj.wechat, // 分享链接
            imgUrl: data.imgUrl, // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
                $('.modal').removeClass('fade');
                //inputTipsText("分享成功");
                try {
                    JumpAfterSharing();
                }catch (e) {}
                try {
                    afterShareFriend();
                } catch (e) {}
                try {
                    afterShareFlaunt();
                } catch (e) {}
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                $('.modal').removeClass('fade');
                //inputTipsText("取消分享");
            }
        });
        //inputTipsText('开始分享');
    }else {
        //APP端 分享
        event_link(API.SERVER_URL + 'sdp/' + API.API_LIST.WECHAT_SHARE + '?title=' + data.title + '&desc=' + data.desc + '&pic=' + data.imgUrl + '&url=' + (linkObj?'':data.link) + '&share_web=' + (linkObj?linkObj.web:'') + '&share_wechat=' + (linkObj?linkObj.wechat:''));
    }
}

/**
 * 微信二维码分享
 */
function shareCode(brandid, path) {
    //APP端 分享
    event_link(API.SERVER_URL + 'sdp/' + API.API_LIST.DISTRIBUTION_SHARECODE + '?userid=' + getUserid() + '&brandid=' + brandid + '&path=' + path);
}

function openScanView() {
    if (is_smdd()) {
        try {
            JavaScriptInterface.openScanView(JSON.stringify({success: 'function(res) {scanQRCodeSucceed(res);}'}));
        } catch (e) {
            //alert('异常:' + e.message);
        }
    } else if (is_weixn(true)) {
        wx.scanQRCode({
            needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
            scanType: ["qrCode", "barCode"], // 可以指定扫二维码还是一维码，默认二者都有
            success: function (res) {
                var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
                var arr = result.toString().split(",");
                try {
                    scanQRCodeSucceed(arr[1]);
                } catch (e) {
                }
            }
        });
    }
}

/**
 *获取应用本地配置
 */
function setStorage(key, value) {
    if (typeof window.localStorage == 'undefined') {
        return false;
    }
    try {
        localStorage.setItem(key, JSON.stringify(value));
        return true;
    } catch (e) {
        console.log('异常:' + e.message);
        return false;
    }
}

/**
 * 设置应用本地配置
 */
function getStorage(key) {
    if (typeof window.localStorage == 'undefined') {
        return false;
    }
    try {
        if (localStorage.getItem(key) == null) {
            return false;
        }
        return JSON.parse(localStorage.getItem(key));
    } catch (e) {
        console.log('异常:' + e.message);
        return false;
    }
}

function getImage(img) {
    var image = new Image();
    image.crossOrigin = '';
    image.src = img;
    image.onload = function () {
        var base64 = getBase64Image(image);
        return base64;
    }
    return img;
}

function getBase64Image(img) {
    var canvas = document.createElement("canvas");
    canvas.width = img.width;
    canvas.height = img.height;

    var ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0, img.width, img.height);
    var ext = img.src.substring(img.src.lastIndexOf(".") + 1).toLowerCase();
    var dataURL = canvas.toDataURL("image/" + ext);
    return dataURL;
}

function TraversalObject(obj) {
    var image = new Image();
    for (var a in obj) {
        if (typeof (obj[a]) == "object") {
            TraversalObject(obj[a]); //递归遍历
        } else {
            if (a == 'pic') {
                image.crossOrigin = '';
                image.src = img;
                image.onload = function () {
                    var base64 = getBase64Image(image);
                    obj[a] = base64;
                }
            }
        }
    }
    return obj;
}

/**
 *加法函数，用来得到精确的加法结果
 *返回值：arg1加上arg2的精确结果
 */
function mathAdd(arg1, arg2) {
    var r1, r2, m;
    try {
        r1 = arg1.toString().split(".")[1].length
    } catch (e) {
        r1 = 0
    }
    try {
        r2 = arg2.toString().split(".")[1].length
    } catch (e) {
        r2 = 0
    }
    m = Math.pow(10, Math.max(r1, r2));
    return (arg1 * m + arg2 * m) / m;
}

/**
 *减法函数
 *返回值：arg2减arg1的精确结果
 */
function mathSub(arg2, arg1) {
    var r1, r2, m, n;
    try {
        r1 = arg1.toString().split(".")[1].length
    } catch (e) {
        r1 = 0
    }
    try {
        r2 = arg2.toString().split(".")[1].length
    } catch (e) {
        r2 = 0
    }
    m = Math.pow(10, Math.max(r1, r2));
    //last modify by deeka
    //动态控制精度长度
    n = (r1 >= r2) ? r1 : r2;
    return ((arg2 * m - arg1 * m) / m).toFixed(n);
}

/**
 *乘法函数，用来得到精确的乘法结果
 *返回值：arg1乘以arg2的精确结果
 */
function mathMul(arg1, arg2) {
    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
    try {
        m += s1.split(".")[1].length
    } catch (e) {
    }
    try {
        m += s2.split(".")[1].length
    } catch (e) {
    }
    return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
}

/**
 *除法函数，用来得到精确的除法结果
 *返回值：arg1除以arg2的精确结果
 */
function mathDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2;
    try {
        t1 = arg1.toString().split(".")[1].length
    } catch (e) {
    }
    try {
        t2 = arg2.toString().split(".")[1].length
    } catch (e) {
    }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""));
        r2 = Number(arg2.toString().replace(".", ""));
        return (r1 / r2) * pow(10, t2 - t1);
    }
}

/**
 * 实现事件页面的连接
 */
function event_link(url) {
    location.href = url;
}
/**
 * 延迟执行
 */
function lateCall(t, func) {
    var _self = this;
    this.handle = null;
    this.func = func;
    this.t = t;

    this.execute = function () {
        _self.func();
        _self.stop();
    }

    this.stop = function () {
        clearInterval(_self.handle);
    }

    this.start = function () {
        _self.handle = setInterval(_self.execute, _self.t);
    }
}

/**
 * 页面重定向
 */
function redirect(url) {
    if (url == '' || typeof(url) == 'undefined') {
        url = '/web/wechat/mall-home.html';
    }
    var param = arguments[1] ? arguments[1] : '';
    if(param!=''){
        param.pub_acct=I('pub_acct','0');
        param.channel_identifier=I('channel_identifier','0');
    }
    var target = '_def'; //新加target参数,用于在跳转时的跳转方式,默认'_def'打开新的WebView.'_self'表示直接跳转,目前仅用于首页.  -2016/4/14. -Taoist
    if (I('share') == 1) {
        param.share = 1;
    }
   //神马假日--分享后底部是否出现下载App悬浮栏
    try{
        if(share_ornot==1){
            param.share_ornot = 1;
        }
    }catch(e){
    }
    //app环境链接自动添加userid
    if (is_smdd()) {
        if (param == '') {
            param = M();
        }
        param.userid = getUserid();
    }
    if (param != '') {
        if (url.indexOf('?') > -1) {
            url = url + '&' + urlEncode(param).substr(1);
        } else {
            url = url + '?' + urlEncode(param).substr(1);
        }
        if (typeof(param.target) != 'undefined' && param.target != '' && param.target != null) {
            target = param.target;
        }
    }
    if (is_smdd() && target == '_def') {
        var DeviceType = getDeviceType();  //获取访问终端类型
        var host = '';
        if (url.indexOf('http://') > -1) {
            url = '/' + url;
        } else {
            host = SERVER_URL;
        }
        try {
            JavaScriptInterface.openWebView('{"url":"' + host + url.substr(1) + '"}');
        } catch (e) {
            //alert('异常:' + e.message);
        }
    } else {
        //处理iframe中跳转。
        if (param.goParent != '' && typeof(param.goParent) != "undefined") {
            parent.location.href = url;
        } else {
            location.href = url;
        }
    }
}

/**
 * JS对象转URL参数
 */
function urlEncode(param, key, encode) {
    if (param == null) return '';
    var paramStr = '';
    var t = typeof (param);
    if (t == 'string' || t == 'number' || t == 'boolean') {
        paramStr += '&' + key + '=' + ((encode == null || encode) ? encodeURIComponent(param) : param);
    } else {
        for (var i in param) {
            var k = key == null ? i : key + (param instanceof Array ? '[' + i + ']' : '.' + i);
            paramStr += urlEncode(param[i], k, encode);
        }
    }
    return paramStr;
};

function TitleReSet(title) {
    // body...
    //如果是IOS端微信,无法直接修改title.需要下面这一段神代码...
    //没看懂为什么添加一个iframe,然后remove掉就能动态修改title.
    document.title = title;
    var $body = $('body');
    var $iframe = $('<iframe src="/favicon.ico" style="display:none;"></iframe>');
    $iframe.on('load', function (argument) {
        //console.log("loading....");
        setTimeout(function () {
            //console.log("remove....");
            $iframe.off('load').remove();
        }, 0);
    }).appendTo($body);
}

function changeBg(color1, color2, obj) {
    obj.css('background-color', color1);
    setTimeout(function () {
        obj.css('background-color', color2);
    }, 200);
}


/**
 * JS转码去除Html标签
 */
function clearHtml(text) {
    var div=document.createElement('div');div.innerHTML=text;
    var content=div.innerText || div.textContent;
    content = content.replace(/<\/{0,}[a-z](.+?)>/gi,"");
    return content;
}

/**
 * by 何变
 * [gotoCheckOutPay 跳转到收银台进行支付]
 * @param  {[object]} param    [收银台页面及跳转所有参数]
 * @param  {[object]} data     [接口返回的订单号等信息]
 */
function gotoCheckOutPay(param,data){
    var order = arguments[2] ? arguments[2] : null;
    if (is_smdd()) {//APP端支付
        if(!order){
            if (data.data.orderid == 0) {
                data.data.orderid = data.data.merge_no;  //合并订单号赋值给订单id
            }
            if (data.data.merge_no == '') {
                data.data.merge_no = 0;
            }
            event_link(API.SERVER_URL + 'sdp/' + API.API_LIST.ORDER_ORDERPAY + '?userid=' + getUserid() + '&order_type=' + data.data.order_type + '&orderid=' + data.data.orderid + '&merge_no=' + data.data.merge_no);
        }else{
            if (order.orderid == 0) {
                order.orderid = order.merge_no;  //合并订单号赋值给订单id
            }
            if (order.merge_no == '') {
                order.merge_no = 0;
            }
            event_link(API.SERVER_URL + 'sdp/' + API.API_LIST.ORDER_ORDERPAY + '?userid=' + getUserid() + '&order_type=' + order.order_type + '&orderid=' + order.orderid + '&merge_no=' + order.merge_no);
        }
    }else{
        //微信端支付 第三方平台
        InterfaceTap('gotoCashier',param);
    }
}

var login_dlg_load=false;//是否已加载登录框
function loginDialog(){
    var event=arguments[0]?arguments[0]:false;
    if(event){
        event.stopPropagation();
        event.preventDefault();
    }
    var page=location.href.split('#')[0];
    if(page.indexOf('/web/ddshop/')>0){
        //嘀嘀店通商家端
        redirect('/web/ddshop/login.html');
        return false;
    }
    var html='';
    var head='';
    if(!login_dlg_load){
        inputTipsText('加载中...',-1);
        html='<div id="login__dialog"class="dialog"><div class="dialog__overlay"></div><div class="dialog__content"><div class="login-mx"><div class="x"><img src="/web/assets/image/login/x@2x.png"></div><div class="logo-login"><img src="/web/assets/image/login/smdd.png"></div><div class="title-x flex-y"><div class="active"><em>注册</em></div><div><em>登录</em></div></div><div class="msg">为了更及时为您发送订单信息,请您绑定手机号码</div><div class="reg"><span class="verfify">验证</span><span class="no-sms">没收到？</span><div class="flex-y"><input id="reg-imgcode"type="tel"value=""maxlength="4"placeholder="请输入图片验证码"/><div class="flex-c">&nbsp;</div><img id="imgcode"onclick="fleshVerify()"src="/web/assets/image/login/smdd.png"/></div><input id="reg-mobile"type="tel"value=""maxlength="11"placeholder="请输入手机号"/><input id="reg-code"type="tel"value=""placeholder="请输入验证码"/><input id="reg-pwd"type="password"value=""maxlength="16"placeholder="请输入密码,密码最少6个字符"/><input id="reg-repwd"type="password"value=""maxlength="16"placeholder="确认密码"/></div><div class="login"><input id="log-mobile"type="tel"value=""maxlength="11"placeholder="手机号"/><input id="log-pwd"type="password"value=""maxlength="16"placeholder="请输入密码"/><div class="ext"><div class="sv flex-y"><input id="save"type="checkbox"value=""checked/><label for="save">一个月内免登录</label><div class="flex-c">&nbsp;</div><div class="forget">忘记密码?</div></div></div></div><div class="sub">注册</div></div></div></div>';
        head+='<link rel="stylesheet" type="text/css" href="/web/user/css/dialog.css?v=1.0.0">';
        head+='<script src="/web/user/js/dialogFx.js?v=1.0.0"></script>';
        head+='<script src="/web/user/js/login.js?v=1.0.6"></script>';
        $(head).appendTo($('head'));
        $('<link rel="stylesheet" type="text/css" href="/web/user/css/login.css?v=1.0.3">').prependTo($('head'));
    }
    setTimeout(function(){
        if(login_dlg==null){
            $(html).appendTo($('body'));
            this.login_itv=0;
            this.processLogin=function(){
                try{
                    inputTipsText('加载完毕.',300);
                    if($('#reg-repwd').is(':hidden')){
                        $('#reg-repwd').prev().css('border','none');
                    }else{
                        $('#reg-repwd').prev().css('border-bottom','1px solid #eee');
                    }
                    $('#imgcode').attr('src',API.SERVER_URL+'gold/public/verify');
                    login_dlg = new DialogFx( document.getElementById('login__dialog') ,
                    {
                        onOpenDialog:function(){
                            $('#reg-imgcode').focus();
                        }
                    });
                    login_dlg_load=true;
                    login_dlg.toggle();
                    eventBind();
                    //$('.inputTipsText').addClass('hide');
                    console.log('login dialog prepared ready.');
                }catch(e){
                    clearTimeout(this.login_itv);
                    this.login_itv=setTimeout(function(){
                        this.processLogin();
                    },10);
                }
            }
            this.processLogin();
        }else{
            login_dlg.toggle();
            $('.inputTipsText').addClass('hide');
        }
    },200);
}
