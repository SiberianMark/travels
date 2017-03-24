<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>编辑线路-行程</title>
    

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
        <li class="bar_list current"><a class="bar_link" href="/Admin/Line/line_journey/id/<?php echo ($lineid); ?>">行程介绍</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/money_include/id/<?php echo ($lineid); ?>">费用包含</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/not_include/id/<?php echo ($lineid); ?>">费用不含</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/notice/id/<?php echo ($lineid); ?>">预订须知</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/reference/id/<?php echo ($lineid); ?>">推荐活动</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/time_price/id/<?php echo ($lineid); ?>">团期价格</a></li>
    </ul>
    <div class="mt-20 mb-40">
            <span class="ml-20" style="font-size: 16px">线路编号：<?php echo ($lineid); ?></span>
            <ul id="Huifold1" class="Huifold">
                <?php $__FOR_START_1297608779__=1;$__FOR_END_1297608779__=$day_num+1;for($i=$__FOR_START_1297608779__;$i < $__FOR_END_1297608779__;$i+=1){ ?><li class="item  ml-10" style="width: 58em">
                        <?php if($i == 1): ?><h4>第&nbsp;<?php echo ($i); ?>&nbsp;天<b>-</b></h4>
                        <?php else: ?>
                            <h4>第&nbsp;<?php echo ($i); ?>&nbsp;天<b>+</b></h4><?php endif; ?>
                        <div class="info"  <?php if($i == 1): ?>style="display:block;"<?php endif; ?>>
                        <form action="/Admin/Line/line_journey?ac=edit" method="post">
                            <input type="hidden" name="lineid" value="<?php echo ($lineid); ?>"/>
                            <input type="hidden" name="dayid" value="<?php echo ($journey[$i]['id']); ?>"/>
                            <input type="hidden" name="day" value="<?php echo ($i); ?>"/>
                            <table class="table table-border table-bordered table-hover" style="width: 57em">
                                <tr>
                                    <th class="text-r"><span style="color:red;">*&nbsp;</span>标题：</th>
                                    <td>
                                        <input type="text" class="input-text" name="name" value="<?php echo ($journey[$i]['name']); ?>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-r"><span style="color:red;">*&nbsp;</span>游览景点：</th>
                                    <td>
                                        <input type="text" class="input-text" name="spot" value="<?php echo ($journey[$i]['spot']); ?>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-r"><span style="color:red;">*&nbsp;</span>早餐：</th>
                                    <td>
                                        <input type="text" class="input-text" name="breakfast" value="<?php echo ($journey[$i]['breakfast']); ?>" placeholder="填含或者不含"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-r"><span style="color:red;">*&nbsp;</span>午餐：</th>
                                    <td>
                                        <input type="text" class="input-text" name="lunch" value="<?php echo ($journey[$i]['lunch']); ?>" placeholder="填含或者不含"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-r"><span style="color:red;">*&nbsp;</span>晚餐：</th>
                                    <td>
                                        <input type="text" class="input-text" name="dinner" value="<?php echo ($journey[$i]['dinner']); ?>" placeholder="填含或者不含"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-r"><span style="color:red;">*&nbsp;</span>住宿酒店：</th>
                                    <td>
                                        <input type="text" class="input-text" name="hotel" value="<?php echo ($journey[$i]['hotel']); ?>"  placeholder="填参考酒店或者不含"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-r"><span style="color:red;">*&nbsp;</span>行程详情：</th>
                                    <td>
                                        <script type="text/plain" id="editor_id<?php echo ($i); ?>" name="detail" style="width:50em;height:21.875em;">
                                            <?php echo ($journey[$i]['detail']); ?>
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
                    </li><?php } ?>
            </ul>
    </div>
</div>

<script>


    //必填项检测
   /* $(function () {
        var form = document.forms[0];
        form.onsubmit = function (e) {
            var line_type = $.trim($("input[name='line_type']:checked").val());
            var des_type = $.trim($("input[name='des_type']:checked").val());
            var start_selected = $("input[name='start_selected[]']").val();
            var des_selected = $("input[name='des_selected[]']").val();
            var day_num = $.trim($("input[name='day_num']").val());
            var main_name = $.trim($("input[name='main_name']").val());
            var sub_name = $.trim($("input[name='sub_name']").val());
            var counselor = $.trim($("#counselor").val());
            if (line_type ==''||des_type==''||start_selected==undefined||des_selected==undefined||day_num==''||main_name==''||sub_name==''||counselor=='') {
                layer.msg('带*为必填项', {icon: 2});
                return false;
            }
        };
    })*/

    //图文编辑(实例化编辑器)
    for (var i=1; i<="<?php echo ($day_num); ?>"; i++) {
        var ue = UE.getEditor('editor_id'+i);
    }


    $(function(){
        $.Huifold("#Huifold1 .item h4","#Huifold1 .item .info","fast",3,"click"); /*5个参数顺序不可打乱，分别是：相应区,隐藏显示的内容,速度,类型,事件*/
    });
    //1	只打开一个，可以全部关闭
    //2	必须有一个打开
    //3	可打开多个

</script>

</body>
</html>