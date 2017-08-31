<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html style="background: #031b49;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta name="format-detection" content="telephone=no, email=no" />
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script> 
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://m.taofen8.com/js/swiper.jquery.min.js"></script>
<script src="https://m.taofen8.com/js/jquery.cookie.js" type="text/javascript"></script>
<script src="https://m.taofen8.com/js/common.js?v=06171815" type="text/javascript"></script>
<script src="https://m.taofen8.com/js/jquery.lazyload.mini_1.9.3.js" type="text/javascript"></script>
<link href="https://m.taofen8.com/css/swiper.min.css" rel="stylesheet" type="text/css" />

<script src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script type="text/javascript" src="https://ocean.taofen8.com/js/yqyj.js"></script>
<script type="text/javascript" src="https://ocean.taofen8.com/js/tf8common_ocean.js"></script>
<link rel="stylesheet" type="text/css" href="https://ocean.taofen8.com/css/yqyj.css"/>
<title>邀请有奖活动</title>
</head>

<body>

<input type="hidden" id="shareController" value="${shareController}">
<input type="hidden" id="shareDialogTitle" value="${shareDialogTitle }">
<input type="hidden" id="shareDialogDescription" value="${shareDialogDescription }">
<input type="hidden" id="shareDescription" value="${shareDescription }">
<input type="hidden" id="shareImageUrl" value="${shareImageUrl }">
<input type="hidden" id="shareTitle" value="${shareTitle }">
<input type="hidden" id="showFlag" value="${showFlag }">
<input type="hidden" id="shareUrl" value="${shareUrl }">
<input type="hidden" id="callbackUrl" value="${callbackUrl}">
<input type="hidden" id="route" value="${route}">
<input type="hidden" id="userId" value="${userId}">
<input type="hidden" id="loginUrl" value="${loginUrl}">

<div class="yqyj" style="height:15rem">
	<div class="fs0" style="height:15rem">
		<p class="yqyj_rule">
			<img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2bdoHqVXXXXXyXXXXXXXXXXXX_!!2296013456.png" class="w100">
			<c:choose>
				<c:when test="${productVersion eq 'Android' }">
					<a class="yqyj_rule_button" title="详细规则" href="http://ocean.taofen8.com/html/invite/inviterule_android.html" target="_blank">&nbsp;</a>
				</c:when>
				<c:otherwise>
					<a class="yqyj_rule_button" title="详细规则" href="http://ocean.taofen8.com/html/invite/inviterule_iphone.html" target="_blank">&nbsp;</a>
				</c:otherwise>
			</c:choose>
			
		</p>
		
		<c:if test="${actEnd eq 'false' }">
		<c:choose>
			<c:when test="${count>0}">
				<p class="fs17 yqyj_p1">红包变大<span> ${count} </span>次啦！</p>
			</c:when>
			<c:otherwise>
				<p class="fs17 yqyj_p1">红包还未变大哦！</p>
			</c:otherwise>
		</c:choose>
		<div class="tf8-log yqyj_yqButton"  id="JS_yqButton" log-position="share_button" log-content="邀请好友"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2USkoqVXXXXciXXXXXXXXXXXX_!!2296013456.png" alt="邀请好友" class="w100"></div>
		</c:if>
		
		<c:if test="${actEnd eq 'true' }">
		<c:choose>
			<c:when test="${count>0}">
				<p class="fs14 yqyj_p1">红包变大<span> ${count} </span>次啦！</p>
				<p class="fs17 yqyj_p1" style="margin-top: 0;">您将获得1个 <span>${amount}元</span> 红包</p>
			</c:when>
			<c:otherwise>
				<p class="fs17 yqyj_p1">真遗憾，您没有邀请到好友，得不到红包了呢</p>
			</c:otherwise>
		</c:choose>
		<div class="yqyj_yqButton" ><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2vtN0sXXXXXaPXXXXXXXXXXXX_!!2296013456.png" alt="活动已结束" class="w100"></div>
		</c:if>
	</div>
	<c:if test="${fn:length(inviteRewardRecords)>0 }">
	<dl class="yqyj_record_list" id="JS_record_list">
		<dt class="fs17 title">邀请记录</dt>
		<c:forEach var="inviteRewardRecord" items="${inviteRewardRecords }" varStatus="varstatus">
			<dd class="fs14 record_list_dd">
			<span class="fs11 sort">${varstatus.index+1}</span>
			<span class="pic">
			<img src="${inviteRewardRecord.wechatHeadImgUrl }" onerror="this.src='https://img.alicdn.com/imgextra/i2/2296013456/TB22YD1qVXXXXbyXpXXXXXXXXXX_!!2296013456.png';" class="">
			</span>
			<span class="userName">${inviteRewardRecord.wechatNickName }</span>
			<span class="text">
			<c:choose>
				<c:when test="${inviteRewardRecord.status==0 }">未注册</c:when>
				<c:when test="${inviteRewardRecord.status==1 }">还未登陆淘粉吧APP</c:when>
				<c:when test="${inviteRewardRecord.status==2 }">邀请成功，红包变大咯！</c:when>
				<c:when test="${inviteRewardRecord.status==3 }">邀请已过期</c:when>
				<c:when test="${inviteRewardRecord.status==4 }">邀请失败,被其他人邀请</c:when>
				<c:when test="${inviteRewardRecord.status==5 }">被邀请者为老用户</c:when>
				<c:when test="${inviteRewardRecord.status==6 }">邀请已过期</c:when>
				<c:when test="${inviteRewardRecord.status==7 }">无效用户</c:when>
				<c:otherwise>被邀请者为老用户</c:otherwise>
			</c:choose>
			</span>
		</dd>
		</c:forEach>
	</dl>
	</c:if>
