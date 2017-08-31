<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="yes" name="apple-touch-fullscreen">
	<meta content="telephone=no,email=no" name="format-detection">
	<script src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
	<link rel="stylesheet" href="/css/cmbc_creditcard_actpage.css">
	<title>办卡狂送集分宝</title>
</head>
<body>
	<div id="container" class="fs12">
		<input id="userId" value="${userId}" type="hidden">
		<input id="actUrl" value="${actUrl}" type="hidden">
		<input id="loginUrl" value="${loginUrl}" type="hidden">
		<c:if test="${not empty luckStartList}">
	    <div class="lucky-star">
	    	<div class="title fs18">幸运之星</div>
	    	<ul class="fs14">
	    		<c:forEach items="${luckStartList}" var="luckStart" varStatus="num">
	    		<li>
	    			<span>${num.index +1}</span><span>${luckStart.mobile}</span><span>${luckStart.rewardAmount}集分宝</span>
	    		</li>
				</c:forEach>
	    	</ul>
	    </div>
	    </c:if>
		<!-- 活动规则 -->
		<dl>
			<dt class="fs14">活动规则</dt>
			<dd>• 活动时间：3月23日-4月7日</dd>
			<dd>• 通过淘粉吧首次申请民生银行信用卡（不限卡种），提交资料并成功核卡，免费送888集分宝，已有民生银行信用卡再申请者无集分宝奖励；</dd>
			<dd>• 活动期间随机抽取10名幸运用户，奖励18888集分宝，中奖名单将在活动页公布；</dd>
			<dd>• 由于银行核卡时间限制，集分宝需在银行资料审核成功后发放，约7个工作日；</dd>
			<dd>• 申领成功将以手机短信和站内信形式通知领取奖励，请记得填写申请时的手机号码；</dd>
			<dd>• 一个用户（同一账户、身份证、手机号）仅限参与一次，重复申请不再赠送；</dd>
			<dd>• 本活动最终解释权归淘粉吧所有。</dd>
		</dl>
		<footer>
			<a class="btn fs14" id="progressBtn" href="${processUrl}">查询办卡进度</a>
			<div class="btn fs14" id="applyBtn">申请办卡</div>
		</footer>
		<img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2zwPEi.hnpuFjSZFpXXcpuXXa_!!2296013456.png" id="fixedIcon" />
	</div>
	</div>
	<script src="https://m.taofen8.com/js/jquery-2.1.4.min.js"></script>
	<script src="/js/cmbc_creditcard_actpage.js"></script>
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-75777879-33', 'auto');
	  ga('send', 'pageview');
	</script>
</body>
</html>