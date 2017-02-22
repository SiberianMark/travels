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
document.writeln('<script src="./assets/js/common/jquery.min.js?v=2.4.0"><\/script>');
document.writeln('<script src="./src/assets/js/common/common.js?v=2.4.0"><\/script>');
document.writeln('<script src="./src/assets/js/common/function.js?v=2.4.0"><\/script>');