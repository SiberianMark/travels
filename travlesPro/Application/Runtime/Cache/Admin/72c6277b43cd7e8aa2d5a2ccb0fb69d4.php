<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>广告位置列表</title>
    

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
    <script src="/Public/lib/layer/layer/layer.js"></script>

    <style>
        th{
            text-align: center;
        }
        .list td{
            text-align: center;
            /*padding:25px;*/
        }
        .mids p {
            display: block;
            width: 200px; /*对宽度的定义,根据情况修改*/
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;

        }
        .layui-layer-input {
            display: block;
            width: 220px;
            height: 30px;
            margin: 0 auto;
            line-height: 30px;
            padding: 0 5px;
            border: 1px solid #ccc;
            box-shadow: 1px 1px 5px rgba(0, 0, 0, .1) inset;
            color: #333
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 系统设置 <span class="c-gray en">&gt;</span> 广告管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="ad_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加广告位置</a></span> </div>
    <div class="mt-20" style="margin-top: 5px">
        <table class="table table-border table-bordered table-hover table-bg" >
            <thead>
            <tr>
                <th style="text-align: center">广告位置ID</th>
                <th style="text-align: center">广告位置名称</th>
                <th style="text-align: center">广告位置状态</th>
                <th style="text-align: center">操作</th>
            </tr>
            </thead>
            <?php if($mod_list): if(is_array($mod_list)): $k = 0; $__LIST__ = $mod_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><tr class="list">
                        <td><?php echo ($vo["id"]); ?></td>
                        <td><?php if(!empty($vo["name"])): echo ($vo["name"]); else: ?>-<?php endif; ?></td>
                        <td><?php if($vo['status']==0){echo '停用';}else{echo '启用';}?></td>
                        <td>
                            <?php if(($vo["status"]) == "1"): ?><a href="javascript:;" onclick="changeStatus('<?php echo ($vo["id"]); ?>', 0)" style="color:red">停用</a>
                            <?php else: ?>
                                <a href="javascript:;" onclick="changeStatus('<?php echo ($vo["id"]); ?>', 1)" style="color:orange">启用</a>
                                |<a href="javascript:void(0);" onclick="edit(<?php echo ($vo["id"]); ?>)">编辑</a>
                                <a href="#" onclick="del('<?php echo ($vo["id"]); ?>')" >删除</a><?php endif; ?>
                            <a href="/Admin/Ad/ad?id=<?php echo ($vo["id"]); ?>"><strong style="color: #fe0000">查看</strong></a>
                        </td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <?php echo ($page); ?>
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
<script type="text/javascript">

    /*添加广告位*/
    function ad_add(){
        layer.prompt({
            title: '请输入广告位名称',
            formType: 0 //prompt风格，支持0-2
        }, function(pass){
            if ($.trim(pass) == "") {
                layer.msg('广告位名称不能为空!',{icon:1,time:1000});
            } else {
                var url = "/Admin/Ad/addadtype";
                $.get(url, {name:pass}, function(data){
                    if(data.status == 1) {
                        layer.msg('添加成功', {icon: 6,time:1000});
                        location.reload();
                    } else {
                        layer.msg(data.info, {icon: 5,time:1000});
                    }
                })
            }
        });
    }

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
                    var url = "/Admin/Ad/changeStatus";
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

    /*编辑广告位置名称*/
    function edit(id){
        layer.prompt({
            title: '请输入广告位名称',
            formType: 0 //prompt风格，支持0-2
        }, function(pass){
            if ($.trim(pass) == "") {
                layer.msg('广告位名称不能为空!',{icon:1,time:1000});
            } else {
                var url = "/Admin/Ad/editadtype";
                $.get(url, {id:id,name:pass}, function(data){
                    if(data.status == 1) {
                        layer.msg('添加成功', {icon: 6,time:1000});
                        location.reload();
                    } else {
                        layer.msg(data.info, {icon: 5,time:1000});
                    }
                })
            }
        });
    }

    /*删除广告位置*/
    function del(id){
        layer.confirm(
            '确认要删除吗？',
            {btn: ['确定','取消']},
            function(index){
                var url = "/Admin/Ad/deladtype";
                $.get(url, {id:id}, function(data){
                    if(data) {
                        layer.msg('删除成功', {icon: 6,time:1000});
                        location.reload();
                    } else {
                        layer.msg('删除失败', {icon: 5,time:1000});
                    }
                })
            });
    }

</script>