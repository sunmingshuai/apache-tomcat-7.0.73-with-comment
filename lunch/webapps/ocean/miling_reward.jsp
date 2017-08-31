<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta content="telephone=no,email=no" name="format-detection">
<script src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<style>
html {background-color: #fff;}
body {width: 10rem;margin: 0 auto;color: #333;font-size:arial,sans-serif}
div,table,tr,td {box-sizing: border-box;}
#records{width:9.28125rem;margin-left:0.4375rem;}
#records tr{height:2rem;max-height:200px;border-bottom:0.03125rem solid #f5f5f5;}
#records td:nth-child(1){width:1.25rem;}
#records td:nth-child(3){width:2.5rem;text-align:right;}
#records .icon{width:0.90625rem;height:0.90625rem;display:inline-block;background-size:contain;}
#records .icon.hb{background-image:url('https://img.alicdn.com/imgextra/i2/2296013456/TB2ZLOudYXlpuFjSszfXXcSGXXa_!!2296013456.png');}
#records .icon.jfb{background-image:url('https://img.alicdn.com/imgextra/i2/2296013456/TB2T.mtd4XlpuFjSsphXXbJOXXa_!!2296013456.png');}
#records .icon.jf{background-image:url('https://img.alicdn.com/imgextra/i1/2296013456/TB2KcxBe4hmpuFjSZFyXXcLdFXa_!!2296013456.png');}
#records .txt p{line-height:1.5;}
#records .desc{color:#999;}
#records .money{padding-right:.5rem;color:#f96767;background:url('https://img.alicdn.com/imgextra/i2/2296013456/TB23W1yd4XkpuFjy0FiXXbUfFXa_!!2296013456.png') no-repeat center right;background-size:contain;}
.img-wrap{width:3.03125rem;height:2.8125rem;margin:3rem auto 0.2rem;}
.img-wrap p{width:100%;padding-left:0.45rem;text-align:center;color:#4A4A4A; }

[data-dpr="1"] .fontSize11 {font-size:11px}
[data-dpr="2"] .fontSize11 {font-size:22px}
[data-dpr="3"] .fontSize11 {font-size:33px}
[data-dpr="1"] .fontSize13 {font-size:13px}
[data-dpr="2"] .fontSize13 {font-size:26px}
[data-dpr="3"] .fontSize13 {font-size:39px}
[data-dpr="1"] .fontSize14 {font-size:14px}
[data-dpr="2"] .fontSize14 {font-size:28px}
[data-dpr="3"] .fontSize14 {font-size:42px}
</style>
<title>获奖记录</title>
<script>
	var userId = ${userId};
	
	function goAppMsg() {
		jumpToAPP("taofen8-master://msg?id=mine");
	}
	
	function goHongbao() {
		window.location.href = "http://ocean.taofen8.com/hongbao/myHongbao?userId="
				+ userId + "##我的红包";
	}
	
	function goJifen() {
		window.location.href = "http://ocean.taofen8.com/jifen/myJifen?userId="
				+ userId + "##我的积分";
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
	    //  window.location = url;
	    //} 
	    else {
	        $(document.body).append('<iframe src="'+url+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
	    }
	}
</script>
</head>
<body>
	<c:if test="${ empty list }">
		<div class="img-wrap">
			<img src="https://img.alicdn.com/imgextra/i2/643039162/TB2zNVpnVXXXXcZXXXXXXXXXXXX_!!643039162.png" style="width:100%;height:100%;display:block;" />
			<p class="fontSize14">没有获奖记录哦！</p>
		</div>
	</c:if>
	<c:if test="${not empty list }">
		<table id="records">
			<c:forEach items="${list}" var="record">
				<c:choose>
					<c:when test="${record.rewardType eq 'point'}">
						<tr class="jfb-record" onclick="goAppMsg()">
							<td><span class="jfb icon"></span></td>
							<td class="txt">
								<p class="fontSize13">${record.mlWord }</p>
								<p class="fontSize11 desc">${record.rewardDesc }</p>
							</td>
							<td>
								<span class="money fontSize13">${record.rewardAmount }</span>
							</td>
						</tr>
					</c:when>
					<c:when test="${record.rewardType eq 'jifen'}">
						<tr class="jf-record" onclick="goJifen()">
							<td><span class="jf icon"></span></td>
							<td class="txt">
								<p class="fontSize13">${record.mlWord }</p>
								<p class="fontSize11 desc">${record.rewardDesc }</p>
							</td>
							<td>
								<span class="money fontSize13">${record.rewardAmount }</span>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr class="hb-record"  onclick="goHongbao()">
							<td><span class="hb icon"></span></td>
							<td class="txt">
								<p class="fontSize13">${record.mlWord }</p> 
								<p class="fontSize11 desc">${record.rewardDesc }</p>
							</td>
							<td>
								<span class="money fontSize13">${record.rewardAmount }</span>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table>
	</c:if>
<script src="https://m.taofen8.com/js/jquery-2.1.4.min.js"></script>

<script>
   (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
   m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
   })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75777879-2', 'auto');
  ga('send', 'pageview');
</script>
</body>
</html>
