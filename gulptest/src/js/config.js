/**
 * 公共配置文件
 */

var DEBUG = 0; //1开启调试模式
var TIMEOUT = 30000; //超时时间 30秒
var EXPIRE = 1800000; //缓存有效期 30分钟
var METHOD = 'get';  //网络请求方式
var WxShare = new Object();  //分享对象
var CLREAR_COPY=true;//屏蔽页面复制内容

var API = {
    'RECENG_URL': RECENG_URL,  //资讯详情
    'SERVER_URL': SERVER_URL,  //服务器url
    'APP_LICATION': 'gold/',  //项目名
    'APPID': '1',
    'PLATFORM': 'web',
    'VERSION': '1.0',
    'API_LIST': {  //api接口列表
        'API_USER_PERSONRANK':'api4/user/personRank',//会员详情
        'GET_NOW':'seckill/getNow',//获取服务器时间
        'GIFT_SHARE_INFO': 'public/giftShare', //礼物攻略分享
        'GIFT_BAGSHARE_INFO': 'public/giftBagShare',//礼包攻略分享
        'INDEX_BANLER': 'index/getBanner',//点嘀生活广告接口
        'INDEX_BANLER_CLICK': 'index/hitsNum',//点嘀生活广告接口点击统计
        'INDEX_SUBJECT_HITS': 'index/subjectHits',//点嘀生活首页栏目点击统计
        'BOSS_BRANDINFO': 'boss/brandInfo',//进入店铺-店铺详情
        'DISTRIBUTION_BRANDINFO': 'distribution/brandInfo',//分享进入店铺-店铺详情
        'DISTRIBUTION_GOODSINFO': 'distribution/goodsInfo',//分享进入商品详情//////////////////////////////////////////////////////////////////////////////
        'BOSS_BRAND': 'boss/brand',//进入店铺-店铺商品列表
        'WECHAT_JSSDK': 'public/jssdk', //微信JS-SDK配置接口
        'PUBLIC_CONFIG': 'public/config', //获取配置参数
        'LOGIN_WEChAT': 'user/login',  //微信授权、用户登录 (APP拦截)
        'LOGIN_USER': 'user/is_login',//判断用户是否登录
        //'WECHAT_SHARE' : 'wechat/share',  //分享信息 (APP拦截)
        'DISTRIBUTION_SHARECODE': 'distribution/sharecode',   //二维码分享 (APP拦截)
        'WECHAT_SHARE': 'distribution/iframe',  //分享信息 (APP拦截)
        'ORDER_ORDERPAY': 'order/orderpay',  //确认支付 (APP拦截)
        'CART_GETCARTINFO': 'cart/getCartInfo', //获取购物车信息
        'CART_ADDTOCART': 'cart/addToCart',  //加入购物车
        'GIFT_GETGIFTL': 'gift/getGiftLists',  //收到的礼物-订单列表
        'GIFT_RECEIVE': 'gift/getGiftDetail',	//物流信息
        'USER_BROKERAGE': 'circle/myprofit',  //佣金
        'CART_CHANGEGOODS': 'cart/changeCartGoods', //修改购物车
        'CART_DELGOODS': 'cart/delCartGoods',			 //删除购物车商品
        'GIFT_CONFIRM_ORDER': 'gift/confirmOrder',  //确认礼物收货
        'GIFT_LOGISTIC_DTLS': 'gift/logisticsDetails',  //物流详情接口
        'SHOW_MESSAGE': 'circle/profitDetail', //收益明细
        'GIFT_GETTHEGIFT': 'gift/getTheGift',  //领取礼物页面接口
        'GIFT_THEINDEX_GIFT': 'gift/theIndexGift',  //领取礼物按钮跳转页面接口
        'GIFT_CONFIRM_GIFT': 'gift/confirmGift',  //领取确认接口
        'USER_GET_ADDRESSLIST': 'user/getAddressList',  //收货地址列表接口
        'USER_ADDADDRESS': 'user/addAddress',  //添加、编辑、删除收货接口
        'MALL_HOME_SHARE': 'public/homeShare', //点嘀生活分享信息
        'SMDD_HOME_SHARE': 'gold/home/HomeShare', //神马集市分享信息
        'INDEX_GET_COLUMNLIST': 'index/getColumnList',  //点嘀生活首页栏目列表接口
        'DETAILS_CATEGORY':'Gold/index/getProductList',//点嘀生活分类栏目详情列表接口
        'INDEX_GET_SUBJECTLIST': 'index/getSubjectList',  //点嘀生活首页专题列表接口
        'INDEX_GET_SUBJECTPRODUCTLIST': 'index/getSubjectProductList', //专题列表
        'INDEX_GET_GOODSLISTS': 'index/getGoodsLists',  //点嘀生活栏目商品列表页面接口////////////////////////////////////////////////////////////////
        'INDEX_GET_PRODUCTSLISTS': 'index/getProductsLists',  //点嘀生活栏目商品列表页面接口////////////////////////////////////////////////////////////
        'INDEX_SUB_COLUMNHITS': 'index/columnHits',//点嘀生活栏目点击次数统计
        'GET_SUBJECT_PRODUCT':'gold/index/getSubjectProduct',//点嘀生活主题活动接口
        'GET_ACTIVITYS':'gold/index/getActivitys',//点嘀生活4个广告位接口
        'FAMILY_FANS': 'circle/myfamily',	//家族粉丝
        'PHONE_NUMBER': 'public/sms', //手机验证码
        'GOODS_MESSAGE': 'boss/goods',  //商品详情 //////////////////////////////////////////////////////////////////////////////////////////
        'WEIXIN_SPREAD': 'circle/spreadBrand',	//微信推广
        'SHOP_DETAIL': 'circle/getshops',	//查看所有店铺
        'SHOP_QRCODE': 'distribution/qrcode',	//店铺二维码生成
        'SHOP_SHARE': 'circle/spreadGoods',	//店铺推广分享
        'GOODS_SEND': 'gift/sendGiftLists', //送出礼物
        'GIFT_SEND': 'gift/sendGiftDetail',		 //送出礼物详情
        'GOODS_ADDRESS': 'user/addAddress',  //设置收货地址
        'ORDER_SENDGIFT': 'order/sendGift',	//送出礼物接口
        'CIRCLE_ORDER': 'circle/getorders',  // 订单列表///////////////////////////////////////////////////////////////////////////////////////////
        'CIRCLEBOSS_ORDER': '/Gold/boss/orderList',  // boss版本订单列表
        'BING_PHONE': 'login/ajaxbinding',		//绑定手机
        'GIFT_GETDETAIL': 'gift/getDetail',	//已领取跳转详情页面接口
        'DELE_ORDER': 'circle/delorder', 	//删除定单
        'CANCEL_ORDER': 'circle/cancleorder',   //取消定单
        'CONFIRM_RECGOODS': 'circle/confirmrecgoods',        //确认收货
        'ORDER_DETAILS': 'circle/orderInfo',		//订单详情
        'ORDERBOSS_DETAILS': '/Gold/boss/orderDetail',		//boss版 订单详情
        'ORDER_CONFIRM': 'order/confirm',  //确认订单
        'ORDER_CREATEORDER': 'order/createorder',  //生成订单
        'ORDER_GETORDERNO': 'order/getOrderNo',  //获取订单号
        'CHANNELPOINT_GETEXCHANGEINFO':'ChannelPoint/get_exchange_info',//用户第三方信息
        'CHANNELPOINT_EXCHANGEPOINT':'ChannelPoint/exchange_point',//确定使用第三方抵扣
        'WXPAY_DOPAY': 'wxpay/dopay',  //获取微信支付参数
        'WXPAY_CHECKORDER': 'wxpay/checkorder',  //检查订单支付状态
        'API4_ORDER_ORDERPAY': 'api4/order/orderpay',  //确认支付
        'PAY_DOPAY': 'api4/pay/dopay',  //统一下单接口
        'GET_PAY_PARAMETER': 'api4/pay/getPayParameter', //获取第三方支付参数
        'PAY_CHECKORDER': 'api4/pay/checkorder',  //检查订单支付状态
        'MONEY_QUERY': 'circle/getgold', //提现接口
        'MONEY_INTO_ACCOUNT': 'circle/intoaccount', //提现金额
        'ADD_GIFY_GREETINGS': 'order/addGifyGreetings',//增加礼物祝福语
        'GET_CROWDFUND': 'crowdfunding/index',	// 获取商品的众筹情况
        'DETAILS_CROWDFUND': 'crowdfunding/detail',	// 获取商品的众筹详情
        'NOTICE_CROWDFUND': '/Gold/Crowdfunding/noticeDetail',  // 众筹公告
        'TOTALSEC_CROWDFUND': 'crowdfunding/mycrowdfunding',	// 获取商品的众筹总金额列表
        'CHECK_CARTGOODSSTOCK': 'cart/checkCartGoodsStock',//检查购物车商品库存状态
        'WECHAT_GET_CODE': 'wechat/getCode',//万人富士康 生成专属二维码
        'WECHAT_GET_CODE_BY_STOTE': 'wechat/getCodeByStore',//万人富士康 生成专属二维码
        'HOTSHOP_GET': 'circle/getshops',	// 热卖店铺
        'ACTIVITY_SPECIAL': 'distribution/index',//活动专题
        'ACTIVITY_GETLIST': 'distribution/getList',//活动列表
        'INDEX_GETSEARCH': 'index/getSearch',//商品，店铺搜索接口
        'INDEX_GETSEARCHHISTORY': 'index/getSearchHistory',//得到搜索历史
        'CLASSIFY_GETLIST': 'Gold/index/getCategoryList',//全部分类列表
        'CLASSIFY_PROLIST': 'gold/index/getproductlist',//产品分类列表
        'BRAND_BRANDLIST': 'distribution/brandlist',//店铺列表
        'SET_DEFAULTADDRESS': 'user/setDefaultAddress',//设置默认收货地址
        'GIFT_N_SUCCESSED': 'gift/giftSucceed',//礼盒领取记录
        'GET_GIFT': 'gift/getTheGift',//领取礼物按钮跳转页面
        'NOTE_GRTNODELIST': 'note/getNoteList',//获取店铺文章列表
        'NOTE': 'note/getNoteDetail',//NOTE
        'NOTE_DO_LIKE': 'note/doLikeNote',//NOTE点赞
        'NOTE_ADD_COMMENT': 'note/addNoteComment',//note评论
        'NOTE_TRANSMIT': 'gold/note/transmit',//NOTE分享记录
        'GET_CROWDFUNDING_LIST': 'boss/getCrowdfundingList',//店铺众筹商品列表
        'GOODS_COMMENT': 'circle/allcomment',// 商品评论
        'GOODS_VIEW_MY_COMMENT': 'circle/viewmycomment',// 查看我的评价
        'GOODS_ENTER_COMMENT': 'circle/enterComment',// 进入商品评价界面
        'GOODS_WRITE_COMMENT': 'circle/comment',// 用户评论商品
        'GOODS_ADD_COMMENT': 'gold/comment/addComment',// 用户追加评论商品
        'BOSS_ORDER_COMMENT': 'boss/bordercomments',// 商户端订单评价
        'BOOS_ALLL_COMMENT': 'boss/ballcomments',// 商户端全部评价
        'BOOS_REPLY_COMMENT': 'boss/breply',// 商户端回复评论
        'SEND_GOODS': 'Gold/order/deliver',//发货接口
        'GET_EXPRESSC_COM': 'Gold/order/getExpressCompany',//发货接口
        'QUOTA_NOTICE': 'gold/note/quota_notice',//红利接口
        'TODAY_RANKING':'Gold/Redpacket/todayRanking',//今日排名
        'MYRED_DETAILS':'Gold/Redpacket/myRedpacketList',// 我的红利
        'RED_DETAILS':'Gold/Redpacket/Redpacket_detail',//红利明细
        'GOLD_NOTE_QUOTAADNOTICE':'gold/note/quota_ad_notice',//訂單紅利彈框
        'RED_HEROLIST':'index.php/Gold/Redpacket/quota_rank',// 红利英雄榜
        'RED_HEROLIST_SHARE':'Gold/Redpacket/share_rank_info',// 红利英雄榜分享
        'RED_YIQIANG':'Gold/Redpacket/get_receive_rp',//已抢(冻结)金额
        'RED_HOME':'Redpacket/myRedpacket',//红利首页
        'RED_SHARE_USER_INFO':'Redpacket/share_user_info',//红利分享用户信息
        'RED_GET_PACKET':'Redpacket/getRedpacket',//红利活动抢红包
        'ACTIVITY_INDEX': 'gold/Activity/index',//平台优惠券
        'ACTIVITY_RECEIVE': 'gold/Activity/receive',//平台优惠券-领取
        'ACTIVITY_MY_COUPON': 'gold/Activity/myCoupon',//我的优惠券
        'ACTIVITY_REG': 'home/reg/reg',//注册用户
        'ACTIVITY_QUERY': 'gold/order/queryActivity',//查询优惠券
        'WINXIN_SHARE':'Redpacket/share',//微信分享
        'USER_MOREINFO':'api4/user/moreinfo',//我的钱包页面信息
        'USER_PAYMENTPWD':'api4/user/paymentpwd',//type=1验证支付密码,type=2修改支付密码,type=6验证密保问题及重置支付密码,type=5设置支付密码及密保问题
        'SERVICE_ORDER': 'api4/order/new_getOrderListByUser',  // 服务订单列表/////////////////////////////////////////////////////////////////////////////////////
        'API_ORDER_VERIFYORDER':'api4/order/verifyOrder',//服务订单-确认服务
        'API_ORDER_ORDERDEL':'api4/order/orderDel',//服务订单-删除订单
        'API_ORDER_CLOSEORDER':'api4/order/closeOrder',//服务订单-取消订单
        'API_ORDER_COMMENT':'api4/order/comment',//服务订单-提交评论
        'API_ORDER_COMMENTPAGE':'api4/order/commentPage',//服务订单-添加评价
        'API_ORDER_SHOWCOMMENT':'api4/order/showComment',//服务订单-查看评价
        'API_ORDER_DIRECTRETURN':'api4/order/orderDirectReturn',//服务订单-即时退款


        //****************************************************************************************//
        //***********************以下是神马学院使用的WEB API接口**********************************//
        //***********************ADD BY 何变 2016-01-06*******************************************//
        //****************************************************************************************//
        'CL_WECHAT_JSSDK': 'college/wechat/jssdk', //微信JS-SDK配置接口
        'CL_LOGIN_WEChAT': 'college/college/login',  //微信授权、用户登录 (APP拦截)
        'CL_UPLOAD_IMG': 'college/wechat/uploadImage',  //上传头像
        'CL_LOGIN_REG': 'college/college/reg',//注册
        'CL_CUR_ACTIVITY_GETLIST': 'college/college/index',//当前活动-活动列表
        'CL_GETREGION': 'college/college/getRegion',//获取区域列表
        'CL_ACTIVITY_DETAILS': 'college/college/detail',//活动详情
        'CL_ACTIVITY_APPLY': 'college/college/apply',//报名活动
        'CL_ACTIVITY_SUBSCIBE': 'college/college/subscibe',//收藏活动（取消收藏）
        'CL_ACTIVITY_REVIEW': 'college/college/review',//活动回顾
        'CL_COURSE': 'college/college/course',//公开课-首页列表type=1,全部公开课type=2,按分类获取公开课type=3,搜索内容获取公开课type=4
        'CL_COURSE_TAG': 'college/college/getCourseTag',//获取课程分类
        'CL_COURSE_DETAILS': 'college/college/getCourseDetail',//课程详情
        'CL_COURSE_LECTOR': 'college/college/getLectorCourse',//讲师课程
        'CL_COURSE_REQUIRES': 'college/college/requires',//课程需求
        'CL_COURSE_LECTORLIST': 'college/college/lectorlist',//讲师介绍
        'CL_MY_INFO': 'college/college/myinfo',//我的（个人信息）
        'CL_MY_ACT': 'college/college/myact',//我参加的活动TYPE=3,我关注的活动TYPE=4
        'CL_QUESTION': 'college/college/question',//常见问题,问题详情需要qid参数
        'CL_ABOUT_US': 'college/college/aboutus',//关于我们

 		//****************************************************************************************//
        //***********************4S店一元购使用的WEB API接口************************************//
        //****************************************************************************************//
        'CAR_ONE_BUY_HOMESHOPLISTS': 'onebuycar/homeShopLists',	//4S店首页数据
		'CAR_ONE_BUY_GETBUYCOUNT': 'onebuycar/getBuyCount',	//获取累计参与人数
		'CAR_ONEBUY_PANICBUYING': 'onebuy/panicbuying',	//最新揭晓，进行中
		'ONEBUYCAR_ARTICLELISTS':'onebuycar/articleLists',//4s店热门活动列表页
		'ONEBUYCAR_ARTICLEDETAIL':'onebuycar/articleDetail',//4s店热门活动详情页
		'ONEBUYCAR_GETFORM':'onebuycar/getForm',//获取表单
		'ONEBUYCAR_subscribe':'onebuycar/subscribe',//提交表单
        'ONEBUYCAR_GETONEBUYCAR': 'gold/onebuycar/getOneBuyCar',//6-4活动接口
        'ONEBUYCAR_GETONEBUYWEIXIN': 'gold/onebuycar/getByWeiXin',//6-4活动接口
        'ONEBUYCAR_GETONEBUYCall': 'gold/onebuy/getOneBuyCallback',//6-4活动接口
        'CAR_INDEX_BANNER_CLICK':'car/carinfo/incUpkeepAd',//首页广告点击
        //****************************************************************************************//
        //***********************收银员WEB API接口************************************//
        //****************************************************************************************//
        'CHECKSTAND_LOGIN': 'Checkstand/login',//登录
        'CHECKSTAND_DESK': 'Checkstand/cashier_desk',//收银台
        'CHECKSTAND_STATISTICS': 'Checkstand/statistics',//统计
        'CHECKSTAND_BANKMES': 'Checkstand/bankmes',//结款
        'CHECKSTAND_Extract': 'Checkstand/extract',//结款操作
        //****************************************************************************************//
        //***********************以下是一元购使用的WEB API接口************************************//
        //****************************************************************************************//
        'ONE_BUY_HOMESHARE': 'Public/homeShare',
        'ONE_BUY_GETCATEGORYID': 'Onebuy/getCategoryId',	//获取首页推荐分类id
        'ONE_BUY_HOMEPACKGELISTS': 'Onebuy/homePackageLists',	//首页人气专场
        'ONE_BUY_GOODSDETAIL': 'onebuy/goodsDetail',	//发起专场页面数据
        'ONE_BUY_PACKONEBUY': 'onebuy/packOnebuy',	//发起专场操作
        'ONE_BUY_GOODINFO': 'onebuy/goodsInfo',//一元购  最新揭晓商品详情接口
        'LOTTERY_TALLY': 'onebuy/getOnebuyLists',	//所有抢购记录
        'ONE_BUY_GETBUYLIST': 'onebuy/getOneBuyList',//获取单期获奖信息
        'ONE_BUY_ORDER': 'Onebuy/addOnebuyOrder',	//生成一元购订单
        'ONE_BUY_AWARD': 'onebuy/getOnebuyAward',//领取奖品
        'ONE_BUY_SELECTPERIOD': 'onebuy/selectperiod',
        'ONE_BUY_PAYCALLBACK': 'onebuy/payCallback',//支付成功回调
        'ONE_BUY_BASKLIST': 'onebuy/baskList',//晒单列表接口
        'ONE_BUY_GETBASKLIST': 'onebuy/getBaskList',//晒单列表接口
        'ONE_BUY_BASKSHARE': 'onebuy/baskShare',//晒单列表分享接口
        'ONE_BUY_BASKORDER': 'Onebuy/addBaskOrder',//发布晒单接口
        'ONE_BUY_EDITEBASKORDER': 'Onebuy/editeBaskOrder',//发布晒单接口
        'ONEBUY_PANICBUYING': 'onebuy/panicbuying',	//一元购最新揭晓，进行中
        'ONEBUY_GETMYLISTS': 'Onebuy/getMyLists',	//一元购我的记录
        'GET_MYDETAIL': 'onebuy/getMyDetail',	//抢购详情
        'DEPICT_DES': 'onebuy/calculateInfo',	//计算详情
        'ONEBUY_RAFFLENUM': 'onebuy/raffleNum',	//生成一元购订单
        'LOTTERY_COMMENT': 'onebuy/baskCommnets',	//一无抢购 晒单评论
        'SUBMIT_COMMENT': 'onebuy/submitComment',	//一无抢购 晒单提交评论
        'SHARE_DETAILS': 'onebuy/baskdetail',  //一元抢购晒单详情
        'GOOD_COMMENT': 'onebuy/likeBask',  //一元抢购 点赞
        'ONEBUY_EXPLAINSHARE': 'onebuy/explainShare',		//一元拍规则页分享接口
        'ONEBUY_GETNEWINFO': 'onebuy/getNewInfo',	//一元拍最新揭晓倒计时到了调用获取最新信息,id
        'ONEBUY_GETBUYCOUNT': 'onebuy/getBuyCount',	//获取累计参与人数 userid
        'ONEBUY_GETLotterys': 'onebuy/getLotterys',  //获取最新揭晓的数据
        'ONEBUY_AWARDDETAILS': 'onebuy/awardsDetails',//获奖详情接口
        'ONEBUY_PACKALLLIST': 'onebuy/packAllList',  //所有专场的人接口
        'PACKAGE_MYPAGE': 'package/myPage',//个人主页
        'PACKAGE_MYINFO': 'package/myInfo',//个人信息
        'PACKAGE_UPD_IMAGE': 'api4/public/uploadimage',//上传头像
        'PACKAGE_UPDATEMYINFO': 'package/updateMyInfo',//更新信息
        'ONEBUY_PACKRECORD': 'onebuy/packRecord',  //我的专场
        'PACKAGE_INFO': 'package/packageInfo',//专场详情
        'PACKAGE_JOIN': 'package/participants',//专场详情
        'PACKAGE_COMM': 'package/commentList',//专场详情
        'PACKAGE_SUB_COMM': 'package/submitComment',//专场详情
        'ONEBUY_UPD_IMAGE': 'onebuy/uploadBaskImage',//上传图片
        'ONEBUY_GETGOODSCODE': 'package/getGoodsCode',//商品二维码
        'ONEBUY_GET_SHARECODE': 'public/getShareCode',//分享二维码
        'GETNUM_DETAILS': 'Gold/Onebuy/getNumsDetail',//所有抢购码
        'GET_CART_GOOD':'gold/cart/getCartGood',//一折购购物车数量和价格查询
        'ONEBUYCAR_SHAREONEBUY':'onebuycar/shareOneBuy',//车展活动分享二维码
        'ONEBUYCAR_RULE':'Gold/onebuycar/preview',//车展活动规则
        'GOLD_PRIVILEGE_USER_ONE_PRIVILEGE':'gold/privilege/user_one_privilege',//一元拍优惠券


		//用户充值////////////////////////////////////////////////////////////
		'PAY_USERINFO':'api4/user/moreinfo',//用户信息
		'PAY_DKRECHARGE':'api4/pay/dkrecharge',//嘀卡充值
		'PAY_CHECKRECHARGE':'api4/pay/checkrecharge',//确认充值
		'CODE_CHARGE':'api4/user/di_code_exchange',//嘀卡优惠码兑现
		'PURSE_DC':'/api4/user/recharge',//钱包-嘀卡
		'PURSE_MT':'/api4/user/mt',//钱包-马蹄
		'USER_REFERRAL':'/api4/user/referral',//钱包-马蹄
        'PURSE_WALLET':'/api4/user/wallet',//钱包-零钱
        //专属公众号
        'WXPAY_INSPECT':'/gold/pay/inspect',//检查是否支付成功
        'TOP_ACTIVITY': 'gold/extendbenefit/article',//热门文章
        'TUIGUANG_SHOUYI': 'Gold/Extendbenefit/lucresum',//推广收益
        'SHOUZHI_DETAILS': 'Gold/Extendbenefit/paymentDetails',//收支明细
        'MY_PAYMENT': 'Gold/pay/pay_html',//我要支付
        'ORDER_GENERATEORDER': 'Gold/Order/wxOrder',  //APP 生成订单
        'PAY_WEIXIN': 'Gold/pay/orderWxPay',  // 微信支付
        //二维码
        'GET_MYCODE_DIDI':'gold/package/getMyCode',//获取个人二维码.

        //秒杀专区
        'GOLD_SECKILL_GETSECKILLDETAIL':'seckill/getSeckillDetail',//秒杀详情.
        'GOLD_SECKILL_INDEX':'seckill/getSeckill',//秒杀首页
        'GOLD_SECKILL_Rush':'seckill/getSeckillList',//秒杀详情.
        'GOLD_SECKILL_COMMENT':'seckill/getSeckillComment',//秒杀晒单.

        //夺宝活动
        'GOLD_ONEBUY_GETREDNETLIST':'Gold/onebuy/getRednetList',//夺宝首页.
        'GOLD_ONEBUY_PREVIEW':'Gold/onebuy/preview',//夺宝首页.

        //表情包大战
        'GOLD_EXPRESSION_INDEX':'Gold/Expression/index',//首页.
        'GOLD_EXPRESSION_HISTORYLISTS':'Gold/Expression/historyLists',//往期记录.
        'GOLD_EXPRESSION_DETAILLISTS':'Gold/Expression/detailLists',//支持详情列表.
        'GOLD_EXPRESSION_GETREDNETLIST':'Gold/expression/getRednetList',//兑换列表.
        'GOLD_EXPRESSION_ADDEXPRESSIONPRDER':'Gold/Expression/addExpressionOrder',//订单生成.
        'GOLD_EXPRESSION_PUBLISHEDEXPRESSION':'Gold/expression/publishedExpression',//获取开奖状态.
        'GOLD_EXPRESSION_GETTOTAL':'Gold/Expression/getTotal',//当期参与人数.
        'GOLD_EXPRESSION_SUPPORT':'gold/expression/supportRecordLists',//当期参与人数.
        'GOLD_EXPRESSION_NOTICE':'Gold/Expression/notice',//公告规则页 往后类似图片介绍页可参考共用.
        'GOLD_EXPRESSION_SHARE':'gold/expression/expressionShare',//分享接口.
        'GOLD_EXPRESSION_PUBNUM':'gold/expression/publishedExpressionByNum',//定时开奖.
        'GOLD_EXPRESSION_GETGRADEINFO':'Gold/Expression/getGradeInfo',//抢司机3.0

        //首页改版
        'GOLD_GETINDEXCOLUMN':'onebuy/getIndexColumn',//获取首页导航栏目菜单
        'GOLD_GETINDEXWINS':'onebuy/getIndexWins',//获取首页弹幕
        'GOLD_ONEBUY_NEWCLIST':'onebuy/getOnebuyCategroyList',//获取首页改版栏目列表
        'HAIXIAN_SHARE':'gold/Activity/seaFoodShare',// 炒海鲜页面
        //专属公众号一元拍首页
        'GOLD_ONEBUY_SOURCELSIT':'onebuy/oneBuySourceList',//获取首页商品列表

        //千人技师
        //'ORDER_READY':'gold/Tech/User/userOrderList',//客户端订单列表

        //极速激情宝马嘉年华
        'GOLD_HOME_QACTIVITY':'gold/home/queryActivity',//查询签到信息
        'GOLD_HOME_ADDSIGNIN':'gold/home/addSignin',//提交签到信息
        'GOLD_HOME_ADDPRIZE':'gold/home/addPrize',//更新中奖人信息
        'GOLD_HOME_PRIZEINFO':'gold/home/prizeInfo',//显示抽奖人信息

        //商人系统
        'GOLD_AUCTION_LIST':'gold/Auction/bindList',//商人系统首页
        'GOLD_AUCTION_ORDER':'gold/Auction/unbindOrder',//解绑订单生成
        'GOLD_AUCTION_CHANGE':'gold/Auction/changeOption',//解绑
        //***********************************************************//
            //*********** 2016-8 神马生活改版的接口 ***********//
        //***********************************************************//

        //神马假日
        'GOLD_HOME_ACTIVITYUSERJION':'Gold/Home/activityUserJoin',//活动报名名单
        'GOLD_HOME_SIGNUP':'Gold/Wxhome/signUp',//提交报名活动
        'GOLD_HOME_SIGNUPFROM':'/Gold/Wxhome/signUpForm',
        'JINGPIN_TUIJIAN':'gold/home/Boutique',//精品推荐
        'GOLD_HOME_HOLIDAYDETAIL':'Gold/Home/holidayDetail',//神马假日活动详情
        'GOLD_HOME_DOLIKEARTICAL':'Gold/Home/doLikeArticle',//点赞与取消点赞
        'GOLD_HOME_DOCOLLECTARTICAL':'Gold/Home/doCollectArticle',//收藏与取消收藏
        'GOLD_HOME_INTERESTINGDETAIL':'Gold/Home/interestingDetail',//花絮详情
        'GOLD_HOME_COMMENTLIST':'Gold/Home/interestingCommentList',//评论列表
        'GOLD_HOME_SENDCOMMENT':'Gold/Home/submitComment',//提交评论
        'GOLD_HOME_STARCOMMENT':'Gold/star/starComment',//明星详情
        'GOLD_HOME_VOUCHERINFO':'/Gold/Home/activityCertificate',//报名凭证
        'GOLD_HOME_NEEDPAY':'gold/Home/needPayment',//是否需要支付
        'GOLD_HOME_ACTIVITYORDER':'gold/Home/addActivityOrder',//生成报名支付订单
        'HOME_ENTRYRECORD':'Gold/Wxhome/entryRecord',//我的参赛记录

        //神马明星
        'GOLD_STAR_STARLIST':'Gold/star/starList',//明星列表
        'GOLD_STAR_COMMENTLIST':'Gold/star/commentList',//明星评论列表
        'GOLD_STAR_SENDCOMMENT':'Gold/star/comment',//明星提交评论
        'GOLD_STAR_SHOPLIST':'/Gold/star/shopList',//明星店铺列表
        'MYCAR_INFO':'Gold/home/useBrand',//我的车型
        'ACTIVES_LIST':'Gold/home/detail', //当前活动列表
        'PAST_REVIEW':'Gold/Wxhome/review', //往期回顾
        'EVENT_STANDING':'Gold/Wxhome/event_integration', //赛事积分

        //唐币兑换
        'USER_ICON':'/Gold/ChannelPoint/get_exchange_info',//唐币兑换
        'USER_EXCHANGE_MT':'/gold/ChannelPoint/exchange_record',//用户兑换马蹄记录
        'CONFIRM_CHANGE':'/Gold/ChannelPoint/exchange_point',//确认兑换
        'EXCHANGE_RATE':'/Gold/ChannelPoint/exchange_rate',//兑换比例
        //奥运竞猜
        'GOLD_GUESS_INDEX':'Gold/Guess/index',//奥运竞猜首页
        'GOLD_GUESS_ADDGUESSORDER':'gold/guess/addGuessOrder',//生成订单
        'GOLD_GUESS_MYRECORD':'Gold/Guess/myRecord',//我的记录
        'GOLD_GUESS_CHECKREBATE':'gold/guess/checkRebate',//是否返利
        'GOLD_GUESS_ADDREBATE':'gold/guess/addRebate',//确认兑换
        // 中秋活动
        'FIRST_CROWDFUNDING_SENDSHARE':'gold/crowdfunding/FirstShare', //中秋众筹首页
        'GOLD_CROWDFUNDING_SENDSHARE':'gold/crowdfunding/SendShare', //中秋众筹活动页面
        //会员福利
        'LOTTERY_VIPACTIVITY':'/gold/Benefits/index',
        //店铺优惠券
        'SHARE_COUPON':'/gold/privilege/get_privilege_show',
        //优惠券分享
        'COUPON_SHARE':'/gold/privilege/privilege_share',
        //点击领取优惠券
        'GET_COUPON':'/gold/privilege/get_privilege',
        //任务系统
        'GOLD_TASK_LIST':'/gold/novicetask/taskList',
        'GOLD_DAY_DAY_SIGN':'/gold/novicetask/signIn',
        'GOLD_BUY_EXPRESSION':'/gold/novicetask/buyExpression',
        'GOLD_LUCKY_DRAW':'/gold/novicetask/luckyDraw',
        'GOLD_FINISH_INFO':'/gold/novicetask/message',
        'GOLD_INVITE_REGIST':'/gold/novicetask/register',
        'GOLD_SHARE_NOTE':'/gold/novicetask/forward',

        //神马生活改版--我的订单 包含礼物及一般商品订单
        'MY_ORDER':'Gold/Gift/myOrder',
        //神马生活改版--提醒卖家发货
        'GOLD_REMAINDELIVERY':'gold/remain/remaindelivery',
        //神马生活改版--提醒好友
        'GIFT_REMAINDFRIENDS':'gold/gift/remindFriends',
        //神马生活改版--确认领取接口
        'GOLD_GIFT_CONFIRMGIFT':'Gold/gift/confirmGift',
        //神马生活改版--确认收货地址接口
        'GOLD_GIFT_AFFIRM':'Gold/gift/affirm',

        //店铺优惠券--优惠券列表页面
        'USER_PRIVILEGE_LIST':'/gold/privilege/user_privilege_list',
        //店铺优惠券--所有店铺优惠券列表
        'USER_PRIVILEGE':'gold/privilege/user_privilege',


        'REFUNDMENT_TUIKUAN':'Gold/Refund/refundByUser',    //退款详情 编辑内容
        'REFUNDMENT_TUIKUAN_DTLS':'Gold/Refund/refundDetail',   //退款详情 详情内容
        'SUBMIT_REFUND':'Gold/Refund/Submitrefund',     //退款申请 提交内容
        'UPDATE_REFUND':'Gold/Refund/updateRefundAmount',     //修改退款申请 提交功能
        'CANCEL_REFUND':'Gold/Refund/cancelRefund',     //取消退款
        'APPLY_PLATFORM':'Gold/Refund/applicationPlatformIn',   //申请平台介入
        'REPLY_CONTENT_USER':'Gold/Refund/buyerReply',      //买家回复内容
        'USER_SEND_GOODS':'Gold/Refund/confirmRefund',      //买家确认退货
        'REFUND_LOGISTIC_DTLS':'Gold/Refund/logisticsDetails',      //退款物流详情
        'REFUND_GETREFUNDINFO':'/Gold/Refund/getRefundInfo',//用户修改退款申请

        //嘉年华
        'CARNIVAL_PROGRAM_LIST':'/Gold/home/speed',
        //嘉年华首页分享
        'CARNIVAL_HOME_SHARE':'Gold/home/HomeShare/type/7',
        //嘉年华--积分榜
        'CARNIVAL_HOME_SCORELOST':'Gold/Wxhome/scoreList',
        //嘉年华--排行榜
        'CARNIVAL_HOME_RANKLIST':'Gold/Wxhome/rankList',
        //儿童摩托活动首页
        'GOLD_MATCHINDEX':'Gold/Match/matchIndex',
        //儿童摩托编辑和删除接口
        'GOLD_MATCHACTION':'Gold/match/matchAction',

        //***********************************************************//
            //*********** 2016-10-23 宝马双 11.11 零点激情活动 的接口 ***********//
        //***********************************************************//
        //宝马双 11.11 零点激情活动
        'VBERSKY_HOME_SHARE':'Gold/Lowprice/shareBmw',
        //宝马双 11.11 首页开售
        'VBER_HOME_SELL':'gold/carnival/vbHome',
        //宝马双 11.11 宝马店铺列表
        'BWA_BRAND_LIST':'gold/carnival/checkCity',
        //宝马双 11.11 首页开售后的图文详情
        'DETAILS_VBERSKY':'gold/carnival/imgDetails',
        //宝马双 11.11 二维码
        'VBERSKY_CODE_SHARE':'Gold/Onebuycar/shareVber',
        //开抢提醒的状态
        'VBERSKY_ISREMIND':'gold/carnival/isRemind',
        //点击广告接口
        'VBERSKY_AD':'gold/carnival/clickAd',
        //开抢提醒提交
        'VBERSKY_REMIND_SMS':'gold/carnival/remindSms',
        //宝马双 11.11 获取所有4s店铺所在的城市
        'VBERSKY_CITIES':'gold/carnival/cities',
        //宝马双 11.11 获取所在的城市的所有4s店铺
        'VBERSKY_GETSTORESBYCITY':'/gold/carnival/getStoresByCity',
        //宝马双 11.11 零点激情活动 确认订单
        'VBERSKY_CONFIRM':'/gold/carnival/confirm',
        //宝马双 11.11 零点激情活动 生成订单
        'VBERSKY_CREATE_ORDER':'/gold/carnival/createorder',
        //宝马双 11.11 选择车型--商品详情
        'VBERSKY_CREATE_VBDETAIL':'/gold/carnival/vbDetail',
        //宝马双 11.11 选择车型--选择车系
        'VBERSKY_CREATE_VBSELECT':'/gold/carnival/vbSelect',
        //宝马双 11.11 选择车型--选择副商品
        'VBERSKY_CREATE_GOODSSELECT':'/gold/carnival/goodsSelect',
        'VBERSKY_PAYSUCCESS':'/gold/carnival/paySuccess',

        /*** 兑换专区接口* **/
        //领取奖励--确定领奖
        'PASGER_RAFFLES_FETCHRAFFLE':'/Gold/raffles/fetchRaffle',
        //领取奖励--界面信息
        'PASGER_RAFFLES_VIEWRAFFLE':'/Gold/raffles/viewRaffle',
        //抽奖记录
        PASGER_RAFFLES_ADDRAFFLE:'/gold/Raffles/addRaffle',
        //支付结果
        PASGER_RAFFLES_PAYCALLBACK:'/gold/Raffles/payCallback',
        //兑换专区--生产订单
        PASGER_RAFFLES_ADDLOTTERYORDER:'/gold/Raffles/addLotteryOrder',
        //兑换专区--弹幕信息
        PASGER_RAFFLES_WINNINGINFO:'/gold/Raffles/winninginfo',
        //兑换专区--商品信息
        PASGER_RAFFLES_INDEX:'/gold/Raffles/index',
        //兑换专区--广告信息
        PASGER_RAFFLES_INDEXBANNER:'/Gold/Raffles/indexBanner',
        //兑换专区--是否绑定手机
        PASGER_LOWPRICE_ISBIND:'/Gold/Lowprice/isBind',
        //兑换专区--是否中奖
        PASGER_RAFFLES_CHECKOUTWINNER:'/Gold/raffles/checkoutWinner',
        //兑换专区--立即领取分享
        PASGER_RAFFLES_LIKELINK:'/Gold/raffles/likeLink',
        //兑换专区--首页分享
        PASGER_RAFFLES_WXSHARE:'/Gold/raffles/wxShare',
        //一元拍---抢购记录--购买记录
        MYRECORDLIST_INDEX:'/gold/Myrecordlist/index',
        //一元拍---代金劵详情
        PRIVILEGE_PRIVILEGE_ONE_LISE:'/gold/privilege/privilege_one_list',
        //一元拍---领取代金劵
        PRIVILEGE_GET_ONE_PRIVILEGE:'/gold/privilege/get_one_privilege',
        //****************************************************************************************//
        //***********************神马嘀嘀2.4改版************************************//
        //****************************************************************************************//
        //发现频道
        'GOLD_PLAY_MARKETLITS': 'Gold/Play/marketLits',
        //发现分享
        'GOLD_PLAY_INDEXSHARE': 'Gold/Play/getIndexShare',
        //关注与取消关注
        'GOLD_PLAY_DOFOLLOW': '/Gold/Play/doFollow',
        //场地列表
        'RACETRACKS':'Gold/Modulegroup/siteModule',
        //场地列表详情 -- 图文详情
        'GROUPLIST':'Gold/Modulegroup/groupList',
        //我的车库
        'GOLD_MODULEGROUP_GARAGE':'Gold/Modulegroup/garage',
        //场地列表详情
        'RACETRACKS_DETAIL':'Gold/Modulegroup/siteList',
        //场地列表详情 -- 去过人气
        'IS_HVAE_GONE':'Gold/Modulegroup/go_away',
        //竞技列表
        'CONTEST':'Gold/Modulegroup/playModule',
        //竞技视频详情
        'GOLD_SPORTS_GETVIDEOINFO':'gold/Sports/getVideoInfo',
        //文章点赞
        'GOLD_NOTE_DOLIKE':'/Gold/Note/doLikeNote',
        //文章收藏
        'GOLD_NOTE_DOCOLLECT':'gold/note/doCollectNote',
        //文章评论点赞
        'GOLD_NOTE_DOLIKECOMMENT':'/Gold/Note/doLikeNoteComment',
        //评论回复列表
        'GOLD_NOTE_GETCOMMENT':'gold/note/getfeedComment',
        //评论列表
        'GOLD_NOTE_NODEDETAIL':'gold/note/getNoteDetail',
        //资讯详情页推荐
        'CARREC_RE_DETAILREC':'CarRec/api/re/doDetailContent',
        //资讯详情页文章
        'CARREC_RE_DETAILCONTENT':'CarRec/api/re/doDetailContent',
        //TA的尾箱
        'GOLD_BOSS_TAILBOX':'Gold/Boss/tailBox',
        //确认订单
        'CONFIRM_ACTIVITY_PAGE':'Gold/Play/confirmActivityPage',
        //查看个人详情
        'CHECK_USER_INFO':'Gold/Play/checkuserInfo',
        //查看车队
        'GOLD_PLAY_SHOWTEAM':'Gold/Play/showTeam',
        //查看相册
        'ALBUM_SHOW':'Gold/Modulegroup/albumShow',
        //竞技评论列表
        'GOLD_SPORT_COMMENTLIST':'gold/Sports/commentList',
        //添加评论
        'GOLD_NOTE_ADDNOTECOMMENT':'Gold/note/addNoteComment',
        //回复评论
        'GOLD_NOTE_FEEDCOMMENT':'Gold/note/feedComment',
        //邀请好友加入车队
        'GOLD_MODULEGOROUP_JOINTEAM':'Gold/Modulegroup/joinTeam',
        //申请加入车队信息接口
        'GOLD_MODULEGOROUP_USERJOIN':'Gold/Modulegroup/userJoin',
        //车队信息
        'TEAM_LIST':'Gold/Modulegroup/teamList',
        //退出车队
        'RETURN_CAR':'Gold/Modulegroup/return_car',
        //TA发布的文章
        'CHECK_ARTICLE':'Gold/Play/checkArticle',
        //加入车队详情
        'GOLD_MODULEGROUP_JOINLIST':'Gold/Modulegroup/join_list',
        //加入车队
        'GOLD_MODULEFROUP_JOINED':'Gold/Modulegroup/joined_h5',
        //互动首页-获取公告
        'GOLD_HOME_HOME_NOTICE':'gold/home/home_notice',
        //添加车辆
        'GOLD_MODULEFROUP_ADDCAR':'Gold/Modulegroup/addCar',
        //修改默认车辆
        'GOLD_MODULEFROUP_UPDATECAR':'Gold/Modulegroup/update_car',
        //删除车辆
        'APT4_USER_CARFORM':'api4/user/carform',
        //选择城市四级菜单接口
        'APT4_PUBLIC_GETFOURTHADRESS':'Api4/Public/getFourthAdress',
        //报名成功分享页
        'GOLD_HOME_GETSIGNSHARE':'Gold/Home/getSignShare',

        //***********************神马卡牌start************************************//
        'GOLD_COMPETECARD_GIVEMONE':'gold/CompeteCard/giveMoney', //领取卡牌卷
        'GOLD_COMPETECARD_GET_CARD_CURRENCY': '/gold/CompeteCard/get_card_currency',  //新手卷是否付费接口
        'GOLD_COMPETECARD_ADDCURRENCYORDER': '/gold/CompeteCard/addCurrencyOrder',  //新手卷生成付费订单
        'GOLD_COMPETECARD_ADDCARORDER':'gold/CompeteCard/addCardOrder', //生成订单
        'GOLD_COMPETECARD_USERJOINRECORD':'gold/CompeteCard/userJoinRecord', //用户参与记录
        'GOLD_COMPETECARD_PERIODWINDETIAL':'gold/CompeteCard/periodWinDetial', //每期开奖详情
        'GOLD_COMPETECARD_USERRECORDAMOUNT':'gold/CompeteCard/userRecordAmount', //参与记录总数
        'GOLD_COMPETECARD_CARD':'Gold/CompeteCard/card', //卡牌详情
        'GOLD_COMPETECARD_Discount':'gold/CompeteCard/cardUserDiscount', //钱包
        'GOLD_COMPETECARD_HOMENOTICE':'gold/CompeteCard/home_notice', //首页公告
        'GOLD_COMPETECARD_USERJOINNUM':'gold/CompeteCard/userJoinNum', //未揭晓的场次
        'GOLD_COMPETECARD_GETCARDUSER':'gold/CompeteCard/get_card_user', //渲染房间user信息
        //***********************神马卡牌over************************************//
        //挑战最低价获奖列表
        'GOLD_LOWPRICE_MYCHALLENGEWINNING':'Gold/Lowprice/myChallengeWinning',
        //抽奖专区获奖列表
        'GOLD_RAFFLES_RECORDSFFLE':'gold/Raffles/recordsRaffle',
        //咸菜市场购买记录
        'GOLD_TRADINGSTATION_ORDEREDLIST':'Gold/tradingStation/orderedList',
        //抽奖专区参与记录
        'GOLD_RAFFLES_ADDRAFFLE':'gold/Raffles/addRaffle',
        //神马卡牌参与记录
        'GOLD_COMPETECARD_USERJOINRECORD':'gold/CompeteCard/userJoinRecord',
        //挑战最低价参与记录
        'GOLD_LOWPRICE_MYCHALLENGERECORDS':'Gold/Lowprice/myChallengeRecords',
        //表情包大战参与记录
        'GOLD_EXPRESSION_EXPRESSIONUSERRECORD':'gold/Expression/expressionUserRecord',
        //神马竞猜参与记录
        'GOLD_GUESS_MYRECORD':'Gold/Guess/myRecord',
        //个人中心全部获奖记录
        'GOLD_PERSONALCENTER_LUCKYALLINVOLVED':'gold/PersonalCenter/lucky_all_involved',
        //个人中心全部参与记录
        'GOLD_PERSONALCENTER_ALLINVOLVED':'gold/PersonalCenter/all_involved',

        //***********************神马嘀嘀2.4.1start************************************//
        'GOLD_AWARD_RECORD':'/Gold/note/appreciationMyRecord',//我的赞赏记录
        'GOLD_AWARD_APRECIATION':'/Gold/note/appreciation',//赞赏页面数据
        'GOLD_AWARD_APRECIATION_ORDER':'/Gold/note/appreciationArticle',//生成赞赏订单
        'GOLD_AWARD_NOTE_AP_RECORD':'/Gold/note/appreciationRecord',//文章赞赏记录
        //***********************神马嘀嘀2.4.1over************************************//
        
    }
};
