// JavaScript Document

//焦点图轮播
    var len = $(".num > li").length;
    var index = 0;  //图片序号
    var adTimer;
    $(".num li").mouseover(function() {
        index = $(".num li").index(this);  //获取鼠标悬浮 li 的index
        showImg(index);
    }).eq(0).mouseover();
    //滑入停止动画，滑出开始动画.
    $('#scrollPics').hover(function() {
        clearInterval(adTimer);
    }, function() {
        adTimer = setInterval(function() {
            showImg(index);
            index++;
            if (index == len) {       //最后一张图片之后，转到第一张
                index = 0;
            }
        }, 3000);
    }).trigger("mouseleave");
    function showImg(index) {
        var adHeight = $("#scrollPics>ul>li:first").height();
        $(".slider").stop(true, false).animate({
            "marginTop": -adHeight * index + "px"    //改变 marginTop 属性的值达到轮播的效果
        }, 1000);
        $(".num li").removeClass("on")
            .eq(index).addClass("on");
    } 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//==== 华为爱旅网焦点图轮播代码======================//
    HWTrip.Flexslider.ready(function(){
    	$(".flexslider").flexslider({
    		directionNav:false,pauseOnAction:false,pauseOnHover:true,animationSpeed:300,start:function(){
    			$(".slides li").each(function(b,a){
    				var c=$(this).find("img").attr("alt");
    				$(".flex-control-nav li").eq(b).find("a").text(c)
    	});
    
    	$(".flex-control-nav li").hover(function(){
    		$(this).parent().parent().flexslider($(this).index())})}});
    	
    	$(".activity-list").find("li").mouseover(function(){
    		$(this).addClass("cur").siblings("li").removeClass("cur");
    		$(this).find("img").stop().animate({top:"-101px"},200);
    		$(this).siblings("li").find("img").stop().animate({top:0},200)})});
    HWTrip=HWTrip||{};
    HWTrip.Index=(function(){
    	function b(){
    		$(".trip-cont").tabs({
    			tabs:"div>ul.trip-nav-list>li",
    			bodys:">div.trip-tabs>div",
    			event:"mouseover",
    			doneFun:function(f){
    				var d=f.data("mid"),c=f.data("moreurl");
    				if(d&&c){
    					$("#js-more-"+d).attr("href",c)}}})}
    	function a(){
    		b();
    		HWTrip.Widget.GoToTop.init();
    		HWTrip.Plugin.Feedback.init()
    		}
    	return{init:a}})();
    HWTrip.Memo=(function(){
    	var b=window.config.HWTRIP_HOST+"memo/index/getRandMemo";
    	var e=$("#memo_box");
    	var h=[];
    	var g=false;
    	var a=0;
    	function d(){
    		$.get(b,function(i){
    			if(i.result==="ok"&&i.count>=4){
    				e.show();
    				h=[];
    				a=0;
    				$.each(i.data,function(k,l){
    					var j=new Image();
    					$(j).bind("load",function(){
    						h.push(l);c()});
    					j.src=l.INDEX_URL})}},"json");
    		setTimeout("HWTrip.Memo.load()",30000)}function c(){
    			if(g||a>=4){
    				return
    				}
    			g=true;
    			var i=$('li[fix="'+a+'"]',e);
    			var k=h.pop();
    			var j=i.find("img.main-img");
    			i.addClass("loading");
    			j.fadeOut(500,function(){
    				j.attr("src",k.INDEX_URL).fadeIn(500,function(){
    					i.removeClass("loading");
    					i.find(".content").html(k.CONTENT);
    					i.find(".memo-detail span").html('<img src="'+k.HEADIMGURL+'" />'+k.NICKNAME);
    					a++;
    					g=false;c()})})}
    		function f(){
    			$("#memo_list_box").delegate(".effect","mouseover",function(){
    				$(this).children(".memo-shorten").hide();
    				$(this).children(".memo-detail").stop().animate({top:0},500)}).delegate(".effect","mouseout",function(){
    					$(this).children(".memo-shorten").show();
    					$(this).children(".memo-detail").stop().animate({top:266},500)}).delegate("a.effect","click",function(){
    						window.open(window.config.HWTRIP_HOST+"qingyouji.html");
    						return false
    						});
    			d()
    			}
    		return{init:f,load:d}})();
    $(document).ready(function(){
    	HWTrip.Index.init();
    	HWTrip.Memo.init()});
    
    