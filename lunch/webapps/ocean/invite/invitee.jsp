<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html style="background: url(https://img.alicdn.com/imgextra/i3/2296013456/TB2UIcfqVXXXXXhXpXXXXXXXXXX_!!2296013456.png) no-repeat;background-size: contain;background-color: #6f1234;">
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
<script type="text/javascript" src="https://ocean.taofen8.com/js/yqyj.js"></script>
<script type="text/javascript" src="https://ocean.taofen8.com/js/tf8common_ocean.js"></script>
<link rel="stylesheet" type="text/css" href="https://ocean.taofen8.com/css/yqyj.css"/>
<link href="https://m.taofen8.com/css/swiper.min.css" rel="stylesheet" type="text/css" />
<title>邀请注册</title>
<%@ include file="../wechat_share.jsp"%>
<script type="text/javascript">
var navLayoutTop = null;
	$(function(){
 		if('${actEnd}'== 'yes'){
			$('.lq_hb_text_p1').hide();
			$('#yqInviteeFormDiv').hide();
			$('#noHongbaoDiv').show();
		} else if('${acquire}' == 'success'){
			// rain分>90
			$('.lq_hb_k_cg').parent().show();
			$('.lq_hb_k_lq').hide();
		} else {
			$('#yqInviteeFormDiv').show();
		}
 		navLayoutTop = $('.rob_menu').offset().top;
	});
</script>


</head>
<body>

<!-- 日志统计用 -->
<input class="tf8-log-hidden" type="hidden" name="pageType" value="mobile" />
<input class="tf8-log-hidden" type="hidden" name="pageName" value="invite_invitee" />
<input class="tf8-log-hidden" type="hidden" name="code" value="invite" />
<input class="tf8-log-hidden" type="hidden" name="channel" value="${channel}" />
<input class="tf8-log-hidden" type="hidden" name="userId" value="${userId}" />

<div class="lq_hb_k lq_hb_k_lq" style="display:block;">
        <div class="lq_hb_text_content">
			<p class="lq_hb_text_p1 fs17" style="line-height: 0.75rem;">快来和我一起买买买，<br>一起拿返利！</p>
            <div id="yqInviteeFormDiv" style="display:none">
	            <form action="" class="lq_hb_text_inp1_k" id="yqInviteeForm">   
	            	<input type="hidden" name="openId" value="${openId }"/>
	            	<input type="hidden" name="inviteCode" value="${inviteCode }"/>
	            	<input type="hidden" name="actCode" value="${actCode }"/>
	                <p><input placeholder="请输入手机号" id="phoneNumber" name="mobile" type="text" class="lq_hb_text_inp1 fs14" /></p>
	                <p class="lq_hb_text_inp_k">
	                    <input placeholder="请输入验证码" id="VerificationCode" name="mobileCode" type="text" class="lq_hb_text_inp2 fs14" />
	                    <span class="tf8-log yzm-button-grey fs14" id="getYzm" log-position="register_yzm"  log-content="获取验证码">获取验证码</span>
	                </p>
	                <span class="numberError fs11" id="numberError">请输入正确的11位手机号</span>
	            </form>     
	            <!-- 可点击样式 -->
	            <div class="tf8-log fs17 lq_hb_text_bt_red" id="JS_Submit_red" log-position="register_button" log-content="注册淘粉吧">注册淘粉吧</div>
	            <!-- 不可点击样式 -->
	            <div class="fs17 lq_hb_text_bt_grey" id="JS_Submit_grey">注册淘粉吧</div>
	            <!-- 错误提示 -->
	        </div>
			
			<div id="noHongbaoDiv" style="display:none">
				<p class="fs15" style="color:#fff;line-height:0.6rem;margin:0.5rem 0">
					送红包活动已经结束了！<br>更多精彩活动请下载淘粉吧查看。
				</p>
				<div class="fs17 lq_hb_text_bt_red" style="display:block;border-radius:0.09375rem" onClick="jumpToDownload();" >下载淘粉吧APP</div>
			</div>
        </div>
</div>

<!-- 领取成功 start-->
	<div id="cg_p" style="display: none">
		<div class="lq_hb_k lq_hb_k_cg" style="display:block;">
				<div class="lq_hb_text_content">
					<p class="lq_hb_text_p1 fs23">注册成功！</p>
					<p class="lq_hb_text_p2 fs11">买东西，拿返利，<br>没有神器在手怎么行？<br>戳↓</p>
					<a class="fs17 lq_hb_text_bt" onclick="jumpToDownload()" style="color: #fff;"
						href="javascript:void(0)">下载淘粉吧APP</a>
				</div>
			<p class="fs0"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2MuFauXXXXXbxXXXXXXXXXXXX_!!2296013456.png" alt="记得一定要用刚注册的手机登录" class="w100"></p>
		</div>
	</div>
<!-- 领取成功end -->

<!-- 领取失败 start-->
	<div id="JS_oldUserTK" class="tk_secondSucceed closeTK"
		style="display: none;">
		<i class="opacity">&nbsp;</i> <span class="fs17 op_text">手机号码已注册！</span>
	</div>
<!-- 领取失败 end-->

<!-- 活动开始 start-->
<div id="JS_tk_opacity" class="tk_opacity">&nbsp;</div>
<div id="JS_tk_share_opacity" class="tk_opacity">&nbsp;</div>


