<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>出游列表</title>
    

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

    <style>
        .th-bg td{
            font-weight: bold;
            background-color: #f5fafe;
            text-align: center;
        }
    </style>
</head>
<body>
<nav class="breadcrumb div-table">
    <i class="Hui-iconfont">&#xe625;</i> 出游登记
    <span class="c-gray en">&gt;</span> 出游列表
    <a class="btn btn-success radius " style="line-height:1.6em;margin-left: 40px;"
       href="/Admin/TravelInfo/travelinfo" title="刷新">
        <i class="Hui-iconfont"></i>
    </a>
</nav>


<input type="hidden" value="1" name="nowpage"/>

<form action="/Admin/TravelInfo/travelinfo" method="get" id="form">
<div class="page-container"  style="padding-bottom: 0">
    <div class="pd-10">
        出发起始日期:&nbsp;
        <input type="text" name="startDate1" class="Wdate input-text" value="<?php echo ($startDate1); ?>" style="width: 190px;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        出发截止日期：
       &nbsp;
        <input type="text" name="startDate2" class="Wdate input-text" value="<?php echo ($startDate2); ?>" style="width: 190px;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
       &nbsp;&nbsp;&nbsp;&nbsp;
        线路名称：&nbsp;
        <input  type="text" name="lineName" class="input-text" style="width: 350px;" value="<?php echo ($lineName); ?>" placeholder="可输入线路关键字查询"/>
    </div>
    <div class="pd-10">
        领队名字：&nbsp;
        <input  type="text" name="trueName" class="input-text" style="width: 130px;" value="<?php echo ($trueName); ?>" placeholder="可输入关键字查询"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        客人类型：&nbsp;
        <select name="visitorType" class="input-text"  style="width: 90px">
            <option value="0">请选择</option>
            <option value="1">散客</option>
            <option value="2">包团</option>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;
        线路类型：&nbsp;
            <select name="lineType" class="input-text"  style="width: 90px">
                <option value="0">请选择</option>
                <option value="1">周边</option>
                <option value="2">国内</option>
                <option value="3">出境</option>
                <option value="4">港澳台</option>
            </select>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <?php if($_SESSION['adminDept']== '2'): ?>OP：&nbsp;
            <select name="op" class="input-text"  style="width: 90px">
                <option value="0">请选择</option>
                <?php if(is_array($admin)): foreach($admin as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>"><?php echo ($v["name"]); ?></option><?php endforeach; endif; ?>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;<?php endif; ?>
        <button name="" style="margin-left: 50px" class="btn btn-success radius" type="submit"><i class="Hui-iconfont">&#xe665;</i>&nbsp;查询</button>
    </div>
</div>
</form>

<div style="width: 2800px; margin-left: 20px;margin-top: 20px;margin-bottom: 50px;" class="div-table">
    <p style="margin-left: 10px;margin-top: 10px">默认显示本月登记的记录<a class="btn btn-warning radius size-S" id="button1" style="margin-left: 50px">展开隐藏的列</a></p>
    <table class="table table-border table-bordered table-hover table-bg">
        <thead>
        <tr class="text-c th-bg">
            <td class="aa">客人类型</td>
            <td class="aa">线路类型</td>
            <td>线路名称</td>
            <td>出游日期</td>
            <td>参团人数</td>
            <td>领队</td>
            <td>真实姓名</td>
            <td>电话</td>
            <td>证件号码</td>
            <td>上车地点</td>
            <td>导游代收</td>
            <td>出游备注</td>
            <td class="aa">出生年月日</td>
            <td class="aa">出生地</td>
            <td class="aa">签发地</td>
            <td class="aa">定金</td>
            <td class="aa">网站来源</td>
            <td class="aa">订单号/券号/验证码</td>
            <td>收客价</td>
            <td>网站结算价</td>
            <td class="aa">地接/专线名称</td>
            <td class="aa">地接负责人</td>
            <td class="aa">地接联系方式</td>
            <td>地接结算价</td>
            <td class="aa">结算方式</td>
            <td class="aa">合同号</td>
            <td class="aa">系统号</td>
            <td class="aa">收据号</td>
            <td class="aa">备注/说明</td>
            <td>保险金额</td>
            <td>利润</td>
            <td class="aa">登记时间</td>
            <?php if($_SESSION['adminDept']== '2'): ?><td colspan="2">OP</td>
            <?php else: ?>
                <td colspan="2">操作</td><?php endif; ?>
        </tr>
        </thead>
        <tbody>
        <?php if(!empty($lists)): if(is_array($lists)): foreach($lists as $key=>$list): ?><tr>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" class="aa">
                            <?php switch($list["visitorType"]): case "1": ?>散客<?php break;?>
                                <?php case "2": ?>包团<?php break; endswitch;?>
                        </td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" class="aa">
                            <?php switch($list["lineType"]): case "1": ?>周边<?php break;?>
                                <?php case "2": ?>国内<?php break;?>
                                <?php case "3": ?>出境<?php break;?>
                                <?php case "4": ?>港澳台<?php break; endswitch;?>
                        </td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>"><?php echo ($list["lineName"]); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" style="width: 70px"><?php echo (date("Y-m-d",$list["startDate"])); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>"><?php echo ($list["visitorNum"]); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>"><?php echo ($list["trueName"]); ?></td><?php endif; ?>
                    <td><?php echo ($list["trueName"]); ?></td>
                    <td><?php echo ($list["phone"]); ?></td>
                    <td><?php echo ($list["idNumber"]); ?></td>
                    <td><?php echo ($list["musterAddr"]); ?></td>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>"><?php echo (floatval($list["guideCollection"])); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" style="width: 90px"><?php echo ($list["visitorNote"]); ?></td><?php endif; ?>
                    <td class="aa"><?php echo ($list["birthDate"]); ?></td>
                    <td class="aa"><?php echo ($list["birthAddr"]); ?></td>
                    <td class="aa"><?php echo ($list["signAddr"]); ?></td>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" class="aa"><?php echo (floatval($list["deposit"])); ?></td><?php endif; ?>
                    <td class="aa">
                        <?php switch($list["source"]): case "1": ?>携程<?php break;?>
                            <?php case "2": ?>美团<?php break;?>
                            <?php case "3": ?>糯米<?php break;?>
                            <?php case "4": ?>窝窝<?php break;?>
                            <?php case "5": ?>点评<?php break;?>
                            <?php case "6": ?>去哪儿<?php break;?>
                            <?php case "7": ?>途牛<?php break;?>
                            <?php case "8": ?>拉手<?php break;?>
                            <?php case "9": ?>内部网站<?php break;?>
                            <?php case "10": ?>其它<?php break; endswitch;?>
                    </td>
                    <td class="aa"><?php echo ($list["orderCode"]); ?></td>
                    <td><?php echo (floatval($list["payPrice"])); ?></td>
                    <td><?php echo (floatval($list["settlementPrice"])); ?></td>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" class="aa"><?php echo ($list["agency"]); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" class="aa"><?php echo ($list["agencyLinkman"]); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" class="aa"><?php echo ($list["agencyPhone"]); ?></td><?php endif; ?>
                    <td><?php echo (floatval($list["agencyPrice"])); ?></td>

                    <?php if($list["ifLeader"] == 1): ?><td class="aa" rowspan="<?php echo ($list["sum"]); ?>">
                            <?php switch($list["payType"]): case "1": ?>总部系统<?php break;?>
                                <?php case "2": ?>月结<?php break;?>
                                <?php case "3": ?>周结<?php break;?>
                                <?php case "4": ?>现结<?php break;?>
                                <?php case "5": ?>其它<?php break; endswitch;?>
                        </td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td class="aa" rowspan="<?php echo ($list["sum"]); ?>"><?php echo ($list["contractId"]); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td class="aa" rowspan="<?php echo ($list["sum"]); ?>"><?php echo ($list["systemId"]); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td class="aa" rowspan="<?php echo ($list["sum"]); ?>"><?php echo ($list["receiptId"]); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td class="aa" rowspan="<?php echo ($list["sum"]); ?>"><?php echo ($list["remark"]); ?></td><?php endif; ?>
                    <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>"><?php echo (floatval($list["insurance"])); ?></td><?php endif; ?>
                    <td><?php echo ($list["profit"]); ?></td>
                    <?php if($list["ifLeader"] == 1): ?><td class="aa" rowspan="<?php echo ($list["sum"]); ?>"><?php echo (date("Y-m-d H:i:s",$list["time"])); ?></td><?php endif; ?>
                    <?php if($_SESSION['adminDept']== '2'): ?><td><?php echo ($list["adminName"]); ?></td>
                    <?php else: ?>
                        <?php if($list["ifLeader"] == 1): ?><td rowspan="<?php echo ($list["sum"]); ?>" style="text-align: center">
                                <a href="/index.php/Admin/TravelInfo/modifyinfo/iid/<?php echo ($list["iid"]); ?>"><span class="label label-secondary radius">修改</span></a>&nbsp;
                                <a href="javascript:void(0)" onclick="del('<?php echo ($list["iid"]); ?>')"><span class="label label-warning radius">删除</span></a>
                            </td><?php endif; endif; ?>
                </tr><?php endforeach; endif; ?>
            <tr>
                <td colspan="33" style="text-align: right;">
                    <div class="f-l"><span class="l" style="margin-top: 6px;font-size: 14px">共有数据：<strong><?php echo ($count); ?></strong> 条，当前第&nbsp;<?php echo ($nowpage); ?>&nbsp;页，共&nbsp;<?php echo ($pages); ?>&nbsp;页</span></div>
                    <div class="f-l" id="laypage" style="margin-left: 150px;"></div>
                </td>
            </tr>
        <?php else: ?>
            <tr>
                <td colspan="33">
                    <div style="text-align:left"><span style="color: red">抱歉，没有找到相关数据哟~</span></div>
                </td>
            </tr><?php endif; ?>
        </tbody>
    </table>

</div>


<script>
        $('.aa').hide();
        $('.div-table').width(1350);
        var flag = 0;
        $("#button1").click(function(){
            if (flag == 0) {
                $('.div-table').width(2800);
                flag = 1;
                $("#button1").empty();
                $("#button1").append('隐藏部分列');
            } else {
                $('.div-table').width(1350);
                flag = 0;
                $("#button1").empty();
                $("#button1").append('展开隐藏的列');
            }
            $('.aa').toggle(0); //设置为0表示不用动画 ，1000就1秒的时间来展示或者隐藏
        });

    // 删除客人
    function del(id) {
        layer.confirm(
            '确定要删除吗？',
            {btn: ['确定','取消']},
            function(){
                var url = "/Admin/TravelInfo/del";
                $.get(url, {id:id}, function(data){
                    if(data) {
                        layer.msg('删除成功', {time:5000});
                        location.reload();
                    } else {
                        layer.msg('删除失败');
                    }
                })
            }
        )
    }

</script>

</body>
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
</html>