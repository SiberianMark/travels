<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加广告</title>
    

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
</head>
<body>

<form action="/Admin/Ad/adadd?ac=add" method="post" style="margin-bottom: 2em;" enctype="multipart/form-data">
    <input type="hidden" name="tid" value="<?php echo ($tid); ?>"/>
    <div class="page-container" style="margin-top: 20px;">
        <table class="table table-border table-bordered table-hover" style="width: 1200px;">
            <thead>
            <tr>
                <th class="text-r">广告名称：</th>
                <td><input type="text" class="input-text" onkeyup="this.value=this.value.replace(/\s/,'');" name="name" placeholder="广告名称" required/></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="text-r">广告描述：</th>
                <td><input type="text" class="input-text" onkeyup="this.value=this.value.replace(/\s/,'');" name="detail" placeholder="广告描述" required/></td>
            </tr>
            <tr>
                <th class="text-r">广告图片：</th>
                <td>
                    <input type="file" name="image" id='fileToUpload' style="display: block; float: left;margin-top: 15px;margin-left: 15px;" onchange="previewImage(this)" />
                    <div id="image"><img src="" id="img" style="width: 150px;height:50px;float: left;" alt="无图"></div>&nbsp;&nbsp;
                    <span style="color: #fe0000;font-size: 12px;display: block; float: left;margin-top: 15px;">建议上传图片尺寸为300*100</span>
                </td>
            </tr>
            <tr>
                <th class="text-r">跳转位置：</th>
                <td><input type="text" class="input-text" id="num" name="url" required/></td>
            </tr>
            <tr>
                <th class="text-r">排序：</th>
                <td><input type="text" class="input-text" name="sort"/></td>
            </tr>
            <tr class="text-c">
                <td colspan="2">
                    <button style="width: 5em;height: 2.5em" type="submit" class="btn btn-success radius">确定</button>
                    <input style="width: 7em;height: 2.5em;margin-left: 2em" type="button" class="btn btn-primary radius" onclick="location.replace(document.referrer); return false;" value="取消并返回">
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
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        param.width = 100;
        param.height = 100;
        return param;
    }
</script>