<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>供应商列表</title>
    

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

</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 供应商管理 <span class="c-gray en">&gt;</span> 供应商列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<form action="/Admin/Supplier/lists" method="get">
    <div class="page-container" style="padding-bottom: 0">
        <div class="pd-10">
            供应商公司名字:&nbsp;
            <input type="text" name="company_name" style="width: 8em;" class="input-text" value="<?php echo ($company_name); ?>" placeholder="关键字或者全称"/>
            &nbsp;&nbsp;老板手机号码:&nbsp;
            <input type="text" name="boss_phone" style="width: 8em;" class="input-text" value="<?php echo ($boss_phone); ?>" placeholder="关键字或者全号"/>
            &nbsp;&nbsp;供应商评价等级:&nbsp;
            <select name="score" class="input-text" style="width: 6em">
                <option value="-1" id="allType">请选择</option>
                <option value="0" <?php if($score==='0') echo "selected";?>>一般</option>
                <option value="1" <?php if($score==1) echo "selected";?>>较好</option>
                <option value="2" <?php if($score==2) echo "selected";?>>较弱</option>
            </select>&nbsp;&nbsp;
            供应商主打线路类型:&nbsp;
            <select name="type" class="input-text" style="width: 6em">
                <option value="0">请选择</option>
                <option value="1" <?php if($type==1) echo "selected";?>>周边</option>
                <option value="2" <?php if($type==2) echo "selected";?>>国内</option>
                <option value="3" <?php if($type==3) echo "selected";?>>出境</option>
                <option value="4" <?php if($type==4) echo "selected";?>>港澳台</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;
            供应商状态:&nbsp;
            <select name="status" class="input-text" style="width: 6em">
                <option value="-1">请选择</option>
                <option value="0" <?php if($status==='0') echo "selected";?>>启用</option>
                <option value="1" <?php if($status==1) echo "selected";?>>已停用</option>
                <option value="2" <?php if($status==2) echo "selected";?>>已删除</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i>
                查询
            </button>
        </div>
    </div>
</form>

<input type="hidden" value="1" name="nowpage"/>

<div class="page-container">
    <div class="cl pd-5 mt-5"> <span class="l"><a href="/Admin/Supplier/addSupplier" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加供应商</a></span> </div>
    <div class="mt-10">
        <table class="table table-border table-bordered table-hover table-bg" >
            <thead>
            <tr>
                <th style="text-align: center">ID</th>
                <th style="text-align: center">供应商名字</th>
                <th style="text-align: center">公司地址</th>
                <th style="text-align: center">老板名字</th>
                <th style="text-align: center">公司座机</th>
                <th style="text-align: center">老板手机号码</th>
                <th style="text-align: center">老板微信号码</th>
                <th style="text-align: center">老板QQ号码</th>
                <th style="text-align: center">公司介绍</th>
                <th style="text-align: center">主打线路类型</th>
                <th style="text-align: center">主打目的地</th>
                <th style="text-align: center">评分等级</th>
                <th style="text-align: center">状态</th>
                <th style="text-align: center">添加时间</th>
                <th style="text-align: center">操作</th>
            </tr>
            </thead>
            <?php if($lists): if(is_array($lists)): $k = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><tr class="list">
                        <td><?php echo ($vo["id"]); ?></td>
                        <td><?php echo ($vo["company_name"]); ?></td>
                        <td><?php echo ($vo["addr"]); ?></td>
                        <td><?php echo ($vo["boss"]); ?></td>
                        <td><?php echo ($vo["tel"]); ?></td>
                        <td><?php echo ($vo["boss_phone"]); ?></td>
                        <td><?php echo ($vo["boss_wx"]); ?></td>
                        <td><?php echo ($vo["boss_qq"]); ?></td>
                        <td><?php echo ($vo["note"]); ?></td>
                        <td>
                            <?php switch($vo["type"]): case "1": ?>周边<?php break;?>
                                <?php case "2": ?>国内<?php break;?>
                                <?php case "3": ?>出境<?php break;?>
                                <?php case "4": ?>港澳台<?php break; endswitch;?>
                        </td>
                        <td><?php echo ($vo["place"]); ?></td>
                        <td>
                            <?php switch($vo["score"]): case "0": ?>一般<?php break;?>
                                <?php case "1": ?>较好<?php break;?>
                                <?php case "2": ?>较弱<?php break; endswitch;?>
                        </td>
                        <td>
                            <?php switch($vo["status"]): case "0": ?><span class="label label-success radius">启用</span><?php break;?>
                                <?php case "1": ?><span class="label label-warning radius">已停用</span><?php break;?>
                                <?php case "2": ?><span class="label label-default radius">已删除</span><?php break; endswitch;?>
                        </td>
                        <td><?php echo ($vo["addtime"]); ?></td>
                        <td>
                            <a href="/Admin/Supplier/view/id/<?php echo ($vo["id"]); ?>"><span class="label label-success radius">查看</span></a>&nbsp;
                            <a href="/Admin/Supplier/editSupplier/id/<?php echo ($vo["id"]); ?>"><span class="label label-secondary radius">编辑</span></a>&nbsp;
                        </td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <tr>
                    <td colspan="33" style="text-align: right">
                        <span class="l" style="margin-top: 4px;font-size: 14px">共有数据：<strong><?php echo ($count); ?></strong> 条，当前第&nbsp;<?php echo ($nowpage); ?>&nbsp;页，共&nbsp;<?php echo ($pages); ?>&nbsp;页</span>
                        <p style="float:right;margin-bottom: 0px;" id="laypage" style="text-align: right"><div id="laypage"></div></p>
                    </td>
                </tr>
            <?php else: ?>
                <tr >
                    <td colspan="11">
                        <div style="text-align:center"><span>抱歉，没有找到相关数据。</span></div>
                    </td>
                </tr><?php endif; ?>
        </table>
    </div>
</div>

</body>
</html>
<script type="text/javascript">




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
    function url(hint)
    {
        $('#remove').val(hint);
        $('#frm').submit();
    }

</script>