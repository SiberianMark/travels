(function () {
	var resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize';
	var recalc = function () {
		var clientWidth = document.body.clientWidth;
		if(!clientWidth){
			return;
		}
		document.documentElement.style.fontSize = 10 * (clientWidth/320)+ 'px';
		document.documentElement.style.visibility = 'visible';
	}
	if(!document.documentElement.addEventListener){
		return;
	}
	window.addEventListener(resizeEvt,recalc,false);
	window.addEventListener('DOMContentLoaded',recalc,false);
})();
document.writeln("<script src='/web/assets/js/jquery.min.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/jweixin-1.0.0.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/jquery.cookie.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/config/host.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/config.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/function.js?v=2.4.1'><\/script>");
document.writeln("<script src='/web/assets/js/goto.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/process_goto.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/common.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/doT.min.js?v=2.4.0'><\/script>");
document.writeln("<script src='/web/assets/js/dotdee.1.0.js?v=2.4.0'><\/script>");
document.writeln('<link rel="stylesheet" type="text/css" href="/web/assets/css/dotdee.1.0.css">');

var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?718e6d6cf60bd5ad2dae6ba2aa44653e";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);
})();