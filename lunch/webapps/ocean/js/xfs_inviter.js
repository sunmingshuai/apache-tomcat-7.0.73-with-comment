/**
 * xuess
 * 颜值活动
 * 2017-03-14
 */
//vue 组件
var vueM = null;
//红包状态
var couponStatus = '';
var faceScore = 0; //分值
var level = 1; //会员等级
var userId = 0; //用户ID
var actSignUrl = '';
var acquireHbUrl = '';
//XXX
var bgClass = 'bg0';

$(function() {
	//红包状态
	couponStatus = $('#couponStatus').val();
	faceScore = $('#faceScore').val(); //分值
	level = $('#level').val(); //会员等级
	userId = +$('#userId').val() || 0; //用户ID
	actSignUrl = $('#actSignUrl').val();
	acquireHbUrl = $('#acquireHbUrl').val();
	//转成数组
	if(!!couponStatus) {
		couponStatus = JSON.parse(couponStatus)
	}

	var obj = new pageObj();
	obj.init();
});

function pageObj() {
	this.env = new Env();
	this.userId = userId || '0'; //用户id

	/*----------------分享信息-----------------*/
	this.title = "你的颜值这么高，送我点呗~";
	//描述不定
	this.desc = this.getShareStr(faceScore);
	this.imgUrl = "https://img.alicdn.com/imgextra/i1/2296013456/TB23G1jhR0lpuFjSszdXXcdxFXa_!!2296013456.jpg";

	this.link = $('#shareUrl').val();

	this.loginUrl = $('#loginUrl').val();
	//活动结束
	this.isOver = $('#isOver').val() || '';
	/********客户端分享部分参数*********/
	this.shareDialogTitle = "找好友来送你颜值";
	this.shareDialogDescription = "好友点击「一键赠送」即获个10颜值";
	//分享权限
	this.showFlag = "1111";
	/********客户端页面按钮分享部分参数*********/
	this.code = "sms";
	this.callBackUrl = $('#callBackUrl').val() || '';

}
/**
 * 根据红包数量取 分享标题
 * @param {Object} num
 */
pageObj.prototype.getShareStr = function(score) {
	var str = '还差一点就可以领大红包啦';
	score = +score;
	switch(true) {
		case score > 0 && score < 10:
			str = '还差一点就可以领大红包啦';
			break;
		case score >= 10 && score < 40:
			str = '我的颜值已经超过全国71%25的人了，还差一点就可以领大红包啦';
			break;
		case score >= 40 && score < 100:
			str = '我的颜值已经超过全国84%25的人了，还差一点就可以领大红包啦';
			break;
		case score >= 100 && score < 500:
			str = '我的颜值已经超过全国89%25的人了，厉害如我~';
			break;
		case score >= 500 && score < 800:
			str = '我的颜值已经超过全国95%25的人了，高处不胜寒~';
			break;
		case score >= 800:
			str = '我的颜值已经超过全国99%25的人了！我的传说一直在';
			break;
		default:
			str = '还差一点就可以领大红包啦';
			break;
	}
	return str;
};

// 页面初始化
pageObj.prototype.init = function() {
	var self = this;
	// 检测系统环境
	self.env.detectAll();
	//判断用什么背景
	bgClass = this.changeScore(level, faceScore);
	//vue 加载
	this.vueReader();
	// 绑定页面事件
	self.bindEvent();

	//活动结束弹窗
	if(self.isOver == '100') {
		self.openModal('.modal-over');
		return;
	}
	//初始化页面
	self.initPage();
//  self.downloadApp('wl/?id=' + self.link);//todo
};
// 初始化页面
pageObj.prototype.initPage = function() {
	//判断提示下载框
//	this.isWX();
	var self = this;
	//不在客户端和微信里，唤醒
	if(!self.env.tf8App.isTf8App && !self.env.thirdApp.isWeixin) {
		self.awakeApp('wl/?id=' + self.callBackUrl + '&p=' + encodeURIComponent('集颜值得红包'));
	}
};

