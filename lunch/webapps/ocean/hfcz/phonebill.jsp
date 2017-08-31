<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tfb" uri="/WEB-INF/tld/tfb-static.tld" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <script src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
    <link rel="stylesheet" href="../css/hfcz/bootstrap-modal.css">
    <title>新人专享充话费活动</title>
    <style>
        html{background-color:#fff;}
        body{width:10rem;padding-bottom:.5rem;margin:0 auto;color:#333;overflow-x:hidden;font-family: PingFangSC-Light;}
        body,div,ul,li,input,p{box-sizing:border-box}
        img{width:100%;display:block}
        .top_banner{width:10rem;height:1.1875rem;line-height:1.1875rem;text-align:center;color:#fff;background-color:#f9a938;}
        /*导航*/
        .nav{width:10rem;text-align:center;font-size:0;overflow:hidden}
        .nav li{float:left;width:33.333%;height:1.25rem;line-height:1.25rem;color:#666;border-bottom:0.03125rem solid #eee;}
        .nav li.active span{display:inline-block;line-height:1.1875rem;color:#f4436d;border-bottom:.0625rem solid #f4436d;}
        /*话费,流量*/
        .content-wrap {display:none;width:10rem;overflow:hidden}
        .content-wrap.active {display: block;}
        .content-wrap dl{width:10rem;padding:0 .5rem .125rem;text-align:center;border-bottom:0.03125rem solid #eee;overflow:hidden;}
        .content-wrap dt{padding-top:0.3125rem;padding-bottom:0.3125rem;text-align:left;}
        .content-wrap dd{float:left;margin-right:0.28125rem;margin-bottom:0.3125rem;color:#fca4bc;}
        .content-wrap .item_wrap{display:table-cell;width:2.8125rem;height:2.03125rem;line-height:1;border:0.03125rem solid #f4436d;border-radius:0.15625rem;vertical-align:middle;}
        .content-wrap dd .item_type{margin-bottom:0.1875rem;color:#f4436d;font-family:PingFangSC-Medium;}
        .content-wrap dd .original_price{margin-bottom:0.15625rem;text-decoration:line-through;}
        .content-wrap .empty-wrap{padding-top:1.0625rem;}
        .content-wrap .img-wrap{width:1.5rem;height:1.5rem;margin:0 auto 0.5rem;}
        .content-wrap p{line-height:1;margin-bottom:0.3125rem;text-align:center;color:#999;}
        /*活动规则*/
        .act_rule{padding:0.3125rem 0.5rem 0;}
        .act_rule dt{padding-top:0.28125rem;padding-bottom:0.28125rem;}
        .act_rule dd{line-height:1.9;padding-left:0.375rem;color:#666;position:relative;}
        .act_rule dd span{position:absolute;left:0;}
        /*弹框*/
        .font-pink{color:#f53e7b}
        .btn{width:3.28125rem;height:1.09375rem;line-height:1.09375rem;border:0;border-radius:0.09375rem;color:#fff;text-align:center;display: inline-block;outline:none;}
        .btn-pink{background-color:#f53e7b;}
        .btn-gray-trans{border:0.03125rem solid #ccc;color: #666;background-color:#fff;}
        .f-right{float:right;}
        #errorMsg{height:.75rem;line-height:.75rem;text-align:center;}
        #submitBtn{width: 2.125rem;height:1rem;line-height:1rem;border-radius:0 0.09375rem 0.09375rem 0;background-color:#ff3367;position:absolute;top:0.25rem;right:0;}
        .modal-body input{width:4.875rem;height:1rem;padding-left:.1875rem;border:0.03125rem solid #e5e5e5;border-right:0;border-radius:.09375rem 0 0 .09375rem;outline:0;-webkit-appearance:none;}
        .modal-body p{line-height:1.6;}

        [data-dpr="1"] .fs9 {font-size:9px}
        [data-dpr="2"] .fs9 {font-size:18px}
        [data-dpr="3"] .fs9 {font-size:27px}
        [data-dpr="1"] .fs12 {font-size:12px}
        [data-dpr="2"] .fs12 {font-size:24px}
        [data-dpr="3"] .fs12 {font-size:36px}
        [data-dpr="1"] .fs11 {font-size:11px}
        [data-dpr="2"] .fs11 {font-size:22px}
        [data-dpr="3"] .fs11 {font-size:33px}
        [data-dpr="1"] .fs14 {font-size:14px}
        [data-dpr="2"] .fs14 {font-size:28px}
        [data-dpr="3"] .fs14 {font-size:42px}
        [data-dpr="1"] .fs15 {font-size:15px}
        [data-dpr="2"] .fs15 {font-size:30px}
        [data-dpr="3"] .fs15 {font-size:45px}
        [data-dpr="1"] .fs17 {font-size:17px}
        [data-dpr="2"] .fs17 {font-size:34px}
        [data-dpr="3"] .fs17 {font-size:51px}
    </style>
</head>
<body>
	<!-- 页面参数start -->
	<!-- 是否为新用户 -->
	<input type="hidden" name="isNewer" id="isNewer" value="${isNewer}">
	<!-- 页面来源 -->
	<input type="hidden" id="mobilePage" value="sale_huafei" />
	<!-- 登录用户ID -->
	<input type="hidden" id="userId" value="${userId}" />
	<!-- cookie -->
	<input type="hidden" id="cookie" value="${mobileCookie}" />
	<!-- 客户端p -->
	<input type="hidden" id="p" value="${p}" />
	<!-- 客户端f -->
	<input type="hidden" id="f" value="${f}" />
	<!-- 页面参数end -->
    <div class="top_banner fs12">充话费和充流量可任意选择，但首充价只能享受一次</div>
    <!-- 运营商导航栏 -->
    <ul class="nav" id="nav">
        <li data-name="yd"><span class="fs14">中国移动</span></li>
        <li data-name="lt"><span class="fs14">中国联通</span></li>
        <li data-name="dx"><span class="fs14">中国电信</span></li>
    </ul>
    <!-- 中国移动 -->
    <div class="fs12 content-wrap yd">
        <c:if test="${not empty list1}">
        <dl>
            <dt>充话费</dt>
            <c:forEach items="${list1}" varStatus="index" var="obj">
            <dd data-itemid="${obj.itemId}" data-price="${obj.rechargeAmount}" data-realprice="${obj.realPrice}" data-firstprice="${obj.firstRechargePrice}" data-rebate="${obj.fanliAmount}">
                <div class="item_wrap">
                    <div class="fs17 item_type">${obj.rechargeAmount}元</div>
                    <div>首充价${obj.firstRechargePrice}元</div>                
                </div>
            </dd>
            </c:forEach>
        </dl>
        </c:if>
        <c:if test="${empty list1 && not empty list4}">
        <!-- 话费商品为空的情况 -->
        <dl>
           <dt>充话费</dt>
           <p>因通信运营商业务调整，暂时无法提供本服务。</p>
           <p>给您带来了不便，小粉非常抱歉！</p>
        </dl>
        </c:if>
        <c:if test="${not empty list4}">
        <dl>
            <dt>充流量</dt>
            <c:forEach items="${list4}" varStatus="index" var="obj">
            <dd data-itemid="${obj.itemId}" data-price="${obj.flowAmount}" data-realprice="${obj.realPrice}" data-firstprice="${obj.firstRechargePrice}" data-rebate="${obj.fanliAmount}">
                <div class="item_wrap">
                    <div class="fs17 item_type">${obj.flowAmount}</div>
                    <div class="fs9 original_price">原价${obj.realPrice}元</div>
                    <div>首充价${obj.firstRechargePrice}元</div>                
                </div>
            </dd>
            </c:forEach>
        </dl>
        </c:if>
        <c:if test="${not empty list1 && empty list4}">
        <!-- 流量商品为空的情况 -->
        <dl>
           <dt>充流量</dt>
           <p>因通信运营商业务调整，暂时无法提供本服务。</p>
           <p>给您带来了不便，小粉非常抱歉！</p>
        </dl>
        </c:if>
        <c:if test="${empty list1 && empty list4}">
        <!-- 流量和话费商品都为空的情况 -->
        <div class="empty-wrap">
            <div class="img-wrap">
                <img src="https://img.alicdn.com/imgextra/i2/643039162/TB2O9CAsXXXXXblXXXXXXXXXXXX_!!643039162.png" />
            </div>
            <p>因通信运营商业务调整，暂时无法提供本服务。</p>
            <p>给您带来了不便，小粉非常抱歉！</p>
        </div>
        </c:if>
    </div>
    <!-- 中国联通 -->
    <div class="fs12 content-wrap lt">
        <c:if test="${not empty list2}">
        <dl>
            <dt>充话费</dt>
            <c:forEach items="${list2}" varStatus="index" var="obj">
            <dd data-itemid="${obj.itemId}" data-price="${obj.rechargeAmount}" data-realprice="${obj.realPrice}" data-firstprice="${obj.firstRechargePrice}" data-rebate="${obj.fanliAmount}">
                <div class="item_wrap">
                    <div class="fs17 item_type">${obj.rechargeAmount}元</div>
                    <div>首充价${obj.firstRechargePrice}元</div>                
                </div>
            </dd>
            </c:forEach>
        </dl>
        </c:if>
        <c:if test="${not empty list5}">
        <dl>
            <dt>充流量</dt>
            <c:forEach items="${list5}" varStatus="index" var="obj">
            <dd data-itemid="${obj.itemId}" data-price="${obj.flowAmount}" data-realprice="${obj.realPrice}" data-firstprice="${obj.firstRechargePrice}" data-rebate="${obj.fanliAmount}">
                <div class="item_wrap">
                    <div class="fs17 item_type">${obj.flowAmount}</div>
                    <div class="fs9 original_price">原价${obj.realPrice}元</div>
                    <div>首充价${obj.firstRechargePrice}元</div>                
                </div>
            </dd>
            </c:forEach>
        </dl>
        </c:if>
        <c:if test="${empty list2 && empty list5}">
        <!-- 商品为空的情况 -->
        <div class="empty-wrap">
            <div class="img-wrap">
                <img src="https://img.alicdn.com/imgextra/i2/643039162/TB2O9CAsXXXXXblXXXXXXXXXXXX_!!643039162.png" />
            </div>
            <p>因通信运营商业务调整，暂时无法提供本服务。</p>
            <p>给您带来了不便，小粉非常抱歉！</p>
        </div>
        </c:if>
        <c:if test="${empty list2 && not empty list5}">
        <!-- 话费商品为空的情况 -->
        <dl>
           <dt>充话费</dt>
           <p>因通信运营商业务调整，暂时无法提供本服务。</p>
            <p>给您带来了不便，小粉非常抱歉！</p>
        </dl>
        </c:if>
        <c:if test="${not empty list2 && empty list5}">
        <!-- 流量商品为空的情况 -->
        <dl>
           <dt>充流量</dt>
           <p>因通信运营商业务调整，暂时无法提供本服务。</p>
            <p>给您带来了不便，小粉非常抱歉！</p>
        </dl>
        </c:if>
    </div>
    <!-- 中国电信 -->
    <div class="fs12 content-wrap dx">
        <c:if test="${not empty list3}">
        <dl>
            <dt>充话费</dt>
            <c:forEach items="${list3}" varStatus="index" var="obj">
            <dd data-itemid="${obj.itemId}" data-price="${obj.rechargeAmount}" data-realprice="${obj.realPrice}" data-firstprice="${obj.firstRechargePrice}" data-rebate="${obj.fanliAmount}">
                <div class="item_wrap">
                    <div class="fs17 item_type">${obj.rechargeAmount}元</div>
                    <div>首充价${obj.firstRechargePrice}元</div>                
                </div>
            </dd>
            </c:forEach>
        </dl>
        </c:if>
        <c:if test="${not empty list6}">
        <dl>
            <dt>充流量</dt>
            <c:forEach items="${list6}" varStatus="index" var="obj">
            <dd data-itemid="${obj.itemId}" data-price="${obj.flowAmount}" data-realprice="${obj.realPrice}" data-firstprice="${obj.firstRechargePrice}" data-rebate="${obj.fanliAmount}">
                <div class="item_wrap">
                    <div class="fs17 item_type">${obj.flowAmount}</div>
                    <div class="fs9 original_price">原价${obj.realPrice}元</div>
                    <div>首充价${obj.firstRechargePrice}元</div>                
                </div>
            </dd>
            </c:forEach>
        </dl>
        </c:if>
        <c:if test="${empty list3 && empty list6}">
        <!-- 商品为空的情况 -->
        <div class="empty-wrap">
            <div class="img-wrap">
                <img src="https://img.alicdn.com/imgextra/i2/643039162/TB2O9CAsXXXXXblXXXXXXXXXXXX_!!643039162.png" />
            </div>
            <p>因通信运营商业务调整，暂时无法提供本服务。</p>
            <p>给您带来了不便，小粉非常抱歉！</p>
        </div>
        </c:if>
        <c:if test="${empty list3 && not empty list6}">
        <!-- 话费商品为空的情况 -->
        <dl>
           <dt>充话费</dt>
           <p>因通信运营商业务调整，暂时无法提供本服务。</p>
           <p>给您带来了不便，小粉非常抱歉！</p>
        </dl>
        </c:if>
        <c:if test="${not empty list3 && empty list6}">
        <!-- 流量商品为空的情况 -->
        <dl>
           <dt>充流量</dt>
           <p>因通信运营商业务调整，暂时无法提供本服务。</p>
           <p>给您带来了不便，小粉非常抱歉！</p>
        </dl>
        </c:if>
    </div>
    <!-- 活动规则 -->
    <dl class="act_rule">
        <dt class="fs12">活动规则</dt>
        <dd class="fs12"><span>1.</span>下单价格-返利金额=首充价</dd>
        <dd class="fs12"><span>2.</span>订单可在淘粉吧“我的——我的返利”内查看，返利将在运营商充值成功后的30分钟内到帐您的支付宝（0-7点充值用户返利将于7点后到帐）</dd>
        <dd class="fs12"><span>3.</span> 本活动为淘粉吧新人专享，每位新用户仅享受一次首充价（话费、流量任选其一）。如给多个手机号充值，仅第一笔到帐订单享受首充价</dd>
        <dd class="fs12"><span>4.</span>流量商品为全国通用流量，充值规则请查看商品详情</dd>
        <dd class="fs12"><span>5.</span>同一手机号、淘宝账号、支付宝号、设备视为同一用户，一经发现违规，取消活动资格</dd>
        <dd class="fs12"><span>6.</span>「新人专享充话费活动」为用户首次安装淘粉吧APP7天内有效，7天后特权消失。</dd>
        <dd class="fs12"><span>7.</span>本活动最终解释权归淘粉吧所有。若有疑问请点击“我的——客服中心”咨询</dd>
    </dl>
    <!-- 老用户模态框 -->
    <div class="modal" id="oldTipModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="close-wrap" data-dismiss="modal"><span class="close"></span></div>
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="fs15 modal-title">新人充值有礼</h1>
                </div>
                <div class="modal-body fs12">
                    <p>${message}</p>
                </div>
                <div class="modal-footer fs14">
                    <div id="takeRebate" class="btn btn-pink" data-dismiss="modal" style="width:5rem;margin:.5rem auto 0">去充值拿返利</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 新用户模态框 -->
    <div class="modal" id="newTipModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="close-wrap" data-dismiss="modal"><span class="close"></span></div>
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="fs15 modal-title">新用户专享</h1>
                </div>
                <div class="modal-body fs12">
                    <div style="margin-bottom:0.25rem;">付款购买：<span class="f-right original-price">¥10.0</span></div>
                    <div style="margin-bottom:0.25rem;">返利到帐支付宝：<span class="f-right rebate">¥0.5</span></div>
                    <div style="padding:0.34375rem 0 0.5rem;border-top:1px solid #e5e5e5;">首充到手价：<span class="f-right font-pink first-price">¥9.5</span></div>
                </div>
                <div class="modal-footer fs15">
                    <div class="btn btn-gray-trans" data-dismiss="modal" style="float:left;">我再看看</div>
                    <div class="btn btn-pink" id="viewItemDetail" style="float:right;">确认</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 填支付宝模态框 -->
    <div class="modal" id="zfbModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="close-wrap" data-dismiss="modal"><span class="close"></span></div>
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="fs12 modal-title">填写支付宝账号,用以接收返利</h1>
                </div>
                <div class="modal-body fs12">
                    <input type="text" name="zfbAccount" id="zfbAccount" placeholder="请输入支付宝账号" />
                    <div class="btn fs15" id="submitBtn">确认</div>
                    <p class="fs11 font-pink" id="errorMsg"></p>
                    <div id="priceWrap" class="fs12">
                        <div style="margin-bottom:0.25rem;">付款购买：<span class="f-right original-price">¥10.0</span></div>
                        <div style="margin-bottom:0.25rem;">返利到帐支付宝：<span class="f-right rebate">¥0.5</span></div>
                        <div style="padding-top:0.34375rem;border-top:1px solid #e5e5e5;">首充到手价：<span class="f-right font-pink first-price">¥9.5</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="../js/jquery-2.1.4.min.js"></script>
<script src="../js/hfcz/common/tf8_sale_common.js"></script>
<script src="../js/hfcz/bootstrap-modal.js"></script>
<script src="../js/common/tf8ued.js"></script>
<script>
var p = $("#p").val();
var f = $("#f").val();
$(function() {
    var itemid = ""; // 商品ID
    var userId = $("#userId").val(); // 用户ID
    var cookie = $("#cookie").val();
    var isNewer = $("#isNewer").val(); // 是否为新用户
    var currentStatus = sessionStorage.getItem("type"); // 从session取得当前状态
 	//模态框弹出后，设置遮挡层高度
    $(".modal").on("shown.bs.modal", function(){
        $(".modal-backdrop").css("height", $(document).height());
    });
    // 初始化
    if (currentStatus) {
        $('[data-name=' + currentStatus + ']').addClass("active");
        $('.' + currentStatus).addClass("active");
    } else {
        $('[data-name=yd]').addClass("active");
        $('.yd').addClass("active");
    }  

    // 选择运营商
    $("#nav").on("click", "li", function() {
        var self = $(this);
        if (!self.hasClass("active")) {
            $("#nav").find(".active").removeClass("active");
            self.addClass("active");
            $('.content-wrap.active').removeClass("active");
            $('.' + self.data('name')).addClass("active");
        }
    });

    // 选择商品
    $(".content-wrap").on("click", "dd", function() {
    	var self = $(this);
        itemid = self.data('itemid');

        if(isNewer === "true"){
            var originalPrice = self.data("realprice"),
            firstPrice = self.data("firstprice"),
            rebate = self.data("rebate");

            $(".original-price").text("¥"+originalPrice);
            $(".rebate").text("¥"+rebate);
            $(".first-price").text("¥"+firstPrice);
        }
        if(userId=="" || userId==undefined || userId=="null"){
        	//login
        	window.location.href = "${loginUrl}";
        	return;
        }

    	$.ajax({
    		url : "/hfcz/toRechargeCheck",
    		type : "POST",
    		data: {"userId": userId, "itemId": itemid, "cookie": cookie},
    		dataType : "json",
    		success : function(data) {
    			if(data) {
    				if(!data.alipayExist) {// 未绑定支付宝账号的新用户
    					if(!data.isNewer){
                            $("#priceWrap").hide();
                        }
                        $("#errorMsg").text("");
                        $("#zfbModal").modal("show");
	    			}else {
                        if(!data.isNewer){//老用户
                            // 弹出老用户提示摸态框
                            $('#oldTipModal').modal('show');
                        }else{//已绑定支付宝的新用户
                            $("#newTipModal").modal("show");
                        }
	    			}
    			}
    		}
    	});
    });

    // 新用户模态框点击确认按钮
    $("#viewItemDetail").on("click", function() {
        saveStatus();
        goToTaobaoRecharge(userId, itemid, cookie);
    });
    
    // 老用户摸态框点击去充值拿返利按钮
    $("#takeRebate").on("click", function() {
    	saveStatus();
    	goToTaobaoRecharge(userId, itemid, cookie);
    });

    // 支付宝绑定
    $("#submitBtn").on("click", function() {
    	var zfbAccount = $.trim($("#zfbAccount").val());

    	if(zfbAccount === ""){
    		$("#errorMsg").text("请填写支付宝账号！");
    		return;
    	}else if(!isEmail(zfbAccount) && !isMobileNumber(zfbAccount) &&  
				!(/(^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/.test(zfbAccount))){
			$("#errorMsg").text("支付宝格式错误，请重新填写！");
			return;
		}

        $.ajax({
            url: "http://wcm.taofen8.com/user/bindAlipay",
            type: "post",
            dataType: "jsonp",
            data: {
                "alipay": zfbAccount,
                "userId": userId,
                "activityType": "SALE_NEW_USER_PHONE_FIRST_RECHARGE",
                "isJsonp": "true"
            },
            jsonpCallback : "jsonpCallback",
            success: function(data) {
            	if(data.success) {
            		addRechargeLogToDB(userId, itemid, cookie);
            	}else {
            		$("#errorMsg").text(data.errorMsg);
            	}
            },
            error: function(a, b) {
            	$("#errorMsg").text("支付宝账号错误，请重新填写！");
            }
        });
    });
});
function saveStatus() {
    var type = $(".nav li.active").data("name");
    sessionStorage.setItem("type", type);
}
function addRechargeLogToDB(userId, itemid, cookie) {
	$.ajax({
        url: "/hfcz/addAlipayWriteSuccessLog",
        type: "post",
        dataType: "json",
        data: {
            "userId": userId,
            "cookie": cookie
        },
        success: function(data) {
        	if(data.result) {
        		saveStatus();
        		goToTaobaoRecharge(userId, itemid, cookie);
        	}else {
        		$("#errorMsg").text("系统异常，请联系客服人员");
        	}
        },
        error: function() {
        	$("#errorMsg").text("支付宝账号错误，请重新填写！");
        }
    });
}

function goToTaobaoRecharge(userId, itemid, cookie) {
	$.ajax({
        url: "/hfcz/goToTaobaoRecharge",
        type: "post",
        dataType: "json",
        data: {
            "userId": userId,
            "itemId": itemid,
            "cookie": cookie
        },
        success: function(data) {
        	if(data.result) {
        		jumpToAPP("taofen8-master://bl?id=" 
        				+ encodeURIComponent("http://m.taofen8.com/item/"+itemid+"?f="+f+"&sid=null") 
        				+ "&mobilePage="+ f +"&p="+ itemid +",,yes,"
        				+ encodeURIComponent("http://m.taofen8.com/item2/"+itemid+"?f="+f+"&sid=null")+",");
        	}else {
        		$("#errorMsg").text("系统异常，请联系客服人员");
        	}
        },
        error: function() {
        	$("#errorMsg").text("跳转淘宝充值页面异常，请联系客服人员");
        }
    });
}
</script>
<script>
//google analytics
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-75777879-12', 'auto');
ga('send', 'pageview');
</script>
</body>
</html>
