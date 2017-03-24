<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>编辑线路-费用包含</title>
    

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
    <style>
        .bar {
            width: 65em;
            height: 3em;
            border-bottom: 1px solid #0053AA;
        }
        .bar .bar_list{
            float: left;
            border: 1px solid #0053AA;
            border-top-left-radius: 0.25em;
            border-top-right-radius: 0.25em;
            border-bottom: 0 solid #0053AA;
            margin-right: 0.25em;
            line-height:3em;
            cursor: pointer;
        }
        .bar .bar_list .bar_link{
            display: inline-block;
            padding-left: 1em;
            padding-right: 1em;
            font-size: 1em;
            color: #0053AA;
            text-decoration:none;
        }
        .bar .bar_list .bar_link:hover{
            font-weight: 700;
        }
        .current{
            font-weight: 700;
            background-color: #d1d3d5;
        }
        .Huifold .item h4 {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 线路管理 <span class="c-gray en">&gt;</span> 编辑线路 </nav>
<div class="mt-20 ml-40" >
    <ul class="bar ml-20">
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/base_info/id/<?php echo ($lineid); ?>">基本信息</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/line_image/id/<?php echo ($lineid); ?>">轮播图</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/line_journey/id/<?php echo ($lineid); ?>">行程介绍</a></li>
        <li class="bar_list current"><a class="bar_link" href="/Admin/Line/money_include/id/<?php echo ($lineid); ?>">费用包含</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/not_include/id/<?php echo ($lineid); ?>">费用不含</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/notice/id/<?php echo ($lineid); ?>">预订须知</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/reference/id/<?php echo ($lineid); ?>">推荐活动</a></li>
        <li class="bar_list"><a class="bar_link" href="/Admin/Line/time_price/id/<?php echo ($lineid); ?>">团期价格</a></li>
    </ul>
    <div class="mt-20 mb-40 ml-20">
        <span class="ml-20" style="font-size: 16px">线路编号：<?php echo ($lineid); ?></span>
        <form action="/Admin/Line/money_include?ac=edit" method="post">
            <input type="hidden" name="id" value="<?php echo ($lineid); ?>"/>
            <table class="table table-border table-bordered table-hover" style="width: 57em">
                <tr>
                    <th class="text-r">交通：</th>
                    <td>
                        <p>
                            <input type="checkbox" name="plane" value="1" style="zoom:120%;"/>
                            <select name="plane_type">
                                <option value="往返">往返</option>
                                <option value="去程">去程</option>
                                <option value="回程">回程</option>
                                <option value="中间段">中间段</option>
                            </select>
                            <input name="plane_fee" style="border:0;width: 440px" readonly="readonly" value="经济舱机票（团队机票将统一出票，散客机票因实时计价预订后即刻出票）"/>
                        </p>
                        <p>
                            <input type="checkbox" name="train" value="1" style="zoom:120%;"/>
                            <select name="train_type">
                                <option value="往返">往返</option>
                                <option value="去程">去程</option>
                                <option value="回程">回程</option>
                                <option value="中间段">中间段</option>
                            </select>
                            <input name="train_fee" style="border:0;width: 44px" readonly="readonly" value="火车票"/>
                            <select name="train_seat_type">
                                <option value="">------</option>
                                <option value="动车二等座">动车二等座</option>
                                <option value="动车一等座">动车一等座</option>
                                <option value="高铁二等座">高铁二等座</option>
                                <option value="高铁一等座">高铁一等座</option>
                                <option value="硬座">硬座</option>
                                <option value="软座">软座</option>
                                <option value="硬卧">硬卧</option>
                                <option value="软卧">软卧</option>
                            </select>
                        </p>
                        <p>
                            <input type="checkbox" name="bus" value="1" style="zoom:120%;"/>
                            <select name="bus_type">
                                <option value="往返">往返</option>
                                <option value="去程">去程</option>
                                <option value="返程">返程</option>
                                <option value="全程">全程</option>
                            </select>
                            <input name="bus_fee" style="border:0;width: 52px" readonly="readonly" value="旅游巴士"/>
                        </p>
                        <p>
                            <input type="checkbox" name="local_bus" value="1" style="zoom:120%;"/>
                            <input name="local_bus_fee" style="border:0;width: 300px" readonly="readonly" value="当地旅游巴士"/>
                        </p>
                        <p>
                            <input type="checkbox" name="ship" value="1" style="zoom:120%;"/>
                            <select name="ship_type">
                                <option value="往返">往返</option>
                                <option value="去程">去程</option>
                                <option value="返程">返程</option>
                                <option value="全程">全程</option>
                            </select>
                            <input name="ship_fee" style="border:0;width: 30px" readonly="readonly" value="船票"/>，
                            <input type="text" name="ship_note" placeholder="可在这里注明具体的航线信息" value="<?php echo ($include["traffic"]["ship_note"]); ?>" style="width: 250px" />
                        </p>
                        <p>
                            <input type="checkbox" name="traffic_other" value="1" style="zoom:120%;"/>
                            <input type="text" name="traffic_other1" placeholder="如有补充信息请在这里注明" value="<?php echo ($include["traffic"]["traffic_other1"]); ?>" style="width: 250px" />
                        </p>
                        <p>
                            <input type="checkbox" name="united_plane" value="1" style="zoom:120%;"/>
                            <input name="united_plane_fee" style="border:0;width: 300px" readonly="readonly" value="往返出发地到出行集合地的联运航班机票"/>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="text-r">小交通：</th>
                    <td>
                        <p>
                            <input type="checkbox" name="scenic" value="1" style="zoom:120%;"/>
                            <input name="scenic_fee" style="border:0;width: 68px" readonly="readonly" value="景区内用车"/>，
                            <input type="text" name="scenic_note" placeholder="可在这里注明具体信息" value="<?php echo ($include["small_traffic"]["scenic_note"]); ?>" style="width: 250px" />
                        </p>
                        <p>
                            <input type="checkbox" name="shuttle" value="1" style="zoom:120%;"/>
                            <input type="text" name="shuttle_where" placeholder="某地到某地..." value="<?php echo ($include["small_traffic"]["shuttle_where"]); ?>" style="width: 250px" />
                            <input name="shuttle_fee" style="border:0;width: 28px" readonly="readonly" value="机场"/>
                            <select name="shuttle_type">
                                <option value="往返接送">往返接送</option>
                                <option value="去程送机">去程送机</option>
                                <option value="回程接机">回程接机</option>
                            </select>
                            <input name="shuttle_service" style="border:0;width: 28px" readonly="readonly" value="服务"/>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="text-r">住宿：</th>
                    <td>
                        <p>
                            <input type="checkbox" name="hotel" value="1" style="zoom:120%;"/>
                            <input name="hotel_fee" style="border:0;width: 100px" readonly="readonly" value="行程所列酒店费用"/>
                        </p>
                        <p>
                            <input type="checkbox" name="hotel1" value="1" style="zoom:120%;"/>
                            <input type="text" name="hotel_note" placeholder="如有补充信息请在这里注明" value="<?php echo ($include["hotel"]["hotel_note"]); ?>" style="width: 250px" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="text-r">用餐：</th>
                    <td>
                        <p>
                            <input type="checkbox" name="food" value="1" style="zoom:120%;"/>
                            <input name="food_fee" style="border:0;width: 100px" readonly="readonly" value="行程所列餐食"/>
                        </p>
                        <p>
                            <input type="checkbox" name="food1" value="1" style="zoom:120%;"/>
                            <input type="text" name="food_note" placeholder="如有补充信息请在这里注明" value="<?php echo ($include["food"]["food_note"]); ?>" style="width: 500px" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="text-r">门票：</th>
                    <td>
                        <p>
                            <input type="checkbox" name="ticket" value="1" style="zoom:120%;"/>
                            <input name="ticket_fee" style="border:0;width: 148px" readonly="readonly" value="行程中所列景点首道大门票"/>，
                            <input type="text" name="ticket_note" style="width: 300px" placeholder="例如注明:园中园门票、电瓶车费用自理" value="<?php echo ($include["ticket"]["ticket_note"]); ?>" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="text-r">导服：</th>
                    <td>
                        <p>
                            <input type="checkbox" name="service1" value="1" style="zoom:120%;"/>
                            <input name="service1_fee" style="border:0;width: 140px" readonly="readonly" value="全陪和当地中文导游服务"/>
                        </p>
                        <p>
                            <input type="checkbox" name="service2" value="1" style="zoom:120%;"/>
                            <input name="service2_fee" style="border:0;width: 140px" readonly="readonly" value="全程陪同中文导游服务"/>
                        </p>
                        <p>
                            <input type="checkbox" name="service3" value="1" style="zoom:120%;"/>
                            <input name="service3_fee" style="border:0;width: 120px" readonly="readonly" value="当地中文导游服务"/>
                        </p>
                        <p>
                            <input type="checkbox" name="service4" value="1" style="zoom:120%;"/>
                            <input type="text" name="service4_fee" placeholder="不是以上选项或补充信息请在这里注明" value="<?php echo ($include["service"]["service4_fee"]); ?>" style="width: 300px" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="text-r">保险：</th>
                    <td>
                        <p>
                            <input type="checkbox" name="insurance" value="1" style="zoom:120%;"/>
                            <input type="text" name="insurance_fee" placeholder="如有含保险信息请在这里注明" value="<?php echo ($include["insurance"]["insurance_fee"]); ?>" style="width: 500px" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="text-r">其它费用：</th>
                    <td>
                        <p style="float: left;height:70px;line-height: 70px">
                            <input type="checkbox" name="other" value="1" style="zoom:120%;"/>
                        </p>
                        <p style="float: left">
                            <textarea name="other_fee" rows="5" cols="90" placeholder="费用中已经包含的其它税费描述"><?php echo ($include["other"]["other_fee"]); ?></textarea>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th class="text-r">儿童价标准：</th>
                    <td>
                        <p>
                            <input type="radio" name="child" value="1" style="zoom:120%;"/>
                            <input name="age" style="border:0;width: 28px" readonly="readonly" value="年龄"/>
                            <input type="text" name="age_min" value="<?php echo ($include["child"]["age_min"]); ?>" style="width: 50px" />
                            <input name="age1" style="border:0;width: 12px" readonly="readonly" value="~"/>
                            <input type="text" name="age_max" value="<?php echo ($include["child"]["age_max"]); ?>" style="width: 50px" />
                            <input name="age2" style="border:0;width: 84px" readonly="readonly" value="周岁（不含），"/>
                            <select name="age_type">
                                <option value="不占床">不占床</option>
                                <option value="占床">占床</option>
                            </select>
                            <input style="border:0;width: 12px" readonly="readonly" value="，"/>
                            <input type="text" name="age_note" placeholder="是否包含大交通，门票，用餐等请注明" value="<?php echo ($include["child"]["age_note"]); ?>" style="width: 300px" />
                        </p>
                        <p>
                            <input type="radio" name="child" value="2" style="zoom:120%;"/>
                            <input name="height" style="border:0;width: 28px" readonly="readonly" value="身高"/>
                            <input type="text" name="height_min" value="<?php echo ($include["child"]["height_min"]); ?>" style="width: 50px" />
                            <input name="height1" style="border:0;width: 12px" readonly="readonly" value="~"/>
                            <input type="text" name="height_max" value="<?php echo ($include["child"]["height_max"]); ?>" style="width: 50px" />
                            <input name="height2" style="border:0;width: 60px" readonly="readonly" value="米（含），"/>
                            <select name="height_type">
                                <option value="不占床">不占床</option>
                                <option value="占床">占床</option>
                            </select>
                            <input style="border:0;width: 12px" readonly="readonly" value="，"/>
                            <input type="text" name="height_note" placeholder="是否包含大交通，门票，用餐等请注明" value="<?php echo ($include["child"]["height_note"]); ?>" style="width: 300px" />
                        </p>
                        <p>
                            <input type="radio" name="child" value="3" style="zoom:120%;"/>
                            <input style="border:0;width: 100px" readonly="readonly" value="儿童价特殊说明"/>
                        </p>
                        <p>
                            <textarea name="child_note" rows="5" cols="90"><?php echo ($include["child"]["child_note"]); ?></textarea>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-c">
                        <input class="btn btn-success radius" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;&nbsp;">
                    </td>
                </tr>
            </table>
            </form>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("input[name='plane'][value='<?php echo ($include["traffic"]["plane"]); ?>']").attr('checked', 'true');
        $("select[name='plane_type'] option[value='<?php echo ($include["traffic"]["plane_type"]); ?>']").attr("selected", "selected");
        $("input[name='train'][value='<?php echo ($include["traffic"]["train"]); ?>']").attr('checked', 'true');
        $("select[name='train_type'] option[value='<?php echo ($include["traffic"]["train_type"]); ?>']").attr("selected", "selected");
        $("select[name='train_seat_type'] option[value='<?php echo ($include["traffic"]["train_seat_type"]); ?>']").attr("selected", "selected");
        $("input[name='bus'][value='<?php echo ($include["traffic"]["bus"]); ?>']").attr('checked', 'true');
        $("select[name='bus_type'] option[value='<?php echo ($include["traffic"]["bus_type"]); ?>']").attr("selected", "selected");
        $("input[name='local_bus'][value='<?php echo ($include["traffic"]["local_bus"]); ?>']").attr('checked', 'true');
        $("input[name='ship'][value='<?php echo ($include["traffic"]["ship"]); ?>']").attr('checked', 'true');
        $("select[name='ship_type'] option[value='<?php echo ($include["traffic"]["ship_type"]); ?>']").attr("selected", "selected");
        $("input[name='traffic_other'][value='<?php echo ($include["traffic"]["traffic_other"]); ?>']").attr('checked', 'true');
        $("input[name='united_plane'][value='<?php echo ($include["traffic"]["united_plane"]); ?>']").attr('checked', 'true');

        $("input[name='scenic'][value='<?php echo ($include["small_traffic"]["scenic"]); ?>']").attr('checked', 'true');
        $("input[name='shuttle'][value='<?php echo ($include["small_traffic"]["shuttle"]); ?>']").attr('checked', 'true');
        $("select[name='shuttle_type'] option[value='<?php echo ($include["small_traffic"]["shuttle_type"]); ?>']").attr("selected", "selected");

        $("input[name='hotel'][value='<?php echo ($include["hotel"]["hotel"]); ?>']").attr('checked', 'true');
        $("input[name='hotel1'][value='<?php echo ($include["hotel"]["hotel1"]); ?>']").attr('checked', 'true');

        $("input[name='food'][value='<?php echo ($include["food"]["food"]); ?>']").attr('checked', 'true');
        $("input[name='food1'][value='<?php echo ($include["food"]["food1"]); ?>']").attr('checked', 'true');

        $("input[name='ticket'][value='<?php echo ($include["ticket"]["ticket"]); ?>']").attr('checked', 'true');

        $("input[name='service1'][value='<?php echo ($include["service"]["service1"]); ?>']").attr('checked', 'true');
        $("input[name='service2'][value='<?php echo ($include["service"]["service2"]); ?>']").attr('checked', 'true');
        $("input[name='service3'][value='<?php echo ($include["service"]["service3"]); ?>']").attr('checked', 'true');
        $("input[name='service4'][value='<?php echo ($include["service"]["service4"]); ?>']").attr('checked', 'true');

        $("input[name='insurance'][value='<?php echo ($include["insurance"]["insurance"]); ?>']").attr('checked', 'true');

        $("input[name='other'][value='<?php echo ($include["other"]["other"]); ?>']").attr('checked', 'true');

        $("input[name='child'][value='<?php echo ($include["child"]["child"]); ?>']").attr('checked', 'true');
        $("select[name='age_type'] option[value='<?php echo ($include["child"]["age_type"]); ?>']").attr("selected", "selected");
        $("select[name='height_type'] option[value='<?php echo ($include["child"]["height_type"]); ?>']").attr("selected", "selected");
    })

</script>

</body>
</html>