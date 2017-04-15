<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>马途旅游_旅游网_海岛旅游_出境旅游_国内旅游_周边旅游</title>
<link type="text/css" rel="stylesheet" href="/Public/css/home/global.css" media="all"/>
<link type="text/css" rel="stylesheet" href="/Public/css/home/index.css" media="all"/>
<script type="text/javascript" src="/Public/js/jquery-1.8.2.min.js"></script>
</head>
<body>
<!-- 头部板块header开始 -->
<div class="header">
	<div class="header_top">
		<div class="area clear">
			<div class="header_top_left">
			<h1>踏燕飞马，马途旅游！ 旅游网站首选品牌</h1>
			</div>
			<ul class="top_nav">
				<li><a>我的马途</a></li>
				<li><a>客户服务</a></li>
				<li><a>微信</a></li>
			</ul>
		</div>
	</div>
	<div class="header_middle">
		<div class="area clear header_middle_mid">
			<div class="logo">
				<h1><a href="#" title="踏燕飞马，马途旅游" alt="踏燕飞马，马途旅游"><img src="/Public/image/logo.png" title="踏燕飞马，马途旅游" alt="踏燕飞马，马途旅游"/></a></h1>
			</div>
			<div class="search">
				<form>
					<p class="search_input">
						<input type="text" id="key_words" value="阳朔" style="color: rgb(153, 153, 153);"/>
					</p>
					<p class="search_button">
						<button type="button" id="searchSub" onclick="search_sub();"></button>
					</p>
				</form>
			</div>
			<a class="search_advance">高级搜索
			<span class="header_icon icon_arrow"></span>
			</a>
			<div class="right-tel">
			<b class="ico"></b>
			<p>24H服务热线</p>
			<h1>0755-82222695</h1>
			</div>
		</div>
	</div>
	<div class="header_nav">
		<div class="area clear">
			<div class="nav_main_classify">
				<a class="classify_link" href="javascript:void(0)" title="马途旅游登录" alt="马途旅游登录"><i class="icon_head hdico_classify"></i>全部旅游产品分类</a>
				<ul class="classify_list">
					<li>
						<div class="list_link">
							<i class="icon_menu im_cj"></i>
							<a  href="#" target="_blank">出境游</a>
							<div class="vice_link">
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">珠海</a>
							</div>
						</div>
						<div class="sublist">
							<dl class="sub_classify">
								<dt><h1>热门城市</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">泰国</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韩国</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">日本</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								</dd>
								<dt><h1>热门景点</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">出境1</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">出境2</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">出境3</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">世界之窗</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">巽寮湾</a>
								</dd>
								<dt><h1>热门主题</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">海边</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">漂流</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">温泉</a>
								</dd>
							</dl>
						</div>
					</li>
					<li>
						<div class="list_link">
							<i class="icon_menu im_ga"></i>
							<a style="color:#333;" href="#" target="_blank">港澳游</a>
							<div class="vice_link">
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">珠海</a>
							</div>
						</div>
						<div class="sublist">
							<dl>
								<dt><h1>热门城市</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">香港</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">澳门</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">港澳</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								</dd>
								<dt><h1>热门景点</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">海洋世界</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">星光大道</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">蜡像馆</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">太平山</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">迪斯尼</a>
								</dd>
								<dt><h1>热门主题</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">海边</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">漂流</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">温泉</a>
								</dd>
							</dl>
						</div>
					</li>
					<li>
						<div class="list_link">
							<i class="icon_menu im_hd"></i>
							<a style="color:#333;" href="#" target="_blank">海岛游</a>
							<div class="vice_link">
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">珠海</a>
							</div>
						</div>
						<div class="sublist">
							<dl class="sub_classify">
								<dt><h1>热门城市</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">清远</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">惠州</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">江门</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								</dd>
								<dt><h1>热门景点</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">东部华侨城</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">丹霞山</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">长隆水上乐园</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">世界之窗</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">巽寮湾</a>
								</dd>
								<dt><h1>热门主题</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">海边</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">漂流</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">温泉</a>
								</dd>
							</dl>
						</div>
					</li>
					<li>
						<div class="list_link">
							<i class="icon_menu im_gn"></i>
							<a style="color:#333;" href="#" target="_blank">国内游</a>							
							<div class="vice_link">
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">珠海</a>
							</div>
						</div>
						<div class="sublist">
							<dl class="sub_classify">
								<dt><h1>热门城市</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">清远</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">惠州</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">江门</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								</dd>
								<dt><h1>热门景点</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">东部华侨城</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">丹霞山</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">长隆水上乐园</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">世界之窗</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">巽寮湾</a>
								</dd>
								<dt><h1>热门主题</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">海边</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">漂流</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">温泉</a>
								</dd>
							</dl>
						</div>
					</li>
					<li>
						<div class="list_link">
							<i class="icon_menu im_zb"></i>
							<a style="color:#333;" href="#" target="_blank">周边游</a>
							<div class="vice_link">
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">珠海</a>
							</div>
						</div>
						<div class="sublist">
							<dl class="sub_classify">
								<dt><h1>热门城市</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">清远</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">惠州</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">江门</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								</dd>
								<dt><h1>热门景点</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">东部华侨城</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">丹霞山</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">长隆水上乐园</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">世界之窗</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">巽寮湾</a>
								</dd>
								<dt><h1>热门主题</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">海边</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">漂流</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">温泉</a>
								</dd>
							</dl>
						</div>
					</li>
					<li>
						<div class="list_link">
							<i class="icon_menu im_yl"></i>
							<a style="color:#333;" href="#" target="_blank">游轮</a>
							<div class="vice_link">
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">韶关</a>
								<a id="index_nav_def" href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">珠海</a>
							</div>
						</div>
						<div class="sublist">
							<dl class="sub_classify">
								<dt><h1>热门城市</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">游轮1</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">惠州</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">江门</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">游轮3</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">深圳</a>
								</dd>
								<dt><h1>热门景点</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">游轮3</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">游轮4</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">长隆水上乐园</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">世界之窗</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">巽寮湾</a>
								</dd>
								<dt><h1>热门主题</h1></dt>
								<dd>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">海边</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">漂流</a>
									<a href="#" title="马途旅游登录" alt="马途旅游登录" target="_blank">温泉</a>
								</dd>
							</dl>
						</div>
					</li>
				</ul>
			</div>
			<ul class="nav_list">
				<li><a href="#" class="nav_link" title="马途旅游登录" alt="马途旅游登录" target="_self">首页</a><li>
				<li><a href="#" class="nav_link" title="马途旅游登录" alt="马途旅游登录" target="_self">出境游</a><li>
				<li><a href="#" class="nav_link" title="马途旅游登录" alt="马途旅游登录" target="_self">高端海岛</a><li>
				<li><a href="#" class="nav_link" title="马途旅游登录" alt="马途旅游登录" target="_self">国内游</a><li>
				<li><a href="#" class="nav_link" title="马途旅游登录" alt="马途旅游登录" target="_self">周边游</a><li>
				<li><a href="#" class="nav_link" title="马途旅游登录" alt="马途旅游登录" target="_self">自驾游</a><li>
				<li><a href="#" class="nav_link" title="马途旅游登录" alt="马途旅游登录" target="_self">游记攻略</a><li>
			</ul>
			<div class="login_menu">
				<a href="#" title="马途旅游登录" alt="马途旅游登录">登录</a><span style="margin:4px">|</span><a href="#" title="马途旅游注册" alt="马途旅游注册">注册</a>
			</div>
		</div>
	</div>
