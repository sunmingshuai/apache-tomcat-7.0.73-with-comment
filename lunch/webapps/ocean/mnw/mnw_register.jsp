<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<script src="https://ocean.taofen8.com/js/jquery-2.1.4.min.js"></script>
<script src="https://ocean.taofen8.com/js/tf8common_ocean.js" type="text/javascript"></script>
<title>玛瑙湾活动</title>
<style type="text/css">
    body,p,ul{font:normal 100% "微软雅黑" Helvetica, Arial, sans-serif; padding:0px; margin:0px;}
    html{background:#fff;}
    a{text-decoration:none;}
    .w100{width:100%;}
    .manao{width:10rem; height:auto; overflow:hidden;margin: 0 auto;}
    .dl_div{width: 10rem;height:3.5rem;font-size: 0;}
    .rule{width:9.3rem;margin: 0 auto;overflow: hidden; height:auto;color: #211203;margin-top: -1rem;}
    .rule_p{padding:0.6rem 0 0.8rem 0; }
    .rule_p1{padding:0 0 0.4rem 0;text-indent: 2em;}
    .rule_p1 span{background:#fee84d;border-radius: 25px;}
    .button{width: 3.84rem;height: 1.05rem;font-size: 0;display: block;margin: 0.3rem auto auto auto;}
    .rule_p2{width: 100%;text-align: center;color: #f93a38;}
    .dl_img{width: 10rem;height:auto; overflow: hidden; font-size: 0;}
    .foot_rule{width: 10rem;overflow: hidden;height: auto;background: #e34338;}
    .foot_rule_img{width:8.4rem;height: 1.06rem;margin: 0.5rem auto;}
    .foot_rule_box{width: 9.06rem;height: auto;overflow: hidden;margin: 0 auto;padding: 0.3rem 0;}
    .foot_rule_box p{color: #fff;padding-bottom: 0.3rem;}
    #mask {width:100%;height:100%;background:#000;opacity:0.5;position:fixed;top:0;z-index:999;display:none; }
    #tankuang {width:8.5rem;padding:0.3rem 0;position:fixed;top:23%;left:0.75rem;background:#fff;z-index:1001;display:none;}
    #tankuang .p1 {position:absolute;right:0.15rem;top:0.1rem;width: 0.4rem;height: 0.4rem;font-size: 0;padding:0.2rem}
    #tankuang .p2 {width:7.2rem;margin:0.2rem auto 0;text-align:center;line-height:0.6rem;color: #333;}
    #tankuang .p3 {width:7.2rem;margin:0.2rem auto;text-align:center;line-height:0.6rem;color: #000;}
    #tankuang .p4 {width:7.2rem;margin:0.2rem auto;text-align:left;line-height:0.6rem;color: #000;}
    #tankuang .p4 span{font-weight: bold;}
    .num_input{width:7.2rem;margin: 0 auto;}
    .numberNull{width:7rem;height: 0.93333rem; line-height: 0.93333rem;border:#999999 solid 2px; background:#fff; color:#999999;outline:none;padding: 0.06rem 0.1rem; }
    .yzm_button{display:inline-block;width:2.5rem;height: 0.93333rem; line-height: 0.93333rem; text-align: center;padding: 0.1rem 0; background:#f4edbd; color:#666; text-decoration:none;margin-top: 0.2rem;}
    .yzm_button:hover{text-decoration:none;}
    .yanzheng{width:4.4rem; display:inline-block;margin-left: 0.65rem;}
    .tips{color:#f83a7a;width:7.2rem;margin:0 auto;padding:0.2rem 0 0.4rem 0;visibility:hidden;}/**visible**/
    .tc_button{width:7.2rem;margin:0 auto}
    .tc_button a{width:3.2rem;height:0.93rem;float:left;line-height:0.93rem;text-align:center;border:#999999 1px solid;color: #666666;text-decoration: none;}
    .tc_button a:hover{text-decoration: none;}
    .tc_button .red{float: right;color: #fff;background: #f83a7a;border:#f83a7a 1px solid;}
    .six_sf{width:6.56rem;height:1rem; overflow: hidden; margin: 0 auto; background: url(https://img.alicdn.com/imgextra/i4/2296013456/TB2UlOjkXXXXXaoXXXXXXXXXXXX_!!2296013456.png) no-repeat;background-size:contain;}
    .sf_num{width:6.16rem;height:1rem;overflow:hidden;background:none;border: none;color: #333;letter-spacing:0.84rem;padding-left: 0.42rem; }

    .yincang{width:8.5rem;padding:0.3rem 0;position:fixed;top:23%;left:0.75rem;background:#fff;z-index:1000;}
	.num_manao{width:4.54rem;height:auto;overflow: hidden; background: #fee84d;margin:0 auto; position: relative; top: -0.9rem; text-align: center;color: #490803; padding: 0.1rem 0;}
    .num_manao span{color: #eb012d;font-weight: bold;}
    [data-dpr="1"] .br5 {border-radius:5px}
    [data-dpr="2"] .br5 {border-radius:10px}
    [data-dpr="3"] .br5 {border-radius:15px}

    [data-dpr="1"] .fontSize13{font-size:13px;}
    [data-dpr="1"] .fontSize14{font-size:14px;}
    [data-dpr="1"] .fontSize16{font-size:16px;}

    [data-dpr="2"] .fontSize13{font-size:26px;}
    [data-dpr="2"] .fontSize14{font-size:28px;}
    [data-dpr="2"] .fontSize16{font-size:32px;}

    [data-dpr="3"] .fontSize13{font-size:39px;}
    [data-dpr="3"] .fontSize14{font-size:42px;}
    [data-dpr="3"] .fontSize16{font-size:48px;}
    
    

</style>
</head>

<body>

<input class="tf8-log-hidden" type="hidden" name="pageType" value="mobile" />
<input class="tf8-log-hidden" type="hidden" name="pageName" value="register" />
<input class="tf8-log-hidden" type="hidden" name="code" value="mnw" />
<input class="tf8-log-hidden" type="hidden" name="channel" value="${channel}" />
<input class="tf8-log-hidden" type="hidden" name="userId" value="${userId}" />

<div class="manao" >
	<input type="hidden" value="${redirectUrl}" id="redirectUrl">
    <div class="dl_div"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB28GXskpXXXXblXpXXXXXXXXXX_!!2296013456.png" class="w100"/></div>
   	<div class="num_manao br5 fontSize14" >您已获得价值<br><span class="fontSize16">${assetAmount }元</span><br>玛瑙币</div>
   	<div class="rule fontSize14">
        <p class="rule_p">为庆祝淘粉吧（股票代码：834805）新三板挂牌上市，淘粉吧和淘粉吧控股公司玛瑙湾联合推出新老用户回馈活动：</p>
        <p class="rule_p1">自用户首次登录淘粉吧起，所有用户可获得8888个玛瑙币，并在后续淘粉吧进行消费每满1元可获赠10个玛瑙币，买越多、送越多，详情请参阅页面底部活动规则。
        </p>
        <p class="rule_p1">
            通过理财超市使用玛瑙币进行投资所获取的收益归用户所有，可以<span>直接提现到银行卡或进行高收益的理财投资</span>。
        </p>
    </div>
    
    <c:if test="${active == 'yes' }">
    	<a class="button" href="${url }" ><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2QtRbkpXXXXb_XXXXXXXXXXXX_!!2296013456.png" class="w100" ></a>
    </c:if>
     <c:if test="${active != 'yes' }">
    	<a class="button" onclick="openTk('shouji');" href="javascript:void(0)" ><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2ql49kXXXXXa4XXXXXXXXXXXX_!!2296013456.png" class="w100" ></a>
    </c:if>
    <div class="dl_img"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2tV04kXXXXXbZXXXXXXXXXXXX_!!2296013456.jpg" class="w100"/></div>
    <div class="dl_img"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2dfRqkXXXXXcZXpXXXXXXXXXX_!!2296013456.jpg" class="w100"/></div>
    <div class="dl_img"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2OXVZkXXXXXbJXXXXXXXXXXXX_!!2296013456.jpg" class="w100"/></div>
    <div class="dl_img"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2pbFlkXXXXXc9XpXXXXXXXXXX_!!2296013456.jpg" class="w100"/></div>
    <c:if test="${active == 'yes' }">
    	<a class="button" href="${url }" ><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2QtRbkpXXXXb_XXXXXXXXXXXX_!!2296013456.png" class="w100" ></a>
    </c:if>
     <c:if test="${active != 'yes' }">
    	<a class="button" onclick="openTk('shouji');" href="javascript:void(0)" ><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2ql49kXXXXXa4XXXXXXXXXXXX_!!2296013456.png" class="w100" ></a>
    </c:if>
    <div class="dl_img" style="height:1rem;" >&nbasp;</div>
    <div class="foot_rule">
        <p class="foot_rule_img"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2kT1fkXXXXXXTXXXXXXXXXXXX_!!2296013456.png" class="w100"/></p>
        <div class="foot_rule_box fontSize13">
            <p>本活动自2016.2.19上线以来，深受广大用户喜爱，经玛瑙湾和淘粉吧友好协商，决定延长本活动至2017.12.31，并在到期之前视情况决定是否继续延长。</p>
            <p>1、1玛瑙币在投资时等值于1元虚拟理财本金，本金归玛瑙湾平台所有，投资收益归用户所有；</p>
            <p>2、活动期间，用户首次登录淘粉吧，所有用户可获得8888个玛瑙币，相当于8888元虚拟理财本金，可投资于“玛瑙币专享理财产品”，投资所获取的收益归用户所有，可以直接提现到银行卡或进行高收益的理财投资；</p>
            <p>3、活动期间，自用户首次登录淘粉吧日起：前90天在淘粉吧每购物1元，可获赠10个玛瑙币；第91天-730天在淘粉吧每购物1元，可获赠5个玛瑙币；（备注：不返集分宝的商品也不参与玛瑙币赠送）</p>
            <p>4、同一个用户在每个自然季度内最多可获得50,000玛瑙币，同一个IP地址、同一个收货地址、同一个设备号（如IMEI）、同一个身份证号码均视同同一个用户；</p>
            <p>5、玛瑙币自获得之日起，有效期为90天，过期不使用则自动作废；</p>
            <p>6、玛瑙币不可兑换现金，不可转让，不可继承；</p>
            <p>7、任何人通过机器人注册、积分墙发任务、邀请刷单、网赚平台等方式利用本活动进行牟利，一旦发现，玛瑙湾将取消其全部奖励（包括已发放和未发放的奖励），如果涉及犯罪，玛瑙湾将移送司法机关处理。</p>
            <p>8、在法律许可范围内玛瑙湾保留活动解释权。</p>
        </div>
    <div>

</div>

<!--弹框-->
<div id="mask" onclick="closeTk();"></div>
<div id="tankuang" class="br5">
    <!-- 填手机号 -->
    <div id="shouji" style="display:block">
        <p class="p1" onclick="closeTk();">
            <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2VYOgkXXXXXaPXXXXXXXXXXXX_!!2296013456.png"  class="w100">
        </p>
        <p class="p2 fontSize14">理财超市温馨提示</p>
        <p class="p3 fontSize14" >为确保您的账户安全，请输入您常用手机号</p>
        <div class="num_input fontSize14"><input type="tel" id="mobile"  placeholder="请输入您的手机号码" value="${mobile }" name="numberNull" class="br5 numberNull"></div>
        <div>
            <input type="text" placeholder="请输入验证码" id="yzm" name="yzm" class="br5 numberNull yanzheng fontSize14" >
            <a href="javascript:void(0)" id="JS_button" class="br5 yzm_button fontSize14">获取验证码</a>
            <a href="javascript:void(0)" class="yzm_button br5 fontSize14" style="background:#dcdcdc; border:#dcdcdc solid 1px; display:none;">剩<span id="JS_num">60</span>秒</a>
        </div>
        <p class="tips fontSize14" id="phone_tip"></p>
        <p class="tc_button fontSize14" >
            <a href="javascript:void(0)" onclick="closeTk();" class="grey br5" >我再看看</a>
            <a href="javascript:void(0)" id="JS_red"  onClick="getPhone();"  class="red br5" >确认提交</a>
        </p>
    </div>
    
    <!-- 填写身份证后六位 -->
    <div id="shenfen" style="display:none">
    	<input id="phone" type="hidden" value="${mobile}"/>
        <p class="p1" onclick="closeTk();">
            <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2VYOgkXXXXXaPXXXXXXXXXXXX_!!2296013456.png"  class="w100">
        </p>
        <p class="p2 fontSize14">您已经是玛瑙湾用户</p>
        <p class="p4 fontSize14" >您的手机号已经注册过玛瑙湾，我们将同步您在玛瑙湾的理财信息，请输入您的<span>身份证后六位进行验证</span>。</p>
        <div class="six_sf">
            <input  id="sx_input" type="text" class="sf_num fontSize16" maxlength="6" readOnly />
        </div>
        <p class="tips fontSize14"  id="shenfen_tip"></p>
        <p class="tc_button fontSize14" >
            <a href="tel:400 963 9633" class="grey br5" >联系客服</a>
            <a href="javascript:void(0)" id="JS_red" onClick="getID();"  class="red br5" >提交验证</a>
        </p>
    </div>
</div>

<div class="yincang"  style="display:none;width:0; left:-1rem;">
        <input  id="sx_input_detil" type="text"  maxlength="6" style="font-size:0.5px"  />
</div>
<input id="userId" type="hidden" value="${userId }"/>

<script>

	$(function(){
		$('#mask').height($(document).height());
	});
	

	$('#sx_input').on('click', function() {
		$('#sx_input_detil').focus();
	});

	$('#sx_input_detil').on('input propertychange', function() {
		var hidVal = $('#sx_input_detil').val();
		hidVal = hidVal.replace(/[^A-Za-z0-9]/g, "");
		if (hidVal.length > 6) {
			hidVal = hidVal.substring(0, 6);
		}
		$('#sx_input_detil').val(hidVal);
		$('#sx_input').val(hidVal);
	});

	
	var count = 0;//控制重复点击
	//点击获取验证码，显示验证码倒计时60秒
	$("#JS_button").on("click", function() {
		var mobile = $('#mobile').val();
		var _this = $(this);
		var cE = $(this).siblings("a");
		//判断手机号是否为11位的正整数
		if (!(/^(1\d{10})$/.test(mobile)) || mobile.length != 11) {
			$("#phone_tip").html("手机号格式不正确，请重新输入");
			$('#phone_tip').css("visibility", "visible");
		} else {
			if(count >= 1){
				return;
			}
			count = 1;
			$.post("/mnw/sendVerifyCode", {
				"mobile" : mobile
			}, function(result) {
				count  = 0;
				result = $.parseJSON(result);
				if (result.success) {
					$('#phone_tip').css("visibility", "hidden");
					_this.hide();
					cE.show();
					countTime();
				}else{
					$("#phone_tip").html(result.message);
					$('#phone_tip').css("visibility", "visible");
				}
			});
		}
	});

	//判断手机号
	function getPhone() {
		var mobile = $('#mobile').val();
		var verifyCode = $('#yzm').val();
		var redirectUrl = $('#redirectUrl').val();
		//判断手机号是否为11位的正整数
		if (!(/^(1\d{10})$/.test(mobile)) || mobile.length != 11) {
			$("#phone_tip").html("手机号格式不正确，请重新输入");
			$('#phone_tip').css("visibility", "visible");
		} else if (verifyCode == null || verifyCode == '') {
			$("#phone_tip").html("请输入验证码");
			$('#phone_tip').css("visibility", "visible");
		} else {
			$.post("/mnw/checkVerifyCode", {
				"verifyCode" : verifyCode,
				"mobile" : mobile,
				"userId" : $("#userId").val()
			}, function(result) {
				result = $.parseJSON(result);
				if (result.success) {
					window.location.href = redirectUrl;
				} else if (result.next) {
					//关闭当前弹窗，打开身份证验证弹窗
					closeTk();
					$('#phone').val(mobile);
					openTk('shenfen');
				} else {
					$("#phone_tip").html(result.message);
					$('#phone_tip').css("visibility", "visible");
				}
			});
		}
	}
	//验证码60秒倒计时
	function countTime() {
		var value = $("#JS_num").html();
		if (value == 0) {
			$("#JS_button").show().siblings("a").hide();
			$("#JS_num").html(60);
		} else {
			value--;
			$("#JS_num").html(value);
			setTimeout(countTime, 1000);
		}
	}

	//判断身份证     
	function getID() {
		var mobile = $('#phone').val();
		var shenfen = $('#sx_input').val();
		var redirectUrl = $('#redirectUrl').val();
		//判断身份证后6位
		if (shenfen == null || shenfen.length != 6) {
			$('#shenfen_tip').html("身份证号后6位不正确");
			$('#shenfen_tip').css("visibility", "visible");
		} else {
			$.post("/mnw/checkIdCardSuffix", {
				"idCardSuffix" : shenfen,
				"mobile" : mobile,
				"userId" : $("#userId").val()
			}, function(result) {
				result = $.parseJSON(result);
				if (result.success) {
					window.location.href = redirectUrl;
				} else {
					$("#shenfen_tip").html(result.message);
					$('#shenfen_tip').css("visibility", "visible");
				}
			});
		}
	}

	/**弹框关闭显示**/
	function openTk(tkName) {
		if(tkName=='shouji' && $('#phone').val()) {
			openTk('shenfen');
			return;
		}
		
		$('#mask').show();
		$('#tankuang').show();
		$('#tankuang').children().hide();
		if('shenfen' == tkName) $('.yincang').show();
		$('#tankuang').find('#' + tkName).show();
		//$('.manao').bind('touchmove',prevent);
		/*弹框居中
		$('#tankuang').css('top', ($(window).height()-$('#tankuang').outerHeight())/2-0.25*parseFloat(window.document.documentElement.style.fontSize));*/
	}

	function closeTk() {
		$("#mobile").val("");
		$('#mask').hide();
		$('#tankuang').hide();
		$('.yincang').hide();
		//$('.manao').unbind('touchmove',prevent);
	}
	
	function prevent(e) {
		e.preventDefault()
	}
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-75777879-19', 'auto');
  ga('send', 'pageview');
</script>

</body>
</html>
