<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
	var ua = navigator.userAgent.toLowerCase();
	if(ua.match(/MicroMessenger/i)=='micromessenger') {
		$.ajax({
			type : 'get',
			url : 'http://wcs.taofen8.com/service/getSignatureJson',
			data : {url : location.href.split('#')[0]},
			dataType : 'jsonp',
			jsonp : "callback",
			jsonpCallback : "signatureJsonCallback"
		});
	}
	function signatureJsonCallback(result) {
		wx.config({
			debug : false,
			appId : result.appId, 
			timestamp : result.timestamp, 
			nonceStr :  result.nonceStr, 
			signature : result.signature,
			jsApiList : [ 'checkJsApi', 'onMenuShareTimeline',
					'onMenuShareAppMessage', 'onMenuShareQQ',
					'onMenuShareWeibo', 'hideMenuItems', 'showMenuItems',
					'hideAllNonBaseMenuItem', 'showAllNonBaseMenuItem',
					'translateVoice', 'startRecord', 'stopRecord',
					'onRecordEnd', 'playVoice', 'pauseVoice', 'stopVoice',
					'uploadVoice', 'downloadVoice', 'chooseImage',
					'previewImage', 'uploadImage', 'downloadImage',
					'getNetworkType', 'openLocation', 'getLocation',
					'hideOptionMenu', 'showOptionMenu', 'closeWindow',
					'scanQRCode', 'chooseWXPay', 'openProductSpecificView',
					'addCard', 'chooseCard', 'openCard' ]
		});
	}
	
	wx.ready(function(){
		//分享朋友圈
		wx.onMenuShareTimeline({
		    title: _title,
		    link: _link,
		    imgUrl:_imgUrl,
		    success: function () { 
		    	_successCallback();
		    },
		    cancel: function () { 
		    	_cancelCallback();
		    }
		});
		//分享给好友
		wx.onMenuShareAppMessage({
		    title: _title, 
		    desc: _desc, 
		    link: _link,
		    imgUrl:_imgUrl,
		    type: '', 
		    dataUrl: '', 
		    success: function () { 
		    	_successCallback();
		    },
		    cancel: function () { 
		    	_cancelCallback();
		    }
		});
		//分享到QQ
		wx.onMenuShareQQ({
		    title: _title, 
		    desc: _desc, 
		    link: _link,
		    imgUrl:_imgUrl,
		    success: function () { 
		    	_successCallback();
		    },
		    cancel: function () { 
		    	_cancelCallback();
		    }
		});
	});
	
	var _title = '';
	var _desc = '';
	var _link ='';
	var _imgUrl = '';
	var _successCallback;
	var _cancelCallback;
	
	/*title 标题
	 *desc  描述
	 *link  链接地址
	 *imgUrl 图片地址
	 *successCallback 分享成功回调
	 *cancelCallback  取消分享回调
	 */
	function setShareMessage(title, desc, link, imgUrl, successCallback, cancelCallback){
		_title = title;
		_desc = desc;
		_link = link ;
		_imgUrl = imgUrl;
		_successCallback = successCallback;
		_cancelCallback = cancelCallback;
	}
</script>


