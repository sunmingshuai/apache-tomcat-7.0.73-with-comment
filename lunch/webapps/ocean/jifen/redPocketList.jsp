<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta name="format-detection"content="telephone=no, email=no" />
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<title>收入明细</title>
<link rel="stylesheet" type="text/css" href="/css/myhb.css?v=04010618" />
<!-- <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script> -->
<script src="../js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.mobile.touch.min.js"></script>
<script language="javascript">
var btnFlag = true;//控制兑换按钮，防止多次点击

//弹窗出现后，禁止背景滚动
var forbidScroll = function (){
    event.preventDefault();
};
$(function(){
    //给兑换按钮绑定提示弹窗事件
    $(".duihuan").on('tap',function(){
    	var hbjifen = $(this).attr("data-hbjifen");//兑换需要的积分
    	var hbamount = $(this).attr("data-hbamount");//积分兑换的红包面额
    	var hbid = $(this).attr("data-hbid");//积分兑换的红包id
    	$("#hongbaoIdInput").val(hbid);
    	$(".convert_hb_tc").find("i").html(hbjifen);
    	$("#hbamount").html(hbamount);
        $(".convert_hb_opacity,.convert_hb_tc").show();
        document.body.addEventListener('touchmove', forbidScroll, false);
        $(".convert_hb_container").addClass("hb_detail_bgImg");
    });
    //关闭是否兑换提示弹窗
    $("#close_tc").on('tap',function(){
    	closeTip();
    });
});

//关闭兑换提示弹窗
function closeTip(){
	 $(".convert_hb_container").removeClass("hb_detail_bgImg");
     $(".convert_hb_opacity,.convert_hb_tc").hide();
     document.body.removeEventListener('touchmove', forbidScroll, false);
	
}

//关闭兑换结果弹窗
function Close(){
	$("#log_2").hide();
	$("#log_3").hide();
	$("#log_4").hide();
	$("#xr_opacity").hide();
}

//积分兑换红包
function jifenExchangePocket(){
	if(btnFlag){
		btnFlag = false;
		$.ajax({
			url: '/jifen/jifenExchangeRedPocket',
			type: 'POST',
			data:{
				"userId":$("#userIdInput").val(),
				"hongbaoId":$("#hongbaoIdInput").val()
			},
			dataType: 'json',
			success: function(data) {
				if(data && data.success) {
					Close();
					$("#log_2").show();
					$("#xr_opacity").show();
				} else {
					if(data.code == "3"){//积分不足，不能兑换
						Close();
						$("#log_4").show();
						$("#xr_opacity").show();
					}else{//积分兑换红包异常
						Close();
						$("#log_3").show();
						$("#xr_opacity").show();
					}
				}
			},
			complete: function(){
				btnFlag = true;
			}
		});
	}
}
</script> 
</head>

<body>
	<input type="hidden" id="userIdInput" value="${userId}">
	<div class="convert_hb_container">
		<p class="convert_hb_hint fs12">为保证顺利使用红包，请在订单确认收货前兑换<br/>购物车多件商品订单视为多笔订单</p>
		<div class="convert_hb_message">
            <div class="convert_hb_integral">
                <p class="fs12 word">可兑换积分</p>
                <p class="fs20 number">${userjf}</p>
            </div>
            <a class="look_rule fs12" href="https://ocean.taofen8.com/html/hongbao/myHongbaorule.html">
                <span class="look_source fs13">查看红包规则</span>
                <span class="gt"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2Kf1tXYlmpuFjSZFlXXbdQXXa_!!2296013456.png" class="w100"></span>
            </a>
        </div>
        <ul>
        <c:forEach items="${hongbaoDtoList}" var="hongbao" varStatus="num">
        	<li class="usable">
        		<div class="price_wrap">
                    <i class="fs12 price_sign">￥</i><span class="fs30">${hongbao.amount}</span>
                </div>
                <div class="integral_detail_wrap">
                    <p class="fs11 introduce">${hongbao.useDesc}</p>
                    <div class="integral_wrap">
                        <div class="integral_number fs14"><span>${hongbao.jifenNum}</span>积分</div>
                        <c:choose>
                        	<c:when test="${hongbao.status}">
                        		<a href="javascript:void(0)" data-hbid="${hongbao.id}" data-hbamount="${hongbao.amount}" data-hbjifen="${hongbao.jifenNum}" class="exchange_integral_btn red fs14 duihuan">兑换</a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="javascript:void(0)" class="exchange_integral_btn gray fs14">积分不足</a>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <c:if test="${hongbao.fanliType == 'GF'}">
                	<!-- 超高返icon -->
                	<span class="tip_icon"><img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2fb3rXR8lpuFjy0FnXXcZyXXa_!!2296013456.png" class="w100" alt="超高返"></span>
                </c:if>
        	</li>
        </c:forEach>
        </ul>
	</div>
	<div class="convert_hb_opacity"></div>
    <div class="convert_hb_tc">
        <p class="hint fs14">您将消耗<i style="font-style:normal;"></i>积分兑换<span id="hbamount"></span><span>元红包</span>，<br>
        	兑换后至${redPocketEndYear}年${redPocketEndMonth}月${redPocketEndDay}日00:00确认收货后自动使用，<br>
        	兑换积分不予退还。
        </p>
        <div class="btn_wrap fs17"><a href="javascript:void(0);" class="gray" id="close_tc">取消</a><a href="javascript:void(0);" onclick="closeTip();jifenExchangePocket();" class="red">确定</a></div>
    </div>
	
	<div class="inte_tank" id="JS_tank">
		<input type="hidden" id="hongbaoIdInput">
		<!-- 兑换成功 -->
        <div id="log_2" style="display:none;">
        	<a class="fs28" href="https://ocean.taofen8.com/jifen/goRedPocketListPage?userId=${userId}" style="color:#333;text-decoration:none;padding:0rem 0.4rem 0 0;float:right;">x</a>
        	<p class="jf_div_wz fs14" style="padding-top:10%"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2rGIWeFXXXXX6XXXXXXXXXXXX_!!2296013456.png"  /><br />恭喜您！您的红包已兑换成功</p>
            <a href="https://ocean.taofen8.com/hongbao/myHongbao?userId=${userId}" class="jf_href" onclick="Close();return ture;">去看看我的红包</a>
        </div>
        <!-- 兑换失败 -->
        <div id="log_3"  style="display:none;">
        	<p class="jf_div_wz fs14"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2RNgzeFXXXXbnXpXXXXXXXXXX_!!2296013456.png"  /><br />兑换失败</p>
            <a href="#" class="jf_href" onclick="Close()">确定</a>
        </div>
        <!-- 积分不足 -->
        <div id="log_4"  style="display:none;">
        	<p class="jf_div_wz fs14"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2RNgzeFXXXXbnXpXXXXXXXXXX_!!2296013456.png"  /><br />您的积分不足，不能兑换</p>
            <a href="#" class="jf_href" onclick="Close()">确定</a>
        </div>
    </div>
    <div class="xr_opacity" id="xr_opacity"></div>
</body>
</html>