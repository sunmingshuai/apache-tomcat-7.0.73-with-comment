<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection"content="telephone=no, email=no" />
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<title>双12提前屯红包啦</title>
<style type="text/css">
body,p,ul{font:normal 100% "微软雅黑" Helvetica, Arial, sans-serif; padding:0; margin:0;}
html {background:#ff3600 url('https://img.alicdn.com/imgextra/i4/2296013456/TB29EBAebOJ.eBjy1XaXXbNupXa_!!2296013456.png') no-repeat;background-size:contain;}
a{text-decoration:none;}
a:hover{text-decoration:none;}
.w100{width:100%;}
.red{width:10rem; height:auto;  margin:0 auto;padding-top:10.21875rem;padding-bottom: 1.8rem;color:#fff;}
.red a{display:block;margin:0 auto;width:8.5rem;height:1.4375rem;line-height:1.4375rem;border:0;border-radius:0.78125rem;color:#fff;text-align:center;outline:none;background-color:#8f11ff;box-shadow:0 0.0625rem 0 0.0625rem #7200a7;}
.red .title{margin-bottom:0.5rem;line-height:1;text-align:center;}
.red .wks{margin-bottom:0.3125rem;color:#7e7e7e;background-color:#cfcfcf;box-shadow:0 0.0625rem 0 0.0625rem #a89393}
ul{width:9.5rem;margin:0 auto;padding:0.125rem 0.3125rem 0 .5rem;line-height:1.6;border:0.0625rem solid #ff4800;border-radius:0.25rem;word-break:break-all;box-sizing:border-box}
ul li{margin-top: 0.34375rem;}
.red .time{padding:0.71875rem 0 0.9rem;text-align:center;}
.red .time span{background: #000;padding: 0.2rem 0.15rem;border-radius: 0.1rem;}
.red .yi_tx{color: #7e7e7e;background:#cfcfcf;box-shadow:0 0.0625rem 0 0.0625rem #a89393}

/***红包弹框**/
.mask{width:100%;height:100%;background-color:#000;opacity:0.8;filter:alpha(opacity=80);-moz-opacity:0.8;position: fixed;left: 0;top: 0;z-index:1000;pointer-events:none;}
.animationTipBox{height:auto;position:fixed;top:0%;z-index:1001;width:100%; left:0%;  top:30%; font-family:"微软雅黑";}
.za_dan{width:95%;margin:0 auto; height:auto; position:relative;}
.za_dan a{width:28%; display:block; float:left;margin-left:4%;}
.za_dan a img{width:100%;}
.za_dan .center{margin-top:12%;}
.za_danp1{width:30%; position:absolute;left:23%;top:-32px;}
.za_danp2{width:20%;position:absolute;left:51%;top:4%;}
.za_dan .wenan{color:#ffcd41; width:100%; text-align:center;font-size:1.1em; font-family:"微软雅黑";clear:both;}
.act_tank{width:90%;height:auto;margin:-8% auto auto auto;background:#fff;border-radius:6px; overflow:hidden;padding-bottom:5%;}
.top_img{width:35%;margin:0 auto auto auto;}
.top_a{width:10%;display:block;float:right;margin:2% 2% 0 0;}
.h1_title{border-bottom:1px solid #f43d8b;width:85%; margin:0 auto;clear:both; text-align:center; padding:3% 0; }
.deart_wz{width:100%; text-align:center;color:#000;padding:3% 0;}
.deart_wz span{color:#f43d8b;}
.button_a{width:50%;display:block;padding:3% 0; background:#f53e7b;border-radius:6px;color:#fff;font-size:0.9em; text-align:center; text-decoration:none;margin:2% auto;}
.button_a:visited{color:#fff;}
.h1_title span{color:#f43d8b;}
.h1_title_hx{border-bottom:none;}
.ppt_tc{width:89%; border-radius:5px; background:#fff; position:fixed; top:25%; left:5%; z-index:1002; padding-bottom:5%; text-align:center;}
.ppt_tc .tc_title{font-weight:bold; color:#333; text-align:center; margin-top:5%;}
.ppt_tc .tc_text{width:89%; margin:2% auto 0;text-align:left;}
.ppt_tc .tc_button{margin-top:4%;  padding:0 2%;}
.tc_button a{width:40%; display:inline-block; text-align:center; padding:4% 0; border-radius:5px; margin:0 2%; text-decoration:none;}
.tc_button .grey{color:#666; border:#ccc solid 1px;}
.tc_button .red{color:#fff; border:#f83a7a solid 1px; background:#f83a7a;}
.tc_button .bg999{color:#fff; background:#999; border:#999 solid 1px;}
.numberNull{width:87%; border:#ccc solid 1px; border-radius:5px; background:#eee; color:#999;  padding:2% 5px; outline:none; margin-top:3%;}
.yzm_button{display:inline-block;width:30%; height:auto; padding:2% 5px; background:#f4edbd; color:#666; border-radius:5px; margin-top:3%; border:#e2d892 solid 1px; text-decoration:none;}
.error_div{height:20px; margin-top:4%;}
.error_div p{color:#f83a7a; display:none;}
.shz_chenggong{width:95%;background:#000;border-radius:5px; overflow:hidden; height:auto; margin:0 auto;}
.shz_chenggong{background:rgba(0,0,0,0.8);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#cc000000,endColorstr=#cc000000);zoom:1;}
:root .shz_chenggong{filter:none\9;}
.succ_img{width:15%; margin:3% auto 1% auto;font-size:0;}
.succ_h1{color:#fff;width:100%; text-align:center;padding:1% 0;}
.succ_p{color:#fff;width:100%;text-align:center;padding:3% 0;}
.text{position:absolute; top:1%; right:1%; z-index:10000; width:35%;}
.text_img{width:100%; font-size:0; float: right;}
.text_img img{width: 100%;}
.wx_ewm{width: 80%; height: auto;  overflow: hidden; margin: 0 auto;clear:both}
.wx_ewm img{width:100%; }

[data-dpr="1"] .fontSize14{font-size:14px;}
[data-dpr="1"] .fontSize18{font-size:18px;}
[data-dpr="1"] .fontSize20{font-size:20px;}

[data-dpr="2"] .fontSize14{font-size:28px;}
[data-dpr="2"] .fontSize18{font-size:36px;}
[data-dpr="2"] .fontSize20{font-size:40px;}

[data-dpr="3"] .fontSize14{font-size:42px;}
[data-dpr="3"] .fontSize18{font-size:54px;}
[data-dpr="3"] .fontSize20{font-size:60px;}
.lqhb_number{text-align: center;color: #fff;height:0.625rem;line-height:0.625rem;margin-bottom:0.234rem;}
.lqhb_number .number{color:#ffe131;margin:0 0.125rem;}
[data-dpr="1"] .fontSize16{font-size:16px;}
[data-dpr="2"] .fontSize16{font-size:32px;}
[data-dpr="3"] .fontSize16{font-size:64px;}


</style>
<script type="text/javascript">
	function GetQueryString(name){
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null)return  unescape(r[2]);
	     return null;
    } 
	
	
    function reload(refresh){
    	if(${isApp}){
    		if(refresh){
    			window.location.reload();
    		}
    	}else{
			$("#mask").show();
	      	$("#downTf8").show();
    	}
    }
    
	$(function(){
		$("#tixing_s").bind('click',function(){
			var userId = '${userId}';
	    	var cookie = GetQueryString("cookie");
	    	if(${isApp}){    
		    	if(userId==undefined || userId==null || userId.trim()==""){
		    		var returnUrl = '${taobaoUrl}';
		    		loginUserNew(returnUrl);
		    		//window.location.href='${taobaoUrl}';	
		    	}else{
		    		  $.ajax({
			  		        type:'GET',
			  		        url:'/cjhb/remindPush',
			  		        data:{'userId':userId,'cookie':cookie},
			  		        dataType:'json',
			  		        timeout:10000,
			  		        success:function (result) {
			  					if(result.success){
			  				        document.getElementById('tixing_s').style.background="#cfcfcf";
			  				        document.getElementById('tixing_s').innerHTML ="已设置提醒";
			  				        document.getElementById('tixing_s').style.color="#7e7e7e";
			  				        document.getElementById('tixing_s').style.boxShadow="0 0.0625rem 0 0.0625rem #a89393";
			  				        $("#tixing_s").unbind("click");
			  					}
			  		        }
			  		  });
		    	} 
	    	}else{
	    		//var ua = navigator.userAgent;
	    		//if(ua.indexOf("MicroMessenger") > 0) {
	    		//	$("#mask").show();
	  	      	//	$("#saoerweima").show();
	    		//}else{
	    			$("#mask").show();
	    			$("#MobileNull").show();
	    		//}
	    	}
		});
		
		if(!${isApp}){
			//如果不是app访问，页面打开即唤起客户端
			jumpToAPP('taofen8-master://wl/?id=https://ocean.taofen8.com/cjhb/actPage&p=抢双12红包');
		}
		
	});
    
    function mc_close(){
        $("#mask").hide();
        $(".guanbi").hide();
        $("#llq").hide();
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

    //WAP用户登陆逻辑，参数为回调url
    function loginUser(returnUrl) {
    	var locationHref = "https://oauth.taobao.com/authorize?response_type=token&client_id=12450255&state=1212&scope=item&view=wap&redirect_uri=";
    	var wapRedirectUrl = "http://m.taofen8.com/iphone/login.jsp";	
    	var realUrl = locationHref + wapRedirectUrl + "?retain=pocket_" + returnUrl;
    	window.location.href = realUrl;
    }
    
    //倒计时
    var acEndTime = new Date(Date.parse('<fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'.replace(/-/g, "/")));
    acEndTime = acEndTime.getTime();

    var currentServiceDate = new Date(Date.parse('<fmt:formatDate value="${currentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'.replace(/-/g, "/")));
    currentServiceDate = currentServiceDate.getTime();

function overTime() {
    if(typeof currentServiceDate == 'undefined') return;
    var initValue = (acEndTime -  currentServiceDate) / 1000 / 60;   //按照分钟计算
    
    var days = Math.floor(initValue / 60 /24);
    var hours = Math.floor(initValue / 60 - 24*days);
    hoursStr = hours<10 ? '0' + hours : hours;
    var minutes = Math.floor(initValue - (60 * hours) - (24*60*days));
    minutesStr = minutes<10 ? '0' + minutes : minutes;
    var second = Math.floor(initValue * 60 - 60 * (minutes + (60 * hours)) - 60*60*24*days);
    secondStr = second<10 ? '0' + second : second;
    $("#overTime_days").html(days);
    $("#overTime_hours").html(hoursStr);
    $("#overTime_minutes").html(minutesStr);
    $("#overTime_seconds").html(secondStr);
    currentServiceDate -= -1000;
    if(initValue < 0) {
        $("#overTime_days").html('00');
        $("#overTime_hours").html('00');
        $("#overTime_minutes").html('00');
        $("#overTime_seconds").html('00');
    }else{
        setTimeout(function(){overTime();}, 1000);
    }
}

$(function(){
	overTime();
});

//获取手机验证码
var isClick = false;
var isZd = true;
function getPhoneVerify(){
	if(isClick) {
		return;
	}
	var mobile = $("input[name = numberNull]").val();
	var ret =isMobileNumber(mobile);
	if(!ret){
		$("#JS_red").hide().siblings("#JS_bg999").show();
		return;
	}
	$("#JS_red").show().siblings("#JS_bg999").hide();
	isZd = true;
	settime();
	
	$.post("/cjhb/getMobileCode",{"mobile":mobile},function(result){
		alert(result);
		isClick = true;
	});
}

//进行填写手机号提醒
function remindMe(){
	var mobile = $("input[name = numberNull]").val();
	var verifyCode = $("input[name = yzm]").val();
	$.post("/cjhb/checkMobileCode",{"verifyCode":verifyCode,"mobile":mobile},function(resp){
		resp = $.parseJSON(resp);
		if(resp.success){
			 $.ajax({
			        type:'POST',
			        url:'/cjhb/remindMobile',
			        data:{"mobile":mobile},
			        dataType:'json',
			        timeout:10000,
			        success:function (result) {
			        	mc_close();
						if(result.success){
							$("#tx_chenggong").show();
					        document.getElementById('tixing_s').style.background="#cfcfcf";
					        document.getElementById('tixing_s').innerHTML ="已设置提醒";
					        document.getElementById('tixing_s').style.color="#7e7e7e";
					        document.getElementById('tixing_s').style.boxShadow="0 0.0625rem 0 0.0625rem #a89393";
					        $("#tixing_s").unbind("click");
						}else{
							$("#tx_shibai").show();
						}
						setTimeout(function(){mc_close();}, 3000);
			        }
			 });
		}else{
			alert(resp.message);
		}
	});
	
}

//验证手机号
function isMobileNumber(str) {
    return (/^(1\d{10})$/.test(str));
};
//验证码60秒倒计时
var countdown=60; 
function settime() { 
	if (countdown == 0) { 
		isClick = false;
		isZd = false;
		clearTimeout(timeoutProcess);
		$("#JS_button").show().siblings("a").hide();
		countdown = 60; 
	} else { 
		$("#JS_button").hide().siblings("a").show();
		$("#JS_num").html(countdown);
		countdown--; 
	} 
	
	if(isZd) {
		timeoutProcess = setTimeout(settime, 1000);
	}
	
} 

function jumpPocketUrl(){
	 var ua = navigator.userAgent;
	 if(ua.indexOf("MicroMessenger") > 0){
		 $("#mask").show();
		 $("#llq").show();
	 }else{
	  	var userId = '${userId}';
		if(userId==undefined || userId==null || userId.trim()==""){
			var returnUrl = '${taobaoUrl}';
    		loginUserNew(returnUrl);
    		//window.location.href='${taobaoUrl}';	
    	}else{
     		if(${isApp}){
    			//如果是app访问，页面打开即唤起客户端
    			jumpToAPP('taofen8-master://tw/?id='+'${pocketUrlApp}'+"&p=抢双12红包");
    		}else{ 
    			window.location.href='${pocketUrlApp}'+'&userId='+userId;	
    		}
    	}
	 }
}

/**
 * 下载客户端
 */
function downloadApp(){
    var ua = navigator.userAgent;
    if(ua.indexOf("MicroMessenger") > 0) {
    	window.location.href="http://a.app.qq.com/o/simple.jsp?pkgname=com.leixun.taofen8";        		
    }else{
       	setTimeout(function(){
       		if(ua.indexOf("Android") > 0){
       			window.location.href="http://m.taofen8.com/download.jsp";
           	}
           	if(ua.indexOf("iPhone") > 0  || ua.toLowerCase().indexOf("ipad") > 0 || ua.toLowerCase().indexOf("ipod") > 0){
           		window.location.href="http://itunes.apple.com/us/app/tao-fen-ba/id527012586?ls=1&mt=8";
           	}		            	
           	if(ua.indexOf("Wp") > 0){
           		window.location.href="http://www.windowsphone.com/zh-cn/store/app/%E6%B7%98%E7%B2%89%E5%90%A7/23861cd8-a7d3-40f2-b140-5cf116964641";
           	}	
       	}, 500);
    }
}

//唤起淘粉吧客户端
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
    }else {
        $(document.body).append('<iframe src="'+url+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
    }
}
 
  
</script>
</head>
<body>
<input type="hidden" id="shareController" value="${shareController}"/>
<input type="hidden" id="shareDialogTitle" value="${shareDialogTitle}"/>
<input type="hidden" id="shareDialogDescription" value="${shareDialogDescription}"/>
<input type="hidden" id="shareImageUrl" value="${shareImageUrl}"/>
<input type="hidden" id="shareTitle" value="${shareTitle}"/>
<input type="hidden" id="shareDescription" value="${shareDescription}"/>
<input type="hidden" id="showFlag" value="${showFlag}"/>
<input type="hidden" id="shareUrl" value="${shareUrl}"/>
<div class="red">
   <!-- 	<p class="lqhb_number fontSize16">已有<span class="number">00000000</span>人领取了红包</p> -->
    <c:if test="${isBegin eq false}">
    	<c:if test="${isPreEnd eq false }">
    		<a href="###" class="fontSize18" onclick="reload(false)" style="${isApp eq false ? 'margin-bottom: 0.3125rem;background:#ffe131;color:#000;box-shadow:0 0.0625rem 0 0.0625rem #c6b23a':'margin-bottom: 0.3125rem;color:#7e7e7e;background-color:#cfcfcf;box-shadow:0 0.0625rem 0 0.0625rem #a89393'}">淘宝红包 12月1日0点开抢</a>
		    <c:if test="${isRemind eq false }">
		    	 <a href="###" class="fontSize20" id="tixing_s">设置开抢提醒</a>       
		    </c:if>    
		    <c:if test="${isRemind eq true }">
		     	<a href="###" class="yi_tx fontSize20">已设置提醒</a>   
		    </c:if>
    	</c:if>
    	<c:if test="${isPreEnd eq true }">
				<a href="###" class="wks fontSize18" onclick="reload(true)" style="background:#ffe131;color:#000">淘宝红包12月1日0点开抢</a>
		</c:if>
	    <div class="time fontSize14">距离开始时间还有 <span id="overTime_days">00</span>&nbsp;天&nbsp;<span id="overTime_hours">00</span>&nbsp;时&nbsp;<span id="overTime_minutes">00</span>&nbsp;分&nbsp;<span id="overTime_seconds">00</span>&nbsp;秒  </div>
    </c:if>
	<c:if test="${isBegin eq true}">
		 <a href="###" class="fontSize18" onclick="jumpPocketUrl()" >点击开抢</a>
		 <div class="time fontSize14">距离结束时间还有 <span id="overTime_days">00</span>&nbsp;天&nbsp;<span id="overTime_hours">00</span>&nbsp;时&nbsp;<span id="overTime_minutes">00</span>&nbsp;分&nbsp;<span id="overTime_seconds">00</span>&nbsp;秒  </div>
	</c:if>   
    <!-- 活动规则 -->
    <div class="title fontSize15"><span style="color:#74ec6c;margin-right:0.71875rem;">/</span>活动规则   <span style="color:#74ec6c;margin-left:0.71875rem;">/</span></div>
    <ul class="fontSize12">
        <li>1. 活动时间：2016年12月1日00:00:00-2016年12月4日23:59:59；</li>
        <li>2. 12月1日0点起，淘粉吧将从通过本页面前100名领到淘宝红包/购物券的用户中抽取10名获得100000集分宝奖励（相当于1000元现金）；前1000名用户获得500集分宝奖励；前5000名用户获得100集分宝奖励；前30000名用户获得50集分宝奖励；</li>
        <li>3. 奖励将于12月7日-12月8日发放到账，中奖信息将通过站内信形式通知。奖励发放信息请查看[我的红包]记录。此前请确保登录账户已绑定支付宝账号；</li>
        <li>4. 相同淘宝账号、手机号、支付宝账号均视为同一用户，一旦发现作弊行为，淘粉吧有权取消用户奖励；</li>
        <li>5. 本活动最终解释权归淘粉吧所有。</li>
    </ul>

    
</div>

<div class="mask" id="mask" style="display:none;" onclick="mc_close()"></div>
<div id="animationTipBox" class="animationTipBox"  style="display:block;">
    <!--开抢提醒  无手机号-->
    <div class="guanbi ppt_tc fontSize14" id="MobileNull" style="display:none;">
        <p class="tc_title">开抢提醒</p>
        <p><input type="text" placeholder="请输入您的手机号码" name="numberNull" class="numberNull" /></p>
        <p>
            <input type="text" placeholder="请输入验证码" name="yzm" class="numberNull" style="width:53%; display:inline-block;" />
            <a href="javascript:void(0)" id="JS_button" class="yzm_button" onclick="getPhoneVerify()">获取验证码</a>
            <a href="javascript:void(0)" class="yzm_button" style="background:#dcdcdc; border:#dcdcdc solid 1px; display:none;">剩<span id="JS_num">60</span>秒</a>
        </p>
        <p class="tc_button fontSize14">
            <a href="javascript:void(0)" class="grey" onclick="mc_close()">我再看看</a>

            <a href="javascript:void(0)" id="JS_red" style="display:none;" class="red" onclick="remindMe()">确认提交</a>
            <a href="javascript:void(0)" id="JS_bg999" class="bg999">确认提交</a>
        </p>
    </div>
    
    <!--下载客户端-->
    <div class="guanbi ppt_tc fontSize14" id="downTf8" style="display:none;">
        <div style="overflow:hidden;">
            <p class="tc_title" style="width:79%; float:left; margin-left:11%;">温馨提示</p>
            <span style="float:right; margin:5px 5px 0 0; width:8%;" onclick="mc_close()"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2hpSegpXXXXXRXXXXXXXXXXXX_!!2296013456.png" style="width:100%;" /></span>
        </div>
        <p class="tc_text" style="text-align:center;">通过客户端可以更快抢到红包哦</p>
        <p class="tc_button">
            <a href="javascript:void(0)" class="red" onclick="downloadApp()" id="jump_url" style="width: 55%;">下载淘粉吧客户端</a>
        </p>
    </div>
    
    
    <!---提醒成功-->
    <div class="guanbi shz_chenggong" id="tx_chenggong" style="display:none;">
        <p class="succ_img"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB23IX4gpXXXXagXpXXXXXXXXXX_!!2296013456.png" ></p>
        <h1 class="succ_h1">设置提醒成功</h1>
    </div>
    <!---提醒失败-->
    <div class="guanbi shz_chenggong" id="tx_shibai" style="display:none;">
        <p class="succ_img"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2rjylgpXXXXXJXXXXXXXXXXXX_!!2296013456.png" ></p>
        <h1 class="succ_h1">设置提醒失败</h1>
        <p class="succ_p">请检查您的网络是否顺畅或刷新后重试</p>
    </div>
    <!---提示二维码-->
    <!-- 
    <div class="guanbi ppt_tc fontSize14" id="saoerweima" style="display:none;">
    	<span style="float:right; margin:5px 5px 0 0; width:8%;" onclick="mc_close()"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2hpSegpXXXXXRXXXXXXXXXXXX_!!2296013456.png" style="width:100%;" /></span>
        <p class="wx_ewm"><img src="/images/wechat/pocketDB11.png" ></p>
        <p class="wx_ewm_p">长按识别二维码，及时收到抢红包提醒</p>
    </div>
     -->
</div>
<div class="text" id="llq" style="display:none;" >
    <div class="text_img" onclick="mc_close()"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2uw9hgpXXXXbcXXXXXXXXXXXX_!!2296013456.png" /></div>
</div>
	<%@ include file="../wechat_share.jsp"%>
	<script type="text/javascript">
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

  ga('create', 'UA-75777879-24', 'auto');
  ga('send', 'pageview');
</script>
	
	
	
</body>
</html>
