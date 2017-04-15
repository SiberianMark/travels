<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加供应商</title>
    

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

<form action="/Admin/Supplier/addSupplier?ac=add" method="post" style="margin-bottom: 2em;" enctype="multipart/form-data">
    <input type="hidden" name="tid" value="<?php echo ($tid); ?>"/>
    <div class="page-container" style="margin-top: 20px;">
        <table class="table table-border table-bordered table-hover" style="width: 1200px;">
            <thead>
            <tr>
                <th class="text-r"><span style="color:red;">*&nbsp;</span>供应商名称：</th>
                <td><input type="text" class="input-text" onkeyup="this.value=this.value.replace(/\s/,'');" name="company_name" placeholder="供应商办公地址" required/></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="text-r"><span style="color:red;">*&nbsp;</span>供应商地址：</th>
                <td><input type="text" class="input-text" onkeyup="this.value=this.value.replace(/\s/,'');" name="addr" placeholder="广告描述" required/></td>
            </tr>
            <tr>
                <th class="text-r">供应商座机：</th>
                <td>
                    <input type="text" class="input-text" name="tel"/>
                </td>
            </tr>
            <tr>
                <th class="text-r"><span style="color:red;">*&nbsp;</span>老板名字：</th>
                <td>
                    <input type="text" class="input-text" name="boss" required/>
                </td>
            </tr>
            <tr>
                <th class="text-r"><span style="color:red;">*&nbsp;</span>老板手机号码：</th>
                <td><input type="text" class="input-text" name="boss_phone" required/></td>
            </tr>
            <tr>
                <th class="text-r">老板微信号码：</th>
                <td><input type="text" class="input-text" name="boss_wx"/></td>
            </tr>
            <tr>
                <th class="text-r">老板QQ号码：</th>
                <td><input type="text" class="input-text" name="boss_qq"/></td>
            </tr>
            <tr>
                <th class="text-r">公司简介：</th>
                <td>
                    <textarea name="note" cols="" rows="" class="textarea"  placeholder="供应商规模，配合程度，客户反馈质量等方面的描述"></textarea>
                </td>
            </tr>
            <tr>
                <th class="text-r"><span style="color:red;">*&nbsp;</span>供应商评价等级：</th>
                <td>
                    <label><input type="radio" name="score" value="0" /><span style="font-size: 1em;margin-right: 4em">&nbsp;一般</span></label>
                    <label><input type="radio" name="score" value="1" /><span style="font-size: 1em;margin-right: 4em">&nbsp;较好</span></label>
                    <label><input type="radio" name="score" value="2" /><span style="font-size: 1em;margin-right: 4em">&nbsp;较弱</span></label>
                </td>
            </tr>
            <tr>
                <th class="text-r"><span style="color:red;">*&nbsp;</span>供应商主打线路类型：</th>
                <td>
                    <label><input type="radio" name="type" value="1" /><span style="font-size: 1em;margin-right: 4em">&nbsp;周边</span></label>
                    <label><input type="radio" name="type" value="2" /><span style="font-size: 1em;margin-right: 4em">&nbsp;国内</span></label>
                    <label><input type="radio" name="type" value="3" /><span style="font-size: 1em;margin-right: 4em">&nbsp;出境</span></label>
                    <label><input type="radio" name="type" value="4" /><span style="font-size: 1em;margin-right: 4em">&nbsp;港澳台</span></label>
                </td>
            </tr>
            <tr>
                <th class="text-r"><span style="color:red;">*&nbsp;</span>供应商主打目的地：</th>
                <td>
                    <label class="btn btn-secondary radius" onclick="des_select()">选择</label>
                    <span style="margin-left: 4em">已选择：&nbsp;</span><span id="des_selected"></span>
                </td>
            </tr>
            <tr class="text-c">
                <td colspan="2">
                    <button style="width: 5em;height: 2.5em" type="submit" class="btn btn-success radius">确定</button>
                    <input style="width: 7em;height: 2.5em;margin-left: 2em" type="button" class="btn btn-primary radius" onclick="location.replace(document.referrer); return false;" value="取消并返回">
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form>




</body>
</html>
<script type="text/javascript">
    /*获取父级id*/
    var parentid = 0;
    $('input[name="type"]').change(function() {
        var type = $(this).val();
        if (type == 1 || type == 2) { //国内
            parentid = 1;
        } else if (type == 3) { //出境
            parentid = 2;
        } else if (type == 4) { //港澳台
            parentid = 3;
        }
    })

    /*选择目的地*/
    function des_select(){
        if (parentid == 0) {
            layer.msg('请先选择目的地类型');
        } else {
            get_place(parentid, '#des_selected', 1);
        }
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

</script>