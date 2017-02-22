<template>
    <div class="goodslist">
        <ul>
            <li>
                <div>
                    <div>
                        <div class="good-img">
                            <div class="good-imgjpg"><img src="http://i4.cctcdn.com/up/i/1702/17/3c938c0ed8cd.jpg_750x500q80.jpg" alt=""></div>
                            <div class="good-type"><span>跟团游 | 上海出发</span></div>
                            <div class="good-price"><small>￥</small><span>2780</span>起</div>
                        </div>
                        
                    </div>
                    <div class="good-desc">
                        <div>
                           <p class="good-title">[春节]大阪-京都-伊势-东京6日游</p>
                        </div>
                        <div class="good-labels">
                            <p class="sell-charge">立减</p>
                            <ul class="good-label">
                                <li>无自费</li>
                                <li>味蕾品日本</li>
                                <li>三大美食</li>
                                <li>感受时尚之都</li>
                                <li>品质住宿</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div>
                    <div>
                        <div class="good-img">
                            <div class="good-imgjpg"><img src="http://i4.cctcdn.com/up/i/1702/17/3c938c0ed8cd.jpg_750x500q80.jpg" alt=""></div>
                            <div class="good-type"><span>跟团游 | 上海出发</span></div>
                            <div class="good-price"><small>￥</small><span>2780</span>起</div>
                        </div>
                        
                    </div>
                    <div class="good-desc">
                        <div>
                           <p class="good-title">[春节]大阪-京都-伊势-东京6日游</p>
                        </div>
                        <div class="good-labels">
                            <p class="sell-charge">立减</p>
                            <ul class="good-label">
                                <li>无自费</li>
                                <li>味蕾品日本</li>
                                <li>三大美食</li>
                                <li>感受时尚之都</li>
                                <li>品质住宿</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div>
                    <div>
                        <div class="good-img">
                            <div class="good-imgjpg"><img src="http://i4.cctcdn.com/up/i/1702/17/3c938c0ed8cd.jpg_750x500q80.jpg" alt=""></div>
                            <div class="good-type"><span>跟团游 | 上海出发</span></div>
                            <div class="good-price"><small>￥</small><span>2780</span>起</div>
                        </div>
                        
                    </div>
                    <div class="good-desc">
                        <div>
                           <p class="good-title">[春节]大阪-京都-伊势-东京6日游</p>
                        </div>
                        <div class="good-labels">
                            <p class="sell-charge">立减</p>
                            <ul class="good-label">
                                <li>无自费</li>
                                <li>味蕾品日本</li>
                                <li>三大美食</li>
                                <li>感受时尚之都</li>
                                <li>品质住宿</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        name:"goodlist"
    }
</script>
<style>
    .goodslist{padding:0.5rem;background: #fff;margin-top: 0.5rem;}
    .goodslist>ul>li{width:100%;border-bottom:1px solid #999;margin-top:0.5rem;}
    .goodslist>ul>li .good-imgjpg,.swiper-img{height:150px; position: relative;overflow: hidden;}
    .goodslist>ul>li .good-imgjpg img,.swiper-img img{position: absolute;top: 50%;left: 0;width: 100%;-webkit-transform: translateY(-50%);transform: translateY(-50%);}
    .scrollFixedTop{position:fixed;top:0;}
    .scrollFixedTopfix{margin-top: 4.4rem}
    .goodslist ul li .good-img{position:relative;}
    .goodslist ul li .good-img img{width:100%;}
    .goodslist ul li .good-type{position:absolute;top:0.5rem;left:1rem;line-height: 2rem; font-size:1rem;text-align: center;background: #333;opacity: 0.8;color:#fff;padding:0 0.5rem;}
    .goodslist ul li .good-price{position:absolute;bottom:2rem;right:0rem;line-height: 2rem;font-size: 1.4rem;text-align: center; background:#d30775;padding:0 0.5rem;color:#fff;}
    .goodslist ul li .good-desc{padding:1rem 1rem;}
    .goodslist ul li .good-desc .good-title{font-size:1.4rem;width:100%;font-weight: bold;}
    .goodslist ul li .good-desc div>p.sell-charge{color:#d30775;border:1px solid #d30775;display: inline;}
    .goodslist ul li .good-desc .good-labels{margin-top:1rem;}
    .goodslist ul li .good-desc .good-label{display: inline;}
    .goodslist ul li .good-desc .good-label li{display: inline-block;border:1px solid #eee; padding:0.1rem;margin:0.1rem;}

</style>