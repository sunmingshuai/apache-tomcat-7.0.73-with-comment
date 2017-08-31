$(function() {
    var obj = new pageObj();
    obj.init();
});

function pageObj() {
    this.env = new Env();
    this.userId = $('#userId').val() || '0'; //用户id
    this.deviceId = $('#deviceId').val(); //deviceId
    this.lastLotteryDay = $('#lastLotteryDay').val() === 'true'; //活动最后一天

    this.hasChance = $('#hasChance').val() === 'true'; //有没有机会再换符号
    this.needShare = $('#needShare').val() === 'true'; //换符号需不需要分享

    this.target = $('#target').val() || -1; //中奖结果

    this.fromShared = $('#shared').val() === 'true'; //分享回来

    this.loginUrl = $('#loginUrl').val();
    this.changeSymbolUrl = $('#changeSymbolUrl').val();
    this.receiveRewardUrl = $('#receiveRewardUrl').val();

    /*----------------分享信息-----------------*/
    this.title = "我正在改写娘娘节红包面额中，逆天大红包离我不远啦，你也来看看吧~";
    this.desc = "我正在改写娘娘节红包面额中，逆天大红包离我不远啦，你也来看看吧~";
    this.link = $('#callBackUrl').val();
    this.imgUrl = "https://img.alicdn.com/imgextra/i3/43878262/TB27dVKg00opuFjSZFxXXaDNVXa_!!43878262.png";
    /********客户端分享部分参数*********/
    this.shareDialogTitle = "分享活动页，改写红包面额！";
    this.shareDialogDescription = "分享成功即可增加一次换取符号的机会，一天仅一次哦";
    this.showFlag = "1111";
    /********客户端页面按钮分享部分参数*********/
    this.code = "sms";
    this.callBackUrl = $('#shareUrl').val();

    this.hasLogin = this.userId !== '0'; //是否登录
    this.signList = $('.lottery-unit'); //符号列表
    this.flyObj = $('#flyObj'); // fly动画对象
    this.endObj = $('#endPos img'); // fly动画目标对象
    this.awards = [
        ['+', '<span class="pink">11元</span>红包组合', '11', '元红包组合'],
        ['-', '<span class="pink">0.01元</span>鼓励红包', '0.01', '元红包'],
        ['×', '<span class="pink">24元</span>红包组合', '24', '元红包组合'],
        ['÷', '<span class="pink">0.38元</span>红包', '0.38', '元红包'],
        ['.', '<span class="pink">3.8元</span>红包', '3.8', '元红包'],
        ['√', '<span class="pink">8元</span>红包组合', '8', '元红包组合']
    ];
}