// 绑定页面事件
pageObj.prototype.bindEvent = function() {
	var self = this;
	// 下载淘粉吧客户端
	$(".downloadBtn").on('click', function() {
		self.downloadApp('wl/?id=' + self.callBackUrl);
	});
	//活动结束 下面就不走了
	if(self.isOver == '100') {
		return;
	}
	// 弹框后阻止页面滑动
	$('#backdrop, .modal,.modal-down,.modal-sign,.modal-over').on('touchmove', function(e) {
		e.preventDefault();
		return false;
	});
	// 关闭遮挡层
	$("#container").on('click', '#backdrop,.modal-close', $.proxy(self.closeModal, self));
	//点击规则框
	$('.J-trigger').click(function() {
		if($('.J-trigger').find('i').hasClass('click')) {
			$('.J-trigger').find('i').removeClass('click');
			$('.rule-str').show();
		} else {
			$('.J-trigger').find('i').addClass('click');
			$('.rule-str').hide();
		}
	});

};
/**
 * 检测是否在微信，弹出下载框
 */
pageObj.prototype.isWX = function() {
	var self = this;

	// 外部浏览器打开默认唤起
	if(!self.env.tf8App.isTf8App && !self.env.thirdApp.isWeixin) {
		self.openModal('#downloadTip');
//		self.awakeApp('wl/?id=' + self.link + '&p=集颜值得红包');
	}
	//微信内 提示下载
	if(self.env.thirdApp.isWeixin) {
		self.openModal('#downloadTipWx');
	}

	if(self.env.os.isAndroid) {
		$('#browser').html('浏览器');
	}
};

/**
 * vue渲染
 */
pageObj.prototype.vueReader = function() {
	var self = this;

	vueM = new Vue({
		el: '#container',
		data: {
			bgClass: bgClass,
			faceScore: +faceScore,
			level: level,
			couponStatus: couponStatus,
			signPop: false,
			ruleShow: true,
			//是否是红包详情 区分弹窗的按钮，下载
			isCoupon: 0,
			popStrArr: ['', '', '', '', ''],
			popStr1: '',
			popStr2: '',
			popStr3: '',
			popStr4: '',
			popStr5: '',
			isSign: true
		},
		methods: {
			//			//隐藏展示规则
			//			triggerRule: function() {
			//				this.ruleShow = !this.ruleShow;
			//			},
			//领红包
			getCoupon: $.proxy(self.getCoupon, self),
			//去爆料页面
			toBL: $.proxy(self.toBL, self),
			//签到
			toSign: $.proxy(self.toSign, self),
			//邀请好友
			toFriend: $.proxy(self.toFriend, self),
			//分享
			toShare: $.proxy(self.toShare, self),
			//查看红包
			findCoupon: $.proxy(self.findCoupon, self),
			//已经领取
			getCouponOver: $.proxy(self.getCouponOver, self),
			//没有权限
			noPower: $.proxy(self.noPower, self),
			//下载
			downloadApp: $.proxy(self.downloadApp, self)

		}
	});
};
/**
 * 根据数值修改背景图
 */
pageObj.prototype.changeScore = function(level, score) {
	var bgClass = 'bg0';
	score = +score;
	if(level >= 4) {
		switch(true) {
			case score > 0 && score < 10:
				bgClass = 'bg0';
				break;
			case score >= 10 && score < 40:
				bgClass = 'bg1';
				break;
			case score >= 40 && score < 100:
				bgClass = 'bg2';
				break;
			case score >= 100 && score < 500:
				bgClass = 'bg3';
				break;
			case score >= 500 && score < 800:
				bgClass = 'bg4';
				break;
			case score >= 800:
				bgClass = 'bg5';
				break;
			default:
				bgClass = 'bg0';
				break;
		}
	} else if(level >= 2 && level < 4) {
		switch(true) {
			case score > 0 && score < 10:
				bgClass = 'bg0';
				break;
			case score >= 10 && score < 40:
				bgClass = 'bg1';
				break;
			case score >= 40 && score < 100:
				bgClass = 'bg2';
				break;
			case score >= 100 && score < 500:
				bgClass = 'bg3';
				break;
			case score >= 500:
				bgClass = 'bg4';
				break;
			default:
				bgClass = 'bg0';
				break;
		}
	} else if(level == 1) {
		switch(true) {
			case score > 0 && score < 10:
				bgClass = 'bg0';
				break;
			case score >= 10 && score < 40:
				bgClass = 'bg1';
				break;
			case score >= 40 && score < 100:
				bgClass = 'bg2';
				break;
			case score >= 100:
				bgClass = 'bg3';
				break;
			default:
				bgClass = 'bg0';
				break;
		}
	}
	return bgClass;
};
/**
 * 领取红包
 */
