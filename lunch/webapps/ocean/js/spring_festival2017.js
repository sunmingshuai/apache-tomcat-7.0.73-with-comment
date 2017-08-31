$(function() {
    var obj = new pageObj();
    obj.init();
});

function pageObj() {
    this.env = new Env();

    this.userId = $('#userId').val() || '0'; //用户id
    this.stage = +$('#stage').val() || 1; //活动阶段1: 1月25日-2月3日, 活动阶段2: 2月4日-2月11日
    this.lastLotteryDay = $('#lastLotteryDay').val() === 'yes'; //活动阶段1最后一天
    this.lotteryCount = +$('#lotteryCount').val() || 0; //抽奖次数
    this.isLotteryUsed = $('#isLotteryUsed').val() === 'yes'; //当天是否已抽奖
    this.hasGetBag = $('#hasGetBag').val() === 'yes'; //是否已领取福袋

    this.hasLogin = this.userId !== '0'; //是否登录
    this.needLanternFlow = false; //是否需要灯笼动画效果
    this.lanternList = $('.lantern-list li'); //灯笼列表
    this.target = -1; //中奖结果
    this.awards = ['<span>8</span>集分宝', '<span>10积分</span>', '<span>888集分宝</span>', '<span>8集分宝</span>', '<span>100%中奖</span>', '<span>18集分宝</span>', '<span>888集分宝</span>', '<span>1集分宝</span>'];
}

