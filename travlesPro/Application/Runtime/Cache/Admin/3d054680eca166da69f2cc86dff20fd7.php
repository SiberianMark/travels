<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>编辑线路-推荐活动</title>
    

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
    <script type="text/javascript" charset="utf-8" src="/Public/lib/ueditor/1.4.3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Public/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="/Public/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
    <style>
        .bar {
            width: 65em;
            height: 3em;
            border-bottom: 1px solid #0053AA;
        }
        .bar .bar_list{
            float: left;
            border: 1px solid #0053AA;
            border-top-left-radius: 0.25em;
            border-top-right-radius: 0.25em;
            border-bottom: 0 solid #0053AA;
            margin-right: 0.25em;
            line-height:3em;
            cursor: pointer;
        }
        .bar .bar_list .bar_link{
            display: inline-block;
            padding-left: 1em;
            padding-right: 1em;
            font-size: 1em;
            color: #0053AA;
            text-decoration:none;
        }
        .bar .bar_list .bar_link:hover{
            font-weight: 700;
        }
        .current{
            font-weight: 700;
            background-color: #d1d3d5;
        }
        .Huifold .item h4 {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 线路管理 <span class="c-gray en">&gt;</span> 编辑线路 </nav>
<div class="mt-20 ml-40" >
    <ul class="bar ml-20">
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/base_info/id/<?php echo ($lineid); ?>">基本信息</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/line_image/id/<?php echo ($lineid); ?>">轮播图</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/line_journey/id/<?php echo ($lineid); ?>">行程介绍</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/money_include/id/<?php echo ($lineid); ?>">费用包含</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/not_include/id/<?php echo ($lineid); ?>">费用不含</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/notice/id/<?php echo ($lineid); ?>">预订须知</a></li>
        <li class="bar_list current"><a class="bar_link" href="/Admin/Line/reference/id/<?php echo ($lineid); ?>">推荐活动</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/time_price/id/<?php echo ($lineid); ?>">团期价格</a></li>
    </ul>
    <div class="mt-20 mb-40 ml-20">
        <span class="ml-20" style="font-size: 16px">线路编号：<?php echo ($lineid); ?></span>
        <form action="/Admin/Line/reference?ac=edit" method="post">
            <input type="hidden" name="id" value="<?php echo ($lineid); ?>"/>
            <table class="table table-border table-bordered table-hover" style="width: 56em">
                <tr>
                    <th class="text-r">推荐活动：</th>
                    <td>
                        <script type="text/plain" id="editor_id" name="reference" style="width:50em;height:21.875em;">
                            <?php echo ($reference); ?>
                        </script>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-c">
                        <input class="btn btn-success radius" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;&nbsp;">
                    </td>
                </tr>
            </table>
            </form>
    </div>
</div>

<script>
    //图文编辑(实例化编辑器)
    var ue = UE.getEditor('editor_id');
</script>

</body>
</html>