pageObj.prototype.getCoupon = function(type, money) {
	//		//显示弹窗
	//		self.openModal('.modal-sign');
	//		//已领取
	//		vueM.popStr3 = '该红包已经被您领走啦~';
	//		vueM.isCoupon = 3;
	var self = this;
	
	//不在客户端里，弹出下载
	if(!self.env.tf8App.isTf8App) {
		self.isWX();
		return;
	} else {
		//未登录 先登录
		if(userId == 0) {
			self.loginByWap(self.loginUrl);
			return;
		}
	}
	
	$.ajax({
		type: 'GET',
		url: acquireHbUrl,
		data: { 'userId': userId, "index": (+type - 1) },
		dataType: 'json',
		timeout: 10000,
		success: function(result) {
			if(!result || typeof result === 'undefined') {
				return;
			}
			//未登录
			if(result.responseStatus === 302) {
				window.location.replace(result.responseLocation);
				return;
			}

			if(result.success) {
				//已经解锁
				vueM.popStr1 = '';
				vueM.popStr2 = '';
				vueM.popStr3 = '恭喜您!';
				vueM.popStr4 = money + '元红包已发放到您的红包账户中！';
				vueM.popStr5 = '';
				vueM.isCoupon = 3;
				//显示弹窗
				self.openModal('.modal-sign');
				//状态修改
				vueM.couponStatus[type - 1] = 1;
			} else {
				if(result.noPower) {
					//待解锁
					vueM.popStr1 = '';
					vueM.popStr2 = '';
					vueM.popStr3 = '您还不能领取本红包，';
					vueM.popStr4 = '试试让好友送你颜值吧';
					vueM.popStr5 = '';
					vueM.isCoupon = 8;
					//显示弹窗
					self.openModal('.modal-sign');
				} else {
					alert(result.msg);
				}
			}
		}
	});

};
//已经领取
pageObj.prototype.getCouponOver = function() {
	var self = this;
	//不在客户端里，弹出下载
	if(!self.env.tf8App.isTf8App) {
		self.isWX();
		return;
	} else {
		//未登录 先登录
		if(userId == 0) {
			self.loginByWap(self.loginUrl);
			return;
		}
	}
	//已领取
	vueM.popStr1 = '';
	vueM.popStr2 = '';
	vueM.popStr3 = '';
	vueM.popStr4 = '';
	vueM.popStr5 = '该红包已经被您领走啦~';
	vueM.isCoupon = 3;
	//显示弹窗
	this.openModal('.modal-sign');
};
//没达到权限
pageObj.prototype.noPower = function() {
	var self = this;
	//不在客户端里，弹出下载
	if(!self.env.tf8App.isTf8App) {
		self.isWX();
		return;
	} else {
		//未登录 先登录
		if(userId == 0) {
			self.loginByWap(self.loginUrl);
			return;
		}
	}
	//待解锁
	vueM.popStr1 = '';
	vueM.popStr2 = '';
	vueM.popStr3 = '您还不能领取本红包，';
	vueM.popStr4 = '试试让好友送你颜值吧';
	vueM.popStr5 = '';
	vueM.isCoupon = 8;
	//显示弹窗
	this.openModal('.modal-sign');
};
//去爆料页面 判断端是否转到原生
pageObj.prototype.toBL = function() {
	//跳转链接
	var url = 'http://act.taofen8.com/baoliao/baoliao-40036?channel=huodong';
	var tf8_master = 'taofen8-master://sd/?id=40036';
	//	var tf8_master = 'taofen8-master://sd/?id=37319';
	var ua = navigator.userAgent;
	if(ua.indexOf("Taofen8") > 0) {
		document.location = tf8_master;
	} else {
		//webview
		window.location = url;
	}
};
//分享
pageObj.prototype.toShare = function() {
	//	//关闭弹窗，调起分享组件
	//	vueM.signPop = false;
	this.closeModal();
	var self = this;

	//不在客户端里，弹出下载
	if(!self.env.tf8App.isTf8App) {
		self.isWX();
		return;
	} else {
		//未登录 先登录
		if(userId == 0) {
			self.loginByWap(self.loginUrl);
			return;
		}
	}
	this.shareByPageBtn();

};
//签到
pageObj.prototype.toSign = function() {
	//是否已经签到
	if(!vueM.isSign) {
		return;
	}

	var self = this;

	//不在客户端里，弹出下载
	if(!self.env.tf8App.isTf8App) {
		self.isWX();
		return;
	} else {
		//未登录 先登录
		if(userId == 0) {
			self.loginByWap(self.loginUrl);
			return;
		}
	}

	$.ajax({
		type: 'GET',
		url: actSignUrl,
		data: { 'userId': userId },
		dataType: 'json',
		timeout: 10000,
		success: function(result) {
			if(!result || typeof result === 'undefined') {
				return;
			}
			//未登录
			if(result.responseStatus === 302) {
				window.location.replace(result.responseLocation);
				return;
			}
			if(result.success) {
				//成功
				vueM.popStr1 = '签到成功';
				vueM.popStr2 = '颜值+8 ';
				vueM.popStr3 = '记得明天继续签到哦~找好友帮忙，';
				vueM.popStr5 = '';
				vueM.popStr4 = '获得10颜值/次哦~';
				vueM.isCoupon = 8;
				vueM.isSign = false;
				//显示弹窗
				self.openModal('.modal-sign');
				$('.sign').html('<span class="signed">明天再来</span>');

				//增加颜值，计算背景图
				vueM.faceScore = +faceScore + 8;

				//判断用什么背景
				vueM.bgClass = self.changeScore(level, vueM.faceScore);
			} else {
				alert(result.msg);
			}
		}
	});
};
//邀请好友
pageObj.prototype.toFriend = function() {
	var self = this;

	vueM.popStr1 = '';
	vueM.popStr2 = '';
	//成功
	vueM.popStr3 = '今天的你超棒的！';
	vueM.popStr5 = '活动期间每天都可以过来充值一次哦~';
	vueM.popStr4 = '找好友鉴定颜值，可以获得10点颜值/次哦';
	vueM.isCoupon = 8;
	//显示弹窗
	this.openModal('.modal-sign');

};
//查看红包
pageObj.prototype.findCoupon = function() {
	// location.href = "http://ocean.taofen8.com/hongbao/myHongbao?userId=" + userId;
    window.location.href= 'taofen8-master://wl?id='+encodeURIComponent("http://ocean.taofen8.com/hongbao/myHongbao?userId=" + userId);
};
//显示模态框
pageObj.prototype.openModal = function(sel) {
	$("#backdrop").show();
	$(sel).show();
};
//关闭模态框
pageObj.prototype.closeModal = function() {
	var self = this;
//	$("#downloadTip").css({
//		"-webkit-transform": "translateY(-100%)",
//		"transform": "translateY(-100%)"
//	});
	$("#backdrop").hide();
	$(".modal").hide();
	$(".modal-down").hide();
	$(".modal-sign").hide();
};
//显示下载提示框
pageObj.prototype.openDownloadTip = function() {
	$("#backdrop").show();

//	$("#downloadTip").css({
//		"-webkit-transform": "translateY(0)",
//		"transform": "translateY(0)"
//	}).show();
	$("#downloadTip").show();
};

