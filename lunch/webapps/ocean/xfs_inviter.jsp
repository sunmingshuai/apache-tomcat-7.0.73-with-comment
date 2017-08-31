<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <script src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
    <script src="/js/vue.min.js"></script>
    <link rel="stylesheet" href="/css/xfs_inviter.css">
    <title>你的颜值这么高,送我点呗~</title>
</head>
<body>
<div id="container">
    <input id="userId" value="${userId}" type="hidden">
    <input id="loginUrl" value="${loginUrl}" type="hidden">
    <input id="level" value="${level}" type="hidden">
    <input id="faceScore" value="${faceScore}" type="hidden">
    <input id="couponStatus" value="${couponStatus}" type="hidden">
    <input id="acquireHbUrl" value="${acquireHbUrl}" type="hidden">
    <input id="actSignUrl" value="${actSignUrl}" type="hidden">
    <input id="callBackUrl" value="${callBackUrl}" type="hidden">
    <input id="shareUrl" value="${shareUrl}" type="hidden">
    <input id="isOver" value="${isOver}" type="hidden">

    <!-- 日志统计用 -->
    <input class="tf8-log-hidden" type="hidden" name="pageType" value="mobile"/>
    <input class="tf8-log-hidden" type="hidden" name="pageName" value="invite"/>
    <input class="tf8-log-hidden" type="hidden" name="code" value="xinfengshang"/>
    <input class="tf8-log-hidden" type="hidden" name="channel" value="${channel}"/>
    <input class="tf8-log-hidden" type="hidden" name="userId" value="${userId}"/>

    <div class="banner">
        <div class="show-live" v-cloak>
            <p v-if="!faceScore">颜值够了就得<span>返利红包</span></p>
            <p v-if="faceScore > 0">您当前颜值：<span>{{faceScore}}</span></p>
        </div>
    </div>

    <div class="main">
        <ul :class="bgClass" v-cloak>
            <li class="coupon-main coupon1 tf8-log" log-position="自定义按钮" log-bussiness-type="按钮"
                log-content="点击领取_1">
                <p class="coupon-tips" v-if="!couponStatus[0] && faceScore < 10">还差{{10-
                    faceScore}}颜值</p>
                <p class="coupon-tips" v-else></p>
                <template v-if="!couponStatus[0] &&  level >= 1 && faceScore >= 10">
                    <div class="coupon" v-on:click="getCoupon(1,1)">
                        <p class="money"><span>￥</span>1</p>
                        <p class="click fontSize12"><span>点击领取</span></p>
                    </div>
                </template>
                <template v-else>
                    <template v-if="couponStatus[0]">
                        <div class="coupon" v-on:click="getCouponOver">
                            <p class="money"><span>￥</span>1</p>
                            <p class="click fontSize12">已领取</p>
                        </div>
                    </template>
                    <template v-else>
                        <div class="coupon" v-on:click="noPower">
                            <p class="money"><span>￥</span>1</p>
                            <p class="collect fontSize12">积攒颜值</p>
                        </div>
                    </template>
                </template>
            </li>
            <li class="coupon-main coupon2 tf8-log" log-position="自定义按钮" log-bussiness-type="按钮"
                log-content="点击领取_3">
                <p class="coupon-tips" v-if="!couponStatus[1] && faceScore < 40">还差{{40 -
                    faceScore}}颜值</p>
                <p class="coupon-tips" v-else></p>
                <template v-if="!couponStatus[1] &&  level >= 1 && faceScore >= 40">
                    <div class="coupon" v-on:click="getCoupon(2,3)">
                        <p class="money"><span>￥</span>3</p>
                        <p class="click fontSize12"><span>点击领取</span></p>
                    </div>
                </template>
                <template v-else>
                    <template v-if="couponStatus[1]">
                        <div class="coupon" v-on:click="getCouponOver">
                            <p class="money"><span>￥</span>3</p>
                            <p class="click fontSize12">已领取</p>
                        </div>
                    </template>
                    <template v-else>
                        <div class="coupon" v-on:click="noPower">
                            <p class="money"><span>￥</span>3</p>
                            <p class="collect fontSize12">积攒颜值</p>
                        </div>
                    </template>
                </template>
            </li>
            <li class="coupon-main coupon3 tf8-log" log-position="自定义按钮" log-bussiness-type="按钮"
                log-content="点击领取_5">
                <p class="coupon-tips" v-if="!couponStatus[2] && faceScore < 100">还差{{100 -
                    faceScore}}颜值</p>
                <p class="coupon-tips" v-else></p>
                <template v-if="!couponStatus[2] &&  level >= 2 && faceScore >= 100">
                    <div class="coupon" v-on:click="getCoupon(3,5)">
                        <p class="money"><span>￥</span>5</p>
                        <p class="click fontSize12"><span>点击领取</span></p>
                    </div>
                </template>
                <template v-else>
                    <template v-if="couponStatus[2]">
                        <div class="coupon" v-on:click="getCouponOver">
                            <p class="money"><span>￥</span>5</p>
                            <p class="click fontSize12">已领取</p>
                        </div>
                    </template>
                    <template v-else>
                        <div class="coupon" v-on:click="noPower">
                            <p class="money"><span>￥</span>5</p>
                            <p class="condition collect fontSize10">LV2及以上<br>用户专享</p>
                        </div>
                    </template>
                </template>
            </li>
            <li class="coupon-main coupon4 tf8-log" log-position="自定义按钮" log-bussiness-type="按钮"
                log-content="点击领取_10">
                <p class="coupon-tips" v-if="!couponStatus[3] && faceScore < 500">还差{{500 -
                    faceScore}}颜值</p>
                <p class="coupon-tips" v-else></p>
                <template v-if="!couponStatus[3] &&  level >= 2 && faceScore >= 500">
                    <div class="coupon" v-on:click="getCoupon(4,10)">
                        <p class="money"><span>￥</span>10</p>
                        <p class="click fontSize12"><span>点击领取</span></p>
                    </div>
                </template>
                <template v-else>
                    <template v-if="couponStatus[3]">
                        <div class="coupon" v-on:click="getCouponOver">
                            <p class="money"><span>￥</span>10</p>
                            <p class="click fontSize12">已领取</p>
                        </div>
                    </template>
                    <template v-else>
                        <div class="coupon" v-on:click="noPower">
                            <p class="money"><span>￥</span>10</p>
                            <p class="condition collect fontSize10">LV2及以上<br>用户专享</p>
                        </div>
                    </template>
                </template>
            </li>
            <li class="coupon-main coupon5 tf8-log" log-position="自定义按钮" log-bussiness-type="按钮"
                log-content="点击领取_11">
                <p class="coupon-tips" v-if="!couponStatus[4] && faceScore < 800">还差{{800 -
                    faceScore}}颜值</p>
                <p class="coupon-tips" v-else></p>

                <template v-if="!couponStatus[4] &&  level >= 4 && faceScore >= 800">
                    <div class="coupon" v-on:click="getCoupon(5,11)">
                        <p class="money"><span>￥</span>11</p>
                        <p class="click fontSize12"><span>点击领取</span></p>
                    </div>
                </template>
                <template v-else>
                    <template v-if="couponStatus[4]">
                        <div class="coupon" v-on:click="getCouponOver">
                            <p class="money"><span>￥</span>11</p>
                            <p class="click fontSize12">已领取</p>
                        </div>
                    </template>
                    <template v-else>
                        <div class="coupon" v-on:click="noPower">
                            <p class="money"><span>￥</span>11</p>
                            <p class="condition collect fontSize10">LV4及以上<br>用户专享</p>
                        </div>
                    </template>
                </template>
            </li>
            <li class="coupon-main coupon6 tf8-log" log-position="自定义按钮" log-bussiness-type="按钮"
                log-content="立即查看-秘籍">
                <div class="coupon" v-on:click="toBL">
                    <p class="rule-face"><img
                            src="https://img.alicdn.com/imgextra/i4/2296013456/TB261hBhR0kpuFjSsziXXa.oVXa_!!2296013456.png">
                    </p>
                    <p class="click"><span class="fontSize12">立即查看</span></p>
                </div>
            </li>
        </ul>
    </div>

    <div class="rule-friends">
        <div class="rule">
            <p class="title J-trigger">活动规则<i
                    class="<c:if test="${fn:length(invitedRecords)>0 }">click</c:if>"><img
                    src="https://img.alicdn.com/imgextra/i3/2296013456/TB2iG31iYJmpuFjSZFwXXaE4VXa_!!2296013456.png"/></i>
            </p>

            <p class="rule-str <c:if test="${fn:length(invitedRecords)>0 }">hide</c:if>">
                活动时间：3月19日00:00:00-3月23日22:00:00 <br />
                <span>活动期间每天可到活动页面点击「签到」获得8点颜值</span>
                <span>分享活动给好友，好友点击「一键送TA颜值」您即可获得10点颜值/人</span>
                <span>每个好友可送您一次颜值</span>
                <span>部分红包除需要颜值还需您的淘粉吧用户等级达到标准才可解锁</span>
                <span>红包解锁后需点击已解锁的红包进行领取</span>
                <span>红包为搜索返利红包，在确认收货后到账</span>
                <span>红包分别为：1元红包（单笔订单实付满20元），3元红包（单笔订单实付满60元），5元红包（单笔订单实付满100元），10元红包（实付满100元），11元红包（实付满66元） </span>
                <span>淘粉吧有权收回作弊用户获得的红包 </span>
                <span>本活动最终解释权归淘粉吧所有 </span>
                <span>本活动与苹果公司无关</span>
            </p>
        </div>
        <c:if test="${fn:length(invitedRecords)>0 }">
            <div class="friends">
                <p class="title">哪些好友帮你鉴定了颜值？</p>
                <ul>
                    <c:forEach var="invitedRecord" items="${invitedRecords }" varStatus="varstatus">
                        <li>
                            <c:if test="${empty invitedRecord.imgUrl}"><span
                                    class="icon-header"><img
                                    src="https://img.alicdn.com/imgextra/i2/2296013456/TB2mCfWjipnpuFjSZFIXXXh2VXa_!!2296013456.png"/></span></c:if>
                            <c:if test="${not empty invitedRecord.imgUrl}"><span
                                    class="icon-header"><img
                                    src="${invitedRecord.imgUrl}"/></span></c:if>
                            <c:if test="${empty invitedRecord.nickName}"><span class="name-str">某个小伙伴</span></c:if>
                            <c:if test="${not empty invitedRecord.nickName}"><span
                                    class="name-str">${invitedRecord.nickName}</span></c:if>
                            <span class="time-str">${invitedRecord.formatedTime}</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>

    <!-- 弹窗签到 找好友鉴定红包 -->
    <div class="modal-sign" id="sign-pop" style="display: none;">
        <div class="modal-close"></div>
        <h3 class="fontSize17" v-if="popStr1">{{popStr1}}</h3>
        <p class="red_color face_number fontSize12" v-if="popStr2">{{popStr2}}</p>
        <p class="fontSize13 hint">
            <span>{{popStr3}}</span>
            <span v-if="popStr5">{{popStr5}}</span>
            <span>{{popStr4}}</span>
        </p>
        <a href="javascript:void(0)" class="fontSize15 btn" id="tipModal" v-if="isCoupon == 8" v-on:click="toShare">找好友送</a>
        <a href="javascript:void(0)" class="fontSize15 btn" id="tipModal" v-if="isCoupon == 3" v-on:click="findCoupon">查看红包详情</a>
    </div>
    <!-- 弹窗活动结束 -->
    <div class="modal-over" style="display: none;">
        <h3 class="fontSize17">本活动已结束</h3>
    </div>

    <footer>
        <div class="invite tf8-log" log-position="自定义按钮" log-bussiness-type="按钮"
             log-content="找好友送(分享)" v-on:click="toShare"><span class="find">找好友送<i>+10颜值</i></span>
        </div>
        <c:if test="${hasSigned == '0'}">
            <div class="sign tf8-log" v-on:click="toSign" log-position="自定义按钮"
                 log-bussiness-type="按钮" log-content="签到"><span
                    class="king -signed">签到<i>+8颜值</i></span></div>
        </c:if>
        <c:if test="${hasSigned == '1'}">
            <div class="sign"><span class="signed">明天再来</span></div>
        </c:if>
    </footer>

    <!-- 模态框遮挡层 -->
    <div id="backdrop"></div>
    <!-- 微信下载弹窗 -->
    <div class="modal" id="downloadTipWx">
        <div class="modal-header fs14">
            <p>使用<span class="red_color">淘粉吧APP</span>参加活动，若已安装</p>
            <p>请点击右上角用「<span id="browser">Safari</span>」打开</p>
        </div>
        <div class="modal-body">
            <div class="divide"></div>
            <p class="fs12">还没有安装App?</p>
            <img class="icon"
                 src="https://img.alicdn.com/imgextra/i2/2296013456/TB2TabAg00opuFjSZFxXXaDNVXa_!!2296013456.png"/>
        </div>
        <div class="modal-footer fs17">
            <div class="btn downloadBtn tf8-log" log-position="自定义按钮" log-bussiness-type="按钮"
                 log-content="立即下载">立即下载
            </div>
        </div>
        <img class="arrow"
             src="https://img.alicdn.com/imgextra/i1/2296013456/TB2rR6ng9VmpuFjSZFFXXcZApXa_!!2296013456.png"/>
        <img class="modal-close"
             src="https://img.alicdn.com/imgextra/i4/2296013456/TB2S6MifM0kpuFjSspdXXX4YXXa_!!2296013456.png"/>
    </div>

    <div class="modal-down" id="downloadTip" style="display:none;">
        <div class="modal-close"></div>
        <h3 class="fontSize17">使用淘粉吧APP参加活动</h3>
        <p class="fontSize13 hint"><span>下载淘粉吧APP即可参加本次活动，</span><span>最高可获得30元红包！</span></p>
        <a href="javascript:void(0)" class="fontSize15 btn downloadBtn tf8-log" log-position="自定义按钮"
           log-bussiness-type="按钮" log-content="下载淘粉吧APP" id="tipModal">下载淘粉吧APP</a>
    </div>


