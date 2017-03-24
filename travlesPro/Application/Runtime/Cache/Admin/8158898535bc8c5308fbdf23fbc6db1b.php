<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
	

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
<title>新建部门</title>
	<style>
		.col-sm-3 {
			width: 18%;
		}
	</style>
</head>
<body>
<article class="page-container">
	<form action="/index.php/Admin/Employee/adminDepaAdd" method="post" class="form form-horizontal" id="form-admin-role-add" target="_parent">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>部门名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="roleName" name="name" datatype="*4-16" nullmsg="用户账户不能为空">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">部门描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="" name="detail">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">部门权限：</label>
			<div class="formControls col-xs-8 col-sm-9">

				<?php if(is_array($lists)): foreach($lists as $key=>$list): ?><dl class="permission-list">
						<dt>
							<label>
								<input type="checkbox" value="<?php echo ($list["id"]); ?>" name="rules[]">
								<?php echo ($list["title"]); ?></label>
						</dt>
						<?php if($list["child"] != ''): ?><dd>
								<?php if(is_array($list["child"])): foreach($list["child"] as $key=>$v): ?><label style="padding-right:0.625em;"><input class="menu-child" type="checkbox" value="<?php echo ($v["id"]); ?>" pid="<?php echo ($v["pid"]); ?>" name="rules[]"><?php echo ($v["title"]); ?></label><?php endforeach; endif; ?>
							</dd><?php endif; ?>

					</dl><?php endforeach; endif; ?>

			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button type="submit" class="btn btn-success radius" id="submit"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</article>


<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
$(function(){
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
	});
	
	/*$("#form-admin-role-add").validate({
		rules:{
			roleName:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
	});*/
});


	//子菜单选中时，同时选中父菜单
	$('.menu-child').click(function(){
		var pid = $(this).attr('pid');
		if (this.checked) {
			$(this).prop('checked', true);
			$('input[value=' + pid + ']').prop('checked', true);
		} else {
			$(this).prop('checked', false);
		}
	})
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>