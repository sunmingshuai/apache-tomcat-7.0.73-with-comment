$(function(){
    var obj = new pageObj();
    obj.init();
});
function pageObj() {
    this.env = new Env();
    this.inviterName=$("#inviterName").val(); //邀请者淘粉吧昵称
    this.userId = $('#userId').val() || '0'; //用户id
    this.inviteeId = $('#inviteeId').val() || '0'; //openId
    this.beautyPercent=$("#beautyPercent").val()||"";//美颜百分比
    this.checkUp=parseInt($("#checkUp").val()); //是否鉴定过
    this.increaseScoreUrl = $('#increaseScoreUrl').val();
	//活动结束
	this.isOver = $('#isOver').val() || '';
    this.link = $('#link').val();
};
// 页面初始化
pageObj.prototype.init = function() {
    var self = this;
    // 检测系统环境
    self.env.detectAll();
    //初始化页面
    self.initPage();
    // 绑定页面事件
    self.bindEvent();
    //活动结束弹窗
	if(self.isOver == '100') {
		self.openModal('.modal-over');
		return;
	}
};
// 初始化页面
pageObj.prototype.initPage = function() {
    var self = this;
    if (self.checkUp) {//1有过
        $("#invited_success").show();
    }else{
        $("#invited_content h3 span").html(self.beautyPercent);
        $("#invited_content .reminder span").html(self.inviterName);
        $("#invited_content").show();
    }
    if (self.env.os.isAndroid) {
        $('#browser').html('浏览器');
    }
};

pageObj.prototype.bindEvent = function(){

    var self = this;
    
    //活动结束 下面就不走了
	if(self.isOver == '100') {
		return;
	}
    // 点击鉴定颜值
    $("#getFace").on('click', function() {
        self.getFace();
    });
    // 点击参加
    $("#invited_success .btn").on('click', function() {
        self.openDownloadTip();

    });

    // 点击下载淘粉吧客户端
    $(".downloadBtn,#tipModal").on('click', function() {
        self.downloadApp('taofen8-master://wl/?id=' + self.link);

    });

    // 关闭遮挡层
    $("#container").on('click', '#backdrop,.modal-close,.modal-close-d', $.proxy(self.closeModal, self));
};

pageObj.prototype.getFace = function(){
    var self = this;
    $.ajax({
               url: self.increaseScoreUrl,
               type: 'post',
               data: {
                   userId: self.userId,
                   inviteeId:self.inviteeId
               },
               dataType: 'json',
               success: function(data) {
                   if (data.success) {
                       $("#invited_content").hide();
                       $("#invited_success").show();
                   } else {
                       alert(data.msg);
                   }
               },
               error: function() {
                   $('#errorModal .msg').text('网络出错！请稍后再试');
                   self.openModal('#errorModal');
               }
           });


};
//显示下载提示框
pageObj.prototype.openDownloadTip = function(){
    var self = this;
    if (self.env.thirdApp.isWeixin) {
        self.openModal('#downloadTipWx');
    } else {
        self.openModal("#downloadTip");
    }
};

//关闭模态框
pageObj.prototype.closeModal = function() {
    $("#backdrop").hide();
    $(".modal").hide();
};

//显示模态框
pageObj.prototype.openModal = function(sel) {
    $("#backdrop").show();
    $(sel).show();
};