// 唤起淘粉吧客户端
pageObj.prototype.awakeApp = function(uri) {
	var self = this,
		scheme = 'taofen8-master://';

	if(self.env.os.isAndroid && self.env.browser.isChrome && !self.env.browser.isWebview) {
		window.location.replace('intent://' + uri + '#Intent;scheme=taofen8-master;package=com.leixun.taofen8;end');
	} else if(self.env.browser.isSafari && self.env.browser.version >= 9 || self.env.browser.isChrome) {
		window.location.href = scheme + uri;
	} else {
		var iframe = document.createElement('iframe');

		iframe.style.cssText = 'display:none;border:0;width:0;height:0;';
		document.body.appendChild(iframe);
		iframe.src = scheme + uri;
	}
};

// 下载淘粉吧客户端
pageObj.prototype.downloadApp = function(uri) {
	var self = this,
		jumpUrl = '';

	if(self.env.thirdApp.isWeixin) {
		jumpUrl = "http://a.app.qq.com/o/simple.jsp?pkgname=com.leixun.taofen8";
	} else {
		// 先尝试唤起淘粉吧app
		self.awakeApp(uri || 'tj/?id=0');

		if(self.env.os.isAndroid) {
			jumpUrl = "http://m.taofen8.com/download.jsp";
		} else if(self.env.os.isIOS) {
			jumpUrl = "http://itunes.apple.com/us/app/tao-fen-ba/id527012586?ls=1&mt=8";
		} else if(self.env.os.isWindowsPhone) {
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

	if(result = ua.match(/Windows\sPhone\s(?:OS\s)?([\d\.]+)/)) {
		self.os = {
			name: "Windows Phone",
			isWindowsPhone: true,
			version: result[1]
		};
	} else if(result = ua.match(/Android[\s\/]([\d\.]+)/)) {
		self.os = {
			name: "Android",
			isAndroid: true,
			version: result[1]
		};
	} else if(result = ua.match(/(iPhone|iPad|iPod)/)) {
		var name = result[1];
		if(result = ua.match(/OS ([\d_\.]+) like Mac OS X/)) {
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

	if(result = ua.match(/(?:UCWEB|UCBrowser\/)([\d\.]+)/)) {
		self.browser = {
			name: "UC",
			isUC: true,
			version: result[1]
		};
	} else if(result = ua.match(/MQQBrowser\/([\d\.]+)/)) {
		self.browser = {
			name: "QQ",
			isQQ: true,
			version: result[1]
		};
	} else if(result = ua.match(/(?:Firefox|FxiOS)\/([\d\.]+)/)) {
		self.browser = {
			name: "Firefox",
			isFirefox: true,
			version: result[1]
		};
	} else if((result = ua.match(/MSIE\s([\d\.]+)/)) || (result = ua.match(/IEMobile\/([\d\.]+)/))) {
		self.browser = {
			version: result[1]
		};
		if(ua.match(/IEMobile/)) {
			self.browser.name = "IEMobile";
			self.browser.isIEMobile = true;
		} else {
			self.browser.name = "IE";
			self.browser.isIE = true;
		}
		if(ua.match(/Android|iPhone/)) {
			self.browser.isIELikeWebkit = true;
		}
	} else if(result = ua.match(/(?:Chrome|CriOS)\/([\d\.]+)/)) {
		self.browser = {
			name: "Chrome",
			isChrome: true,
			version: result[1]
		};
		if(ua.match(/Version\/[\d+\.]+\s*Chrome/)) {
			self.browser.name = "Chrome Webview";
			self.browser.isWebview = true;
		}
	} else if(ua.match(/Safari/) && (result = ua.match(/Android[\s\/]([\d\.]+)/))) {
		self.browser = {
			name: "Android",
			isAndroid: true,
			version: result[1]
		};
	} else if(ua.match(/iPhone|iPad|iPod/)) {
		if(ua.match(/Safari/) && (result = ua.match(/Version\/([\d\.]+)/))) {
			self.browser = {
				name: "Safari",
				isSafari: true,
				version: result[1]
			};
		} else if(result = ua.match(/OS ([\d_\.]+) like Mac OS X/)) {
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