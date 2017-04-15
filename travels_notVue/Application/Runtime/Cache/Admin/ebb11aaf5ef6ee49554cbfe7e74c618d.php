<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>线路目的地，出发地</title>
    

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

    <style type="text/css">
    #item {
    list-style: outside none none;
    padding: 0px;
    margin: 0px;
    margin-top: 1em;
    margin-left: 1em;
    width:18.5em;
    height: 3em;
    font-size:1.25em;
    text-align:center;
    }

    #item li {
    margin-top:0;
    margin-left:0;
    overflow: hidden;
    height:3em;
    width:6em;
    cursor: pointer;
    float: left;
    padding: 0;
    line-height: 3em;
    }

    .clear {
    clear: both;
    }
    .item-selected {
        border-top:2px solid #212121;
        border-left:2px solid #212121;
        border-right:2px solid #212121;
        border-bottom:0;
    }
    .item-no-selected {
        border-bottom:2px solid #212121;
    }
    .place-one {
        display: inline-block;
        width: 120px;
        height: 80px;
        border: 1px solid #212121;
        margin-left: 20px;
    }
    .place-selected {
        background-color: #38984b;
    }

    </style>
</head>
<body>

<ul id="item">
    <li status="1" <?php if($status==1): ?>class="item-selected"<?php else: ?>class="item-no-selected"<?php endif; ?> ><?php echo ($place["0"]["name"]); ?></li>
    <li status="2" <?php if($status==2): ?>class="item-selected"<?php else: ?>class="item-no-selected"<?php endif; ?>><?php echo ($place["1"]["name"]); ?></li>
    <li status="3" <?php if($status==3): ?>class="item-selected"<?php else: ?>class="item-no-selected"<?php endif; ?>><?php echo ($place["2"]["name"]); ?></li>
</ul>
<div class="clear"></div>
<form action="/Admin/Place/placelist" method="get" id="form1">
    <input type="hidden" name="status" id="status" value="<?php echo ($status); ?>"/>
    <input type="hidden" name="one_id" id="one_id" value="<?php echo ($one_id); ?>"/>
    <input type="hidden" name="two_id" id="two_id" value="<?php echo ($two_id); ?>"/>
</form>

<div class="page-container">

    <table class="table table-border table-bordered table-hover" style="width: 18em; float: left; margin-right: 3em;margin-top: 1.5em;margin-bottom: 1.5em">
        <tr class="text-c">
            <td colspan="3"><a class="btn btn-success radius ml-10" href="#" onclick="add_place(2)">新增一级地址</a></td>
        </tr>
        <?php if(is_array($place1)): foreach($place1 as $key=>$v): ?><tr class="text-c">
            <label><td class="" style="cursor: pointer" onclick="get_one(this,'<?php echo ($v["id"]); ?>')"><input type="checkbox" name="one_name" value="<?php echo ($v["id"]); ?>"/>&nbsp;<?php echo ($v["name"]); ?></td></label>
            <td style="width: 120px;">
                <a href="#" onclick="edit('<?php echo ($v["id"]); ?>')">编辑</a>&nbsp;&nbsp;
                <a href="#" onclick="del('<?php echo ($v["id"]); ?>')">删除</a>
            </td>
        </tr><?php endforeach; endif; ?>
    </table>

    <table class="table table-border table-bordered table-hover" style="width: 18em; float: left; margin-right: 3em;margin-top: 1.5em;margin-bottom: 1.5em">
        <tr class="text-c">
            <td colspan="3"><a class="btn btn-success radius ml-10" href="#" onclick="add_place(3)">新增二级地址</a></td>
        </tr>
        <?php if(is_array($place2)): foreach($place2 as $key=>$v): ?><tr class="text-c">
                <label><td class="" style="cursor: pointer" onclick="get_two('<?php echo ($v["id"]); ?>')"><input type="checkbox" name="two_name" value="<?php echo ($v["id"]); ?>"/>&nbsp;<?php echo ($v["name"]); ?></td></label>
                <td style="width: 120px;">
                    <a href="#" onclick="edit('<?php echo ($v["id"]); ?>')">编辑</a>&nbsp;&nbsp;
                    <a href="#" onclick="del('<?php echo ($v["id"]); ?>')">删除</a>
                </td>
            </tr><?php endforeach; endif; ?>
    </table>

    <table class="table table-border table-bordered table-hover" style="width: 18em; float: left; margin-right: 3em;margin-top: 1.5em;margin-bottom: 1.5em">
    <tr class="text-c">
        <td colspan="3"><a class="btn btn-success radius ml-10" href="#" onclick="add_place(4)">新增三级级地址</a></td>
    </tr>
    <?php if(is_array($place3)): foreach($place3 as $key=>$v): ?><tr class="text-c">
            <td class="" style="cursor: pointer"><?php echo ($v["name"]); ?></td>
            <td style="width: 120px;">
                <a href="#" onclick="edit('<?php echo ($v["id"]); ?>')">编辑</a>&nbsp;&nbsp;
                <a href="#" onclick="del('<?php echo ($v["id"]); ?>')">删除</a>
            </td>
        </tr><?php endforeach; endif; ?>
    </table>

