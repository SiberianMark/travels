<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>供应商OP管理</title>
    

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


<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 供应商管理<span class="c-gray en">&gt;</span>OP管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>


<?php $parentid?>
<div class="page-container">
    <div class="mt-20" style="margin-top: 3px">
        <div class="pd-10">
            <span style="font-size: 1em">供应商名称：</span><span style="color: lightcoral"><?php echo ($supplier["company_name"]); ?></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="btn btn-success radius ml-10" href="/Admin/Supplier/addOp?sid=<?php echo ($supplier["id"]); ?>">新增供应商OP</a>&nbsp;
            <a class="btn btn-success radius ml-10" href="/Admin/Supplier/lists/">返回上一页</a>
        </div>
<table class="table table-border table-bordered table-hover table-bg" >
    <thead>
    <tr>
        <th style="text-align: center">ID</th>
        <th style="text-align: center">供应商OP名字</th>
        <th style="text-align: center">座机</th>
        <th style="text-align: center">手机</th>
        <th style="text-align: center">微信</th>
        <th style="text-align: center">QQ</th>
        <th style="text-align: center">备注</th>
        <th style="text-align: center">添加时间</th>
        <th style="text-align: center">操作</th>
    </tr>
    </thead>
    <?php if($lists): if(is_array($lists)): $k = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><tr class="list">
                <td style="text-align: center;"><?php echo ($vo["id"]); ?></td>
                <td style="text-align: center;"><?php echo ($vo["name"]); ?></td>
                <td style="text-align: center;"><?php echo ($vo["tel"]); ?></td>
                <td style="text-align: center;"><?php echo ($vo["phone"]); ?></td>
                <td style="text-align: center;"><?php echo ($vo["wx"]); ?></td>
                <td style="text-align: center;"><?php echo ($vo["qq"]); ?></td>
                <td style="text-align: center;"><?php echo ($vo["note"]); ?></td>
                <td style="text-align: center;"><?php echo ($vo["addtime"]); ?></td>
                <td style="text-align: center;">
                    <a href="/Admin/Supplier/editOp?id=<?php echo ($vo["id"]); ?>&sid=<?php echo ($supplier["id"]); ?>">编辑</a> |
                    <a href="#" onclick="del('<?php echo ($vo["id"]); ?>')" style="color:red">删除</a>
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



    /*删除广告*/
    function del(id){
        layer.confirm(
                '确认要删除吗？',
                {btn: ['确定','取消']},
                function(index){
                    var url = "/Admin/Supplier/delOp";
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