</div>
<!-- 头部板块header结束 -->
<!-- 焦点图 start -->
<div id="scrollPics">
	<ul class="slider">
		<li class='gallery_item'><a href="#" title="踏燕飞马，马途旅游" target="_blank" alt="踏燕飞马，马途旅游"><img src="/Public/lunbo/11.jpg" title="踏燕飞马，马途旅游" alt="踏燕飞马，马途旅游"/></a></li>
		<li class='gallery_item'><a href="#" title="踏燕飞马，马途旅游" target="_blank" alt="踏燕飞马，马途旅游"><img src="/Public/lunbo/22.jpg" title="踏燕飞马，马途旅游" alt="踏燕飞马，马途旅游"/></a></li>
		<li class='gallery_item'><a href="#" title="踏燕飞马，马途旅游" target="_blank" alt="踏燕飞马，马途旅游"><img src="/Public/lunbo/33.jpg" title="踏燕飞马，马途旅游" alt="踏燕飞马，马途旅游"/></a></li>
		<li class='gallery_item'><a href="#" title="踏燕飞马，马途旅游" target="_blank" alt="踏燕飞马，马途旅游"><img src="/Public/lunbo/44.jpg" title="踏燕飞马，马途旅游" alt="踏燕飞马，马途旅游"/></a></li>
		<li class='gallery_item'><a href="#" title="踏燕飞马，马途旅游" target="_blank" alt="踏燕飞马，马途旅游"><img src="/Public/lunbo/55.jpg" title="踏燕飞马，马途旅游" alt="踏燕飞马，马途旅游"/></a></li>
	</ul>
	<ul class="num">
		<li class="on">1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>5</li>	
	</ul>
</div>
<!-- 焦点图 end -->

<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>
<hr/>




<script type="text/javascript">

//左侧导航鼠标滑过显示隐藏菜单
$(function(){
    $('.sublist').hide();
    $('.classify_list>li').hover(
            function(){
            	$(this).children('.sublist').show();
            },
            function(){
            	$(this).children('.sublist').hide();
            }
    );
})

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
        var adWidth = $("#scrollPics>ul>li:first").width()+480;
       
        $(".slider").stop(true, false).animate({
            "marginTop": -adHeight * index + "px"   //改变 marginTop 属性的值达到轮播的效果
        }, 1000);
        $(".num li").removeClass("on")
            .eq(index).addClass("on");
    }


</script>
</body>
</html>