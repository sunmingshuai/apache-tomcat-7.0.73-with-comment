$(function() {
    var obj = new pageObj();
    obj.init();
});

function pageObj() {
    this.userId = $('#userId').val() || '0'; //用户id
    this.hasLogin = this.userId !== '0'; //是否登录
    this.actUrl = $('#actUrl').val(); //项目地址
    this.loginUrl = $('#loginUrl').val(); //登录链接
    this.telephone = $('#telephone').val(); //默认手机号
    this.cardType = 0; //信用卡种类
    this.isTimerIntervalOn = false;
}

// 根据所选的卡种，跳转到民生银行相应的信用卡页面
function jump2Cmbc(cardType) {
	var applyUrl = "";
	if(cardType==1){
		applyUrl = "https://creditcard.cmbc.com.cn/online/mobile/index.aspx?tradeFrom=YX-HZFTB2&EnStr=08FEE5A822ADCD64B16F8651BAE8A0DC&jg=607000002&jgEnStr=CAED90A9C980710B5F33C75E7404F4F5";
	}else if(cardType==2){
		applyUrl = "https://creditcard.cmbc.com.cn/online/mobile/index.aspx?tradeFrom=YX-HZFTB4&EnStr=2E5E715B692155686538EE89A6944CD2&jg=607000002&jgEnStr=CAED90A9C980710B5F33C75E7404F4F5";
	}else if(cardType==3){
		applyUrl = "https://creditcard.cmbc.com.cn/online/mobile/index.aspx?tradeFrom=YX-HZFTB6&EnStr=4A472921B71153B89D0B406BC457F243&jg=607000002&jgEnStr=CAED90A9C980710B5F33C75E7404F4F5";
	}else if(cardType==4){
		applyUrl = "https://creditcard.cmbc.com.cn/online/mobile/index.aspx?tradeFrom=YX-HZFTB3&EnStr=BAB416E6464E8614F1F02A7C63BCCB6A&jg=607000002&jgEnStr=CAED90A9C980710B5F33C75E7404F4F5";
	}else if(cardType==5){
		applyUrl = "https://creditcard.cmbc.com.cn/online/mobile/index.aspx?tradeFrom=YX-HZFTB5&EnStr=DA68AA1C359831DA380809D5E3E77E11&jg=607000002&jgEnStr=CAED90A9C980710B5F33C75E7404F4F5";
	}
	window.location.href = applyUrl;
}

