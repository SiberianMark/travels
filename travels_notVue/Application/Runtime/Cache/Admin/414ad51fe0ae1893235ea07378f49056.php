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
	<script src="/Application/Admin/View/Public/laypage/laypage.js"></script>
	<title>部门管理</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 员工管理
	<span class="c-gray en">&gt;</span> 部门管理
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray"> <span class="l"> <a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加部门','/Admin/Employee/adminDepaAdd','800','700')"><i class="Hui-iconfont">&#xe600;</i> 添加部门</a></span></div>
	<table class="mt-5 table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="5">部门管理</th>
			</tr>
			<tr class="text-c">
				<th>ID</th>
				<th>部门名称</th>
				<th>员工人数</th>
				<th>部门描述</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<?php if(is_array($lists)): foreach($lists as $key=>$list): ?><tr class="text-c">
					<td><?php echo ($list["id"]); ?></td>
					<td><?php echo ($list["name"]); ?></td>
					<td><?php echo ($list["num"]); ?></td>
					<td><?php echo ($list["detail"]); ?></td>
					<td class="f-14">
						<a title="编辑权限" href="javascript:;" onclick="admin_role_edit('编辑部门','/Admin/Employee/adminDepaEdit/id/<?php echo ($list["id"]); ?>','800','700')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>&nbsp;&nbsp;
						<a title="删除" href="javascript:;" onclick="del('<?php echo ($list["id"]); ?>')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr><?php endforeach; endif; ?>
		</tbody>
	</table>
</div>


<script type="text/javascript">
	/*管理员-角色-添加*/
	function admin_role_add(title,url,w,h){
		layer_show(title,url,w,h);
	}

	/*管理员-角色-编辑*/
	function admin_role_edit(title,url,w,h){
		layer_show(title,url,w,h);
	}

	/*删除部门*/
	function del(id) {
		layer.confirm(
			'确定要删除吗？',
			{btn: ['确定','取消']},
			function(){
				var url = "/Admin/Employee/depaDel";
				$.get(url, {id:id}, function(data){
					if(data) {
						location.reload();
						layer.msg('删除成功', {icon: 1});
					} else {
						layer.msg('删除失败', {icon: 2});
					}
				})
			}
		)
	}
</script>
</body>
</html>