</div>


<!--新增地址-->
<div id="add_place" style="display: none;">
    <form action="" id="do_add_place">
        <table class="table table-border table-bordered table-hover">
            <tr>
                <td class="text-c"><span style="color: red">*</span>地点名字：</td>
                <td><input class="input-text" type="text" name="name" id="add-name" placeholder="请输入地址名字，必填"></td>
            </tr>
            <tr>
                <td class="text-c">排序：</td>
                <td><input class="input-text" type="text" name="order" id="add-order" placeholder="排序，请输入整数"></td>
            </tr>
            <tr>
                <td class="text-c">地点首字母：</td>
                <td><input class="input-text" type="text" name="first_letter" id="add-first_letter" placeholder="大写字母"></td>
            </tr>
            <tr>
                <td class="text-c">是否是海岛：</td>
                <td>
                    <label><input type="radio" name="is_island" id="add-is_island" value="0">不是</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label><input type="radio" name="is_island" value="1">是</label>
                </td>
            </tr>
        </table>
    </form>
</div>


<script>
    //新增地址
    function add_place(type) {
        if (type == 2) {
            var pid =  $('#status').val();
            var pname = '<?php echo ($top_name); ?>';
        } else if (type == 3) {
            var pid =  $('#one_id').val();
            var pname = '<?php echo ($one_name); ?>';
        } else if (type == 4){
            var pid =  $('#two_id').val();
            var pname = '<?php echo ($two_name); ?>';
        }
        if (pid == '0') {
            layer.msg('请先选择上级地址');
        } else {
            layer.open({
                area: ['30em', '22em'],
                title: "新增地址，上级地址：" + pname,
                type:1,
                btn: ['确定', '取消'],
                yes: function(index) {
                    var url = "/admin/place/addplace";
                    var name = $('#add-name').val();
                    var order = $('#add-order').val();
                    var first_letter = $('#add-first_letter').val();
                    var is_island = $("input[name='is_island']:checked").val();
                    $.get(url, {pid:pid, type:type, name:name, order:order, first_letter:first_letter, is_island:is_island}, function (data) {
                        if (data.status == 1) {
                            layer.msg('添加成功', {icon: 1});
                            location.reload();
                        } else {
                            layer.msg(data.info, {icon: 2});
                        }
                    })
                },
                content:$('#add_place')
            });
        }
    }


    /*编辑地址*/
    function edit(id) {
        var url = "/admin/place/getplace";
        $.get(url, {id:id}, function (data) {
            if (data.status == 1) {
                $('#add-name').val(data.info.name);
                $('#add-order').val(data.info.order);
                $('#add-first_letter').val(data.info.first_letter);
                $('input[name="is_island"]').each(function(){
                    if ($(this).val()== data.info.is_island) {
                        $(this).attr("checked", "checked");
                    }
                });
                layer.open({
                    area: ['30em', '22em'],
                    title: "修改地址",
                    type:1,
                    btn: ['确定', '取消'],
                    yes: function(index) {
                        var url = "/admin/place/editplace";
                        var name = $('#add-name').val();
                        var order = $('#add-order').val();
                        var first_letter = $('#add-first_letter').val();
                        var is_island = $("input[name='is_island']:checked").val();
                        $.get(url, {id:id, name:name, order:order, first_letter:first_letter, is_island:is_island}, function (data) {

//                            alert(data);
                            if (data.status == 1) {
                                layer.msg(data.info, {icon: 1});
                                location.reload();
                            } else {
                                layer.msg(data.info, {icon: 1});
                            }
                        })
                    },
                    content:$('#add_place')
                });
            } else {
                layer.msg(data.info, {icon: 1});
            }
        })
    }

    /*删除地址*/
    function del(id){
        layer.confirm(
            '确认要删除吗？',
            {btn: ['确定','取消']},
            function(index){
                var url = "/Admin/place/delplace";
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

    // 点击选中
    $(document).ready(function () {
        $('input[name="one_name"]').each(function(){
            if ($(this).val()=='<?php echo ($one_id); ?>') {
                $(this).attr("checked", "checked");
            }
        });
        $('input[name="two_name"]').each(function(){
            if ($(this).val()=='<?php echo ($two_id); ?>') {
                $(this).attr("checked", "checked");
            }
        });

    })

    //获得一级地址id
    function get_one(obj,id) {
        $('#one_id').val(id);
        $('#two_id').val(0);
        $("#form1").submit();

    }

    //获得二级地址id
    function get_two(id) {
        $('#two_id').val(id);
        $("#form1").submit();
    }


    $("#item").find("li").each(function () {
        $(this).click(function () {
            $(this).addClass("item-selected").removeClass("item-no-selected").siblings().removeClass("item-selected").addClass("item-no-selected");
            status = $(this).attr('status');
            $("#status").val(status);
            $('#one_id').val(0);
            $('#two_id').val(0);
            $("#form1").submit();
        })
    })




</script>
</body>
</html>