<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<title>我的积分</title>
<link rel="stylesheet" type="text/css" href="/css/vip.css?v=04010618" />
<style type="text/css">
    html{background: #fff;}
    .jf_gz{padding: 0.03rem 0.12rem 0.05rem 0.12rem;float: right;margin-top: 0.2rem;text-align: center;color: #000;}
    .jf_sk{border-bottom: 1px #d7d7d7 solid;border-top: 1px #d7d7d7 solid;width: 100%;background: #eeeeee;padding: 0.2rem 0;}
    .hb_img{width: 2.28125rem;height: 2.28125rem;}
    .hb_img_3{height: 2.5625rem;float: right;margin-top: -0.2rem;}
    .hb_dh_box{width: 9.0rem;height: auto;overflow: hidden;margin: 0 auto;padding-bottom: 0.7rem;}
    .hb_dh_box h1{padding-top: 0.25rem;}
    .hb_list{width: 100%;height: auto;overflow: hidden;padding-top: 0.5rem;}
    .hb_list p{width: 2.28125rem;height: 2.28125rem;float: left;margin-left: 0.55rem;}
    .fyb_a_h{background: #e70016;}
    .mingxi{padding-bottom: 0.5rem;width: 100%; height: auto; overflow: hidden;}
    .jfmx{padding: 0.5rem;}
    .tiwen{color: #000;padding: 0.5rem;font-weight: 800;}
    .tw_img1{width:10rem;height:4.6875rem;}
    .tw_img1 img{width:10rem;height:4.6875rem;}
    .tw_img2{width:10rem;height:4.6875rem;}
    .tw_img2 img{width:10rem;height:4.6875rem;}
    
    .mask {width:100%;height:100%;position:fixed;background:#000;top:0px;left:0px;opacity:0.6;z-index:100}
    .animationTipBox{height:auto;position:fixed;top:0%;z-index:1001;width:100%; left:0%;  top:20%; font-family:"微软雅黑";}
    .money_log {width:8.5rem;height: auto;margin: 8% auto auto auto; background: #fff;border-radius: 10px;overflow: hidden;}
    .fyb_a{text-align:center; display:block;width:9.0rem; padding:0.3rem 0; background:#f53e7b;border-radius:6px;color:#fff; margin:0.5rem auto auto auto}
</style>
</head>

<body>
	<div class="vip">
		<div class="xh_fyb" style="width:9rem;" >
	     	当前可用积分： &nbsp;<span class="hong fontSize22">${jifen}</span><a href="https://ocean.taofen8.com/html/jifen/jf_shuoming.html" class="jf_gz fontSize12">积分规则</a>
	    </div>
		<c:if test="${flower > 0 }">
			<div class="xh_fyb" style="width:9rem; " >
	     	我的鲜花  &nbsp;&nbsp;<span class="hong fontSize22">${flower}</span>&nbsp;朵 <a href="https://ocean.taofen8.com/jifen/flowerToJifen?userId=${userId}" class="dhdh dhdh_2 fontSize12">兑换成积分</a>
	     	</div>
	    </c:if>
	    <c:if test="${score > 0 }">
			<div class="xh_fyb" style="width:9rem; " >
	     	我的粉元宝  &nbsp;&nbsp;<span class="hong fontSize22">${score}</span>&nbsp;个 <a href="https://ocean.taofen8.com/jifen/scoreToJifen?userId=${userId}" class="dhdh dhdh_2 fontSize12">兑换成积分</a>
	     	</div>
	    </c:if>
	    <div class="jf_sk"></div>
	    <div class="hb_dh_box">
	        <h1 class="fontSize14">可兑换红包</h1>
	        
	        
	        <c:if test="${showJFHongbao }">
		        <div class="hb_list">
		            <p onclick="$('#maskDivId').show();$('#alertTipBox').show();"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2789lgVXXXXacXXXXXXXXXXXX_!!2296013456.jpg" class="hb_img hb_img_1"  /></p>
		            <p onclick="$('#maskDivId').show();$('#alertTipBox').show();"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2LbR5gVXXXXXtXpXXXXXXXXXX_!!2296013456.jpg" class="hb_img" /></p>
		            <p onclick="$('#maskDivId').show();$('#alertTipBox').show();"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB23r45gVXXXXXLXpXXXXXXXXXX_!!2296013456.jpg" class="hb_img hb_img_3"/></p>
		        </div>
	        	 <a href="#" class="fyb_a fyb_a_h fontSize14" onclick="$('#maskDivId').show();$('#alertTipBox').show();" >去兑换红包</a>
	        </c:if>
	       	<c:if test="${!showJFHongbao }">
		       	<div class="hb_list">
		            <p onclick="javascript:window.location.href='https://ocean.taofen8.com/jifen/goRedPocketListPage?userId=${userId}'"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2789lgVXXXXacXXXXXXXXXXXX_!!2296013456.jpg" class="hb_img hb_img_1"  /></p>
		            <p onclick="javascript:window.location.href='https://ocean.taofen8.com/jifen/goRedPocketListPage?userId=${userId}'"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2LbR5gVXXXXXtXpXXXXXXXXXX_!!2296013456.jpg" class="hb_img" /></p>
		            <p onclick="javascript:window.location.href='https://ocean.taofen8.com/jifen/goRedPocketListPage?userId=${userId}'"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB23r45gVXXXXXLXpXXXXXXXXXX_!!2296013456.jpg" class="hb_img hb_img_3"/></p>
		        </div>
	       		<a href="https://ocean.taofen8.com/jifen/goRedPocketListPage?userId=${userId}" class="fyb_a fyb_a_h fontSize14">去兑换红包</a>
      	  </c:if>

	    </div>
	    <div class="jf_sk"></div>
	    <div class="mingxi">
	         <h1 class="jfmx fontSize14">积分明细</h1>
	         <a href="https://ocean.taofen8.com/jifen/jifenIncome?userId=${userId}" class="fyb_a fyb_b fontSize14" style="margin-top:0rem;">收入明细</a>
	         <a href="https://ocean.taofen8.com/jifen/jifenExpend?userId=${userId}" class="fyb_a fyb_b fontSize14">支出明细</a>
	    </div>
	    <div class="jf_sk"></div>
	    <h1 class="jfmx fontSize14">温馨提示</h1>
	    <h2 class="tiwen fontSize12">1.怎么获得积分？</h2>
	    <div class="tw_img1"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2uwV9gVXXXXc6XXXXXXXXXXXX_!!2296013456.jpg" /></div>
	    <h2 class="tiwen fontSize12">2.积分可以干什么？</h2>
	    <div class="tw_img2"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2KreXgVXXXXb7XXXXXXXXXXXX_!!2296013456.jpg" /></div>
	</div>

<div class="mask" id="maskDivId" style="display:none;" onclick="gz_close()"></div>
<div id="alertTipBox" class="animationTipBox"  style="display:none; top:25%;">
	<div style="display:block;"  >
		<div class="money_log" style="padding:1rem 0 0.5rem;text-align:center">
			抱歉！由于系统升级兑换红包的功能暂停使用12小时！<br>
			<div class="fyb_a" style="width:4.5rem" onclick="gz_close()">
				我知道了
			</div>
		</div>
    </div>
</div>

<script>
function gz_close(){
	$("#alertTipBox").hide();
	$("#maskDivId").hide();	
}
</script>
</body>
</html>
