$(function(){
	$("img.lazyload").lazyload({failurelimit:8, effect:"fadeIn", effectspeed:1000, threshold:200, event:"scroll"});
	
	//弹框垂直居中
	$('.yqyj_tankuang').css('top', ($(window).height()-$('.yqyj_tankuang').outerHeight())/2-0.25*parseFloat(window.document.documentElement.style.fontSize));	

	//点击"邀请好友领红包"按钮  	
	$("#JS_yqButton").on('click', function(){
	    shareButtonClick();
	});
	//下载淘粉吧客户端
	$("#JS_download").on('click', function(){
	    jumpToDownload();
	});
	//关闭普通弹出框
	$("#JS_download>.close,#JS_close,#JS_tk_opacity,#JS_tk_download>.close,#JS_tk_over>.close,#over_close").on('click', function(){
        closeBox();
    });
	//关闭分享弹出框
	$("#JS_tk_share>.close,#JS_tk_share_opacity").on('click', function(){
	    closeShareBox();
	});

    //被邀请者用户名如果是手机号码，隐藏中间4位数字
    hideIphoneNub();
    
    tips();
});

//控制提醒
function tips(){
	var route = $('#route').val();
	if(route=="fenxiang"){
		//分享后回调的情况
		var userId = getCookie('first_share_flag');
		if(userId == null || userId == ""){
			setCookie('first_share_flag',$('#userId').val(),3650);
			//firstShareSucceed();
		}
	}
}

function setCookie(c_name, value, expiredays) {
	var exdate = new Date()
	exdate.setDate(exdate.getDate() + expiredays)
	document.cookie = c_name + "=" + escape(value)
			+ ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
}

function getCookie(c_name) {
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=")
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1
			c_end = document.cookie.indexOf(";", c_start)
			if (c_end == -1)
				c_end = document.cookie.length
			return unescape(document.cookie.substring(c_start, c_end))
		}
	}
	return ""
}


//手机号省略中间四位数
function hideIphoneNub(){
    $("#JS_record_list").find('.record_list_dd').each(function() {
        var name = $(this).find(".userName");
        if(isMobileNumber(name.text())){
            var replaceNub = name.text().substr(0,3);
                replaceNub += "****";
                replaceNub += name.text().substr(7);
            name.html(replaceNub);
        }
    });
}

//点击"邀请好友领红包"按钮
function shareButtonClick(){
	var ua = navigator.userAgent;
	//浏览器打开
	if(ua.indexOf("Taofen8")<0  && "1"!=GetQueryString("isApp")){//
		//弹出框 提示下载	
		$("#JS_tk_download").show();
		$("#JS_tk_opacity").show();		
	}else{
		//app内打开
		var userId = $('#userId').val();
		var loginUrl = $('#loginUrl').val();
		if(!userId){
			window.location.href=loginUrl;
		}else{
			shareYq();
		}
	}
}

function shareYq() {
	var callbackUrl = $('#callbackUrl').val();
	var shareDialogTitle = encodeURIComponent($('#shareDialogTitle').val());
	var shareDialogDescription = encodeURIComponent($('#shareDialogDescription').val());
	var shareDescription = encodeURIComponent($('#shareDescription').val());
	var shareUrl = encodeURIComponent($('#shareUrl').val());
	var shareImageUrl = encodeURIComponent($('#shareImageUrl').val());
	var shareTitle = encodeURIComponent($('#shareTitle').val());
	var showFlag = $('#showFlag').val();
	
    var shareUrl = 'share://taofen8.com?callBackUrl='+callbackUrl+
            '&code=sms&shareDialogTitle='+shareDialogTitle +'&shareDescription='+shareDescription+
            '&shareUrl='+shareUrl+'&shareImageUrl='+shareImageUrl+
            '&shareTitle='+shareTitle+'&showFlag=' + showFlag + '&shareDialogDescription=' + shareDialogDescription;
 
    $(document.body).append('<iframe src="'+shareUrl+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
}

//获取url参数对应值 
function GetQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}

