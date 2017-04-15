<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑供应商OP</title>
    

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

<form action="/Admin/Supplier/editOp?ac=edit" method="post" style="margin-bottom: 2em;" enctype="multipart/form-data">
    <input type="hidden" name="sid" value="<?php echo ($sid); ?>"/>
    <input type="hidden" name="id" value="<?php echo ($list["id"]); ?>"/>
    <div class="page-container" style="margin-top: 20px;">
        <table class="table table-border table-bordered table-hover" style="width: 1200px;">
            <thead>
            <tr>
                <th class="text-r">OP名字：</th>
                <td><input type="text" class="input-text" onkeyup="this.value=this.value.replace(/\s/,'');" name="name" value="<?php echo ($list["name"]); ?>" required/></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th class="text-r">座机：</th>
                <td><input type="text" class="input-text" onkeyup="this.value=this.value.replace(/\s/,'');" name="tel" value="<?php echo ($list["tel"]); ?>" placeholder="座机或者分机"/></td>
            </tr>
            <tr>
                <th class="text-r">手机：</th>
                <td><input type="text" class="input-text" onkeyup="this.value=this.value.replace(/\s/,'');" name="phone" value="<?php echo ($list["phone"]); ?>"/></td>
            </tr>
            <tr>
                <th class="text-r">微信：</th>
                <td><input type="text" class="input-text" name="wx" value="<?php echo ($list["wx"]); ?>"/></td>
            </tr>
            <tr>
                <th class="text-r">QQ：</th>
                <td><input type="text" class="input-text" name="qq" value="<?php echo ($list["qq"]); ?>"/></td>
            </tr>
            <tr>
                <th class="text-r">备注信息：</th>
                <td><input type="text" class="input-text" name="note" value="<?php echo ($list["note"]); ?>"/></td>
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

</script>