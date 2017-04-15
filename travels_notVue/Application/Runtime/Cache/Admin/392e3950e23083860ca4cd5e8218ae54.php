<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	

<script type="text/javascript" src="/Public/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Public/H-ui.admin_v2.5/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/Public/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/Public/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/Public/H-ui.admin_v2.5/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="/Public/BJs/common.js"></script>


<!--[if lt IE 9]>
<script type="text/javascript" src="/Public/H-ui.admin_v2.5/lib/html5.js"></script>
<script type="text/javascript" src="/Public/H-ui.admin_v2.5/lib/respond.min.js"></script>
<script type="text/javascript" src="/Public/H-ui.admin_v2.5/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/Public/H-ui.admin_v2.5/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/Public/H-ui.admin_v2.5/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/Public/H-ui.admin_v2.5/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/Public/H-ui.admin_v2.5/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="/Public/H-ui.admin_v2.5/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/Public/H-ui.admin_v2.5/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
	<title>网站信息</title>
	<style>
		.col-sm-3 {
			width: 18%;
		}
		.textarea-numberbar {
			 position: relative;
			 right: -10px;
			 bottom: 0;
			z-index: 1;
			margin-bottom: 0;
		}
	</style>
</head>
<body>

<form action="/Admin/Index/web_info?ac=add" method="post" style="margin-bottom: 2em;" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo ($list["id"]); ?>"/>
	<div class="page-container" style="margin-top: 1em;">
		<table class="table table-border table-bordered table-hover" style="width: 70em;">
			<thead>
			<tr>
				<th class="text-r">网站描述：</th>
				<td>
					<textarea name="web_title" cols="30" rows="5" class="textarea" placeholder="说点什么..." onKeyUp="textarealength(this,150)"><?php echo ($list["web_title"]); ?></textarea>
					<span class="textarea-numberbar"><em class="textarea-length">0</em>/150</span>
				</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th class="text-r">网站SEO关键词：</th>
				<td>
					<textarea name="web_keywords" cols="" rows="" class="textarea"  placeholder="说点什么..." onKeyUp="textarealength(this,150)"><?php echo ($list["web_keywords"]); ?></textarea>
					<p class="textarea-numberbar"><em class="textarea-length">0</em>/150</p>
				</td>
			</tr>
			<tr>
				<th class="text-r">PC端LOGO图：</th>
				<td>
					<input type="file" name="pc_logo" id='fileToUpload' style="display: block; float: left;margin-top: 15px;margin-left: 15px;" onchange="previewImage(this)" />
					<div id="image"><img src="<?php echo ($list["pc_logo"]); ?>" id="img" style="width: 150px;height:50px;float: left;" alt="无图"></div>&nbsp;&nbsp;
					<span style="color: #fe0000;font-size: 12px;display: block; float: left;margin-top: 15px;">建议上传图片尺寸为300*100</span>
				</td>
			</tr>
			<tr>
				<th class="text-r">移动端LOGO图：</th>
				<td>
					<input type="file" name="mobile_logo" id='fileToUpload1' style="display: block; float: left;margin-top: 15px;margin-left: 15px;" onchange="previewImage1(this)" />
					<div id="image1"><img src="<?php echo ($list["mobile_logo"]); ?>" id="img1" style="width: 150px;height:50px;float: left;" alt="无图"></div>&nbsp;&nbsp;
					<span style="color: #fe0000;font-size: 12px;display: block; float: left;margin-top: 15px;">建议上传图片尺寸为300*100</span>
				</td>
			</tr>
			<tr>
				<th class="text-r">网站主色调：</th>
				<td><input type="text" class="input-text" name="main_color" value="<?php echo ($list["main_color"]); ?>" placeholder="#加六位数字或者字母。如#ff00ff"></td>
			</tr>
			<tr>
				<th class="text-r">公司名字：</th>
				<td><input type="text" class="input-text" name="company_name" value="<?php echo ($list["company_name"]); ?>"></td>
			</tr>
			<tr>
				<th class="text-r">公司地址：</th>
				<td><input type="text" class="input-text" name="company_addr" value="<?php echo ($list["company_addr"]); ?>"></td>
			</tr>
			<tr>
				<th class="text-r">网站备案号：</th>
				<td><input type="text" class="input-text" name="web_id" value="<?php echo ($list["web_id"]); ?>"></td>
			</tr>
			<tr>
				<th class="text-r">网站联系电话：</th>
				<td><input type="text" class="input-text" name="web_tel" value="<?php echo ($list["web_tel"]); ?>"></td>
			</tr>
			<tr class="text-c">
				<td colspan="2">
					<button style="width: 5em;height: 2.5em" type="submit" class="btn btn-success radius">保存</button>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</form>





</body>
</html>
<script type="text/javascript">

	//本地预览
	function previewImage(file)
	{
		var MAXWIDTH  = 300;
		var MAXHEIGHT = 100;
		var div = document.getElementById('image');
		if (file.files && file.files[0])
		{
			var img = document.getElementById('img');
			img.onload = function(){
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
				img.width = rect.width;
				img.height = rect.height;
				img.style.marginLeft = rect.left+'px';
				img.style.marginTop = rect.top+'px';
			}
			var reader = new FileReader();
			reader.onload = function(evt){img.src = evt.target.result;}
			reader.readAsDataURL(file.files[0]);
		}
		else
		{
			var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
			file.select();
			var src = document.selection.createRange().text;
			div.innerHTML = '<img id=img>';
			var img = document.getElementById('img');
			img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
			status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
			div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;margin-left:"+rect.left+"px;"+sFilter+src+"\"'></div>";
		}
	}

	//本地预览1
	function previewImage1(file)
	{
		var MAXWIDTH  = 300;
		var MAXHEIGHT = 100;
		var div = document.getElementById('image1');
		if (file.files && file.files[0])
		{
			var img = document.getElementById('img1');
			img.onload = function(){
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
				img.width = rect.width;
				img.height = rect.height;
				img.style.marginLeft = rect.left+'px';
				img.style.marginTop = rect.top+'px';
			}
			var reader = new FileReader();
			reader.onload = function(evt){img.src = evt.target.result;}
			reader.readAsDataURL(file.files[0]);
		}
		else
		{
			var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
			file.select();
			var src = document.selection.createRange().text;
			div.innerHTML = '<img id=img1>';
			var img = document.getElementById('img1');
			img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
			status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
			div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;margin-left:"+rect.left+"px;"+sFilter+src+"\"'></div>";
		}
	}

	function clacImgZoomParam( maxWidth, maxHeight, width, height ){
		var param = {top:0, left:0, width:width, height:height};
		param.width = 100;
		param.height = 100;
		return param;
	}
</script>

















</body>
</html>