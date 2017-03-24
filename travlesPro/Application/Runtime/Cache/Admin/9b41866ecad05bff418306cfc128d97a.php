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

        .month-bar {
            width: 100em;
            height: 2em;
            margin-left: 20px;
        }
        .month-bar .month_list{
            float: left;
            margin-right: 0.25em;
            line-height:3em;
            cursor: pointer;
        }
        .month-bar .month_list .month_link{
            display: inline-block;
            font-size: 1em;
            width: 68px;
            color: #0053AA;
            text-decoration:none;
        }
        .month-bar .month_list .month_link:hover{
            font-weight: 700;
        }
        .month_current{
            font-weight: 700;
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
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/reference/id/<?php echo ($lineid); ?>">推荐活动</a></li>
        <li class="bar_list current"><a class="bar_link" href="/Admin/Line/time_price/id/<?php echo ($lineid); ?>">团期价格</a></li>
    </ul>


    <div class="mt-20 mb-40">

        <input type="hidden" name="id" id="lineid" value="<?php echo ($lineid); ?>"/>
        <span class="ml-30" style="font-size: 16px">线路编号：<?php echo ($lineid); ?></span>
        <div class="cl pd-5 bg-1 bk-gray mt-10"> <span class="l"><a href="javascript:;" onclick="price_add('批量添加日期价格','/Admin/Line/price_add/lineid/<?php echo ($lineid); ?>','700','400')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>批量添加日期价格</a></span> </div>
        <ul class="month-bar">
            <?php if(is_array($month)): $k = 0; $__LIST__ = $month;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($k % 2 );++$k; if($k == 1): ?><li class="month_list month_current"><a class="month_link"><?php echo ($v); ?></a></li>
                <?php else: ?>
                    <li class="month_list"><a class="month_link"><?php echo ($v); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
        </ul>


        <table class="table table-border table-bordered table-hover table-striped table-bg ml-10" style="width: 58em">
            <thead>
                <tr>
                    <th class="text-c" id="now-month"></th>
                    <th class="text-c">成人价格</th>
                    <th class="text-c">儿童价格</th>
                    <th class="text-c">全程单房差</th>
                    <th class="text-c">操作</th>
                </tr>
            </thead>
            <tbody id="price-view" class="text-c">

            </tbody>
        </table>

    </div>
</div>

<!--修改价格-->
<div id="alter_price" style="display: none;">
    <form action="">
        <table class="table table-border table-bordered table-hover">
            <tr>
                <td class="text-c"><span style="color: red">*</span>成人价格：</td>
                <td><input class="input-text" type="text" id="adult_price" /></td>
            </tr>
            <tr>
                <td class="text-c"><span style="color: red">*</span>儿童价格：</td>
                <td><input class="input-text" type="text" id="child_price"/></td>
            </tr>
            <tr>
                <td class="text-c"><span style="color: red">*</span>全程单房差：</td>
                <td><input class="input-text" type="text" id="single_room"/></td>
            </tr>
        </table>
    </form>
</div>


<script>
    $(document).ready(function(){
        var id = $('#lineid').val();
        month = $('.month-bar .month_list .month_link').first().text();
        $('#now-month').text(month + '月');
        var url = "/Admin/Line/get_price";
        $.get(url,{month: month, id:id},function(data){
            $("#price-view").append(data);
        });

        // 点击月份切换
        $('.month-bar .month_list').click(function(){
            $(this).addClass("month_current").siblings().removeClass("month_current");
            month = $(this).children().first().text();
            $('#now-month').text(month + '月');
            var url = "/Admin/Line/get_price";
            $.get(url,{month: month, id:id},function(data){
                $("#price-view").empty();
                $("#price-view").append(data);
            });
        })
    })

    // 修改价格
    function change(id,tim,week,adult,child,single) {
        $('#adult_price').val(adult);
        $('#child_price').val(child);
        $('#single_room').val(single);
        layer.open({
            area: ['30em', '18em'],
            title: "修改价格，出游日期：" + tim + week,
            type:1,
            btn: ['确定', '取消'],
            yes: function(index) {
                var url = "/admin/line/change_price";
                var adult_price = $('#adult_price').val();
                var child_price = $('#child_price').val();
                var single_room = $('#single_room').val();
                $.get(url, {id:id, adult_price:adult_price, child_price:child_price, single_room:single_room}, function (data) {
                    if (data) {
                        var url = "/Admin/Line/get_price";
                        $.get(url,{month: month, id:data},function(data){
                            $("#price-view").empty();
                            $("#price-view").append(data);
                        });
                        layer.close(index);
                    } else {
                        layer.msg('修改失败', {icon: 2});
                    }
                })
            },
            content:$('#alter_price')
        });
    }

    // 添加价格
    function add_price(lineid,tim,week) {
        layer.open({
            area: ['30em', '18em'],
            title: "添加价格，出游日期：" + tim + week,
            type:1,
            btn: ['确定', '取消'],
            yes: function(index) {
                var url = "/admin/line/change_price";
                var adult_price = $('#adult_price').val();
                var child_price = $('#child_price').val();
                var single_room = $('#single_room').val();
                $.get(url, {lineid:lineid, line_date:tim, adult_price:adult_price, child_price:child_price, single_room:single_room}, function (data) {
                    if (data) {
                        var url = "/Admin/Line/get_price";
                        $.get(url,{month: month, id:data},function(data){
                            $("#price-view").empty();
                            $("#price-view").append(data);
                        });
                        layer.close(index);
                    } else {
                        layer.msg('增加失败', {icon: 2});
                    }
                })
            },
            content:$('#alter_price')
        });
    }

    // 修改状态
    function change_status(id,status) {
        var title='';
        switch(status){
            case 1: title='确认要开启吗?';break;
            case 2: title='确认要关闭吗?';break;
        }
        layer.confirm(
            title,
            {btn: ['确定','取消']},
            function(index){
                var url = "/Admin/Line/change_status";
                $.get(url, {id:id, status:status}, function(data){
                    if(data) {
                        var url = "/Admin/Line/get_price";
                        $.get(url,{month: month, id:data},function(data){
                            $("#price-view").empty();
                            $("#price-view").append(data);
                        });
                        layer.close(index);
                    } else {
                        layer.msg('修改失败', {icon: 5,time:1000});
                    }
                })
            });
    }

    /*添加日期价格*/
    function price_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
</script>

</body>
</html>