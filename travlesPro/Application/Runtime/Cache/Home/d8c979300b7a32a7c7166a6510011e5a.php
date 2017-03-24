<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="telephone=no" name="format-detection" />
<meta name="apple-touch-fullscreen" content="yes">
<meta>
<title>手机端</title>
<script type="text/javascript" src="http://cdn.xiangpailvxing.com/Wap/js/seft-depation.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.xiangpailvxing.com/Wap/css/reset.css">
<link rel="stylesheet" type="text/css" href="http://cdn.xiangpailvxing.com/Wap/css/style.css">
<link rel="stylesheet" type="text/css" href="http://cdn.xiangpailvxing.com/Wap/css/common.css">
</head>
<body>

<!-- mene -->

<h4>手机</h4>

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