</div>
<script src="../js/jquery-2.1.4.min.js"></script>
<script src="/js/xfs_inviter.js"></script>
<script>
    var tf8LogHidden = {};
    $(function(){
        //页面属性
        $('.tf8-log-hidden').each(function() {
            tf8LogHidden[$(this).attr('name')] = $(this).val();
        });

        $.ajax({
                   type : 'POST',
                   url : "http://ocean.taofen8.com/log/ajaxViewLog",
                   data : tf8LogHidden,
                   dataType : "jsonp",
                   contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
                   success: function(data){
                   }
               });

        //点击事件统计
        $('body').on('click','.tf8-log', function(event) {
            var paramJson = {
                'position':$(this).attr('log-position'),
                'bussinessType':$(this).attr('log-bussiness-type'),
                'content':$(this).attr('log-content'),
                'bmCategory':$(this).attr('log-bm-category')
            };
            paramJson = $.extend(paramJson, tf8LogHidden);
            $.ajax({
                       type : 'POST',
                       url : "http://ocean.taofen8.com/log/ajaxClickLog",
                       data : paramJson,
                       dataType : "jsonp",
                       contentType : 'application/x-www-form-urlencoded;charset=UTF-8'
                   });
        });
    });

    function logAndHref(url, o) {
        var paramJson = {
            'position':$(o).attr('log-position'),
            'bussinessType':$(o).attr('log-bussiness-type'),
            'content':$(o).attr('log-content'),
            'bmCategory':$(o).attr('log-bm-category')
        };
        paramJson = $.extend(paramJson, tf8LogHidden);
        $.ajax({
                   type : 'POST',
                   url : "http://ocean.taofen8.com/log/ajaxClickLog",
                   data : paramJson,
                   dataType : "jsonp",
                   contentType : 'application/x-www-form-urlencoded;charset=UTF-8'
               });

        window.location.href = url;
    }

    function loginUserNew(returnUrl) {
        if(!$.trim(returnUrl)) return;
        var ua = navigator.userAgent;
        var versionNum = 0;

        var productVersion = GetQueryString("productVersion");
        if(productVersion) {
            if(productVersion.indexOf("_") > 0){
                versionNum = parseFloat(productVersion.split("_")[1].substring(1));
            }else{
                versionNum = parseFloat(productVersion);
            }
        }
        if(ua.indexOf("Taofen8")>0 && versionNum>=8.4) {
            returnUrl += "&";
            returnUrl = returnUrl.replace(/(productVersion=.*?&)/g, "");
            returnUrl = returnUrl.replace(/(cookie=.*?&)/g, "");
            returnUrl = returnUrl.replace(/(loginType=.*?&)/g, "");
            returnUrl = returnUrl.replace(/(sign=.*?&)/g, "");
            returnUrl = returnUrl.replace(/(userId=.*?&)/g, "");
            window.location.href = 'native-check://login/?callback=' + encodeURIComponent(returnUrl);
        } else {
            loginUser(returnUrl);
        }
        /*
         if(returnUrl.indexOf("productVersion") > -1) {
         window.location.href= 'taofen8-master://wl?id='+encodeURIComponent("http://m.taofen8.com/s/login?callback=" + encodeURIComponent(returnUrl));
         } else if(window.location.href.indexOf("productVersion") > -1) {
         window.location.href= 'taofen8-master://wl?id='+encodeURIComponent("http://m.taofen8.com/s/login?callback=" + encodeURIComponent(returnUrl + '&productVersion=' + GetQueryString('productVersion')));

         //window.location.href = "http://m.taofen8.com/s/login?callback=" + encodeURIComponent(returnUrl + '&productVersion=' + GetQueryString('productVersion'));
         } else {
         loginUser(returnUrl);
         }
         */
    }

    function GetQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }


    function clickLog(itemId,type,source) {
        $.ajax({url:"http://m.taofen8.com/bizActivity/ajaxClickLog?itemId=" + itemId + "&type=" + type+"&source="+source,  dataType:'json', success:function(dataJson) {

        }});
    }

    function loginUser(returnUrl) {
        var locationHref = "https://oauth.taobao.com/authorize?response_type=token&client_id=12450255&state=1212&scope=item&view=wap&redirect_uri=";
        var wapRedirectUrl = "http://m.taofen8.com/iphone/login.jsp";
        var realUrl = locationHref + wapRedirectUrl + "?retain=pocket_" + returnUrl;
        window.location.href = realUrl;
    }


    function jumpToAPP(url) {

        var nav_user = navigator.userAgent;

        isChrome = nav_user.match(/Chrome/i) != null  && nav_user.match(/Version\/\d+\.\d+(\.\d+)?\sChrome\//i) == null;
        var ios_version = [];
        var ios_num = 0;
        if (nav_user.match(/(iPhone)/)) {
            if (nav_user.match(/Safari/)) {
                ios_version = nav_user.match(/Version\/([\d\.]+)/);
                if (ios_version) {
                    ios_num = ios_version[1];
                    ios_num && (ios_num = ios_num.split(".")[0])
                }
            }
        }
        if (ios_num >= 9) {
            window.location.href = url;
        }
        //else if (isChrome) {
        //	window.location = url;
        //}
        else {
            $(document.body).append('<iframe src="'+url+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
        }
    }


</script>
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-75777879-31', 'auto');
    ga('send', 'pageview');
</script>
</body>
</html>