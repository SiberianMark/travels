<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>添加线路</title>
    

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

    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 线路管理 <span class="c-gray en">&gt;</span> 添加线路 </nav>
<div class="mt-50 ml-50 mb-50" >
  <form action="/Admin/Line/addline?ac=add" method="post">
    <table class="table table-border table-bordered table-hover ml-10" style="width: 58em">
        <tr>
            <th style="width: 20%" class="text-r"><span style="color:red;">*&nbsp;</span>线路类型：</th>
            <td>
                <label><input type="radio" name="line_type" value="1" /><span style="font-size: 1em;margin-right: 4em">&nbsp;跟团游</span></label>
                <label><input type="radio" name="line_type" value="2" /><span style="font-size: 1em;margin-right: 4em">&nbsp;自由行</span></label>
            </td>
        </tr>
        <tr>
            <th class="text-r"><span style="color:red;">*&nbsp;</span>目的地类型：</th>
            <td>
                <label><input type="radio" name="des_type" value="1" /><span style="font-size: 1em;margin-right: 4em">&nbsp;周边</span></label>
                <label><input type="radio" name="des_type" value="2" /><span style="font-size: 1em;margin-right: 4em">&nbsp;国内</span></label>
                <label><input type="radio" name="des_type" value="3" /><span style="font-size: 1em;margin-right: 4em">&nbsp;出境</span></label>
                <label><input type="radio" name="des_type" value="4" /><span style="font-size: 1em;margin-right: 4em">&nbsp;港澳台</span></label>
            </td>
        </tr>
        <tr>
            <th class="text-r"><span style="color:red;">*&nbsp;</span>出发地：</th>
            <td>
                <label class="btn btn-secondary radius" onclick="start_select()">选择</label>
                <span style="margin-left: 4em">已选择：&nbsp;</span>
                <span id="start_selected">
                    <span style="margin-right: 1em;font-size: 1.125em">
                        <input type="hidden" name="start_selected[]" value="7"/>深圳
                        <i class="Hui-iconfont" onclick="del_place(this)" style="cursor:pointer">&#xe6a6;</i>
                    </span>
                </span>
            </td>
        </tr>
        <tr>
            <th class="text-r"><span style="color:red;">*&nbsp;</span>目的地：</th>
            <td>
                <label class="btn btn-secondary radius" onclick="des_select()">选择</label>
                <span style="margin-left: 4em">已选择：&nbsp;</span><span id="des_selected"></span>
            </td>
        </tr>
        <tr>
            <th class="text-r"><span style="color:red;">*&nbsp;</span>出游天数：</th>
            <td>
                <input type="text" name="day_num" id="day_num" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="2" placeholder="请输入数字1~20"/>
            </td>
        </tr>
        <tr>
            <th class="text-r"><span style="color:red;">*&nbsp;</span>线路主标题：</th>
            <td>
                <input type="text" class="input-text" name="main_name"/>
            </td>
        </tr>
        <tr>
            <th class="text-r"><span style="color:red;">*&nbsp;</span>线路副标题：</th>
            <td>
                <input type="text" class="input-text" name="sub_name"/>
            </td>
        </tr>
        <tr>
            <th class="text-r">SEO搜索关键词：</th>
            <td>
                <input type="text" class="input-text" name="keywords" placeholder="如不填则默认为线路标题"/>
            </td>
        </tr>
        <tr>
            <th class="text-r">线路标签：</th>
            <td>
                <label class="btn btn-secondary radius" onclick="label_select()">选择</label>
                <span style="margin-left: 4em">已选择：&nbsp;</span><span id="label_selected"></span>
            </td>
        </tr>
        <tr>
            <th class="text-r"><span style="color:red;">*&nbsp;</span>专属OP：</th>
            <td>
                <select name="counselor" id="counselor" class="input-text" >
                    <option value="0">请选择</option>
                    <?php if(is_array($op)): foreach($op as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>"><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
                </select>
            </td>
        </tr>
        <tr>
            <th class="text-r">供应商线路名称：</th>
            <td>
                <input type="text" class="input-text" name="supplier_title"/>
            </td>
        </tr>
        <tr>
            <th class="text-r">供应商对接OP：</th>
            <td>
                供应商：
                <select id="supplier" class="input-text" style="width: 10em">
                    <option value="0">请选择</option>
                    <?php if(is_array($supplier)): foreach($supplier as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>"><?php echo ($v["company_name"]); ?></option><?php endforeach; endif; ?>
            </select>&nbsp;&nbsp;
                对应OP：
                <select name="supplier_op" id="supplier_op" class="input-text" style="width: 10em">
                    <option value="0">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <th class="text-r">推荐理由：</th>
            <td>
                <script type="text/plain" id="editor_id" name="special" style="width:50em;height:21.875em;">

                </script>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-c">
            <input class="btn btn-success radius" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;&nbsp;&nbsp;">
            </td>
        </tr>
    </table>
  </form>
</div>





</div>

<script>

    //必填项检测
    $(function () {
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
    })

    /*获取父级id*/
    var parentid = 0;
    $('input[name="des_type"]').change(function() {
        var type = $(this).val();
        if (type == 1 || type == 2) { //国内
            parentid = 1;
        } else if (type == 3) { //出境
            parentid = 2;
        } else if (type == 4) { //港澳台
            parentid = 3;
        }
    })

    /*选择出发地*/
    function start_select(){
        get_place(1, '#start_selected', 2);
    }

    /*选择目的地*/
    function des_select(){
        if (parentid == 0) {
            layer.msg('请先选择目的地类型');
        } else {
            get_place(parentid, '#des_selected', 1);
        }
    }

    /*选择标签*/
    function label_select(){
        var url = "/Admin/Line/labelSelect";
        $.get(url, {}, function(data){
            if (data) {
                var content = data;
                layer.open({
                    title: '选择标签',
                    type: 1,
                    area: ['37.5em', '37.5em'],
                    fix: false, //不固定
                    content: content,
                    btn:['确认','取消'],
                    yes: function(index) {
                        $("input[name='label[]']:checked").each(function(){
                            var str = '<span style="margin-right: 1em;font-size: 1.125em">';
                            str += '<input type="hidden" name="label_selected[]" value="';
                            str += $(this).val();
                            str += '"/>';
                            str += $(this).attr('label');
                            str += '<i class="Hui-iconfont" onclick="del_place(this)" style="cursor:pointer">&#xe6a6;</i>';
                            str += '</span>';
                            $("#label_selected").append(str);
                        });
                        layer.close(index);
                    }
                });
            }
        });
    }

    /**
     *  根据父级id获得地址并加载
     *  var parentid 父级id
     *  var obj 标签id
     *  var place_type 1-目的地，2-出发地
     */
    function get_place(parentid, obj, place_type) {
        var url = "/admin/place/placeSelect";
        $.get(url, {parentid:parentid}, function(data){
            if (data) {
                var content = data.str;
                if (place_type == 1) {
                    var title = data.parentname + '目的地';
                } else {
                    var title = data.parentname + '出发地';
                }
                layer.open({
                    title: title,
                    type: 1,
                    area: ['37.5em', '37.5em'],
                    fix: false, //不固定
                    content: content,
                    btn:['确认','取消'],
                    yes: function(index) {
                        if (place_type == 1) {
                            var name = 'des_selected[]';
                        } else {
                            var name = 'start_selected[]';
                        }
                        $("input[name='rules[]']:checked").each(function(){
                            var str = '<span style="margin-right: 1em;font-size: 1.125em">';
                            str += '<input type="hidden" name="'+ name +'" value="';
                            str += $(this).val();
                            str += '"/>';
                            str += $(this).attr('place');
                            str += '<i class="Hui-iconfont" onclick="del_place(this)" style="cursor:pointer">&#xe6a6;</i>';
                            str += '</span>';
                            $(obj).append(str);
                        });
                        layer.close(index);
                    }
                });
            }
        });
    }

    // 点击删除地址
    function del_place(obj) {
        $(obj).parent().remove();
    }

    // 判断输入的数字在1-20之间
    $("#day_num").blur( function(event) {
        var el = event.target;
        if(el.value>=20){
            el.value = 20;
        } else if (el.value <1) {
            el.value = '';
        }
    });

    //图文编辑(实例化编辑器)
    var ue = UE.getEditor('editor_id');

    //根据供应商选择OP
    $("#supplier").change(function () {
        $("#supplier_op").empty("");
        $("#supplier_op").append('<option value="">请选择</option>');
        var id = $("#supplier").val();
        var url = "/Admin/Supplier/OPList";
        $.get(url,{id: id},function(data){
            data = eval(data);
            if (data.length != 0){
                var op = '';
                $.each(data, function(i, v){
                    op += "<option value='"+ v.id + "'>" + v.name + "</option>";
                });
                $("#supplier_op").append(op);
            }
        });
    })

</script>


</body>
</html>