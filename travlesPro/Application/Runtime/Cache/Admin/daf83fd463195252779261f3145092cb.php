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
	<script src="/Public/lib/layer/layer/layer.js"></script>
	<title>员工管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 员工管理 <span class="c-gray en">&gt;</span> 员工管理  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="/Admin/Employee/emplList" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form action="/Admin/Employee/emplList" method="get" id="form">
		<div class="text-c">
			部门：
			<select name="depa" id="depa" class="input-text" style="width: 90px">
				<option value="0">全部</option>
				<?php if(is_array($depa)): foreach($depa as $key=>$de): ?><option value="<?php echo ($de["id"]); ?>"><?php echo ($de["name"]); ?></option><?php endforeach; endif; ?>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;
			状态：
			<select name="status" class="input-text" style="width: 90px">
			<option value="-1">全部</option>
			<option value="0" <?php if($_GET['status']==='0') echo "selected";?>>正常</option>
			<option value="1" <?php if($_GET['status']==1) echo "selected";?>>禁用</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;
			关键词:&nbsp;
			<input type="text" class="input-text" style="width:200px" placeholder="姓名、手机或邮箱关键词"  name="keyword" value="<?php echo ($keyword); ?>">&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
		</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="member_add('添加员工','/Admin/Employee/emplAdd','800','700')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加员工</a></span> <span class="r">共有数据：<strong><?php echo ($count); ?></strong> 条</span> </div>
	<div class="mt-5">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th>ID</th>
				<th>姓名</th>
				<th>部门</th>
				<th>手机</th>
				<th>微信</th>
				<th>QQ</th>
				<th>邮箱</th>
				<th>性别</th>
				<th>籍贯</th>
				<th>住址</th>
				<th>入职时间</th>
				<th>备注</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<?php if(is_array($lists)): foreach($lists as $key=>$list): ?><tr class="text-c">
					<td><?php echo ($list["id"]); ?></td>
					<td><u style="cursor:pointer" class="text-primary" onclick="member_show('<?php echo ($list["name"]); ?>','/Admin/Employee/emplSalary','10001','360','400')"><?php echo ($list["name"]); ?></u></td>
					<td><?php echo ($list["department"]); ?></td>
					<td><?php echo ($list["phone"]); ?></td>
					<td><?php echo ($list["weixin"]); ?></td>
					<td><?php echo ($list["qq"]); ?></td>
					<td><?php echo ($list["email"]); ?></td>
					<td>
						<?php switch($list["sex"]): case "1": ?>男<?php break;?>
							<?php case "2": ?>女<?php break; endswitch;?>
					</td>

					<td><?php echo ($list["nativeplace"]); ?></td>
					<td class="text-l"><?php echo ($list["address"]); ?></td>
					<td><?php echo ($list["entrytime"]); ?></td>
					<td><?php echo ($list["note"]); ?></td>
					<td class="td-status">
						<?php switch($list["status"]): case "0": ?><span class="label label-success radius">已启用</span><?php break;?>
							<?php case "1": ?><span class="label label-defaunt radius">已禁用</span><?php break; endswitch;?>
					</td>
					<td class="td-manage">
						<?php if($list["status"] == 0): ?><a style="text-decoration:none" onClick="member_stop(this,'<?php echo ($list["id"]); ?>',1,1)" href="javascript:;" title="禁用"><i class="Hui-iconfont">&#xe631;</i></a>
						<?php else: ?>
							<a style="text-decoration:none" onClick="member_stop(this,'<?php echo ($list["id"]); ?>',0,2)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a><?php endif; ?>
						<a title="编辑" href="javascript:;" onclick="member_edit('编辑','/Admin/Employee/emplEdit/id/<?php echo ($list["id"]); ?>','800','700')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
						<a style="text-decoration:none" class="ml-5" onclick="change_password('<?php echo ($list["id"]); ?>')" title="重置密码"><i class="Hui-iconfont">&#xe63f;</i></a>
						<a title="删除" href="javascript:;" onclick="member_del('<?php echo ($list["id"]); ?>')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
				</tr><?php endforeach; endif; ?>
			<tr>
				<td colspan="14" style="text-align: right">
					<div class="f-l"><span class="l" style="margin-top: 6px;font-size: 0.875em">共有数据：<strong><?php echo ($count); ?></strong> 条，当前第&nbsp;<?php echo ($nowpage); ?>&nbsp;页，共&nbsp;<?php echo ($pages); ?>&nbsp;页</span></div>
					<div class="f-r" id="laypage"></div>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