// 页面初始化
pageObj.prototype.init = function() {
    var self = this;
    // 检测系统环境
    self.env.detectAll();
    // 初始化插件
    self.initPlugins();
    //初始化页面
    self.initPage();
    // 绑定页面事件
    self.bindEvent();
};
// 初始化页面
pageObj.prototype.initPage = function() {
    var self = this,
        count = self.lotteryCount;
    // 非客户端打开默认唤起
    if (!self.env.tf8App.isTf8App) {
        self.awakeApp('taofen8-master://wl/?id=' + encodeURIComponent(window.location.href) + '&p=金鸡送福');
    }
    // 第二阶段展示
    if (self.stage === 2) {
        if (self.hasGetBag) {
            $('#luckyBagBtn').addClass('inactive');
        } else {
            $('#luckyBagBtn').addClass('active');
        }
    }
    // 点亮灯笼
    if (self.hasLogin && count > 0) {
        $('.lantern-count').text(count);
        while (count--) {
            $(self.lanternList[count]).addClass('active');
        }
    }
};
// 初始化插件
pageObj.prototype.initPlugins = function() {
    var self = this;
    // 抽奖插件
    if (self.stage === 1) {
        lottery.lottery({
            selector: '#turnplate',
            width: 3,
            height: 3,
            index: 0, // 初始位置
            initSpeed: 500, // 初始转动速度
            // upStep:       50,   // 加速滚动步长
            upMax: 100, // 速度上限
            downStep: 100, // 减速滚动步长
            // downMax:      500,  // 减速上限
            waiting: 2000, // 匀速转动时长
            beforeRoll: function() { // 重写滚动前事件：beforeRoll
                if (!self.env.tf8App.isTf8App) {
                    self.openDownloadTip();
                    return false;
                } else if (!self.hasLogin) {
                    self.loginByWap();
                    return false;
                } else if (self.isLotteryUsed) {
                    if (self.lastLotteryDay) {
                        $('#tipModal3 .more').hide();
                    }
                    self.openModal('#tipModal3');
                    return false;
                }
                $('#lotteryBtn img').hide().eq(1).show();
                return true;
            },
            aim: function() {
                var lotteryContext = this;

                $.ajax({
                    type: "get",
                    url: "http://ocean.taofen8.com/springFestival2017/actSignByUser",
                    data: {
                        userId: self.userId
                    },
                    dataType: 'json',
                    success: function(data) {
                        self.isLotteryUsed = true;
                        if (data.success) {
                            lotteryContext.options.target = self.target = data.target;
                        } else {
                            lotteryContext.options.target = self.target = -1;
                            if (data.isLotteryUsed === 'yes') {
                                if (self.lastLotteryDay) {
                                    $('#tipModal3 .more').hide();
                                }
                                self.openModal('#tipModal3');
                            } else {
                                $('#errorModal .msg').text(data.errorText);
                                self.openModal('#errorModal');
                            }
                        }
                    },
                    error: function() {
                        lotteryContext.options.target = self.target = -1;
                        $('#errorModal .msg').text('网络出错！请稍后再试');
                        self.openModal('#errorModal');
                    }
                });
            },
            successCb: function() {
                $('#tipModal4 .lantern-count').text(++self.lotteryCount);
                $('.lantern-modal .result').html(self.awards[self.target]);
                // 需要灯笼动画
                self.needLanternFlow = true;
                if (self.lastLotteryDay) {
                    $('#tipModal4 .modal-body').toggleClass('active inactive');
                }
                self.openModal('#tipModal4');

                self.isLotteryUsed = true;
            }
        });
    }
    // swiper插件
    var index = $("#dateNav li.active").index(),
        order = (index - 2 < 0 ? 0 : index - 2),
        navSwiper = new Swiper('#dateNav', {
            initialSlide: 0,
            freeMode: true,
            slidesPerView: 'auto',
            resistanceRatio: 0,
            freeModeMomentumBounce: false,
        });

    navSwiper.slideTo && navSwiper.slideTo(order, 500);
};
// 绑定页面事件
pageObj.prototype.bindEvent = function() {
    var self = this;
    if (self.stage === 2 && !self.hasGetBag) {
        // 页面滚动
        $(window).on('scroll', $.proxy(self.scrollWindow, self));
        setTimeout(function() {
            // 刷新时手动触发滚动事件
            $(window).trigger('scroll');
        }, 400);
    }
    // 查看活动说明
    $(".rule-btn").on('click', function() {
        self.openModal('#tipModal1');
    });
    // 复制红包密令
    $(".group-wrap").on('click', 'li.started .copy-btn', $.proxy(self.copyHbml, self));
    // 切换不同日期红包密令场次
    $(".date").on('click', self.switchHbmlDate);
    // 点击灯笼区域
    $(".lantern-list").on('click', function() {
        self.openModal('#tipModal2');
    });
    // 立即领取福袋
    $("#luckyBagWrap").on('click', '#luckyBagBtn.active', $.proxy(self.getLuckyBag, self));
    // 查看红包
    $("#hbBtn").on('click', function() {
        window.location.href = 'http://ocean.taofen8.com/hongbao/myHongbao?userId=' + self.userId;
    });
    // 查看积分
    $("#jfBtn").on('click', function() {
        window.location.href = 'http://ocean.taofen8.com/jifen/jifenIncome?userId=' + self.userId;
    });
    // 下载淘粉吧客户端
    $("#downloadBtn").on('click', function() {
        self.downloadApp('taofen8-master://wl/?id=' + encodeURIComponent(window.location.href) + '&p=金鸡送福');
    });
    // 关闭遮挡层
    $("#contentWrap").on('click', '#backdrop,.modal-close', $.proxy(self.closeModal, self));
};
// 监听滚动事件
pageObj.prototype.scrollWindow = function(e) {
    var self = this;
    var docScrollTop = $(document).scrollTop();
    var lanternOffsetTop = $('#luckyBagWrap').offset().top;

    if (docScrollTop > lanternOffsetTop) {
        $('#luckyBag').addClass('tada animated');
        $(window).unbind('click', self.scrollWindow);
    }
};
// 复制红包密令
pageObj.prototype.copyHbml = function(e) {
    var self = this,
        _this = $(e.target),
        _parent = _this.parent();

    if (!_this.hasClass('copied')) {
        if (!self.env.tf8App.isTf8App) {
            self.openDownloadTip();
            return;
        }
        self.awakeApp("clipboard://taofen8.com?text=" + _parent.find('.pwd').text());
        _this.remove();
        _parent.find('.copied').css({
            'position': 'relative',
            'visibility': 'visible'
        });
        $(".group-wrap").unbind('click', self.copyHbml);
    }
};
// 切换不同日期红包密令场次
pageObj.prototype.switchHbmlDate = function(e) {
    var _this = $(this),
        indexNo = _this.data("indexno");

    if (!_this.hasClass("active")) {
        $("#dateNav li.active").removeClass("active");
        _this.addClass("active");

        $(".group-wrap.active").removeClass("active");
        $('.group-wrap').eq(indexNo).addClass("active");
    }
};
// 领取福袋
pageObj.prototype.getLuckyBag = function(e) {
    var self = this,
        _this = $(e.target);

    if (!self.env.tf8App.isTf8App) {
        self.openDownloadTip();
        return;
    } else if (!self.hasLogin) {
        self.loginByWap();
        return;
    }

    _this.toggleClass('active inactive');

    $.ajax({
        type: "get",
        url: "http://ocean.taofen8.com/springFestival2017/getLuckyBag",
        data: {
            userId: self.userId
        },
        dataType: 'json',
        success: function(data) {
            self.hasGetBag = true;
            if (data.success) {
                var pattern = /(\d)+|([^\d])+/g;
                var result = data.result.match(pattern);

                $('#tipModal5 .award').html('您获得<span class="fs25">' + result[0] + '</span>' + result[1]);
                if (result[1].indexOf('积分') > -1) {
                    $('#hbBtn').hide();
                    $('#jfBtn').show();
                }
                self.openModal('#tipModal5');
            } else {
                if (data.hasGetBag === 'yes') {
                    $('#errorModal .msg').text('您已经领取过福袋了！');
                    self.openModal('#errorModal');

                } else {
                    $('#errorModal .msg').text(data.errorText);
                    self.openModal('#errorModal');
                }
            }
        },
        error: function() {
            _this.toggleClass('active inactive');
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
    // 开启灯笼动画效果
    if (self.needLanternFlow) {
        self.likeMoveRight();
    }
    $("#downloadTip").css({
        "-webkit-transform": "translateY(-100%)",
        "transform": "translateY(-100%)"
    });
    $("#backdrop").hide();
    $(".modal").hide();
};
//显示下载提示框
pageObj.prototype.openDownloadTip = function() {
    var self = this;
    self.awakeApp('taofen8-master://wl/?id=' + encodeURIComponent(window.location.href) + '&p=金鸡送福');
    setTimeout(function() {
        $("#backdrop").show();
        $("#downloadTip").css({
            "-webkit-transform": "translateY(0)",
            "transform": "translateY(0)"
        });
    }, 0);
};
//动画效果
pageObj.prototype.likeMoveRight = function(e) {
    var self = this;
    var latternObj = $('#latternObj'),
        startObj = $('#startPos'),
        endObj = $('#endPos');

    latternObj.css({ //起点
        "display": "block",
        "top": startObj.offset().top,
        "left": startObj.offset().left
    }).animate({ //终点
        "top": endObj.offset().top,
        "left": endObj.offset().left
    }, 600, function() {
        latternObj.hide();
        $('.lantern-count').text(self.lotteryCount);
        $(self.lanternList[self.lotteryCount - 1]).addClass('active');
        self.needLanternFlow = false;
    });
};

// 唤起淘粉吧客户端
pageObj.prototype.awakeApp = function(url) {
    var self = this;

    if (self.env.browser.isSafari && self.env.browser.version >= 9) {
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
pageObj.prototype.loginByWap = function(callbackUrl) {
    var self = this;

    callbackUrl = callbackUrl || window.location.href;

    if (callbackUrl.indexOf("productVersion") > -1) {
        window.location.href = "http://m.taofen8.com/s/login?callback=" + encodeURIComponent(callbackUrl);
    } else if (window.location.href.indexOf("productVersion") > -1) { // 在app中打开
        callbackUrl += callbackUrl.indexOf("?") > -1 ? "&productVersion=" : "?productVersion=";
        callbackUrl += self.getUrlParam('productVersion');

        window.location.href = "http://m.taofen8.com/s/login?callback=" + encodeURIComponent(callbackUrl);
    } else { // 在浏览器中打开
        var taobaoOauthUrl = "https://oauth.taobao.com/authorize?response_type=token&client_id=12450255&state=1212&scope=item&view=wap&redirect_uri=";
        var wapRedirectUrl = "http://m.taofen8.com/iphone/login.jsp";
        var realUrl = taobaoOauthUrl + wapRedirectUrl + "?retain=callback_" + callbackUrl;

        window.location.href = realUrl;
    }
};
// 获取url参数
pageObj.prototype.getUrlParam = function(key, url) {
    if (key === undefined) return null;

    url = url || window.location.href;

    var rParam = new RegExp("(\\?|&)" + key + "=([^&]*)(&|$)");
    var result = url.match(rParam);

    if (result) return decodeURIComponent(result[2]);

    return null;
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
};