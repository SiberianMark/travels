<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="telephone=no" name="format-detection" />
<meta name="apple-touch-fullscreen" content="yes">
<meta>
<title>手机端</title>


</head>
<body>


<h4>手机</h4>


<script type="text/javascript" src="/Public/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    var url = "/Home/User/index";
    $.get(url, {phone:'13425157493'}, function(data){
       alert(data.data.password);
    })
})



</script>
</body>
</html>