<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-control" content="no-cache">
<meta name="format-detection"content="telephone=no, email=no" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>
<script src="https://m.taofen8.com/js/jquery.cookie.js"></script>
<script src="https://m.taofen8.com/js/js/common.js?v=04010618" type="text/javascript"></script>
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<title>客户端口令红包</title>
<link rel="stylesheet" href="../css/kl_hongbao.css" type="text/css" />
<STYLE type=text/css>
body{font: normal 100% Helvetica, Arial, sans-serif; padding:0px; margin:0px;}
.jfsc-ul .jfsc-list-right span{color: #999}
</STYLE>
</head>
<body>
<!--弹框 start-->
<!--红包使用规则-->
<div class="mask" id="maskDivId" onclick="ruleBoxClose()">&nbsp;</div>
<div id="animationTipBox" class="animationTipBox" style="top: 0px; position: absolute;">
    <div style="display:none;" id="gz_detial" onclick="ruleBoxClose()">
        <div class="money_log" id="pocketRuleDescId" style="padding-bottom:10px">
        	<h1 class="h1_title fs16">红包使用规则</h1>
            <p class="xy_hbgz fs14" style="font-weight:bold">红包使用时间</p>
            <p class="xy_hbgz fs14">在红包使用范围内确认收货的返利订单，红包奖励将在订单返利到帐后的3个工作日内发放到对应支付宝。</p>
            <p class="xy_hbgz fs14" style="font-weight:bold">红包使用条件</p>
            <p class="xy_hbgz fs14">红包是基于订单返利来使用，红包使用的返利订单分为超高返订单、普通返订单和指定商品返利订单三种。</p>
            <p class="xy_hbgz fs14">超高返利红包：购买淘粉吧超高返、品牌特卖商品的返利订单</p>
            <p class="xy_hbgz fs14">普通返利红包：购买淘粉吧除聚划算外普通商品的返利订单</p>
            <p class="xy_hbgz fs14">活动商品红包：购买淘粉吧指定商品的返利订单</p>
            <p class="xy_hbgz fs14" style="font-weight:bold">红包使用规则</p>
            <p class="xy_hbgz fs14">1.满足红包条件的返利订单每次自动使用1个红包；当有多个红包时，优先按照红包面额由高到低使用，相同面额优先按照失效时间由近到远使用。</p>
            <p class="xy_hbgz fs14">2.红包奖励将在订单返利到账后的3个工作日内以集分宝或现金的形式发放到对应支付宝中。</p>
            <p class="xy_hbgz fs14">3.购物车每一件商品都是一个独立返利订单，不叠加计算成交金额。</p>
            <p class="xy_hbgz fs14">4.红包有效期内没有符合条件的订单则红包自动失效，失效后不予补发。</p>
            <p class="xy_hbgz fs14">5.红包状态按照未使用在上，已使用（已打款改成）在下状态排序。</p>
            <p class="xy_hbgz fs14">红包最终解释权归淘粉吧所有</p>
    	</div>
    </div>
</div>
<!--领取失败-->
<c:if test="${result ==  0}">
	<div class="mask" id="JS-r-history" style="display:block;" >&nbsp;</div>
	<div class="jfsc-list-history" id="JS-list-history" > 
		<h2 class="h1_title fs15">领取失败</h2>
	    <p class="list-history-p fs15">亲，领取失败，请联系客服	</p>
	    <a href="#/" class="jfsc-r-bottom fs15" style="width:6.875rem;" onclick="historyBoxClose()">我知道了</a>
	</div>
</c:if>
<!--已过期-->
<c:if test="${result ==  3}">
	<div class="mask" id="JS-r-history" style="display:block;" >&nbsp;</div>
	<div class="jfsc-list-history" id="JS-list-history" > 
		<h2 class="h1_title fs15">活动已结束</h2>
	    <p class="list-history-p fs15">亲，很抱歉，您来晚了</p>
	    <a href="#/" class="jfsc-r-bottom fs15" style="width:6.875rem;" onclick="historyBoxClose()">我知道了</a>
	</div>
</c:if>
<!--未开始-->
<c:if test="${result ==  4}">
	<div class="mask" id="JS-r-history" style="display:block;" >&nbsp;</div>
	<div class="jfsc-list-history" id="JS-list-history" > 
		<h2 class="h1_title fs15">活动尚未开始</h2>
	    <p class="list-history-p fs15">亲，很抱歉，活动尚未开始</p>
	    <a href="#/" class="jfsc-r-bottom fs15" style="width:6.875rem;" onclick="historyBoxClose()">我知道了</a>
	</div>
</c:if>
<!--已领取-->
<c:if test="${result ==  1}">
	<div class="mask" id="JS-r-history" style="display:block;" >&nbsp;</div>
	<div class="jfsc-list-history" id="JS-list-history" > 
		<h2 class="h1_title fs15">您已领取</h2>
	    <p class="list-history-p fs15">亲，您已经领取过红包了，请关注淘粉吧的其它优惠活动哦  </p>
	    <a href="#/" class="jfsc-r-bottom fs15" style="width:6.875rem;" onclick="historyBoxClose()">我知道了</a>
	</div>
</c:if>
<!--渠道部匹配-->
<c:if test="${result ==  5}">
	<div class="mask" id="JS-r-history" style="display:block;" >&nbsp;</div>
	<div class="jfsc-list-history" id="JS-list-history" > 
		<h2 class="h1_title fs15">${groupName }</h2>
	    <p class="list-history-p fs15">亲，很抱歉，这是${groupName }用户专享红包 </p>
	    <a href="#/" class="jfsc-r-bottom fs15" style="width:6.875rem;" onclick="historyBoxClose()">我知道了</a>
	</div>
</c:if>
<!--新用户匹配-->
<c:if test="${result ==  6}">
	<div class="mask" id="JS-r-history" style="display:block;" >&nbsp;</div>
	<div class="jfsc-list-history" id="JS-list-history" > 
		<h2 class="h1_title fs15">新用户专享</h2>
	    <p class="list-history-p fs15">亲，很抱歉，您不是淘粉吧新用户，不能领取红包 </p>
	    <a href="#/" class="jfsc-r-bottom fs15" style="width:6.875rem;" onclick="historyBoxClose()">我知道了</a>
	</div>
</c:if>
<!--弹框 end-->
<div class="jfsc-r-list">
	<p class="jfsc-banner"><img src="${promoImgUrl }" class="w100" /></p>
	
    <p class="jfsc-rule-text fs14" onclick="ruleShow()" style="text-decoration: none;overflow:hidden;_zoom:1;">
        <span style="float: right;overflow:hidden;_zoom:1;">
            <img src="https://img.alicdn.com/imgextra/i1/1039442546/TB2K_g1qpXXXXalXpXXXXXXXXXX_!!1039442546.png" style="width:0.297rem;margin-top: 0.31rem;margin-right:0.062rem;float:left">
            <span style="float:right;">查看红包规则</span> 
        </span>
    </p>  

    <ul class="jfsc-ul">
    <c:forEach items="${list }" var="hb">
    	<li>
        	<div class="jfsc-ul-img">
            	<p class="img-p">
            	<img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2pirPmpXXXXbkXpXXXXXXXXXX_!!2296013456.png" class="w100" /></p>
            	<c:if test="${hb.fanliType eq 'GF' }">
	                <p class="jfsc-ul-opacity">
	                    <i>&nbsp;</i>
	                    <span class="text fs12">超高返</span>
	                </p>
                </c:if>
            </div>
            <div class="jfsc-list-right">
            	<p class="p1 fs15">${hb.amount }元红包</p>
                <p class="p2 fs12">
                使用条件：单笔
				<c:if test="${hb.fanliType eq 'GF' }">
                	高反
                </c:if>
				<c:if test="${hb.fanliType eq 'PF' }">
                	普反
                </c:if>
                订单实付金额满${hb.realPay }元</p>
                <span class="time fs12">有效期：${hb.timeDesc}天</span>
            </div>
        </li>
    </c:forEach>
    </ul>
    <a href="/klhb/grantHongbao?userId=${userId}&groupId=${groupId}&channel=${channel}&appCookie=${appCookie}" class="jfsc-r-bottom fs14">我要领取</a>
</div>
</body>
<script>
$(function(){
	$('#JS-list-history').css('top', ($(window).height()-$('#JS-list-history').outerHeight())/2-0.25*parseFloat(window.document.documentElement.style.fontSize));
})
function ruleShow(){
	$("#maskDivId").show();
	$("#gz_detial").show();
}
function ruleBoxClose(){
	$("#maskDivId").hide();
	$("#gz_detial").hide();
}
function historyBoxClose(){
	$("#JS-r-history").hide();
	$("#JS-list-history").hide();
}
</script>
</html>