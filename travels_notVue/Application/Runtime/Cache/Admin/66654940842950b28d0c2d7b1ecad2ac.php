<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>修改出游客人</title>
	

<script type="text/javascript" src="/Public/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Public/H-ui.admin_v2.5/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/Public/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/Public/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="/Public/H-ui.admin_v2.5/static/h-ui.admin/js/H-ui.admin.js"></script>



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
	<link type="text/css" rel="stylesheet" href="/Public/css/admin/travelInfo.css" media="all"/>
	<style>
		.table1 th{
			width: 100px;
			text-align: right;
		}
		label:hover{
			cursor:pointer;
		}

	</style>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe625;</i> 出游登记
	<span class="c-gray en">&gt;</span> 修改出游客人

</nav>
<form action="/index.php/Admin/TravelInfo/domodifyinfo" method="post">
	<input type="hidden" name="iid" value="<?php echo ($iid); ?>"/>
	<div class="page-container" style="width: 900px;margin:20px auto;">
		1、标<span style="color:red;">*</span>为必填项。&nbsp;&nbsp;2、如果是包团，出游人数填总人数，旅客只填写领队就可以。公司名字等填到备注里。&nbsp;&nbsp;3、默认旅客第一个人为领队。
		<table class="table table-border table-bordered table-hover mt-10 table1">
			<tr>
				<th><span style="color:red;">*&nbsp;</span>客人类型：</th>
				<td>
					<label><input type="radio" name="visitorType" value="1" <?php if($travelInfo['visitorType'] == 1) echo "checked";?>/><span style="font-size: 14px">散客</span></label>&nbsp;
					<label><input type="radio"  style="margin-left: 20px" name="visitorType" value="2" <?php if($travelInfo['visitorType'] == 2) echo "checked";?>/><span style="font-size: 14px">包团</span></label>
				</td>
				<th><span style="color:red;">*&nbsp;</span>线路类型：</th>
				<td>
					<select name="lineType" id="lineType" class="input-text">
						<option value="0">请选择</option>
						<option value="1">周边</option>
						<option value="2">国内</option>
						<option value="3">出境</option>
						<option value="4">港澳台</option>
					</select>
				</td>
				<th><span style="color:red;">*&nbsp;</span>出游人数：</th>
				<td><input id="visitorNum" class="input-text" type="text" name="visitorNum" value="<?php echo ($travelInfo["visitorNum"]); ?>"/></td>
			</tr>
			<tr>
				<th><span style="color:red;">*&nbsp;</span>线路名称：</th>
				<td colspan="3"><input class="input-text box180" type="text" name="lineName" value="<?php echo ($travelInfo["lineName"]); ?>"/></td>
				<th><span style="color:red;">*&nbsp;</span>出发日期：</th>
				<td><input type="text" name="startDate" class="Wdate input-text" value="<?php echo ($travelInfo["startDate"]); ?>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
			</tr>
			<tr>
				<th><span style="color:red;">*&nbsp;</span>已付定金：</th>
				<td><input class="input-text" type="text" name="deposit" value="<?php echo ($travelInfo["deposit"]); ?>" placeholder="未付则填0"/></td>
				<th><span style="color:red;">*&nbsp;</span>导游代收款：</th>
				<td><input class="input-text" type="text" name="guideCollection" value="<?php echo ($travelInfo["guideCollection"]); ?>" placeholder="无代收则填0"/></td>
				<th><span style="color:red;">*&nbsp;</span>结束日期：</th>
				<td><input  type="text" name="endDate" class="Wdate input-text" value="<?php echo ($travelInfo["endDate"]); ?>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
			</tr>
			<tr>
				<th>出游备注：</th>
				<td colspan="3"><input class="input-text" type="text" name="visitorNote" value="<?php echo ($travelInfo["visitorNote"]); ?>"/></td>
				<th>地接名称：</th>
				<td><input class="input-text" type="text" name="agency" value="<?php echo ($travelInfo["agency"]); ?>" placeholder="地接或专线名称"/></td>
			</tr>
			<tr>
				<th>地接负责人：</th>
				<td><input class="input-text" type="text" name="agencyLinkman" value="<?php echo ($travelInfo["agencyLinkman"]); ?>"/></td>
				<th>地接联系电话：</th>
				<td><input class="input-text" type="text" name="agencyPhone" value="<?php echo ($travelInfo["agencyPhone"]); ?>"/></td>
				<th>地接结算方式：</th>
				<td>
					<select name="payType" id="payType" class="input-text">
						<option value="0">请选择</option>
						<option value="1">总部系统</option>
						<option value="2">月结</option>
						<option value="3">周结</option>
						<option value="4">现结</option>
						<option value="4">其它</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>客人来源：</th>
				<td>
					<select name="source" id="source" class="input-text">
						<option value="0">请选择</option>
						<option value="1">携程</option>
						<option value="2">美团</option>
						<option value="3">糯米</option>
						<option value="4">窝窝</option>
						<option value="5">点评</option>
						<option value="6">去哪儿</option>
						<option value="7">途牛</option>
						<option value="8">拉手</option>
						<option value="9">内部网站</option>
						<option value="10">其它</option>
					</select>
				</td>
				<th>网站订单号：</th>
				<td><input class="input-text" type="text" name="orderCode" value="<?php echo ($travelInfo["orderCode"]); ?>" placeholder="网站订单号或券号验证码等"/></td>
				<th>收据号：</th>
				<td><input class="input-text" type="text" name="receiptId" value="<?php echo ($travelInfo["receiptId"]); ?>"/></td>
			</tr>
			<tr>
				<th>合同号：</th>
				<td><input class="input-text" type="text" name="contractId" value="<?php echo ($travelInfo["contractId"]); ?>" placeholder="针对上系统"/></td>
				<th>系统号：</th>
				<td><input class="input-text" type="text" name="systemId" value="<?php echo ($travelInfo["systemId"]); ?>" placeholder="针对上系统"/></td>
				<th>保险总金额：</th>
				<td><input class="input-text" type="text" name="insurance" value="<?php echo ($travelInfo["insurance"]); ?>"/></td>
			</tr>

			<tr>
				<th>内部备注：</th>
				<td colspan="5"><input class="input-text" type="text" name="remark" value="<?php echo ($travelInfo["remark"]); ?>"/></td>
			</tr>
		</table>
	</div>
	<div style="width:300px; margin:30px auto 0">
		<button id="add" style="margin-left: 10px;" class="btn btn-success radius" type="button">+&nbsp;加一个旅客</button>
		<button id="del" style="margin-left: 10px;" class="btn btn-primary radius" type="button">-&nbsp;减一个旅客</button>
	</div>
	<table id="addVisitors" class="table table-border table-bordered table-hover" style="margin:10px auto 0; <?php if($travelInfo['lineType'] == 4){ echo 'width:1200px';}else{echo 'width:940px';}?>">
		<?php
 if ($member) { $content = ''; if ($travelInfo['lineType'] == 4) { $content .= '<tr><th style="text-align: center;">真实名字</th>'. '<th style="text-align: center;">电话</th>' . '<th style="text-align: center;">身份证号</th>' . '<th style="text-align: center;">上车地点</th>' . '<th style="text-align: center;">出生年月日</th>' . '<th style="text-align: center;">出生地</th>' . '<th style="text-align: center;">签发地</th>' . '<th style="text-align: center;">收客价</th>' . '<th style="text-align: center;">网站结算价</th>' . '<th style="text-align: center;">地接结算价</th></tr>'; foreach ($member as $list) { $content .= '<tr><td style="width: 100px"><input type="hidden" name="memberid[]" value="'.$list['id'].'"/><input class="input-text" type="text" name="trueName[]" value="'.$list['trueName'].'"/></td>'. '<td style="width: 120px"><input class="input-text" type="text" name="phone[]" value="'.$list['phone'].'"/></td>'. '<td style="width: 180px"><input class="input-text" type="text" name="idNumber[]" placeholder="身份证或护照号，通行证号" value="'.$list['idNumber'].'"/></td>'. '<td><input class="input-text" type="text" name="musterAddr[]" value="'.$list['musterAddr'].'"/></td>'. '<td style="width: 90px"><input class="input-text" type="text" name="birthDate[]" value="'.$list['birthDate'].'"/></td>'. '<td style="width: 60px"><input class="input-text" type="text" name="birthAddr[]" value="'.$list['birthAddr'].'"/></td>'. '<td style="width: 60px"><input class="input-text" type="text" name="signAddr[]" value="'.$list['signAddr'].'"/></td>'. '<td style="width: 60px"><input class="input-text" type="text" name="payPrice[]" value="'.$list['payPrice'].'"/></td>'. '<td style="width: 60px"><input class="input-text" type="text" name="settlementPrice[]" value="'.$list['settlementPrice'].'"/></td>'. '<td style="width: 60px"><input class="input-text" type="text" name="agencyPrice[]" value="'.$list['agencyPrice'].'"/></td></tr>'; } } else { $content .= '<tr><th style="text-align: center;">真实名字</th>'. '<th style="text-align: center;">电话</th>' . '<th style="text-align: center;">身份证号</th>' . '<th style="text-align: center;">上车地点</th>' . '<th style="text-align: center;">收客价</th>' . '<th style="text-align: center;">网站结算价</th>' . '<th style="text-align: center;">地接结算价</th></tr>'; foreach ($member as $list) { $content .= '<tr><td style="width: 100px"><input type="hidden" name="memberid[]" value="'.$list['id'].'"/><input class="input-text" type="text" name="trueName[]" value="'.$list['trueName'].'"/></td>'. '<td style="width: 120px"><input class="input-text" type="text" name="phone[]" value="'.$list['phone'].'"/></td>'. '<td style="width: 180px"><input class="input-text" type="text" name="idNumber[]" placeholder="身份证或护照号，通行证号" value="'.$list['idNumber'].'"/></td>'. '<td><input class="input-text" type="text" name="musterAddr[]" value="'.$list['musterAddr'].'"/></td>'. '<td style="width: 60px"><input class="input-text" type="text" name="payPrice[]" value="'.$list['payPrice'].'"/></td>'. '<td style="width: 60px"><input class="input-text" type="text" name="settlementPrice[]" value="'.$list['settlementPrice'].'"/></td>'. '<td style="width: 60px"><input class="input-text" type="text" name="agencyPrice[]" value="'.$list['agencyPrice'].'"/></td></tr>'; } } echo $content; } else { } ?>
	</table>
	<div style="width:300px; margin:40px auto 60px">
		<button name="" style="margin-left: 10px; width:110px" class="btn btn-success radius" type="submit">修&nbsp;&nbsp;改</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button style="margin-left: -10px; width:110px" class="cal btn btn-primary radius" type="button">取&nbsp;&nbsp;消</button>
	</div>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var payType = <?php echo ($travelInfo["payType"]); ?>;
	var lineType = <?php echo ($travelInfo["lineType"]); ?>;
	var source = <?php echo ($travelInfo["source"]); ?>;
	$('#lineType option[value='+lineType+']').attr('selected','selected');
	$('#payType option[value='+payType+']').attr('selected','selected');
	$('#source option[value='+source+']').attr('selected','selected');
	});
