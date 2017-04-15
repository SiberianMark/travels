<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>编辑线路</title>
    

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
    <link rel="stylesheet" type="text/css" href="/Application/Admin/View/Public/webuploader/0.1.5/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="/Application/Admin/View/Public/webuploader/0.1.5/style.css" />
    <!--图片放大缩小jquery-->
    <script type="text/javascript" src="/Public/BJs/content_zoom.js"></script>
    <style>
        body{
            font-family: "Microsoft Yahei","Hiragino Sans GB","Helvetica Neue",Helvetica,tahoma,arial,"WenQuanYi Micro Hei",Verdana,sans-serif,"\5B8B\4F53";

        }
        .placeholder {
            z-index: 0;
        }
        #wrapper {
            width: 52em;
        }
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
    </style>
</head>
<body>
<nav class="breadcrumb" style="font-size: 13px"><i class="Hui-iconfont">&#xe67f;</i> 线路管理 <span class="c-gray en">&gt;</span> 编辑线路 </nav>
<div class="mt-20 ml-40" >

        <ul class="bar ml-20">
            <li class="bar_list"><a class="bar_link" href="/Admin/Line/base_info/id/<?php echo ($lineid); ?>">基本信息</a></li>
            <li class="bar_list current"><a class="bar_link" href="/Admin/Line/line_image/id/<?php echo ($lineid); ?>">轮播图</a></li>
            <li class="bar_list"><a class="bar_link" href="/Admin/Line/line_journey/id/<?php echo ($lineid); ?>">行程介绍</a></li>
            <li class="bar_list"><a class="bar_link" href="/Admin/Line/money_include/id/<?php echo ($lineid); ?>">费用包含</a></li>
            <li class="bar_list"><a class="bar_link" href="/Admin/Line/not_include/id/<?php echo ($lineid); ?>">费用不含</a></li>
            <li class="bar_list"><a class="bar_link" href="/Admin/Line/notice/id/<?php echo ($lineid); ?>">预订须知</a></li>
            <li class="bar_list"><a class="bar_link" href="/Admin/Line/reference/id/<?php echo ($lineid); ?>">推荐活动</a></li>
            <li class="bar_list"><a class="bar_link" href="/Admin/Line/time_price/id/<?php echo ($lineid); ?>">团期价格</a></li>
        </ul>

        <div class="mt-20 mb-40">
            <span  class="ml-40">线路编号：<?php echo ($lineid); ?></span>
            <input type="hidden" name="id" id="lineid" value="<?php echo ($lineid); ?>"/>
            <div class="page-container" style="margin-top: 2px;padding-top: 2px">
                <?php if(is_array($image)): $k = 0; $__LIST__ = $image;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><div class="l mr-10">
                        <div class="album-img" style="width: 150px;">
                            <div class="maskWraper"  style="width: 150px;">
                                <span href="#zoom-<?php echo ($k); ?>" style="cursor:pointer">
                                    <img src="<?php echo ($vo["url"]); ?>" height="84px"/>
                                </span>
                                <div id="zoom-<?php echo ($k); ?>" style="display:none;">
                                    <img src="<?php echo $vo['url'];?>" />
                                </div>
                                <div class="maskBar text-c"><?php echo ($vo["id"]); ?></div>
                            </div>
                            <div class="btn-group text-c" style="padding-top:2px;">
                                <?php if($vo["is_cover"] == 1): ?><span class="btn btn-success size-S">封面图</span>
                                <?php else: ?>
                                    <span class="btn btn-default size-S" onclick="isCover(<?php echo ($lineid); ?>,<?php echo ($vo["id"]); ?>)">设为封面图</span><?php endif; ?>
                                <span class="btn btn-default size-S" onclick="delimage(<?php echo ($vo["id"]); ?>)">删除</span>
                            </div>
                        </div>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                <div style="clear: both;"></div>
            </div>

            <?php if(count($image) <= 6): ?><div id="wrapper">
                    <div id="container">
                        <!--头部，相册选择和格式选择-->
                        <div id="uploader">
                            <div class="queueList">
                                <div id="dndArea" class="placeholder">
                                    <div id="filePicker"></div>
                                    <p>或将照片拖到这里，单次最多可选5张</p>
                                    <p>建议图片像素为500*280</p>
                                </div>
                            </div>
                            <div class="statusBar" style="display:none;">
                                <div class="progress">
                                    <span class="text">0%</span>
                                    <span class="percentage"></span>
                                </div><div class="info"></div>
                                <div class="btns">
                                    <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><?php endif; ?>
        </div>
</div>


<!--<script type="text/javascript" src="/Public/lib/jquery/1.9.1/jquery.min.js"></script>-->
<script type="text/javascript" src="/Application/Admin/View/Public/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="/Application/Admin/View/Public/webuploader/0.1.5/upload.js"></script>

<script>
    $(document).ready(function(){
        //图片放大镜效果
        $('span').fancyZoom({scaleImg: true, closeOnClick: true});
    })


    /*删除图片*/
    function delimage(id){
        layer.confirm(
                '确认要删除吗？',
                {'title':'删除图片', btn: ['确定','取消']},
                function(index){
                    var url = "/Admin/Line/delImage";
                    $.get(url, {id:id}, function(data){
                        if(data.status ==1) {
                            layer.msg(data.info, {icon: 6,time:1000});
                            location.reload();
                        } else {
                            layer.msg(data.info, {icon: 5,time:1000});
                        }
                    })
                });
    }

    /*图片设为封面*/
    function isCover(lineid,id){
        layer.confirm(
                '确认要设为封面图片？',
                {'title':'设为封面图片', btn: ['确定','取消']},
                function(index){
                    var url = "/Admin/Line/isCover";
                    $.get(url, {lineid:lineid, id:id}, function(data){
                        if(data.status ==1) {
                            layer.msg(data.info, {icon: 6,time:1000});
                            location.reload();
                        } else {
                            layer.msg(data.info, {icon: 5,time:1000});
                        }
                    })
                });
    }


</script>

</body>
</html>