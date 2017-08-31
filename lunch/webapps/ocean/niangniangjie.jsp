<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <script src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
    <link rel="stylesheet" href="../css/niangniangjie.css">
    <title>三生三世十里桃花</title>
</head>
<body>
<div id="container" class="fs12">
    <input id="userId" value="${userId}" type="hidden">
    <input id="deviceId" value="${deviceId}" type="hidden">
    <input id="shared" value="${shared}" type="hidden">
    <input id="hasChance" value="${hasChance}" type="hidden">
    <input id="needShare" value="${needShare}" type="hidden">
    <input id="shareUrl" value="${shareUrl}" type="hidden">
    <input id="callBackUrl" value="${callBackUrl}" type="hidden">
    <input id="loginUrl" value="${loginUrl}" type="hidden">
    <input id="changeSymbolUrl" value="${changeSymbolUrl}" type="hidden">
    <input id="receiveRewardUrl" value="${receiveRewardUrl}" type="hidden">
    <input id="target" value="${target}" type="hidden">
    <input id="lastLotteryDay" value="${lastLotteryDay}" type="hidden">
    <input id="status" value="${status}" type="hidden">
    <input id="hasGetHb" value="${hasGetHb}" type="hidden">

    <!-- 日志统计用 -->
    <input class="tf8-log-hidden" type="hidden" name="pageType" value="mobile" />
    <input class="tf8-log-hidden" type="hidden" name="pageName" value="niangniangjie17" />
    <input class="tf8-log-hidden" type="hidden" name="code" value="niangniangjie" />
    <input class="tf8-log-hidden" type="hidden" name="channel" value="${channel}" />
    <input class="tf8-log-hidden" type="hidden" name="userId" value="${userId}" />


    <!-- 算式 -->
    <div class="equation fs40">
        <span>3</span>
        <c:if test="${target == -1}">
            <span class="fs0" id="endPos">
                <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB22QQUfgxlpuFjSszgXXcJdpXa_!!2296013456.png"/>
            </span>
            <span>8</span>
            <span class="fs36">=</span>
            <span id="money">?</span>
            <span class="fs15" id="moneyText">元红包</span>
        </c:if>
        <c:if test="${target == 0}">
            <span class="fs0" id="endPos">
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB20Ls8fl8lpuFjSspaXXXJKpXa_!!2296013456.png"/>
            </span>
            <span>8</span>
            <span class="fs36">=</span>
            <span id="money">11</span>
            <span class="fs15" id="moneyText">元红包组合</span>
        </c:if>
        <c:if test="${target == 1}">
            <span class="fs0" id="endPos">
                <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2ZQ7OfeJ8puFjy1XbXXagqVXa_!!2296013456.png"/>
            </span>
            <span>8</span>
            <span class="fs36">=</span>
            <span id="money">0.01</span>
            <span class="fs15" id="moneyText">元红包</span>
        </c:if>
        <c:if test="${target == 2}">
            <span class="fs0" id="endPos">
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2oKg8fl0kpuFjSsppXXcGTXXa_!!2296013456.png"/>
            </span>
            <span>8</span>
            <span class="fs36">=</span>
            <span id="money">24</span>
            <span class="fs15" id="moneyText">元红包组合</span>
        </c:if>
        <c:if test="${target == 3}">
            <span class="fs0" id="endPos">
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2lqh5gAqvpuFjSZFhXXaOgXXa_!!2296013456.png"/>
            </span>
            <span>8</span>
            <span class="fs36">=</span>
            <span id="money">0.38</span>
            <span class="fs15" id="moneyText">元红包</span>
        </c:if>
        <c:if test="${target == 4}">
            <span class="fs0" id="endPos">
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB25T9KgCFmpuFjSZFrXXayOXXa_!!2296013456.png"/>
            </span>
            <span>8</span>
            <span class="fs36">=</span>
            <span id="money">3.8</span>
            <span class="fs15" id="moneyText">元红包</span>
        </c:if>
        <c:if test="${target == 5}">
            <span class="fs0" id="endPos">
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2ZvyCgyRnpuFjSZFCXXX2DXXa_!!2296013456.png"/>
            </span>
            <span>8</span>
            <span class="fs36">=</span>
            <span id="money">8</span>
            <span class="fs15" id="moneyText">元红包组合</span>
        </c:if>
    </div>
    <!-- 抽奖区域 -->
    <div id="turnplate">
        <div class="lottery-group">
            <div class="lottery-unit <c:if test="${target == 0 || target == -1}">active</c:if>">
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB20Ls8fl8lpuFjSspaXXXJKpXa_!!2296013456.png" />
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2xt.UfbFlpuFjy0FgXXbRBVXa_!!2296013456.png" />
            </div>
            <div class="lottery-unit <c:if test="${target == 1 || target == -1}">active</c:if>">
                <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2ZQ7OfeJ8puFjy1XbXXagqVXa_!!2296013456.png" />
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2i_IZfgxlpuFjSszbXXcSVpXa_!!2296013456.png" />
            </div>
            <div class="lottery-unit <c:if test="${target == 2 || target == -1}">active</c:if>">
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2oKg8fl0kpuFjSsppXXcGTXXa_!!2296013456.png" />
                <img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2C0wPfbXlpuFjSszfXXcSGXXa_!!2296013456.png" />
            </div>
            <div class="lottery-unit <c:if test="${target == 3 || target == -1}">active</c:if>">
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2lqh5gAqvpuFjSZFhXXaOgXXa_!!2296013456.png" />
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2yKw9fbRkpuFjSspmXXc.9XXa_!!2296013456.png" />
            </div>
            <div class="lottery-unit <c:if test="${target == 4 || target == -1}">active</c:if>">
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB25T9KgCFmpuFjSZFrXXayOXXa_!!2296013456.png" />
                <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2Xr33fbXlpuFjy1zbXXb_qpXa_!!2296013456.png" />
            </div>
            <div class="lottery-unit <c:if test="${target == 5 || target == -1}">active</c:if>">
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2ZvyCgyRnpuFjSZFCXXX2DXXa_!!2296013456.png" />
                <img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2zNAVfmxjpuFjSszeXXaeMVXa_!!2296013456.png" />
            </div>
        </div>
        <div class="btnWrap">
            <!-- 抽奖前 -->

            <div id="wrap1" <c:if test="${target == -1}">style="display:block"</c:if> >
                <div class="tipWrap">
                    <p>点击按钮 试试手气</p>
                </div>
                <a href="javascript:void(0);" class="lotteryBtn tf8-log" log-position="抽红包按钮" log-bussiness-type="抽红包按钮" log-content="201738">
                    <img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2ial0fH0kpuFjy0FjXXcBbVXa_!!2296013456.png" />
                </a>
            </div>

            <!-- 抽奖后 choujianghou -->

            <div id="wrap2" <c:if test="${cjh == '1'}">style="display:block"</c:if>>
                <div class="tipWrap">
                    <p><span class="poorLuck" <c:if test="${target == 1}">style="display:none"</c:if>>恭喜</span>您抽中“<span class="sign pink">${symbol}</span>”符号，获得<span class="hb_text">${symbolHB}</span></p>
                    <p>点击“换符号，逆天改命”可换符号</p>
                </div>
                <a href="javascript:void(0);" class="lotteryBtn tf8-log" log-position="换符号按钮" log-bussiness-type="换符号按钮" log-content="201738">
                    <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2nmeefR8lpuFjSspaXXXJKpXa_!!2296013456.png" />
                </a>
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2xCVebyC9MuFjSZFoXXbUzFXa_!!2296013456.png" id="fate" />
            </div>

            <!-- 领取红包 lingquhongbao-->

            <div id="wrap3" <c:if test="${lqhb == '1' }">style="display:block"</c:if>>
                <div class="tipWrap">
                    <p><span class="poorLuck" <c:if test="${target == 1}">style="display:none"</c:if>>恭喜</span>您抽中“<span class="sign pink">${symbol}</span>”符号，获得<span class="hb_text">${symbolHB}</span></p>
                </div>
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2kluFgstnpuFjSZFvXXbcTpXa_!!2296013456.png" id="getHb" class="tf8-log" log-position="领红包按钮" log-bussiness-type="领红包按钮" log-content="201738"/>
            </div>

            <!-- 已领取红包 -->

            <div id="wrap4" <c:if test="${status == 2}">style="display:block"</c:if>>
                <div class="tipWrap">
                    <p>您已领取<span class="hb_text">${symbolHB}</span></p>
                    <p>请到我的-我的红包页面查看</p>
                </div>
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB20ICDgEdnpuFjSZPhXXbChpXa_!!2296013456.png" />
            </div>

        </div>
    </div>
    <!-- 规则 -->
    <dl>
        <dt class="fs18">活动规则</dt>
        <dd>1 活动时间：3月6日00:00-3月8日24:00；</dd>
        <dd>2 活动期间每人可获得一个公式符号，该公式计算结果为最终所得红包金额；</dd>
        <dd>3 每人每天有一次通过分享获得“逆天改命”换取符号的机会；</dd>
        <dd>4 活动期间每人只有一次机会领取红包。</dd>
        <dt class="fs18 award-rule">奖励规则</dt>
        <dd><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2NLalgrJmpuFjSZFwXXaE4VXa_!!2296013456.png" /></dd>
    </dl>
    <!-- 模态框遮挡层 -->
    <div id="backdrop"></div>
    <!-- 今天机会用完弹窗 -->
    <div class="modal" id="tipModal">
        <div class="modal-header fs15">今天机会用完啦</div>
        <div class="modal-body">
            <p>每天只有一次逆天改命的机会哦！</p>
            <p>明天再来改命吧！</p>
        </div>
        <div class="modal-footer fs15">
            <div class="btn btn-pink modal-close">我知道啦</div>
        </div>
    </div>
    <!-- 抽奖结果弹窗 -->
    <div class="modal" id="resultModal">
        <div class="modal-header fs15">恭喜获得<span>0.01</span>元红包</div>
        <div class="modal-body">
            <p>您只有一次领取红包的机会.</p>
            <p>确认认命领取吗？</p>
        </div>
        <div class="modal-footer fs15">
            <div class="btn btn-gray modal-close">我再想想</div>
            <div class="btn btn-pink tf8-log" id="getHbModal" log-position="领红包按钮" log-bussiness-type="领红包按钮" log-content="201738">确定领取</div>
        </div>
    </div>
    <!-- 微信下载弹窗 -->
    <div class="modal" id="downloadTipWx">
        <div class="modal-header fs14">
            <p>若已安装淘粉吧</p>
            <p>请点击右上角用「<span id="browser">Safari</span>」打开</p>
        </div>
        <div class="modal-body">
            <div class="divide"></div>
            <p class="fs12">还没有安装App?</p>
            <img class="icon" src="https://img.alicdn.com/imgextra/i2/2296013456/TB2TabAg00opuFjSZFxXXaDNVXa_!!2296013456.png" />
        </div>
        <div class="modal-footer fs17">
            <div class="btn downloadBtn">立即下载</div>
        </div>
        <img class="arrow" src="https://img.alicdn.com/imgextra/i1/2296013456/TB2rR6ng9VmpuFjSZFFXXcZApXa_!!2296013456.png" />
        <img class="modal-close" src="https://img.alicdn.com/imgextra/i4/2296013456/TB2S6MifM0kpuFjSspdXXX4YXXa_!!2296013456.png" />
    </div>
    <!-- 浏览器下载弹窗 -->
    <div id="downloadTip">
        <p class="fs12">在淘粉吧app内才能参与活动哦！</p>
        <div class="fs14 downloadBtn">下载淘粉吧客户端</div>
    </div>
    <!-- 错误提示 -->
    <div class="modal fs14" id="errorModal">
        <p class="msg">网络出错！请稍后再试</p>
    </div>
</div>
</div>
<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/niangniangjie.js?v=1434325"></script>
<script src="/js/lottery.js"></script>
<script src="https://ocean.taofen8.com/js/tf8common_ocean.js"></script>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-75777879-31', 'auto');
    ga('send', 'pageview');

</script>
</body>
</html>