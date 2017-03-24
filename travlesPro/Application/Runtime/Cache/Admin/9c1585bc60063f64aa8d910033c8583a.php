<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加日期价格</title>
    

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
        .d {
            float: left;
        }
        #content p {
            margin-bottom: 0;
        }
    </style>
</head>
<body>


<div class="page-container" style="height: 265px">
    <form action="/Admin/Line/many_price" method="get" id="form">
        <input type="hidden" name="lineid" id="lineid" value="<?php echo ($lineid); ?>"/>
        <div class="d" style="margin-right: 1em">
            <p>点击日历中日期添加开班日期：</p>
            <div id="div1"></div>
        </div>
        <div class="d" style="margin-right: 1.6em">
            <p>已选日期：</p>
            <div id="content" style="width: 150px;height: 220px;border: 1px solid #999;overflow-y :auto">

            </div>
        </div>
        <div class="d" style="width: 250px;height: 200px;">
            <p>价格：</p>
            <table class="table table-border table-bordered table-hover">
                <tr>
                    <td class="text-c"><span style="color: red">*</span>成人价格：</td>
                    <td style="width: 90px"><input class="input-text" type="text" name="adult_price" /></td>
                </tr>
                <tr>
                    <td class="text-c"><span style="color: red">*</span>儿童价格：</td>
                    <td><input class="input-text" type="text" name="child_price"/></td>
                </tr>
                <tr>
                    <td class="text-c"><span style="color: red">*</span>全程单房差：</td>
                    <td><input class="input-text" type="text" name="single_room"/></td>
                </tr>
            </table>
        </div>
    </form>
</div>
<p><button id="conform" class="btn btn-secondary radius" style="width:100px;display:block;margin: auto">保存</button></p>

</body>
</html>
<script type="text/javascript">
    WdatePicker({eCont:'div1',onpicked:function(dp){
        var select_date = dp.cal.getDateStr();
        var select_date1 = $('#'+ select_date +'').val();
        if (select_date1 == undefined) {
            var lineid = $("#lineid").val();
            var url = "/Admin/Line/if_price";
            $.get(url,{lineid: lineid, line_date:select_date},function(data){
                if (data) {
                    layer.msg('该日期对应的价格已经存在');
                } else {
                    var str = '<p>';
                    str += '<input name="date_selected[]" style="border:0;width: 100px" readonly="readonly" id="'+ select_date +'" value="'+ select_date +'"/>';
                    str += '<i class="Hui-iconfont" onclick="del_date(this)" style="cursor:pointer">&#xe6a6;</i>';
                    str += '</p>';
                    $("#content").append(str);
                }
            });
        } else {
            layer.msg('该日期已经被选中');
        }
    }})

    // 点击删除日期
    function del_date(obj) {
        $(obj).parent().remove();
    }

    $("#conform").click(function(){
        $("#form").submit();
    })

</script>