</div>
<input type="hidden" value="1" name="nowpage"/>


<script type="text/javascript">

	$(document).ready(function(){
		$("#depa option[value='<?php echo ($depaid); ?>']").attr("selected","selected");
	});


/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id,status,flag){
	var title='';
	switch(flag){
		case 1: title='确认要禁用吗?';break;
		case 2: title='确认要启用吗?';break;
	}
	layer.confirm(
			title,
			{btn: ['确定','取消']},
			function(index){
				var url = "/Admin/Employee/changeStatus";
				$.get(url, {id:id, status:status}, function(data){
					if(data) {
						layer.msg('修改成功', {icon: 6,time:1000});
						location.reload();
					} else {
						layer.msg('修改失败', {icon: 5,time:1000});
					}
				})
	});
}

/*用户-编辑*/
function member_edit(title,url,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(id){
	layer.prompt({
		title: '重置密码',
		formType: 0 //prompt风格，支持0-2
	}, function(pass){
		if ($.trim(pass) == "") {
			layer.msg('密码不能为空!',{icon:1,time:1000});
		} else {
			var url = "/Admin/Employee/changePassword";
			$.get(url, {id:id, password:pass}, function(data){
				if(data) {
					layer.msg('重置成功', {icon: 6,time:1000});
				} else {
					layer.msg('重置失败', {icon: 5,time:1000});
				}
			})
		}
	});
}

/*用户-删除*/
function member_del(id){
	layer.confirm(
			'确认要删除吗？',
			{btn: ['确定','取消']},
			function(index){
				var url = "/Admin/Employee/emplDel";
				$.get(url, {id:id}, function(data){
					if(data) {
						layer.msg('删除成功', {icon: 6,time:1000});
						location.reload();
					} else {
						layer.msg('删除失败', {icon: 5,time:1000});
					}
				})
			});
}
</script>
<script>
	/**
	 * 分页
	 */
	laypage({
		cont: $('#laypage'), //容器。值支持id名、原生dom对象，jquery对象,
		pages: <?php echo ($pages); ?>, //总页数
		skip: true, //是否开启跳页
		groups: 5 ,//连续显示分页数
		curr: <?php echo ($nowpage); ?>,
		jump: function(obj, first){
			//得到了当前页，用于向服务端请求对应数据
			if(!first){
				nowpage=GetQueryString('nowpage')?obj.curr:'2';
				location.href = changeURLArg(location.href,'nowpage',nowpage)
			}
		}
	});
	/**
	 * url 目标url
	 * arg 需要替换的参数名称
	 * arg_val 替换后的参数的值
	 * return url 参数替换后的url
	 */
	function changeURLArg(url,arg,arg_val){
		var pattern=arg+'=([^&]*)';
		var replaceText=arg+'='+arg_val;
		if(url.match(pattern)){
			var tmp='/('+ arg+'=)([^&]*)/gi';
			tmp=url.replace(eval(tmp),replaceText);
			return tmp;
		}else{
			if(url.match('[\?]')){
				return url+'&'+replaceText;
			}else{
				return url+'?'+replaceText;
			}
		}
		return url+""+arg+""+arg_val;
	}
	/**
	 * 得到url参数的值
	 * @param name
	 * @returns {*}
	 * @constructor
	 */
	function GetQueryString(name)
	{
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if(r!=null)return  unescape(r[2]); return null;
	}
</script>
</body>
</html>