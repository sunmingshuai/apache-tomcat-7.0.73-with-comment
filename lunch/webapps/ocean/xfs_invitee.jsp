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
    <link rel="stylesheet" href="/css/xfs_invitee.css">
    <title>你的颜值这么高,送我点呗~</title>

</head>
<body>
<div id="container">
    <!-- 是否鉴定过 -->
    <input id="inviterName" value="${inviterName}" type="hidden">
    <input id="userId" value="${userId}" type="hidden">
    <input id="inviteeId" value="${inviteeId}" type="hidden">
    <!-- 美颜百分比 -->
    <input id="beautyPercent" value="${beautyPercent}" type="hidden">
    <input id="checkUp" value="${checkUp}" type="hidden">
    <input id="increaseScoreUrl" value="${increaseScoreUrl}" type="hidden">
    <input id="link" value="${link}" type="hidden">
    <input id="isOver" value="${isOver}" type="hidden">



    <!-- 日志统计用 -->
    <input class="tf8-log-hidden" type="hidden" name="pageType" value="mobile" />
    <input class="tf8-log-hidden" type="hidden" name="pageName" value="invited" />
    <input class="tf8-log-hidden" type="hidden" name="code" value="xinfengshang" />
    <input class="tf8-log-hidden" type="hidden" name="channel" value="${channel}" />
    <input class="tf8-log-hidden" type="hidden" name="userId" value="${userId}" />

    <div class="invited_banner">
        <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2H9D2i00opuFjSZFxXXaDNVXa_!!2296013456.png">
    </div>
    <!-- 被邀请 -->
    <div id="invited_content">
        <h3 class="fontSize20">您的好友颜值击败了全国<span class="red_color"></span>的人</h3>
        <p class="fontSize15 hint">TA正在参与淘粉吧的颜值换红包活动
            <br/> 快来送TA颜值吧~
        </p>
        <a href="javascript:void(0)" class="fontSize17 btn tf8-log" id="getFace" log-position="自定义按钮" log-bussiness-type="按钮" log-content="一键送TA颜值(分享)">一键送TA颜值 > </a>
        <p class="fontSize10 reminder">好友淘粉吧昵称：<span></span></p>
    </div>
    <!-- 鉴定成功 -->
    <div id="invited_success">
        <h3 class="fontSize20"><span>&nbsp;</span>赠送成功！</h3>
        <p class="fontSize12 hint">正所谓沉鱼落雁,闭月羞花也不过如此吧~
            <br/> 要不你也来集颜值？说不定是下个颜王呢！
        </p>
        <a href="javascript:void(0)" class="fontSize17 btn tf8-log" log-position="自定义按钮" log-bussiness-type="按钮" log-content="我也要参加"> 我也要参加 > </a>
        <p class="fontSize13 reminder">最高<span class="red_color">30元</span>返利红包 新人<span class="red_color">999</span>集分宝等你拿！</p>
    </div>


    <!-- 弹窗活动结束 -->
    <div class="modal-over" style="display: none;">
        <h3 class="fontSize17">本活动已结束</h3>
    </div>
    <!-- 模态框遮挡层 -->
    <div id="backdrop"></div>
    <!-- 浏览器下载弹窗 -->
    <div class="modal" id="downloadTip">
        <div class="modal-close"></div>
        <h3 class="fontSize17">使用淘粉吧APP参加活动</h3>
        <p class="fontSize13 hint"><span>下载淘粉吧APP即可参加本次活动，</span><span>最高可获得30元红包！</span></p>
        <a href="javascript:void(0)" class="fontSize15 btn tf8-log" log-position="自定义按钮" log-bussiness-type="按钮" log-content="下载淘粉吧APP" id="tipModal">下载淘粉吧APP</a>
    </div>
    <!-- 微信下载弹窗 -->
    <div class="modal" id="downloadTipWx">
        <div class="modal-header fontSize14">
            <p>使用<span class="font_red">淘粉吧APP</span>参加活动，若已安装</p>
            <p>请点击右上角用「<span id="browser">Safari</span>」打开</p>
        </div>
        <div class="modal-body">
            <div class="divide"></div>
            <p class="fontSize12">还没有安装App?</p>
            <img class="icon" src="https://img.alicdn.com/imgextra/i2/2296013456/TB2TabAg00opuFjSZFxXXaDNVXa_!!2296013456.png">
        </div>
        <div class="modal-footer fontSize17">
            <div class="btn-d downloadBtn tf8-log" log-position="自定义按钮" log-bussiness-type="按钮" log-content="立即下载">立即下载</div>
        </div>
        <img class="arrow" src="https://img.alicdn.com/imgextra/i1/2296013456/TB2rR6ng9VmpuFjSZFFXXcZApXa_!!2296013456.png">
        <img class="modal-close-d" src="https://img.alicdn.com/imgextra/i4/2296013456/TB2S6MifM0kpuFjSspdXXX4YXXa_!!2296013456.png">
    </div>
    <!-- 错误提示 -->
    <div class="modal fontSize15" id="errorModal">
        <p class="msg">网络出错！请稍后再试</p>
    </div>

</div>
<script src="../js/jquery-2.1.4.min.js"></script>
<script src="../js/tf8common_ocean.js"></script>
<script src="../js/xfs_invitee.js"></script>

<%@ include file="wechat_share.jsp"%>
<script>
    setShareMessage(
        "${shareTitle}",
        "${shareDescription}",
        "${shareUrl}",
        "${shareImageUrl}",
        function(){
        },
        function(){
        }
    );
</script>
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