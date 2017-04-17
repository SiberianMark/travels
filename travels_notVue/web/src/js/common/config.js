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
	INDEX_LINESELECT1:'/Home/APITravel/first_tag1',//精品路线选择一级菜单
	INDEX_LINESELECT2:'/Home/APITravel/first_tag2',//精品路线选择二级菜单
	INDEX_LINESELECT3:'/Home/APITravel/first_lineselect',//精品路线选择二级菜单

	PLATE_SLIDE:'/Home/APITravel/plate_slide',//板块轮播图
	AREA_LINESELECT1:'/Home/APITravel/plate_tag1',//板块路线选择一级菜单
	AREA_LINESELECT2:'/Home/APITravel/first_tag2',//板块路线选择一级菜单
	AREA_LINESELECT3:'/Home/APITravel/plate_lines',//板块路线选择一级菜单


	LOGIN_LOGIN:'/Home/APILogin/login',//登录
	LOGIN_LOGOUT:'/Home/APILogin/loginOut',//退出登录
	LOGIN_REG:'/Home/APILogin/reg',//注册
	LOGIN_VALIDATE:'/validate.php',//图形验证码
	LOGIN_PHONEVAL:'/Home/APILogin/sendCode',//手机验证码
	LOGIN_FINDPSW:'/Home/APILogin/findPasswd',//找回密码
	SEARCH_HOT_PLACE:'/Home/APITravel/hot_search',//搜索热门目的地
	AREA_HOT_PLACE:'/Home/APITravel/hot_place',//板块热门目的地

	MY_CENTER:'/Home/APILogin/member_center',//我的个人中心
	MY_INFO:'/Home/APILogin/personal_info',//我的信息
	CHANGEPSW:'/Home/APILogin/changePasswd',//修改密码

	SEARCH_RESULT:'/Home/APITravel/search',//搜索结果
	SEARCH_LABEL:'/Home/APITravel/search_label',//搜索标签

	GOOD_LINE_DETAIL:'/Home/APILine/line',//线路详情
	GUESS_YOU_LIKE:'/Home/APITravel/guess_like',//猜您喜欢 	

	GOOD_DATE_PRICE:'/Home/APILine/line_date',//线路日期对应价格
	CREATE_ORDER:'/Home/APILine/create_order',//创建订单
	PRICE_DETAILS:'/Home/APILine/money_detail',//费用说明

}
var PAGE={//页面路由
	index:config.SERVER_URL,//首页
	login:'/web/login.html',//登录页面
	regist:'/web/register.html',//注册页面
	forgetPSW:'/web/find-psw.html',//忘记密码
	mycenter:'/web/mycenter.html',//我的个人中心
	searchresult:'/web/search-result.html',//查找结果
	search:'/web/search.html',//搜索页面
	myinfo:'/web/myinfo.html',//我的信息
	changepsw:'/web/changepsw.html',//修改密码
	//goodDetail:'/web/goodinfo.html',//路线详情
	goodDetail:'/web/line.html',//路线详情
	determinorder:'/web/determin-order.html',//订单确认页面
	orderresult:'/web/order-result.html',//下订单结果
	areatravel:'/web/areatravel.html',//区域游


}
