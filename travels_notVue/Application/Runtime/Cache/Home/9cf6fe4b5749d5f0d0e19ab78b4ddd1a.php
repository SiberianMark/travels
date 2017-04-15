<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>sdsdsdsdsd</title>
    

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
    <link rel="stylesheet" type="text/css" href="/Public/iconfont/iconfont.css" />

</head>
<body>




周
<i class="iconfont" style="color: #00ff00;weigh:900;font-size: 30px" >&#xe608;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe656;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe64b;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe60b;</i>
特
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe616;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe637;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe6fd;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe63e;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe6c3;</i>
国
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe60a;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe678;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe607;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe61a;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe647;</i>
出
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe60f;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe6d1;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe7c0;</i>

港
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe65d;</i>
<i class="iconfont" style="color: #00ff00;font-size: 30px" >&#xe62c;</i>


<table class="table table-border table-bordered table-bg table-hover" style="width:300px">
	<thead>
	<tr>
		<th>发给</th>
		<th>发给</th>
		<th>发给</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td>11</td>
		<td>11</td>
		<td>11</td>
	</tr>
	<tr>
		<td>11</td>
		<td>11</td>
		<td>11</td>
	</tr>
	<tr>
		<td>11</td>
		<td>11</td>
		<td>11</td>
	</tr>
	<tr>
		<td>11</td>
		<td>11</td>
		<td>11</td>
	</tr>
	</tbody>
</table>


<table class="table table-border table-bordered table-bg table-hover" style="width:300px">
    <tr>
        <th>输入：</th>
        <td style="width:200px;border: solid 1px #bbb"><div class="icon-input1" contenteditable="true"></div></td>
    </tr>
   
</table>
<br>
<div id="icon-div" style="display: none">
    <i class="iconfont" style="color: #65d778;font-size: 20px" >&#xe604;</i>
    <i class="iconfont" style="color: #65d778;font-size: 20px">&#xe642;</i>
</div>
<br>
<input type="text" id="input-value"/>
<br>
<button id="submit">提交</button>





<script type="text/javascript">
    $(".icon-input1").focus(function(){
        $("#icon-div").show();

    })
 /*   $(".icon-input").blur(function(){
        $("#icon-div").hide();
    })
*/
    $(".iconfont").click(function(){
     var a = $(this).text();
//        $(".icon-input1").append('<i class="iconfont" style="font-size: 20px">'+a+'</i>');
        $(".icon-input1").append('<img src="/Public/Upload/lunbo/5872fd607e2f7.jpg">');
        $("#icon-div").hide();
    })

    $("#submit").click(function(){
        var a = $(".icon-input1").html();
        alert(a);
        $("#input-value").val(a);
    })
    $('icon-input1').on('input',function(){
        var html=this.innerHTML;
        console.log(html);
//        this.innerHTML=html;
    })
</script>


</body>
</html>