<!---弹框begin-->
<div class="mask" id="mask" style="display:none;" onclick="gz_close()"></div>
<div id="animationTipBox" class="animationTipBox"  style="display:none; top:20%;">
    <div id="" style="display:block;" onclick="gz_close()">
        <div class="money_log" >
            <h1 class="h1_title fs14">商品已经在淘粉吧卖完了</h1>
            <p class="xy_hbgz fs14">现在过去购买已经不是超高返利，只能拿普通返利哦！</p>
            <div class="button_two">
                <a href="javascript:void(0)" class="button_href xiangxiang fs14" onclick="gz_close()">我再想想</a>
                <a id="jump" href="javascript:void(0)" class="button_href fs14" >去购买</a>
            </div>
        </div>
    </div>
</div>



<p class="lq_hb_p fs14">每日爆款推荐</p>
<div class="rob">
	<div style="height:1.25rem">
    <div class="swiper-container rob_menu" style="z-index: 10;">
        <ul class="swiper-wrapper rob_ul fs14" id="swiper-wrapper">
            <c:forEach items="${pageData.groupDataList}" var="groupData" varStatus="num">
            	<li cid="${groupData.pageGroup.id}" class="${categoryId eq groupData.pageGroup.id or (categoryId==0 and num.index==0) ? 'swiper-slide menu light_li' : 'swiper-slide menu'}"  tap='${num.index}'>${ groupData.pageGroup.name}</li>
            </c:forEach>           	
        </ul>
    </div>
    </div>
    <div class="swiper-container" id="goods_rob">
        <ul class="swiper-wrapper" id="goods-swiper-wrapper">
        	<c:forEach items="${pageData.groupDataList}" var="groupData" varStatus="num">
            <li class="swiper-slide">
                <div id="goods_rob${num.index}" class="goods_rob">
		           <c:if test="${not empty groupData.pageItemList}">
		   		   <c:forEach items="${groupData.pageItemList}" var="item" varStatus="num1">
		   		   <c:choose>
		   		   	<c:when test="${item.ext1 eq '0' }">
		   		   		<div class="goods_list" onclick="log_open(${item.pageItemId})">
		   		   	</c:when>
		   		   	<c:otherwise>
		   		   		<div class="goods_list" onclick="viewDetail(${item.pageItemId})">
		   		   	</c:otherwise>
		   		   </c:choose>
                        <p class="goods_list_img"><img class="lazyload w100" data-original="${item.pageItemImageUrl}_350x350q75.jpg" src="https://img.alicdn.com/imgextra/i4/169328611/TB27FHbepXXXXX3XpXXXXXXXXXX_!!169328611.png"  /></p>
                        <div class="goods_list_right">
                            <p class="right_title fs14">
                            <c:if test="${not empty item.ext2 }"><span>【${item.ext2}】</span></c:if>
                               ${item.itemTitle}
                            </p>
                            <p class="right_price fs14">¥ ${item.mobilePrice}</p>
                            <div class="right_reduction fontSize16"><span class="fs14">返利</span>&nbsp;${item.mobileFanliAmount} </div>
                            <c:if test="${item.ext1 eq '0' }">
                           		 <a href="javascript:void(0)" class="now_rob now_rob_not fs14" onclick="log_open(${item.pageItemId})">抢光了</a>
                            </c:if>
                            <c:if test="${item.ext1 eq '1' }">
                           		<a href="javascript:void(0)" class="now_rob fs14" onclick="viewDetail(${item.pageItemId})">马上抢</a>
                            </c:if>
                            <c:if test="${item.ext1 eq '2' }">
                           		<a href="javascript:void(0)" class="now_rob fs14" style="color:#fd6700;background:#fdead3;width:1.85rem;" onclick="viewDetail(${item.pageItemId})">即将售罄</a>
                           		<div class="item_prompt fs14">${item.ext3}</div>
                            </c:if>                                                      
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>

<script type="text/javascript">
function viewDetail(itemId) {
	storage.setItem('docTopTemp',  $(window).scrollTop());
	storage.setItem('curTapNoTemp',  curTapNo);
		var ua = navigator.userAgent;
		var productVersion = GetQueryString("productVersion");
		if(ua.indexOf("Taofen8") > 0){
			document.location = 'taofen8-master://bl?id=http://m.taofen8.com/item/' + itemId 
	         +'?sid=null%26ttid=400000_12450255@taofen8_wap%26f=${mobilePage}%26p='+productVersion+'&p='+itemId +',,yes,http://m.taofen8.com/item2/'+ itemId 
	         +'?sid=null%26ttid=400000_12450255@taofen8_wap%26f=${mobilePage},';			
		}else if(productVersion){
			document.location = 'taofen8-master://bl?id=http://m.taofen8.com/item/' + itemId 
					         +'?sid=null%26ttid=400000_12450255@taofen8_wap%26f=${mobilePage}%26p='+productVersion+'&p='+itemId +',,yes,http://m.taofen8.com/item2/'+ itemId 
					         +'?sid=null%26ttid=400000_12450255@taofen8_wap%26f=${mobilePage},';
			setTimeout(function () {
			document.location = "http://m.taofen8.com/d.jsp?i=" + itemId + "&r=iDetail&t=${mobilePage}&isApp=${isApp}&userId=${userId}&p="+productVersion;
			}, 1000); 
		} else {
			productVersion = GetQueryString("p");
			document.location = "http://m.taofen8.com/d.jsp?i=" + itemId + "&r=iDetail&t=${mobilePage}&isApp=${isApp}&userId=${userId}&p="+productVersion;
		}
}

function log_open(itemId){
    $("#animationTipBox").show();  
    $("#jump").attr("onclick","viewDetail("+itemId+");");
    $("#mask").show();  
}

function gz_close(){
    $("#animationTipBox").hide();   
    $("#mask").hide();  
}

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

  ga('create', 'UA-75777879-22', 'auto');
  ga('send', 'pageview');

</script>

</body>
</html>