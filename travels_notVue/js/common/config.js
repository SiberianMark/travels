var config={
	SERVER_URL:"http://hyu2594430001.my3w.com",//服务器地址
	JSONMETHOD: 'get',//JSON默认请求方式
	PLATFORM:'web',//默认平台
	TIMEOUT :30000,//超时时间为30秒

}


var API={//后台数据API
	INDEX_SWIPER:'/Home/APITravel/slide',//首页轮播图
	INDEX_INFO:'/Home/APITravel/web_info',//首页信息
	INDEX_PLATE:'/Home/APITravel/plate',//首页栏目
	INDEX_LINESELECT:'/Home/APITravel/first_lineselect',//精品路线选择
	INDEX_LINESELECT1:'/Home/APITravel/first_tag1',//精品路线选项1
	INDEX_LINESELECT2:'/Home/APITravel/first_tag2',//精品路线选项2
	INDEX_LINESELECT3:'/Home/APITravel/first_lineselect',//精品路线选项2

	LOGIN_LOGIN:'/Home/APILogin/login',//登录
	LOGIN_REG:'/Home/APILogin/reg',//注册
	LOGIN_VALIDATE:'/validate.php',//图形验证码
	LOGIN_PHONEVAL:'/Home/APILogin/sendCode',//手机验证码
	LOGIN_FINDPSW:'/Home/APILogin/findPasswd',//找回密码
	SEARCH_HOT_PLACE:'/Home/APITravel/hot_search',//搜索热门目的地
}
var PAGE={//页面路由
	index:'./index.html',//首页
	login:'./login.html',//登录页面
	regist            :'./register.html',//注册页面
	forgetPSW:'./find-psw.html',//忘记密码
	mycenter:'./mycenter.html',//我的个人中心
	searchresult:'./search-result.html',//查找结果
	search:'./search.html',//搜索页面
}
