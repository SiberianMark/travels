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
<title>选择目的地</title>
	<style>
		.col-sm-3 {
			width: 18%;
		}
	</style>
</head>
<body>
<article class="page-container">
	<form action="">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><?php echo ($parentname); ?>目的地：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<?php if(is_array($lists)): foreach($lists as $key=>$list): ?><dl>
						<dt style="margin: 0.3em">
							<label>
								<input type="checkbox" value="<?php echo ($list["id"]); ?>" name="rules[]">
								<span style="background-color: lightgrey"><?php echo ($list["name"]); ?></span>
							</label>
						</dt>
						<?php if($list["child"] != ''): if(is_array($list["child"])): foreach($list["child"] as $key=>$v): ?><dd style="margin-left: 1.25em">
									<dl>
										<dt style="margin: 0.3em">
											<label><input type="checkbox" value="<?php echo ($v["id"]); ?>" name="rules[]"><span style="background-color: lightgreen"><?php echo ($v["name"]); ?></span></label>
										</dt>
										<?php if($v["child"] != ''): if(is_array($v["child"])): foreach($v["child"] as $key=>$v1): ?><span style="margin-left: 1.25em">
												<label style="padding-right:0.625em;"><input type="checkbox" value="<?php echo ($v1["id"]); ?>" name="rules[]"><?php echo ($v1["name"]); ?></label>
												</span><?php endforeach; endif; endif; ?>
									</dl>
								</dd><?php endforeach; endif; endif; ?>
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



<script type="text/javascript">
	$("#submit").click(function(){
		var value = 123;
		var key = 'name';
		sessionStorage.setItem(key,value);
		history.go(-1);
	})


</script>

</body>
</html>