// 唤起淘粉吧客户端
pageObj.prototype.awakeApp = function(url) {
    var self = this;

    if (self.env.browser.isSafari && self.env.browser.version >= 9 || self.env.browser.isChrome) {
        window.location.href = url;
    } else {
        $(document.body).append('<iframe src="' + url + '" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
    }
};



// 下载淘粉吧客户端
pageObj.prototype.downloadApp = function(url) {
    var self = this,
        jumpUrl = '';

    if (self.env.thirdApp.isWeixin) {
        jumpUrl = "http://a.app.qq.com/o/simple.jsp?pkgname=com.leixun.taofen8";
    } else {
        // 先尝试唤起淘粉吧app
        self.awakeApp(url || 'taofen8-master://tj/?id=0');

        if (self.env.os.isAndroid) {
            jumpUrl = "http://m.taofen8.com/download.jsp";
        } else if (self.env.os.isIOS) {
            jumpUrl = "http://itunes.apple.com/us/app/tao-fen-ba/id527012586?ls=1&mt=8";
        } else if (self.env.os.isWindowsPhone) {
            jumpUrl = "http://www.windowsphone.com/zh-cn/store/app/%E6%B7%98%E7%B2%89%E5%90%A7/23861cd8-a7d3-40f2-b140-5cf116964641";
        }
    }
    // 必须大于1秒，否则不会去唤起app，而直接跳到app下载页
    setTimeout(function() {
        window.location.href = jumpUrl;
    }, 1001);
};


// 系统环境
function Env() {
    this.os = {};
    this.thirdApp = {};
    this.tf8App = {};
    this.browser = {};
}
// 检测系统类型
Env.prototype.detectOs = function(ua) {
    var self = this;
    var result = [];

    if (result = ua.match(/Windows\sPhone\s(?:OS\s)?([\d\.]+)/)) {
        self.os = {
            name: "Windows Phone",
            isWindowsPhone: true,
            version: result[1]
        };
    } else if (result = ua.match(/Android[\s\/]([\d\.]+)/)) {
        self.os = {
            name: "Android",
            isAndroid: true,
            version: result[1]
        };
    } else if (result = ua.match(/(iPhone|iPad|iPod)/)) {
        var name = result[1];
        if (result = ua.match(/OS ([\d_\.]+) like Mac OS X/)) {
            self.os = {
                name: name,
                isIPhone: "iPhone" === name || "iPod" === name,
                isIPad: "iPad" === name,
                isIOS: true,
                version: result[1].split("_").join(".")
            }
        }
    } else {
        self.os = {
            name: "unknown",
            version: '0'
        };
    }
};
// 检测第三方APP
Env.prototype.detectThirdApp = function(ua) {
    var self = this;

    self.thirdApp.isWeixin = !!ua.match(/MicroMessenger/i);
};
// 检测淘粉吧APP
Env.prototype.detectTf8App = function(ua) {
    var self = this;

    self.tf8App.isTf8App = !!ua.match(/taofen8/i);
};
// 检测浏览器类型
Env.prototype.detectBrowser = function(ua) {
    var self = this;
    var result = [];

    if (result = ua.match(/(?:UCWEB|UCBrowser\/)([\d\.]+)/)) {
        self.browser = {
            name: "UC",
            isUC: true,
            version: result[1]
        };
    } else if (result = ua.match(/MQQBrowser\/([\d\.]+)/)) {
        self.browser = {
            name: "QQ",
            isQQ: true,
            version: result[1]
        };
    } else if (result = ua.match(/(?:Firefox|FxiOS)\/([\d\.]+)/)) {
        self.browser = {
            name: "Firefox",
            isFirefox: true,
            version: result[1]
        };
    } else if ((result = ua.match(/MSIE\s([\d\.]+)/)) || (result = ua.match(/IEMobile\/([\d\.]+)/))) {
        self.browser = {
            version: result[1]
        };
        if (ua.match(/IEMobile/)) {
            self.browser.name = "IEMobile";
            self.browser.isIEMobile = true;
        } else {
            self.browser.name = "IE";
            self.browser.isIE = true;
        }
        if (ua.match(/Android|iPhone/)) {
            self.browser.isIELikeWebkit = true;
        }
    } else if (result = ua.match(/(?:Chrome|CriOS)\/([\d\.]+)/)) {
        self.browser = {
            name: "Chrome",
            isChrome: true,
            version: result[1]
        };
        if (ua.match(/Version\/[\d+\.]+\s*Chrome/)) {
            self.browser.name = "Chrome Webview";
            self.browser.isWebview = true;
        }
    } else if (ua.match(/Safari/) && (result = ua.match(/Android[\s\/]([\d\.]+)/))) {
        self.browser = {
            name: "Android",
            isAndroid: true,
            version: result[1]
        };
    } else if (ua.match(/iPhone|iPad|iPod/)) {
        if (ua.match(/Safari/) && (result = ua.match(/Version\/([\d\.]+)/))) {
            self.browser = {
                name: "Safari",
                isSafari: true,
                version: result[1]
            };
        } else if (result = ua.match(/OS ([\d_\.]+) like Mac OS X/)) {
            self.browser = {
                name: "iOS Webview",
                isWebview: true,
                version: result[1].split("_").join(".")
            };
        }
    } else {
        self.browser = {
            name: "unknown",
            version: '0'
        };
    }
};
// 检测所有项目
Env.prototype.detectAll = function() {
    var self = this;
    var ua = window.navigator.userAgent;

    self.detectOs(ua);
    self.detectThirdApp(ua);
    self.detectTf8App(ua);
    self.detectBrowser(ua);
}