<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="telephone=no" name="format-detection" />
<meta name="apple-touch-fullscreen" content="yes">
<meta>
<title>享拍旅行</title>
<script type="text/javascript" src="http://cdn.xiangpailvxing.com/Wap/js/seft-depation.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.xiangpailvxing.com/Wap/css/reset.css">
<link rel="stylesheet" type="text/css" href="http://cdn.xiangpailvxing.com/Wap/css/style.css">
<link rel="stylesheet" type="text/css" href="http://cdn.xiangpailvxing.com/Wap/css/common.css">
</head>
<body>
<header class="header-top"><a class="go-back" href="javascript:window.history.go(-1);"><i></i></a>尊享三线
  <a class="member-menu">
    <span></span>
  </a>
</header>
<!-- mene -->
<div class="menu-main">
    <span></span>
    <ul>
        <li><a href="/"><i></i>首页</a></li>
        <li><a href="/User/User/"><i></i>我的享拍</a></li>
        <?php if($userId == 0): ?><li><a href="/User/Login/"><i></i>登录/注册</a></li>
        <?php else: ?>
        <li><a href="/User/Login/logout"><i></i>退出</a></li><?php endif; ?>
    </ul>
</div>
<div class="all-black"></div>

<div class="main">
<div class="threeline" style="padding-top: 0.8rem;">
  <div class="threeline-main">
    <ul>
      <?php if(is_array($subs)): foreach($subs as $key=>$sub): ?><li>
        <div class="line-img"><a href="/Event/Index/detail/<?php echo ($sub["id"]); ?>?app"><img src="<?php echo ($sub["image"]); ?>"><span><?php echo ($sub["name"]); ?></span></a></div>
        <div class="line-date">
            <h5>出发日期丨最近三期</h5>
            <?php if(is_array($sub['prices'])): foreach($sub['prices'] as $key=>$price): ?><span><?php echo ($price["day"]); ?></span><?php endforeach; endif; ?>
        </div>
      </li><?php endforeach; endif; ?>    
    </ul>
</div>
<div class="Holiday-desc">
  <p class="textindent">本产品的价格不适用于泰国泼水节，中国国庆节假期，中国春节春运期间及中国各大节假日,如需以上期间出行价格会有所上调，详情敬请咨询客服；(请查看本套餐底部的<b class="red">假日说明</b>)</p>
  <section class="Holiday">
    <details>
      <summary><h4>假日说明<i>&nbsp;</i></h4></summary>
      <div class="introduce-con">
        <p class="textweight">一、中国假期：</p>
        <p>春节（春运期为春节前后各30天范围内）</p>
        <p>五一劳动节（5.1前后各14天范围内）</p>
        <p>暑假（7月至8月）</p>
        <p>中秋节（中秋节前后各14天范围内）</p>
        <p>国庆节（国庆节前后各14天范围内）</p>
        <p>寒假（1月-2月）</p>
        <p class="textweight">二 、泰国2016年假期</p>
        <p>1月1-3日泰国元旦节NewYear’sEve&NewYear’sDay</p>
        <p>3月7日万佛节MakhaPuja</p>
        <p>4月6日查理克王朝纪念日ChakriDay</p>
        <p>4月13-17日泼水节Songkran-WaterFestival</p>
        <p>5月5日泰王登基纪念日</p>
        <p>6月4日浴佛节VisakaBucha</p>
        <p>8月3日守夏节Vassa,BuddhistLentDay</p>
        <p>8月13日母亲节Mother’sDay</p>
        <p>11月28日水灯节LoyKrathong</p>
        <p>12月5日父亲节Father’sDay</p>
        <p class="textweight">三、东南亚区域2016年法定假日</p>
        <p>1月1日 中华民国开国纪念日(元旦) 1912年 孙中山于南京成立中华民国，放假一天</p>
        <p>2月28日 和平纪念日 纪念1947年(民国三十六年)二二八事件，放假一天</p>
        <p>3月12日 国父逝世纪念日</p>
        <p>3月29日 革命先烈纪念日</p>
        <p>4月5日清明节气 清明节 民俗节日，也是民族扫墓节，中枢春祭; </p>
        <p>5月1日 国际劳动节 </p>
        <p>农历正月初一 春节 即农历新年，民俗节日，放假3天</p>
        <p>农历五月初五 端午节 </p>
        <p>农历八月十五 中秋节</p>
        <p>农历腊月三十 除夕</p>
      </div>
    </details>  
  </section>
</div>
</div>
</div>
<div class="buy-now">
  <a href="/User/Order/index/<?php echo ($eventId); ?>">立即购买</a>
</div>

<!-- <div class="prom-download">
    <div class="download-desc"><i></i><span>下载享拍旅行APP<br>最高送1000元优惠券</span></div>
    <div class="download-now-btn"><a href="<?php echo ($url); ?>">免费下载</a><b></b></div>
</div> -->

<script type="text/javascript" src="http://cdn.xiangpailvxing.com/Wap/js/zepto.js"></script>
<script type="text/javascript" src="http://cdn.xiangpailvxing.com/Wap/js/full-black.js"></script>
<script type="text/javascript">
$(".Holiday h4").each(function(){
    $(this).click(function(){
        $(this).find("i").toggleClass("rotate");
    })
});
$(".download-now-btn").click(function(){
    $(".buy-now").addClass("btm");
    $(".prom-download").hide();
})
</script>
</body>
</html>