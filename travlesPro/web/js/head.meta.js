


//写入公共meta
//设置浏览器窗口大小适配不同屏幕尺寸
document.writeln('<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no"/>');
//设置渲染引擎匹配,提高兼容性<!-- 如果安装了GCF,则使用GCF来渲染页面.如果未安装GCF,则使用最高版本的IE内核进行渲染.
document.writeln('<meta http-equiv="X-UA-Compatible" content="IE=edge chrome=1"/>');
document.writeln('<meta name="renderer" content="webkit">');

//允许iphone全屏模式浏览
document.writeln('<meta content="yes" name="apple-mobile-web-app-capable" />');

//iPhone在web app应用下状态条（屏幕顶部条）的颜色
document.writeln('<meta content="black" name="apple-mobile-web-app-status-bar-style"/>');

//忽略将数字作为电话号码
document.writeln('<meta content="telephone=no" name="format-detection"> ');

//设置浏览器缓存，不缓存
document.writeln('<meta http-equiv="Cache-Control" content="no-transform" />');
document.writeln('<meta http-equiv="Cache-Control" content="no-siteapp"/>');