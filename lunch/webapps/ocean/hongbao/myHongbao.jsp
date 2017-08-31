<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%  String contextPath =request.getContextPath();
	pageContext.setAttribute("contextPath",contextPath);
%>
<!DOCTYPE html>
<html>
<head>
<title>淘粉吧-我的红包</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection"content="telephone=no, email=no" />
<link rel="stylesheet" type="text/css" href="https://ocean.taofen8.com/css/myhb.css?v=04010618" media="all"/>
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js" ></script>
<script type="text/javascript" src="../js/jquery-2.1.4.min.js" ></script>
<script language="javascript">
var pocketMaxPage =1;
var pocketCount=0;
var currentPocketPage = 1;
var docHeight = 0;
$(document).ready(function(){
	 ajaxRed(); 					
	$(window).scroll(function(){
		var scrollTop = $(this).scrollTop();               //滚动条距离顶部的高度
		var scrollHeight = $(document).height();           //当前页面的总高度
		var windowHeight = $(this).height();               //当前可视的页面高度
		scrollTop = scrollTop+50;
		if(scrollTop + windowHeight >= scrollHeight){        //距离顶部+当前高度 >=文档总高度 即代表滑动到底部
			if(currentPocketPage >= pocketMaxPage ||  pocketCount==0){                         //如果加载ajax达到2次 停止加载
				return false;                              //如果条件满足 停止运行该判断
			}
			ajaxRed();   //开始加载ajax
		}
	});
	docHeight = $(document).height();
});
function gz_close(){
	$("#animationTipBox").hide();	
	$("#maskDivId").hide();	
}

function closeNeedLogin(msgId){
	$("#"+msgId).hide();
	$(".mask").hide();
}

function ajaxRed(){
	if (pocketCount > 0){
		$(".loading_text").ajaxStart(function(){    //ajax开始执行
			$(this).show(); 
		}).ajaxStop(function(){                 //ajax结束执行
			  	$(this).hide();
		});
		currentPocketPage++;                           //执行成功页码+1
		if (currentPocketPage > pocketMaxPage){
			return currentPocketPage;                       //判断页码是否达到限定的加载次数;
			return false;
		}
	}
	var userId=$("#userId").val();
	$.ajax({
	      type:'GET',
	   	  url:'/hongbao/myPocket',
	      data:{'pageNo':currentPocketPage,'userId':userId},
	      dataType:'json',
	      timeout:10000,
	      success:function (data) {
				var myPocketHtml = new StringBuffer();
				var pageBean = data.pageBean;
				var pocketArray = data.list;
				if(pageBean == null || pocketArray == null || pocketArray.length == 0 ){
					$("#noPocketListId").show();
				}else{
					pocketMaxPage=pageBean.totalPages;
					for(var i=0; i<pocketArray.length; i++) {
						var pocketObj=pocketArray[i];
						var status =pocketObj.hbStatus;//红包状态
						var useDesc= pocketObj.useDesc;//使用范围
						var timeDesc = pocketObj.timeDesc;//使用期限
						var amount = pocketObj.amount;//金额
						var resource = pocketObj.resource;//来源
						var tradeSource = pocketObj.tradeSource;//订单来源
						
						var useableClass = '';//列表中的红包样式
						var useableImg = '';//列表中的红包可否使用样式图片
						var tradeSourceClass = ''//订单来源样式
						var tradeSourceImg = '';//订单来源角标
						
						if(status == '0' ){
						//未使用
							useableClass = 'usable';
							useDesc = useDesc+'<br/>';
						}else if(status == '2'){
						//已使用
							useableClass = 'unusable';
							useableImg = 'https://img.alicdn.com/imgextra/i4/2296013456/TB2gV9uXYxmpuFjSZJiXXXauVXa_!!2296013456.png';
							useDesc = '<span class="content text-ellipsis">'+useDesc+'</span>';
						}else if(status == '200'){
						//已过期
							useableClass = 'unusable';
							useableImg = 'https://img.alicdn.com/imgextra/i3/2296013456/TB2Vf1tXYlmpuFjSZFlXXbdQXXa_!!2296013456.png';
							useDesc = useDesc+'<br/>';
						}else if(status == '1' || status == '100'){
						//使用中
							useableClass = 'usable';
							useableImg = 'https://img.alicdn.com/imgextra/i2/2296013456/TB2h1yrX.lnpuFjSZFjXXXTaVXa_!!2296013456.png';
							useDesc = '<span class="content text-ellipsis">'+useDesc+'</span>';
						}
						
						//客户端专享红包
						if(tradeSource == '1'){
							tradeSourceClass = 'app_icon';
							if(status == '0' || status == '1' || status == '100'){
							//未使用或使用中状态
								tradeSourceImg = 'https://img.alicdn.com/imgextra/i4/2296013456/TB2dBJCfYJmpuFjSZFwXXaE4VXa_!!2296013456.png';
							}else if(status == '2' || status == '200'){
							//已使用或已过期
								tradeSourceImg = 'https://img.alicdn.com/imgextra/i3/2296013456/TB2xl4je80kpuFjy1XaXXaFkVXa_!!2296013456.png';
							}
						}
						
						myPocketHtml.append('<li class="'+useableClass+'">');
						if(tradeSourceImg!=''){
							myPocketHtml.append('	<span class="'+tradeSourceClass+'">');
							myPocketHtml.append('		<img src="'+tradeSourceImg+'" class="w100"/>');
							myPocketHtml.append('	</span>');
						}
						myPocketHtml.append('	<div class="price_wrap">');
						myPocketHtml.append('		<i class="fs12 price_sign">￥</i><span class="fs30">'+amount+'</span>');
						myPocketHtml.append('	</div>');
						myPocketHtml.append('	<dl class="hb_detail_wrap">');
						myPocketHtml.append('		<dt class="fs12 title">'+resource+'</dt>');
						myPocketHtml.append('		<dd class="fs11 introduce">'+useDesc+'<span class="red_packet_time">'+timeDesc+'</span></dd>');
						myPocketHtml.append('	</dl>');
						if(useableImg!=''){
							myPocketHtml.append('	<span class="tip_icon">');
							myPocketHtml.append('		<img src="'+useableImg+'" class="w100"/>');
							myPocketHtml.append('	</span>');
						}
						myPocketHtml.append('</li>');
					}
					$("#myPocketListId ul").append(myPocketHtml.toString());
				}
			pocketCount++;
		}
	});
}   