//下载淘粉吧客户端
function jumpToDownload() {
    var jumpUrl;
    var ua = navigator.userAgent;
    if(ua.indexOf("MicroMessenger") > 0) {
        jumpUrl="http://a.app.qq.com/o/simple.jsp?pkgname=com.leixun.taofen8";              
    }else{
        var url = 'taofen8-master://';
        $(document.body).append('<iframe src="'+url+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
         
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
    document.location = jumpUrl;
}


//关闭弹出框
function closeBox(){
	$("#JS_tk_opacity").hide();
	$(".closeTK").hide();
}

//关闭分享弹出框
function closeShareBox(){
	$("#JS_tk_share").addClass("closeAnimation").css("bottom","-4.84rem");
	$("#JS_tk_share_opacity").hide();
	setTimeout(function(){
		$("#JS_tk_share").removeClass("animation").removeClass("closeAnimation");
	}, 1000);
}

//被邀请者 领取红包
var isTimerIntervalOn;
$(function(){
	isTimerIntervalOn = false;
	$("#yqInviteeForm input").each(function(index, domEle) {
		domEle.addEventListener("input", function() {
			$("#numberError").hide().html("");
			//输入框
			var phoneNo = $.trim($("#phoneNumber").val());
			var verifyCode = $.trim($("#VerificationCode").val());
			//按钮
			var verifyBtn = $("#getYzm");
			var submitRed = $("#JS_Submit_red");
			var submitGrey = $("#JS_Submit_grey");
			
			//获取验证码按钮样式
			if(isMobileNumber(phoneNo) && !isTimerIntervalOn) {
				verifyBtn.removeClass("yzm-button-grey").addClass("yzm-button-red");
			} else {
				verifyBtn.removeClass("yzm-button-red").addClass("yzm-button-grey");
			}
			//领取红包按钮样式
			if(isMobileNumber(phoneNo) && isZ0Integer(verifyCode)) {
				submitRed.show();
				submitGrey.hide();
			} else {
				submitRed.hide();
				submitGrey.show();
			}
		}, false);
	});
    
	var count = 0;//控制重复点击
    //获取验证码按钮  绑定click
    if($("#getYzm").length>0) {
    	$("#getYzm").on('click', function() {
    		if(isTimerIntervalOn) return;
    		var _this = $(this);
    		var phoneNo = $.trim($("#phoneNumber").val());
    		if (!isMobileNumber(phoneNo)) {
    			$("#numberError").show().html("请输入正确的手机号！");
    			return;
    		} else {
    			$("#numberError").hide().html("");
    		}
    		if(count >= 1){
				return;
			}
			count = 1;
    		//服务器发送短信验证码 toDo
    		$.ajax({
    			url: "/invite/getMobileCode",
    			type: "POST",
    			dataType: "json",
    			data: $("#yqInviteeForm").serialize(),
    			success: function(data) {
    				count  = 0;
    				// 已注册提示
    				if(data.oldUser){
    					oldUserTK();// 被邀请者为老用户
    					$('.lq_hb_k_cg').parent().hide();
    				}
    				// 验证码倒计时
    				if(!data.oldUser){
    					countDown();
    				}
    				if(!data.success){
    					$("#numberError").show().html(data.message);
    				}
    			},
    			error: function() {
    				countDown();
    				$("#numberError").show().html("网络异常");
    				$("#JS_Submit_red").hide();
    				$("#JS_Submit_grey").show();
    			}
    		});
        });
    }
    
    if($("#JS_Submit_grey").length>0) {
    	$("#JS_Submit_grey").on('click', function() {
    		var phoneNo = $.trim($("#phoneNumber").val());
			var verifyCode = $.trim($("#VerificationCode").val());
    		if (!isMobileNumber(phoneNo)) {
    			$("#numberError").show().html("请输入正确的手机号！");
    			return;
    		}
			
    		if (!isZ0Integer(verifyCode)) {
    			$("#numberError").show().html("请输入正确的验证码！");
    			return;
    		}
    	});
    }
    
    if($("#JS_Submit_red").length>0) {
    	$("#JS_Submit_red").on('click', function() {
    		var phoneNo = $.trim($("#phoneNumber").val());
			var verifyCode = $.trim($("#VerificationCode").val());

			if (!isMobileNumber(phoneNo)) {
    			$("#numberError").show().html("请输入正确的手机号！");
    			return;
    		}
			
    		if (!isZ0Integer(verifyCode)) {
    			$("#numberError").show().html("请输入正确的验证码！");
    			return;
    		}
    		
    		$.ajax({
    			url: "/invite/acquireHongbao",
    			type: "POST",
    			dataType: "json",
    			data: $("#yqInviteeForm").serialize(),
    			success: function(data) {
    				if(data.status == 0){
    					$("#numberError").show().html(data.message);
    				}else if(data.status == 1){
    					oldUserTK();// 被邀请者为老用户
    					$('.lq_hb_k_cg').parent().hide();
    					$('.lq_hb_k_lq').hide(0, function(){
    						$('body,html').animate({scrollTop:0}, 0);
    					});
    				}else if(data.status == 2){
    					// 成功用户
    					$('#cg_p').show();
    					$('.lq_hb_k_lq').hide();
    				}
    			},
    			error: function() {
    				$("#numberError").show().html("网络异常");
    				$("#JS_Submit_red").hide();
    				$("#JS_Submit_grey").show();
    			}
    		});
    	});
    }

});

//判断正整数或零
function isZ0Integer (str) {
    return (/^\d+$/.test(str));
}
//验证手机号码
function isMobileNumber(str) {
    return (/^(1\d{10})$/.test(str));
}


// 被邀请者页面JS
var storage = window.sessionStorage;
var curTapNo = '0';
$(function() {
	var itemHtml = null;
	var url = null;
	var cidArr = $('#swiper-wrapper').find('li');
	for(var i=0; i<cidArr.length; i++) {
		if(i==0) continue;
		url='/invite/today/best2/category-' + $.trim($(cidArr[i]).attr('cid')) + '/ajaxItem';
		$.ajax({async:false, url: url, success: function(reponseData) {
			if($.trim(reponseData) == '') {return;}
			itemHtml = jsonToHtml(JSON.parse(reponseData));
			$("#goods_rob" + i).html(itemHtml);
			$("img.lazyload").lazyload({failurelimit:8, effect:"fadeIn", effectspeed:1000, threshold:200, event:"scroll"});
        }});
	}
	
	var swiperHeightArr = new Array();
	var goodsSwiperWrapperLi = $('#goods-swiper-wrapper li');
	for(var i=0; i<goodsSwiperWrapperLi.length; i++) {
		swiperHeightArr[i] = goodsSwiperWrapperLi.eq(i).height();
	}
	$('#goods-swiper-wrapper').height(swiperHeightArr[0]);
	
    var swiper = new Swiper('.rob_menu', {
        freeMode : true,
        slidesPerView:'auto',
        resistanceRatio : 0,
        freeModeMomentumBounce:false,
    });

    var swiperGood = new Swiper('#goods_rob', {
        resistanceRatio : 0,
        freeModeMomentumBounce:false,
        onSlideChangeStart: function(swiperE) {
            curTapNo = swiperE.activeIndex;
            menuChange(curTapNo);
            $('#goods-swiper-wrapper').height(swiperHeightArr[curTapNo]);
            
            var docTopTempNo = storage.getItem('docTopTemp' + curTapNo);
            if(docTopTempNo) {
            	$('body,html').animate({scrollTop:docTopTempNo}, 0);
            }
            storage.setItem('curTapNoTemp',  curTapNo);
        },
        onSlideChangeEnd: function(swiperE) {
        },
    });

    $('.menu').click(function() {
        curTapNo = parseInt($(this).attr('tap'));
        swiperGood.slideTo(curTapNo, 300, true);
    });

    function menuChange(tapNo) {
        $('#swiper-wrapper').find(".light_li").removeClass("light_li");
        $('#swiper-wrapper').find(".light_li_span").removeClass("light_li").hide();
        $('.menu').eq(tapNo).addClass("light_li");
        $('.menu').eq(tapNo).find("span").attr("style","display:block").addClass("light_li_span");
    }
    
    var curTapNoTemp = storage.getItem('curTapNoTemp');
    if($.trim(curTapNoTemp)!='') {
        curTapNo = parseInt(curTapNoTemp);
        swiperGood.slideTo(curTapNo, 300, true);
    }
    storage.setItem('curTapNoTemp',  curTapNo);
    
    //被邀请者页面 导航栏固定
    if($("div").hasClass('rob_menu')) {
        //navLayoutTop = $('.rob_menu').offset().top;
        $(window).scroll(function() {
        	if(!navLayoutTop) return;
            docScrollTop = $(document).scrollTop();
            if(docScrollTop > navLayoutTop) {
                $(".rob_menu").css({'position':'fixed'});
            } else {
                $('.rob_menu').css({'position':'absolute'});
            }
            storage.setItem('docTopTemp' + curTapNo,  docScrollTop);
        });
    }
    
    function jsonToHtml(itemList) {
    	var html = '';

    	for(var i = 0; i < itemList.length; i++) {
    		var item = itemList[i];
    		if(item.ext1==0){
    			html += '<div class="goods_list" onclick="log_open('+item.pageItemId+')">';
    		}else{
    			html += '<div class="goods_list" onclick="viewDetail('+item.pageItemId+')">';
    		}
    		if(i < 4) {
    			html += '<p class="goods_list_img"><img src="' + item.pageItemImageUrl +'_320x320q75s150.jpg" class="w100"  /></p>';
    		} else {
    			html += '<p class="goods_list_img"><img class="lazyload w100" data-original="' + item.pageItemImageUrl + '_320x320q75s150.jpg" src="https://img.alicdn.com/imgextra/i4/169328611/TB27FHbepXXXXX3XpXXXXXXXXXX_!!169328611.png"  /></p>';
    		}
    		
    		html += '<div class="goods_list_right">';
    		html += '<p class="right_title fs14">';
    		if(item.ext2){
    			html +='<span>【'+item.ext2+'】</span>';
    		}
    		html += item.itemTitle + '</p>'
    		html += '<p class="right_price fs14">¥ ' + item.mobilePrice + '</p>';
    		html += '<div class="right_reduction fontSize16"><span class="fs14">返利</span>&nbsp;' + item.mobileFanliAmount + ' </div>';
    		if(item.ext1==0){
    			 html += '<a href="javascript:void(0)" class="now_rob now_rob_not fs14" onclick="log_open('+item.pageItemId+')">抢光了</a>';
    		}else if(item.ext1==1){
    			html += '<a href="javascript:void(0)" class="now_rob fs14" onclick="viewDetail('+item.pageItemId+')">马上抢</a>';
    		}else{
    			html +='<a href="javascript:void(0)" class="now_rob fs14" style="color:#fd6700;background:#fdead3;width:1.85rem;" onclick="viewDetail('+item.pageItemId+')">即将售罄</a><div class="item_prompt fs14">'+item.ext3+'</div>';
    		}			
    		html += '</div></div>';
    	}
    	return html;
    }

});

//老用户注册失败提示
function oldUserTK(){
  $("#JS_oldUserTK").show();
  setTimeout(function(){
      $("#JS_oldUserTK").hide();
  }, 2000);
}

//重新获取验证码倒计时
function countDown() {
    var i = 60;
    var timerInterval;
    var _this = $("#getYzm");

    isTimerIntervalOn = true;
    _this.text("重新发送(" + i-- + ")").removeClass("yzm-button-red").addClass("yzm-button-grey");

    timerInterval = setInterval(function() {
        if (i === 0) {
            clearInterval(timerInterval);
            _this.text("获取验证码").removeClass("yzm-button-grey").addClass("yzm-button-red");
            isTimerIntervalOn = false;
            return;
        }
        _this.text("重新发送(" + i-- + ")");
    }, 1000);
};