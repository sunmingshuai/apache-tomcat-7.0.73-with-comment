<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html style="background: #cc1f3a;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta name="format-detection" content="telephone=no, email=no" />
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<title>抽奖</title>
<style type="text/css">
[data-dpr="1"] .fs9{font-size:9px;}
[data-dpr="1"] .fs10{font-size:10px;}
[data-dpr="1"] .fs11{font-size:11px;}
[data-dpr="1"] .fs12{font-size:12px;}
[data-dpr="1"] .fs13{font-size:13px;}
[data-dpr="1"] .fs14{font-size:14px;}
[data-dpr="1"] .fs15{font-size:15px;}
[data-dpr="1"] .fs16{font-size:16px;}
[data-dpr="1"] .fs17{font-size:17px;}
[data-dpr="1"] .fs18{font-size:18px;}
[data-dpr="1"] .fs19{font-size:19px;}
[data-dpr="1"] .fs20{font-size:20px;}
[data-dpr="1"] .fs21{font-size:21px;}
[data-dpr="1"] .fs22{font-size:22px;}
[data-dpr="1"] .fs26{font-size:26px;}
[data-dpr="1"] .fs39{font-size:39px;}

[data-dpr="2"] .fs9{font-size:18px;}
[data-dpr="2"] .fs10{font-size:20px;}
[data-dpr="2"] .fs11{font-size:22px;}
[data-dpr="2"] .fs12{font-size:24px;}
[data-dpr="2"] .fs13{font-size:26px;}
[data-dpr="2"] .fs14{font-size:28px;}
[data-dpr="2"] .fs15{font-size:30px;}
[data-dpr="2"] .fs16{font-size:32px;}
[data-dpr="2"] .fs17{font-size:34px;}
[data-dpr="2"] .fs18{font-size:36px;}
[data-dpr="2"] .fs19{font-size:38px;}
[data-dpr="2"] .fs20{font-size:40px;}
[data-dpr="2"] .fs21{font-size:42px;}
[data-dpr="2"] .fs22{font-size:44px;}
[data-dpr="2"] .fs26{font-size:52px;}
[data-dpr="2"] .fs39{font-size:78px;}

[data-dpr="3"] .fs9{font-size:29px;}
[data-dpr="3"] .fs10{font-size:32px;}
[data-dpr="3"] .fs11{font-size:35px;}
[data-dpr="3"] .fs12{font-size:38px;}
[data-dpr="3"] .fs13{font-size:42px;}
[data-dpr="3"] .fs14{font-size:45px;}
[data-dpr="3"] .fs15{font-size:48px;}
[data-dpr="3"] .fs16{font-size:51px;}
[data-dpr="3"] .fs17{font-size:54px;}
[data-dpr="3"] .fs18{font-size:58px;}
[data-dpr="3"] .fs19{font-size:61px;}
[data-dpr="3"] .fs20{font-size:64px;}
[data-dpr="3"] .fs21{font-size:67px;}
[data-dpr="3"] .fs22{font-size:70px;}
[data-dpr="3"] .fs26{font-size:78px;}
[data-dpr="3"] .fs39{font-size:117px;}
body,p,ul{padding:0; margin: 0; box-sizing: border-box;}
body{width: 10rem;margin: 0 auto!important;}
a{text-decoration:none!important;}

