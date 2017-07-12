// 自适应改变html font字体大小,使使用rem单位进行页面自适应移动终端
(function () {
  var resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize';
  var recalc = function () {
    var clientWidth = document.body.clientWidth;
    if(!clientWidth){
      return;
    }
    document.documentElement.style.fontSize = 10 * (clientWidth/375)+ 'px';
    document.documentElement.style.visibility = 'visible';
  }
  if(!document.documentElement.addEventListener){
    return;
  }
  window.addEventListener(resizeEvt,recalc,false);
  window.addEventListener('DOMContentLoaded',recalc,false);
})();


//写入公共js
document.writeln('<script src="/web/js/common/config.js"><\/script>');
document.writeln('<script src="/web/js/common/jquery.min.js"><\/script>');
document.writeln('<script src="/web/js/common/jquery.cookie.js"><\/script>');
document.writeln('<script src="/web/js/common/doT.min.js"><\/script>');
// document.writeln('<script src="/web/js/common/common.js"><\/script>');
document.writeln('<script src="/web/js/common/function.js"><\/script>');
document.writeln('<script src="http://cdn.bootcss.com/less.js/1.7.0/less.min.js"><\/script>');
