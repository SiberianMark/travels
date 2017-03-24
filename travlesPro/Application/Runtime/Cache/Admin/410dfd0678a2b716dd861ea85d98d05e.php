<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看广告</title>
    

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
    <!--图片放大缩小jquery-->
    <script type="text/javascript" src="/Public/BJs/content_zoom.js"></script>
</head>
<body>


<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 系统设置<span class="c-gray en">&gt;</span>广告管理<span class="c-gray en">&gt;</span>查看广告<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>


<?php $parentid?>
<div class="page-container">
    <div class="mt-20" style="margin-top: 3px">
        <div class="pd-10">
            <span style="font-size: 1em">广告位置：</span><span style="color: lightcoral"><?php echo ($adtype["name"]); ?></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="btn btn-success radius ml-10" href="/Admin/Ad/adadd?tid=<?php echo ($adtype["id"]); ?>">新增广告</a>&nbsp;
            <a class="btn btn-success radius ml-10" href="/Admin/Ad/adtype/">返回上一页</a>
        </div>
<table class="table table-border table-bordered table-hover table-bg" >
    <thead>
    <tr>
        <th style="text-align: center">广告ID</th>
        <th style="text-align: center">广告名称</th>
        <th style="text-align: center">广告图片</th>
        <th style="text-align: center">跳转位置</th>
        <th style="text-align: center">广告描述</th>
        <th style="text-align: center">排序</th>
        <th style="text-align: center">状态</th>
        <th style="text-align: center">点击次数</th>
        <th style="text-align: center">操作</th>
    </tr>
    </thead>
    <?php if($lists): if(is_array($lists)): $k = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><tr class="list">
                <td style="text-align: center;"><?php echo ($vo["id"]); ?></td>
                <td style="text-align: center;"><?php echo ($vo["name"]); ?></td>
                <td style="text-align: center;">
                    <span href="#zoom-<?php echo ($k); ?>" style="cursor:pointer">
                        <img src='<?php echo ($vo["image"]); ?>' height="50" width="50" />
                    </span>
                    <div id="zoom-<?php echo ($k); ?>" style="display:none;">
                        <img src="<?php echo $vo['image'];?>" />
                    </div>
                </td>
                <td style="text-align: center;"><?php echo ($vo["url"]); ?></td>
                <td style="text-align: center;"><?php if(!empty($vo["detail"])): echo ($vo["detail"]); else: ?>-<?php endif; ?></td>
                <td style="text-align: center;"><?php echo ($vo["sort"]); ?></td>
                <td style="text-align: center;"><?php if(($vo["status"]) == "1"): ?>启用<?php else: ?>停用<?php endif; ?></td>
                <td style="text-align: center;"><?php echo ($vo["hits"]); ?></td>
                <td style="text-align: center;"><?php if(($vo["status"]) == "1"): ?><a href="javascript:;" onclick="changeStatus('<?php echo ($vo["id"]); ?>', 0)" style="color:red">停用</a>
                    <?php else: ?>
                    <a href="javascript:;" onclick="changeStatus('<?php echo ($vo["id"]); ?>', 1)" style="color:orange">启用</a> |
                    <a href="/Admin/Ad/adedit?id=<?php echo ($vo["id"]); ?>&tid=<?php echo ($adtype["id"]); ?>">编辑</a> |
                    <a href="#" onclick="del('<?php echo ($vo["id"]); ?>')" style="color:red">删除</a><?php endif; ?>
                </td>
            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
        <?php else: ?>
        <tr >
            <td colspan="11">
                <div style="text-align:center"><span>抱歉，没有找到相关数据。</span></div>
            </td>
        </tr><?php endif; ?>

</table>
        </div>
</div>
</body>
</html>
<script>

    $(document).ready(function(){
        //图片放大镜效果
        $('span').fancyZoom({scaleImg: true, closeOnClick: true});
    })

    /*启用-停用*/
    function changeStatus(id,status){
        var title='';
        switch(status){
            case 0: title='确认要停用吗?';break;
            case 1: title='确认要启用吗?';break;
        }
        layer.confirm(
                title,
                {btn: ['确定','取消']},
                function(index){
                    var url = "/Admin/Ad/changeStatus1";
                    $.get(url, {id:id, status:status}, function(data){
                        if(data) {
                            layer.msg('修改成功', {icon: 6,time:6000});
                            location.reload();
                        } else {
                            layer.msg('修改失败', {icon: 5,time:4000});
                        }
                    })
                });
    }

    /*删除广告*/
    function del(id){
        layer.confirm(
                '确认要删除吗？',
                {btn: ['确定','取消']},
                function(index){
                    var url = "/Admin/Ad/delad";
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

</script>