function  replaceIfOverLimit(title){
	if(title!= null && title.length>26){
		return title.substring(0,26)+"...";
	}
	return title;
}

//创建一个StringBuffer类 ，此类有两个方法：一个是append方法一个是toString方法
function StringBuffer() {
	this.__strings__ = [];
}
StringBuffer.prototype.append = function(str) {
	this.__strings__.push(str);
}
StringBuffer.prototype.toString = function() {
	return this.__strings__.join('');
}
</script>  
</head>
<body>
	<input type="hidden" id="userId" name="userId" value="${userId}">
	
    <div class="hb_list_container">
    	<div class="hb_list_hint">
			<p class="word fs11">
				确认收货后红包自动使用<br/>红包在返利到账后最快半小时内自动到账
			</p>
			<a class="look_rule fs12" href="https://ocean.taofen8.com/html/hongbao/myHongbaorule.html">
                <span class="look_source fs13">查看红包规则</span>
                <span class="gt"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2iyIwXR8lpuFjy0FnXXcZyXXa_!!2296013456.png" class="w100"></span>
            </a>
        </div>
        <div class="hb_list_message">
            <div class="hb_list_integral">
                <p class="fs12 word">可兑换积分</p>
                <p class="fs20 number">${userjf}</p>
            </div>
            <a class="go_exchange fs14" href="https://ocean.taofen8.com/jifen/goRedPocketListPage?userId=${userId}">去兑换红包</a>
        </div>
        <!--红包列表-->
    	<div class="hb_lb" style="display:block;"  id="myPocketListId"><ul></ul></div>
        <div class="dont_hb" style="display:none;" id="noPocketListId">
        	<p class="dont_hb_img" style="text-align: center;padding-top: 3.2rem;">
        		<img src="https://img.alicdn.com/imgextra/i4/615562620/TB2mLKUdRNkpuFjy0FaXXbRCVXa_!!615562620.png" style="
				width: 5.4rem;height: 3.9rem;text-align: CENTER;">
        	</p>
        	<br/>
            <p class="dont_hb_p fs14" style="text-align:center;line-height:0.7rem">您还没有红包哦<br>搜索淘粉吧微信公众号（taofen8）<br/>红包动态提前知</p>
        </div>
        <div class="loading_text" >正在加载中...</div>
        <div style="padding:5% 0;"></div>
    </div>
</body>
</html>