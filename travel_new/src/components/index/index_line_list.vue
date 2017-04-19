<template>
	<div class="index-ll-container">
		<div class="goodlists-box"> <div class="goodslist" tagid="1" tag2id="1"> <ul>  <li goodid="100001">                 <div> <div class="good-img"> <div class="good-imgjpg"><img src="http://hyu2594430001.my3w.com//Public/Upload/line/58a70b6a3cda9.jpg" alt=""></div> <div class="good-type"><span>跟团游 | 深圳出发</span></div> <div class="good-price"><small>￥</small><span>368</span>起</div> </div>  </div> <div class="good-desc"> <div> <p class="good-title">河源两日游</p> <p class="sub-title">万绿湖游船</p> </div> <div class="good-labels">  <ul class="good-label">  <li>毕业旅行</li>  </ul> </div> </div> </li>  <li goodid="100003">                 <div> <div class="good-img"> <div class="good-imgjpg"><img src="http://hyu2594430001.my3w.com//Public/Upload/lunbo/5872fd60d5d5b.jpg" alt=""></div> <div class="good-type"><span>跟团游 | 深圳出发</span></div> <div class="good-price"><small>￥</small><span>428</span>起</div> </div>  </div> <div class="good-desc"> <div> <p class="good-title">惠州特惠三日游</p> <p class="sub-title">三角洲-出海捕鱼，放飞自我</p> </div> <div class="good-labels">  <ul class="good-label">  <li>漂流季</li>  <li>亲子游</li>  </ul> </div> </div> </li>  <li goodid="100005">                 <div> <div class="good-img"> <div class="good-imgjpg"><img src="http://hyu2594430001.my3w.com//Public/Upload/line/58a70ebe45557.jpg" alt=""></div> <div class="good-type"><span>自由行 | 深圳出发</span></div> <div class="good-price"><small>￥</small><span>138</span>起</div> </div>  </div> <div class="good-desc"> <div> <p class="good-title">英德赏花一日游</p> <p class="sub-title">踏青节赏花</p> </div> <div class="good-labels">  <ul class="good-label">  <li>亲子游</li>  <li>赏花季</li>  <li>踏青</li>  <li>周末游</li>  </ul> </div> </div> </li>  </ul> </div> <div class="goodslist" tagid="1" tag2id="1"> <ul>  <li goodid="100006">                 <div> <div class="good-img"> <div class="good-imgjpg"><img src="http://hyu2594430001.my3w.com//Public/Upload/line/58a70e3942417.jpg" alt=""></div> <div class="good-type"><span>跟团游 | 深圳出发</span></div> <div class="good-price"><small>￥</small><span>368</span>起</div> </div>  </div> <div class="good-desc"> <div> <p class="good-title">清远漂流2日游</p> <p class="sub-title">新银盏温泉-古龙峡漂流</p> </div> <div class="good-labels">  <ul class="good-label">  <li>漂流季</li>  <li>周末游</li>  <li>纯玩</li>  </ul> </div> </div> </li>  <li goodid="100007">                 <div> <div class="good-img"> <div class="good-imgjpg"><img src="http://hyu2594430001.my3w.com//Public/Upload/line/58a70fb70f6f4.jpg" alt=""></div> <div class="good-type"><span>自由行 | 深圳出发</span></div> <div class="good-price"><small>￥</small><span>428</span>起</div> </div>  </div> <div class="good-desc"> <div> <p class="good-title">珠海两日游</p> <p class="sub-title">畅游长隆海洋世界</p> </div> <div class="good-labels">  <ul class="good-label">  <li>无自费</li>  <li>周末游</li>  <li>纯玩</li>  </ul> </div> </div> </li>  <li goodid="100012">                 <div> <div class="good-img"> <div class="good-imgjpg"><img src="http://hyu2594430001.my3w.com//Public/Upload/line/58c5554e6b67a.jpg" alt=""></div> <div class="good-type"><span>跟团游 | 深圳出发</span></div> <div class="good-price"><small>￥</small><span>458</span>起</div> </div>  </div> <div class="good-desc"> <div> <p class="good-title">惠州2日1晚跟团游</p> <p class="sub-title">海洋水母馆+罗浮山+环海单车+出海捕鱼</p> </div> <div class="good-labels">  <ul class="good-label">  <li>踏青</li>  <li>周末游</li>  </ul> </div> </div> </li>  </ul> </div></div>
	</div>
</template>
<script>
	
</script>
<style>
	.goodslist{background: #fff;}
	.goodslist>ul>li{border-bottom:4px solid #eee;}
	.swiper-img{height:410px; position: relative;overflow: hidden;}
	.goodslist>ul>li .good-imgjpg{height:400px; position: relative;overflow: hidden;}
	.goodslist>ul>li .good-imgjpg img,.swiper-img img{position: absolute;top: 50%;left: 0;width: 100%;-webkit-transform: translateY(-50%);transform: translateY(-50%);}
	.scrollFixedTop{position:fixed;top:0;}
	.scrollFixedTopfix{margin-top: 4.4rem}
	/*.goodlists-box .goodslist{display: none;}*/
	.goodslist ul li{text-align: left;}
	.goodslist ul li .good-img{position:relative;}
	.goodslist ul li .good-img img{width:100%;}
	.goodslist ul li .good-type{position:absolute;top:0.5rem;left:1rem;line-height: 2rem; font-size:1rem;text-align: center;background: #333;opacity: 0.8;color:#fff;padding:0 0.5rem;}
	.goodslist ul li .good-price{border-radius:4px 0 0 4px;position:absolute;bottom:1rem;right:0rem;height:3rem;line-height: 3.2rem;font-size: 1.4rem;text-align: center; background:#f8791c;padding:0 0.5rem;color:#fff;}
	.goodslist ul li .good-price span{font-size: 2.2rem;}
	.goodslist ul li .good-desc{padding:1rem 1rem;}
	.goodslist ul li .good-desc .good-title{padding:0.2rem 0;font-size:1.6rem;color:#333;width:100%;text-overflow:ellipsis;overflow: hidden;white-space: nowrap;}
	.goodslist ul li .good-desc .sub-title{ padding:0.2rem 0;   font-size: 1.3rem;line-height: 1.4rem;color: #666;text-overflow:ellipsis;overflow: hidden;white-space: nowrap;}
	.goodslist ul li .good-desc div>p.sell-charge{color:#f8791c;border:1px solid #f8791c;display: inline; padding: 0.1rem;}
	.goodslist ul li .good-desc .good-labels{margin-top:0.3rem;font-size: 1rem;padding:0.2rem;}
	.goodslist ul li .good-desc .good-label{display: inline;}
	.goodslist ul li .good-desc .good-label p{padding: 0.1rem 0!important;}
	.goodslist ul li .good-desc .good-label li{display: inline-block;border:1px solid #999;font-size:1rem; color:#999;padding:0.2rem;}
	#load-data{text-align: center;font-size: 1rem;color: #aaa;width: 100%;height: 2rem;line-height: 2rem;}

</style>