// 页面初始化
pageObj.prototype.init = function() {
    var self = this;
    // 绑定页面事件
    self.bindEvent();
};
// 绑定页面事件
pageObj.prototype.bindEvent = function() {
    var self = this;
    // 立即申请
    $(".apply-btn").on('click', $.proxy(self.applyCard, self));
    // 查看或者关闭详细介绍
    $(".detail-wrap").on('touchend', '.title>span', function(e) {
        $(e.target).closest('.detail-wrap').toggleClass('active');
    });
    // 监听输入框改变事件
    $("input").on("input", function() {
        var phoneNo = $("#phoneNo").val(),
            verifyCode = $("#verifyCode").val(),
            $submitBtn = $("#submitBtn");

        if (self.isEmpty(phoneNo) || self.isEmpty(verifyCode)) {
            $submitBtn.removeClass("active");
        } else {
            $submitBtn.hasClass("active") || $submitBtn.addClass("active");
        }
    });
    // 获取验证码
    $("#verifyCodeBtn").on("click", $.proxy(self.getVerifyCode, self));
    // 提交手机号
    $("#submitBtn").on("click", $.proxy(self.submitTelphone, self));
    // 关闭遮挡层
    $("#container").on('click', '#backdrop,.modal-close', $.proxy(self.closeModal, self));
    // 弹框后阻止页面滑动
    $('#backdrop, .modal').on('touchmove', function(e) {
        e.preventDefault();
        return false;
    });
};
// 立即申请信用卡
pageObj.prototype.applyCard = function(e) {
    var self = this;

	if (!self.hasLogin) {
		self.loginByWap(self.loginUrl);
		return ;
	}
    
    self.cardType = $(e.target).data('type');

    if (self.isMobile(self.telephone)) {
        $("#phoneNo").val(self.telephone);
    }
    
    var needPopup = $("#needPopup").val();
	if ('true' == needPopup) {
		self.openModal('#telephoneModal');
	} else {
		jump2Cmbc(self.cardType);
	}
};
// 获取验证码
pageObj.prototype.getVerifyCode = function(e) {
    var self = this,
        _this = null,
        phoneNo = '';

    if (self.isTimerIntervalOn) {
        return;
    }
    _this = $(e.target);
    phoneNo = $.trim($("#phoneNo").val());

    if (self.isEmpty(phoneNo)) {
        $("#phoneNoMsg").text("请输入手机号码");
        return;
    } else if (!self.isMobile(phoneNo)) {
        $("#phoneNoMsg").text("手机号格式错误");
        return;
    } else {
        $("#phoneNoMsg").text("");
    }

    // 重新获取验证码倒计时
    (function() {
        var i = 60, // 60s
            timerInterval;

        self.isTimerIntervalOn = true;
        _this.text(i-- + "s").removeClass('active');

        timerInterval = setInterval(function() {
            if (i === 0) {
                clearInterval(timerInterval);
                _this.text("获取验证码")
                    .addClass("active");
                self.isTimerIntervalOn = false;
                return;
            }
            _this.text(i-- + "s");
        }, 1000);
    })();

    //服务器发送短信验证码
    $.ajax({
        url: "/cmbc/creditcard/sendVerifyCode",
        type: "POST",
        dataType: "json",
        data: {
            "phoneNo": phoneNo
        }
    });
};
// 提交手机号
pageObj.prototype.submitTelphone = function(e) {
    var self = this;

    var _this = $(e.target),
        phoneNo = $.trim($("#phoneNo").val()),
        verifyCode = $.trim($("#verifyCode").val()),
        errorFlag = false;
    
    if(!_this.hasClass('active')){
    	return false;
    }

    if (self.isEmpty(phoneNo)) {
        $("#phoneNoMsg").text("请输入手机号码");
        errorFlag = true;
    } else if (!self.isMobile(phoneNo)) {
        $("#phoneNoMsg").text("手机号格式错误");
        errorFlag = true;
    } else {
        $("#phoneNoMsg").text("");
    }

    if (self.isEmpty(verifyCode)) {
        $("#verifyCodeMsg").text("请输入验证码！");
        errorFlag = true;
    } else {
        $("#verifyCodeMsg").text("");
    }

    if (errorFlag) {
        _this.removeClass("active");
        return;
    }

    $.ajax({
        url: "/cmbc/creditcard/submitTelphone",
        type: "POST",
        dataType: "json",
        data: {
            "phoneNo": phoneNo,
            "verifyCode": verifyCode,
            "type": self.cardType,
            "userId":self.userId
        },
        success: function(data) {
        	if(data && data.success){
        		$("#needPopup").val("false");
        		self.closeModal('#telephoneModal');
        		jump2Cmbc(self.cardType);
        	}else{
        		var message = data.message;
        		$("#verifyCodeMsg").text(message);
                _this.removeClass("active");
        	}
        },
        error: function() {
            $("#verifyCodeMsg").text("验证码错误，请重新输入！");
            _this.removeClass("active");
        }
    });
};
//显示模态框
pageObj.prototype.openModal = function(sel) {
    $("#backdrop").show();
    $(sel).show();
};
//关闭模态框
pageObj.prototype.closeModal = function() {
    var self = this;
    $("#backdrop").hide();
    $(".modal").hide();
};
//判断手机号码
pageObj.prototype.isMobile = function(str) {
    return (/^(1\d{10})$/.test(str));
};
//判断为空
pageObj.prototype.isEmpty = function(str) {
    if (str === undefined || $.trim(str) === "" || str === null) {
        return true;
    }
    return false;
};
//移动端登录
pageObj.prototype.loginByWap = function(loginUrl) {
    var self = this;
    window.location.href = loginUrl;
};