// 页面初始化
pageObj.prototype.init = function() {
    var self = this;
    // 检测系统环境
    self.env.detectAll();
    //初始化页面
    self.initPage();
    // 初始化插件
    self.initPlugins();
    // 第一次分享回来后自动换符号
    if (self.fromShared && self.hasChance && self.needShare) {
        $('.lotteryBtn').trigger('click');
    }
    // 绑定页面事件
    self.bindEvent();
};
// 初始化页面
pageObj.prototype.initPage = function() {
    var self = this;

    // 外部浏览器打开默认唤起
    if (!self.env.tf8App.isTf8App && !self.env.thirdApp.isWeixin) {
        self.awakeApp('taofen8-master://wl/?id=' + self.link + '&p=逆天红包');
    }
    if (self.env.os.isAndroid) {
        $('#browser').html('浏览器');
    }
};
// 初始化插件
pageObj.prototype.initPlugins = function() {
    var self = this;

    // 抽奖插件
    lottery.lottery({
        selector: '#turnplate',
        width: 6,
        height: 1,
        initSpeed: 500, // 初始转动速度
        // upStep:       50,   // 加速滚动步长
        upMax: 100, // 速度上限
        downStep: 100, // 减速滚动步长
        // downMax:      500,  // 减速上限
        waiting: 1000, // 匀速转动时长
        beforeRoll: function() { // 重写滚动前事件：beforeRoll
            if (!self.env.tf8App.isTf8App) {
                if (self.env.thirdApp.isWeixin) {
                    self.openModal('#downloadTipWx');
                } else {
                    self.openDownloadTip();
                }
                return false;
            } else if (!self.hasLogin) {
                self.loginByWap(self.loginUrl);
                return false;
            } else if (!self.hasChance) {
                self.openModal('#tipModal');
                return false;
            } else if (self.needShare && !self.fromShared) {
                self.shareByPageBtn();
                return false;
            }
            $('.lottery-unit').removeClass('active');
            return true;
        },
        aim: function() {
            var lotteryContext = this;

            $.ajax({
                type: "get",
                url: self.changeSymbolUrl,
                data: {
                    userId: self.userId,
                    deviceId: self.deviceId
                },
                dataType: 'json',
                success: function(data) {
                    if (data.responseStatus === 302) {
                        window.location.replace(data.responseLocation);
                        return;
                    }
                    if (data.success) {
                        self.hasChance = data.hasChance;
                        self.needShare = data.needShare;
                        lotteryContext.options.target = self.target = data.target;
                    } else {
                        lotteryContext.options.target = self.target = -1;
                        if (data.hasChance === false) {
                            self.openModal('#tipModal');
                        } else {
                            $('#errorModal .msg').text(data.msg);
                            self.openModal('#errorModal');
                        }
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    lotteryContext.options.target = self.target = -1;
                    $('#errorModal .msg').text('网络出错！请稍后再试');
                    self.openModal('#errorModal');
                }
            });
        },
        successCb: function() {
            self.flyAction();

            $('.sign').html(self.awards[self.target][0]);
            $('.hb_text').html(self.awards[self.target][1]);
            $('#money').html(self.awards[self.target][2]);
            $('#moneyText').html(self.awards[self.target][3]);

            if (self.target === 1) {
                $('.poorLuck').hide();
            } else {
                $('.poorLuck').show();
            }

            $('#wrap1').hide();
            if (self.target === 2 || (self.lastLotteryDay && !self.hasChance)) {
                $('#wrap2').hide();
                $('#wrap3').show();
            } else {
                $('#wrap2').show();
            }
        }
    });
};
// 绑定页面事件
pageObj.prototype.bindEvent = function() {
    var self = this;
    // 弹框里点击确定领取
    $("#getHbModal").on('click', function() {
        self.getHb('modal');
    });
    // 点击领取红包
    $("#getHb").on('click', function() {
        self.getHb();
    });
    // 认命领取红包
    $("#fate").on('click', function() {
        $('#resultModal .modal-header span').html(self.awards[self.target][2]);
        self.openModal('#resultModal');
    });
    // 下载淘粉吧客户端
    $(".downloadBtn").on('click', function() {
        self.downloadApp('taofen8-master://wl/?id=' + self.link + '&p=逆天红包');
    });
    // 关闭遮挡层
    $("#container").on('click', '#backdrop,.modal-close', $.proxy(self.closeModal, self));
    // 弹框后阻止页面滑动
    $('#backdrop, .modal').on('touchmove', function(e) {
        e.preventDefault();
        return false;
    });
};
// 领取红包
pageObj.prototype.getHb = function(typeStr) {
    var self = this;

    $.ajax({
        type: "get",
        url: self.receiveRewardUrl,
        data: {
            userId: self.userId
        },
        dataType: 'json',
        success: function(data) {
            if (data.responseStatus === 302) {
                window.location.replace(data.responseLocation);
                return;
            }
            if (data.success) {
                if (typeStr === 'modal') {
                    $('#wrap2').hide();
                    self.closeModal();
                } else {
                    $('#wrap3').hide();
                }
                $('#wrap4').show();
            } else {
                $('#errorModal .msg').text(data.msg);
                self.openModal('#errorModal');
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $('#errorModal .msg').text('网络出错！请稍后再试');
            self.openModal('#errorModal');
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
    $("#downloadTip").css({
        "-webkit-transform": "translateY(-100%)",
        "transform": "translateY(-100%)"
    });
    $("#backdrop").hide();
    $(".modal").hide();
};
//显示下载提示框
pageObj.prototype.openDownloadTip = function() {
    $("#backdrop").show();
    $("#downloadTip").css({
        "-webkit-transform": "translateY(0)",
        "transform": "translateY(0)"
    });
};
//动画效果
pageObj.prototype.flyAction = function(e) {
    var self = this;
    var startObj = self.signList.eq(self.target);
    var flyObj = startObj.find('img').eq(0).clone();

    $('body').append(flyObj.attr('id', 'flyObj'));

    flyObj.css({ //起点
        "display": "block",
        "top": startObj.offset().top,
        "left": startObj.offset().left
    }).animate({ //终点
        "top": self.endObj.offset().top,
        "left": self.endObj.offset().left
    }, 600, function() {
        self.endObj.attr('src', flyObj.attr('src'));
        flyObj.remove();
    });
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
// 移动端登录
pageObj.prototype.loginByWap = function(loginUrl) {
    var self = this;
    window.location.href = loginUrl;
};
// 客户端中页面按钮分享
pageObj.prototype.shareByPageBtn = function() {
    var self = this;
    var shareUrl = 'share://taofen8.com?callBackUrl=' + self.callBackUrl +
        '&code=' + self.code + '&shareDialogTitle=' + self.shareDialogTitle + '&shareDialogDescription=' + self.shareDialogDescription + '&shareTitle=' + self.title + '&shareDescription=' + self.desc + '&shareUrl=' + self.link + '&shareImageUrl=' + self.imgUrl + '&showFlag=' + self.showFlag;

    $(document.body).append('<iframe src="' + shareUrl + '" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
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