</script>

<script type="text/javascript">

	$('.cal').click(function(){
		window.location.href = '/Admin/TravelInfo/travelinfo';
	})

	var lineType = '<?php echo ($travelInfo["lineType"]); ?>';
	// 判断线路类型是否是港澳台
	$("#lineType").change(function(){
		var changetype = $("#lineType").val();
		if (lineType == 4) {
			if (changetype != 4) {
				$("#addVisitors").empty();
			}
		} else {
			if (changetype == 4) {
				$("#addVisitors").empty();
			}
		}
		lineType = changetype;
	})

	// 加旅客
	$("#add").click(function(){
		var num = $("#visitorNum").val();
		lineType = $("#lineType").val();
		var count = $("#addVisitors tr").length;
		if (count > num) {
			return false;
		}
		var content = '';
		if (lineType == 4) { //港澳台
			$("#addVisitors").width(1200);
			if (count == 0) {
				content += '<tr><th style="text-align: center;">真实名字</th>' +
						'<th style="text-align: center;">电话</th>' +
						'<th style="text-align: center;">身份证号</th>' +
						'<th style="text-align: center;">上车地点</th>' +
						'<th style="text-align: center;">出生年月日</th>' +
						'<th style="text-align: center;">出生地</th>' +
						'<th style="text-align: center;">签发地</th>' +
						'<th style="text-align: center;">收客价</th>' +
						'<th style="text-align: center;">网站结算价</th>' +
						'<th style="text-align: center;">地接结算价</th></tr>';
			}
			content += '<tr><td style="width: 100px"><input class="input-text" type="text" name="trueName[]"/></td>' +
					'<td style="width: 120px"><input class="input-text" type="text" name="phone[]"/></td>' +
					'<td style="width: 180px"><input class="input-text" type="text" name="idNumber[]" placeholder="身份证或护照号，通行证号"/></td>' +
					'<td><input class="input-text" type="text" name="musterAddr[]"/></td>' +
					'<td style="width: 90px"><input class="input-text" type="text" name="birthDate[]" /></td>' +
					'<td style="width: 60px"><input class="input-text" type="text" name="birthAddr[]"/></td>' +
					'<td style="width: 60px"><input class="input-text" type="text" name="signAddr[]"/></td>' +
					'<td style="width: 60px"><input class="input-text" type="text" name="payPrice[]"/></td>' +
					'<td style="width: 60px"><input class="input-text" type="text" name="settlementPrice[]"/></td>' +
					'<td style="width: 60px"><input class="input-text" type="text" name="agencyPrice[]"/></td></tr>';
		} else {
			$("#addVisitors").width(940);
			if (count == 0) {
				content += '<tr><th style="text-align: center;">真实名字</th>' +
						'<th style="text-align: center;">电话</th>' +
						'<th style="text-align: center;">身份证号</th>' +
						'<th style="text-align: center;">上车地点</th>' +
						'<th style="text-align: center;">收客价</th>' +
						'<th style="text-align: center;">网站结算价</th>' +
						'<th style="text-align: center;">地接结算价</th></tr>';
			}
			content += '<tr><td style="width: 100px"><input class="input-text" type="text" name="trueName[]"/></td>' +
					'<td style="width: 120px"><input class="input-text" type="text" name="phone[]"/></td>' +
					'<td style="width: 180px"><input class="input-text" type="text" name="idNumber[]" placeholder="身份证或护照号，通行证号"/></td>' +
					'<td><input class="input-text" type="text" name="musterAddr[]"/></td>' +
					'<td style="width: 60px"><input class="input-text" type="text" name="payPrice[]"/></td>' +
					'<td style="width: 60px"><input class="input-text" type="text" name="settlementPrice[]"/></td>' +
					'<td style="width: 60px"><input class="input-text" type="text" name="agencyPrice[]"/></td></tr>';

		}

		$("#addVisitors").append(content);
	})

	// 删旅客
	$("#del").click(function(){
		$("#addVisitors tr").last().remove();
	})


</script>
</body>
</html>