.w100{width:100%; display: block;}
.clearfix::after{content: '.';display: block;overflow: hidden;visibility: hidden;clear: both;height: 0;}
.floatL{float: left;}
.floatR{float: right;}
.color666{color: #666!important;}
.color333{color: #333;}
.color999{color: #999;}
.color000{color: #000;}
.colorff0{color: #ff0065;}
.mt10{margin-top: 0.15625rem;}

.banner{height: 2.773333rem;}
.app_m_text{text-align: center; color: #fff; margin-top: 0.4rem;}
.app_m_text .num{font-weight: bold; margin-top: 0.13rem;}
.app_m_text .num span{color: #ffe87e; margin: 0 0.07rem;}

#outercont{ position:relative;  width: 10rem; height:auto;overflow: hidden; margin-top: 0.266667rem;}
.zhuanpan_lp {position:relative;width:10rem;top:0.32rem;margin-bottom:0.4rem;}
.zhuanpan_lp .lp_img {width:9.375rem;height:9.375rem;margin:0 auto}
.zhuanpan_lp .lp_mc {width:100%;height:100%;position:absolute;background:#fff;top:0;left:0;opacity:0}
.zhuanpan_zz {position:absolute;width:100%;top:2.7638rem;}
.zhuanpan_zz .zz_img {width:3.5rem;height:3.96875rem;margin:0 auto;cursor:pointer;padding-left:0.15rem}


.app_m_rule{color: #fff; text-align: center; margin-top: 0.533333rem; box-sizing: border-box;}
.app_m_rule .text_box{color: #fff; border-left: dashed 0.026667rem #000; text-align: left; margin-left:0.067rem; padding-bottom:0.27rem; }
.app_m_rule .text_box:last-child{padding-bottom: 0; border: 0;}
.app_m_rule .num_icon{ background: rgba(0,0,0,0.81); border-radius: 50%; width: 0.32rem; height: 0.32rem; text-align: center; line-height: 0.32rem; float: left; font-style: normal; padding: 0.04rem; margin-left:-0.2rem;}
.app_m_rule .text_box .text{float: left; width: 95%; margin-left: 0.066667rem;}
.text_box .text .s1{float:left; vertical-align: top;}
.text_box .text .p1{width:6.3rem;float:left;}
.text_box .text .s2{display: block; padding:0.133333rem 0 0 0.106667rem}

.xr_opacity{width:100%; height:100%; display: none; background:#000;filter:alpha(opacity=60); -moz-opacity:0.6; opacity: 0.6; position:fixed; z-index:500; left:0; top:0;}
.act_app_tk{width:8.4375rem; margin:0 auto; display: none; transform: translate(-50%,-50%); -webkit-transform: translate(-50%,-50%); background:#fff; position:fixed; top: 50%; left: 50%; z-index:501; border-radius:0.15625rem; text-align: center;color:#333; padding: 0.466667rem; box-sizing: border-box;}
.act_app_tk .close{width: 0.76rem; height: 1.413rem; margin-top:-1.87rem; float: right;}
.act_app_tk .text{margin-top: 0.25rem; text-align: left;}
.act_app_tk .but{margin-top: 0.333333rem}
.act_app_tk .but span {width:3.21875rem;height:1.03rem;display:inline-block;line-height:1.03rem;border-radius: 0.2rem; margin-top: 0.4rem; }
.act_app_tk .but .span1{background:#cc1f3a;color:#fff;border:#cc1f3a 1px solid;}
.act_app_tk .but .span2 {border:#cccccc 1px solid;color:#666666; margin-left: 0.3rem;}
.act_app_tk .zfb_box{margin-top: 0.15rem; text-align: left;}
.zfb_box .userName{width: 100%; height: 0.88rem; line-height: 0.88rem; box-sizing: border-box; padding: 0 0.133333rem; border: #a2a2a2 solid 1px;}
.zfb_box .error{color: #ff1237; margin-top: 0.133rem; height: 0.55rem;}
.app_m_text .goHome{display: inline-block; padding: 0 0.5rem; height: 0.893rem; border-radius: 0.44rem; border: #fff solid 0.035rem; line-height: 0.893rem; margin-top: 0.4rem; color: #fff;}
.act_app_footer{margin:0.58rem 0; text-align: center; line-height: 0.533333rem; color: #ebbcc0;}
.act_app_footer .help{width: 2.426667rem; height: 0.666667rem; display: inline-block;}

/*提示app下载弹框*/
.yqyj_tankuang{width: 6.7rem; /*height: 4.125rem;*/ top: 50%; display: none; z-index: 1000; position: fixed; border-radius: 7px; left: 50%;  margin:-2.625rem auto 0 -3.3rem; background:#fff; overflow: hidden; padding:0.31rem 0;}
.yqyj_tankuang .close{float: right;width:0.6875rem; height: 0.6875rem; display: block; margin-right:0.31rem;}
.yqyj_tankuang .content{margin:0 0.78rem; color: #666;}
.yqyj_tankuang .tk_title{text-align: center; color:#333;}
.yqyj_tankuang .tk_text{line-height: 0.45rem; margin-top: 0.7rem; }
.yqyj_tankuang .tk_button{display: block;height: 1rem; line-height: 1rem; width:5.16rem; margin: 0.77rem auto 0; background:#f4436d; color:#fff; text-align: center; border-radius:7px;}

</style>
</head>
<body>
<!-- 弹框 非淘粉吧App环境 提示用户下载淘粉吧 -->
<div id="JS_tk_download" class="yqyj_tankuang">
	<span class="close"  onclick="closeTk()"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2F0P0qVXXXXbAXpXXXXXXXXXX_!!2296013456.png" class="w100" alt="关闭"></span>
	<div class="content">
		<p class="fs17 tk_title">请使用淘粉吧</p>
		<p class="fs12 tk_text">使用淘粉吧客户端才可参与活动哦!</p>
		<a class="fs14 tk_button" id="JS_download"  href="javascript:void(0)">立刻参加活动</a>
	</div>
</div>


<!-- 页面参数 start -->
<input type="hidden" id="loginCallBackUrl" value="${loginCallBackUrl}">
<input type="hidden" id="userId" value="${userId}">
<input type="hidden" id="appCookie" value="${appCookie}">
<!-- 页面参数 end -->
<p class="banner"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2FpZNabBnpuFjSZFGXXX51pXa_!!2296013456.png" class="w100" alt="新年送钱大行动"></p>
<div class="app_m_text">
	<p class="fs15">前3笔APP订单都可抽奖</p>
	<p class="num fs20">您当前有<span id="JS_num_total">${totalCount-usedCount}</span>次抽奖机会</p>
	<c:if test="${totalCount<3}">
	    <span class="goHome fs15">马上下单，领奖励</span>
	</c:if>
	<c:if test="${totalCount>=3}">
	<span class="goHome fs15">继续下单，领返利</span>
	</c:if>
</div>

<div id="outercont">
    <div class="zhuanpan_lp">
        <div class="lp_img" id="lotteryBtn" style="transform: rotate(0deg);">
            <img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2YZxUagxlpuFjy0FoXXa.lXXa_!!2296013456.png" class="w100">
        </div>
        <div class="lp_mc">
        </div>
    </div>
    <div class="zhuanpan_zz">
        <div class="zz_img" id="lotteryBtnZZ">
            <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2mZoRad4opuFjSZFLXXX8mXXa_!!2296013456.png" class="w100">
        </div>
    </div>
</div>
<div class="app_m_rule">
	<p class="fs16">—— 活动规则 ——</p>
	<div style="margin: 0.493333rem;">
		<div class="text_box clearfix">
			<i class="num_icon fs9">1</i>
			<div class="text fs12">
				<span class="s1">活动时间：</span>
				<p class="p1">
					下单时间：2016-12-22 10:00至2017-01-08 10:00<br>
					抽奖时间：跟踪到订单后
				</p>
			</div>
		</div>
		<div class="text_box clearfix">
			<i class="num_icon fs9">2</i>
			<span class="text fs12">活动对象：未下载过淘粉吧APP的用户 </span>
		</div>
		<div class="text_box clearfix">
			<i class="num_icon fs9">3</i>
			<span class="text fs12">领取方式：在活动期间内通过淘粉吧APP购买淘宝/天猫商品，前3笔订单返利到帐后将收到站内信、短信通知（含抽奖链接）。每笔订单抽奖一次，购物车订单视为多笔订单</span>
		</div>
		<div class="text_box clearfix">
			<i class="num_icon fs9">4</i>
			<span class="text fs12">订单返利金额越高，中奖的奖品价值越高，100%中奖</span>
		</div>
		<div class="text_box clearfix">
			<i class="num_icon fs9">5</i>
			<span class="text fs12">话费充值订单、券后价商品订单、京东等商城订单不能参与抽奖</span>
		</div>
		<div class="text_box clearfix">
			<i class="num_icon fs9">6</i>
			<p class="text fs12">关于奖品：
				<span class="s2 fs11">1. iphone 7 为64G，颜色随机发货。</span>
				<span class="s2 fs11">2. 集分宝为支付宝提供的积分，在淘宝购物时可抵现金使用，也可用于还信用卡、缴水电煤等。</span>
				<span class="s2 fs11">3. 奖品红包为淘粉吧提供的返利红包，在淘粉吧下单后以集分宝形式和返利同时到账。</span>
			</p>
		</div>
		<div class="text_box clearfix">
			<i class="num_icon fs9">7</i>
			<span class="text fs12">同一个淘粉吧账号、手机号、支付宝账号、设备视为同一用户</span>
		</div>
	</div>

	<div class="act_app_footer">
		<p class="fs11">活动最终解释权归淘粉吧所有，如有疑问，请联系在线客服。</p>
		<a class="help" href="#/" onclick="goHelp()"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2uttTamJjpuFjy0FdXXXmoFXa_!!2296013456.png" class="w100"></a>
		<p>客服电话：400-882-0168</p>
	</div>
</div>

<!-- 弹框 -->
<div class="xr_opacity" id="xr_opacity"></div>
<!-- 身份不符合，不能参与活动 -->
<div class="act_app_tk" id="JS_app_tk_0">
	<p class="close"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2.c.QadXnpuFjSZFoXXXLcpXa_!!2296013456.png" class="w100" alt="关闭"></p>
	<p class="fs17">温馨提示</p>
	<p class="text fs15">抱歉，您身份不符合，不能参与活动！</p>
	<p class="but fs15">
		<span class="span1" id="contactUs" onclick="goHelp()">联系客服</span>
		<span class="span2 closes">我知道了</span>
	</p>
</div>
<!-- 没有在APP下单，不能领取奖励 -->
<div class="act_app_tk" id="JS_app_tk_1">
	<p class="close"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2.c.QadXnpuFjSZFoXXXLcpXa_!!2296013456.png" class="w100" alt="关闭"></p>
	<p class="fs17">温馨提示</p>
	<p class="text fs15">抱歉，您还没有在APP下单，不能领取奖励！</p>
	<p class="but fs15">
		<span class="span1 closes goHome" onClick="goHome()">去下单领奖励</span>
	</p>
</div>
<!-- 抽奖机会已用完 -->
<div class="act_app_tk" id="JS_app_tk_2">
	<p class="close"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2.c.QadXnpuFjSZFoXXXLcpXa_!!2296013456.png" class="w100" alt="关闭"></p>
	<p class="fs17">温馨提示</p>
	<p class="text fs15">抱歉，您的抽奖机会已用完！</p>
	<p class="but fs15">
		<span class="span1 closes goHome">去下单领返利</span>
	</p>
</div>
<!-- 设备被使用过 -->
<div class="act_app_tk" id="JS_app_tk_3">
	<p class="close"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2.c.QadXnpuFjSZFoXXXLcpXa_!!2296013456.png" class="w100" alt="关闭"></p>
	<p class="fs17">温馨提示</p>
	<p class="text fs15">抱歉，您的手机已被其他用户使用过，不能领取奖励！</p>
	<p class="but fs15">
		<span class="span2 closes">我知道了</span>
	</p>
</div>
<!-- 未填写支付宝 -->
<div class="act_app_tk" id="JS_app_tk_4">
	<p class="close"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2.c.QadXnpuFjSZFoXXXLcpXa_!!2296013456.png" class="w100" alt="关闭"></p>
	<p class="fs17">未填写支付宝</p>
	<p class="text fs15">您没有填写支付宝，不能领取奖励！请先填写支付宝</p>
	<div class="zfb_box fs14">
		<input class="userName" type="text" name="aliAcount" placeholder="请输入支付宝">
		<p class="error"></p>
	</div>
	<p class="but fs15">
		<span class="span1 jfbBtn">确定</span>
	</p>
</div>
<!-- 支付宝已被使用 -->
<div class="act_app_tk" id="JS_app_tk_5">
	<p class="close"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2.c.QadXnpuFjSZFoXXXLcpXa_!!2296013456.png" class="w100" alt="关闭"></p>
	<p class="fs17">支付宝已被使用</p>
	<p class="text fs15">您没有填写支付宝，不能领取奖励！请先填写支付宝</p>
	<div class="zfb_box fs14">
		<input class="userName" type="text" name="aliAcount" placeholder="请输入支付宝">
		<p class="error"></p>
	</div>
	<p class="but fs15">
		<span class="span1 jfbBtn">确定</span>
	</p>
</div>
<!-- 奖品为”红包“类型 -->
<div class="act_app_tk" id="JS_app_tk_hb">
	<p class="close"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2.c.QadXnpuFjSZFoXXXLcpXa_!!2296013456.png" class="w100" alt="关闭"></p>
	<p class="fs17">恭喜您领取到<span class="JS_app_title" style="color: #cc1f3a;">0</span>！</p>
	<p class="text fs15 JS_app_remind">活动期内您的下一笔订单也能抽奖哦！</p>
	<p class="but fs15">
		<a href="http://ocean.taofen8.com/hongbao/myHongbao?userId=${userId}"><span class="span1">去查看红包</span></a>
		<span class="span2 closes">我知道了</span>
	</p>
</div>
<!-- 奖品为”集分宝“类型 -->
<div class="act_app_tk" id="JS_app_tk_jfb">
	<p class="close"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2.c.QadXnpuFjSZFoXXXLcpXa_!!2296013456.png" class="w100" alt="关闭"></p>
	<p class="fs17">恭喜您领取到<span class="JS_app_title" style="color: #cc1f3a;">0</span>！</p>
	<p class="text fs15">集分宝将在24小时内打到您的支付宝账号<span id="JS_zfbUserName"></span></p>
	<p class="text fs15">您可以在<span style="color: #319bd8">支付宝-我的-余额-集分宝</span>中查看。</p>
	<p class="text fs15 JS_app_remind">活动期内您的下一笔订单也能抽奖哦！</p>
	<p class="but fs15">
		<span class="span2 closes">我知道了</span>
	</p>
</div>

<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://wcm.taofen8.com/js/jQueryRotate.2.2.js"></script>
<script src="https://wcm.taofen8.com/js/jquery.easing.min.js"></script>
<script src="https://ocean.taofen8.com/js/tf8common_ocean.js"></script>
<script>
var isFetching = false;
var userId = $('#userId').val();
var appCookie = $('#appCookie').val();
var loginCallBackUrl = $('#loginCallBackUrl').val();
var tf8 = {};
//判断手机号码
tf8.isMobile = function(str) {
	return (/^(1\d{10})$/.test(str));
};
//判断有效邮箱
tf8.isMail = function(str) {
	return (/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(str));
};
//判断为空
tf8.isEmpty = function(str) {
	if (str === undefined || $.trim(str) === "" || str === null) {
		return true;
	}
	return false;
};
// 格式化支付宝账号
tf8.formatAliaccount = function(str) {
    var result = ''
      , len = str.length
      , pattern1 = /^\d+$/
      , pattern2 = /^\w+@\w+.\w+$/;
    if (pattern1.test(str)) {
        result = str.substring(0, 3) + "**" + str.substring(len - 2);
    } else if (pattern2.test(str)) {
        var mailPrefix = str.substring(0, str.indexOf("@"));
        var mailSuffix = str.substring(str.indexOf("@"));
        if (mailPrefix.length <= 4) {
            result = mailPrefix.charAt(0) + "**" + mailPrefix.charAt(mailPrefix.length - 1) + mailSuffix;
        } else {
            result = mailPrefix.substring(0, 2) + "**" + mailPrefix.substring(mailPrefix.length - 2) + mailSuffix;
        }
    }
    return result;
}
// 转盘转动进行抽奖
function rotateFunc(awardCode, angle, text, usedCount, unUsedCount, aliAccount) {
	$("#lotteryBtn").stopRotate();
	$("#lotteryBtn").rotate({
		angle: 0,
		duration: 10000,
		animateTo: angle + 3600 - 1,
		callback: function() {
			if (awardCode == 0) { //未中奖
				alert(text);
			} else if (awardCode == 7) { // iphone7
			} else {
				//抽奖次数用完
                if(usedCount >= 3){
                    $(".JS_app_remind").html("");
                }
				if (awardCode == 1 || awardCode == 3 || awardCode == 5) { // 集分宝
					$(".JS_app_title").html(text);
					$("#JS_zfbUserName").html(tf8.formatAliaccount(aliAccount));
					showMsg('jfb');
				} else { // 红包
					$(".JS_app_title").html(text);
					showMsg('hb');
				}
			}
            isAnimated = false;
			// 剩余抽奖次数
			$('#JS_num_total').text(unUsedCount);
			//抽奖次数用完
			if(usedCount >= 3){
				$('.app_m_text .goHome').text('继续下单，领返利');
			}

		}
	});
}
function showMsg(id) {
	//JS_app_tk_0:身份不符合，不能参与活动
	//JS_app_tk_1:没有在app下单,抽奖次数为0
	//JS_app_tk_2:抽奖机会已用完
	//JS_app_tk_3:设备被使用过
	//JS_app_tk_4:未填写支付宝
	//JS_app_tk_5:支付宝已被使用
	// 奖品
	//JS_app_tk_hb:奖品为”红包“类型
	//JS_app_tk_jfb:奖品为”集分宝“类型
	$("#xr_opacity").show();
	$("#JS_app_tk_" + id).show();
}
function closeTk() {
	$("#JS_tk_download").hide();
	$(".act_app_tk").hide();
	$("#xr_opacity").hide();
    isAnimated = false;

}
var isAnimated = false;
$(function() {
	$("#JS_download").click(function(){
		var url = 'taofen8-master://wl/?id=http%3a%2f%2focean.taofen8.com%2flottery%2factPage';
		jumpToDownload(url);
	});
	
    if (history.replaceState) {
        history.replaceState({}, '', '');
    }
    window.onpopstate = function (e) {
        if (e.state) {
            window.location.reload(true);
        }
    };
    //跳转到app首页
	$(".goHome").click(function(){
		var url = 'taofen8-master://tj/?id=0';
    	jumpToAPP(url);
	});
	//联系客服
//	$("#contactUs").click(function(){
//		var url = 'taofen8-master://ccs';
//    	jumpToAPP(url);
//	});
	// 关闭弹框
	$(".act_app_tk .closes,.act_app_tk .close,#xr_opacity").on('click', function() {
		closeTk();
	});
    var hasAlipay = '${hasAlipay}';
	// 填写支付宝
	$('.jfbBtn').on('click', function(e) {
		var self = $(this),
			tkEle = self.closest('.act_app_tk'),
			errEle = tkEle.find('.error'),
			aliAcount = $.trim(tkEle.find('[name=aliAcount]').val());

		if (tf8.isEmpty(aliAcount)) {
			errEle.text('支付宝不能为空');
			return false;
		} else if (!tf8.isMobile(aliAcount) && !tf8.isMail(aliAcount)) {
			errEle.text('支付宝格式错误');
			return false;
		}

		var jqXhr = $.ajax({
			url: '${changeAliAccountUrl}',
			type: 'POST',
			dataType: 'json',
			data: {
				userId: userId,
				aliAccount: aliAcount
			},
			beforeSend: function() {
				var currentReq = self.data("jqXhr");
				if (currentReq != null) {
					currentReq.abort();
				}
			},
			complete: function() {
				self.data("jqXhr", null);
			},
			success: function(data) {
				if (data.result) {
				    hasAlipay = 'true';
					closeTk();
					$("#lotteryBtn").trigger('click');
				} else {
					errEle.text('支付宝已被使用');
				}
			}
		});
		self.data("jqXhr", jqXhr);
		return false;
	});
	// 抽奖

	$("#lotteryBtnZZ").rotate({
		bind: {
			click: function() {
				var ua = navigator.userAgent;
				if(ua.indexOf("Taofen8")<0 ) {
					// 显示下载弹框
					$("#JS_tk_download").show();
					$("#xr_opacity").show();
					return false;
				}
				
                if(isAnimated == true){return;}
                isAnimated = true;
                if(tf8.isEmpty(userId)){
                    loginUserNew(loginCallBackUrl);
                    return;
                }
/*                 if(hasAlipay == 'false'){
                    showMsg(4);
                    return;
                } */
				// 验证合法性
				$.ajax({
					url: '${lotteryUrl}',
					type: 'POST',
					dataType: 'json',
					data: {
						userId: userId,
						appCookie: appCookie
					},
					beforeSend: function() {
						if (isFetching) {
							return false;
						} else {
							isFetching = true;
						}
					},
					complete: function() {
						isFetching = false;
					},
					success: function(data) {
						var errorCode = data.errorCode;

						if (errorCode > -1) {
							$("#lotteryBtn").stopRotate();
							showMsg(errorCode);
							return;
						} else {
							var awardCode = data && data.awardCode || 0,
								awardObj = [{'angle':0, 'txt':'很遗憾，这次您未抽中奖'},
											 {'angle':338, 'txt':'188集分宝'},
											 {'angle':292, 'txt':'1元红包'},
											 {'angle':247, 'txt':'588集分宝'},
											 {'angle':201, 'txt':'5元红包'},
											 {'angle':160, 'txt':'288集分宝'},
											 {'angle':117, 'txt':'2元红包'},
											 {'angle':73, 'txt':'iphone7'},
							  				 {'angle':25, 'txt':'10元红包'}],
							    award = awardObj[awardCode];

							// $("#lotteryBtn").stopRotate();
							// $("#lotteryBtn").rotate({
							// 	angle: 0,
							// 	duration: 2000,
							// 	animateTo: 360000,
							// });

							rotateFunc(awardCode, award.angle, award.txt, data.usedCount, data.totalCount - data.usedCount, data.aliAccount);
						}
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
					    console.dir(textStatus+'->'+errorThrown);
					}
				});
			}
		}
	});
});
function goHelp() {
    var url = 'taofen8-master://tw/?id=http%3a%2f%2fh5.m.taobao.com%2fww%2findex.htm%3fa%3da%23!dialog-5reY57KJ5ZCn--69813275-';
    jumpToAPP(url);
};

//下载淘粉吧客户端
function jumpToDownload(url) {
    var jumpUrl;
    var ua = navigator.userAgent;
    if(ua.indexOf("MicroMessenger") > 0) {
        jumpUrl="http://a.app.qq.com/o/simple.jsp?pkgname=com.leixun.taofen8";              
    } else {
        //尝试唤起
        jumpToAPP(url);
         
        if(ua.indexOf("Android") > 0){
            jumpUrl="http://m.taofen8.com/download.jsp";
        }
        if(ua.indexOf("iPhone") > 0  || ua.toLowerCase().indexOf("ipad") > 0 || ua.toLowerCase().indexOf("ipod") > 0){
            jumpUrl="http://itunes.apple.com/us/app/tao-fen-ba/id527012586?ls=1&mt=8";
        }                       
        if(ua.indexOf("Wp") > 0){
            jumpUrl="http://www.windowsphone.com/zh-cn/store/app/%E6%B7%98%E7%B2%89%E5%90%A7/23861cd8-a7d3-40f2-b140-5cf116964641";
        }   
    }
    //因ios9以上的唤起方式是重定向，所以下载要延迟0.05秒再重定向
    setTimeout(function() {
        window.location.href = jumpUrl;
    }, 2000);
}

</script>

</body>
</html>