</div>
<!-- 弹框 -->
<div id="JS_tk_opacity" class="tk_opacity">&nbsp;</div>
<div id="JS_tk_share_opacity" class="tk_opacity">&nbsp;</div>
<!-- 弹框 活动结束 -->
<div id="JS_tk_over" class="yqyj_tankuang closeTK">
	<span class="close"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2F0P0qVXXXXbAXpXXXXXXXXXX_!!2296013456.png" class="w100" alt="关闭"></span>
	<div class="content">
		<p class="fs17 tk_title">活动已结束</p>
		<p class="tk_text">该活动已结束，敬请期待后续活动。</p>
		<a class="fs14 tk_button" id="over_close" href="javascript:void(0)">知道了</a>
	</div>
</div>
<!-- 弹框 非淘粉吧App环境 提示用户下载淘粉吧 -->
<div id="JS_tk_download" class="yqyj_tankuang closeTK">
	<span class="close"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2F0P0qVXXXXbAXpXXXXXXXXXX_!!2296013456.png" class="w100" alt="关闭"></span>
	<div class="content">
		<p class="fs17 tk_title">请下载客户端</p>
		<p class="tk_text">本活动仅可通过淘粉吧客户端参与，快去下载赚红包吧！</p>
		<a class="fs14 tk_button" id="JS_download" href="javascript:void(0)">立即下载</a>
	</div>
</div>
<!-- 弹窗 分享 -->
<div class="yqyj_tank_share" id="JS_tk_share">
	<span class="close"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2F0P0qVXXXXbAXpXXXXXXXXXX_!!2296013456.png" class="w100" alt="关闭"></span>
	<div class="cont">
		<p class="fs17 p1">一起变红包，一起买买买！</p>
		<p class="fs11 p2"></p>
	</div>
	<dl class="dl">
		<dd>
			<p><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2yCD0qVXXXXarXpXXXXXXXXXX_!!2296013456.png" class="w100"></p>
			<p class="fs9">朋友圈</p>
		</dd>
		<dd>
			<p><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB20p7uqVXXXXbwXXXXXXXXXXXX_!!2296013456.png" class="w100"></p>
			<p class="fs9">微信好友</p>
		</dd>
	</dl>
</div>

<!-- 日志统计用 -->
<input class="tf8-log-hidden" type="hidden" name="pageType" value="mobile" />
<input class="tf8-log-hidden" type="hidden" name="pageName" value="invite_inviter" />
<input class="tf8-log-hidden" type="hidden" name="code" value="invite" />
<input class="tf8-log-hidden" type="hidden" name="channel" value="${channel}" />
<input class="tf8-log-hidden" type="hidden" name="userId" value="${userId}" />

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75777879-21', 'auto');
  ga('send', 'pageview');

</script>

</body>
</html>