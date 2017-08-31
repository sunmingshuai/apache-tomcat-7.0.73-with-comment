var tf8LogHidden = {};
$(function(){
	//页面属性
	$('.tf8-log-hidden').each(function() {
	    tf8LogHidden[$(this).attr('name')] = $(this).val();
	});
	
	$.ajax({
		type : 'POST',
		url : "http://ocean.taofen8.com/log/ajaxViewLog",
		data : tf8LogHidden,
		dataType : "jsonp",
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		success: function(data){
		}
	});

	//点击事件统计
	if(typeof $('.tf8-log').on != 'undefined') {
		$('.tf8-log').on('click', function(event) {
		    var paramJson = {
		        'position':$(this).attr('log-position'), 
		        'bussinessType':$(this).attr('log-bussiness-type'), 
		        'content':$(this).attr('log-content'), 
		        'bmCategory':$(this).attr('log-bm-category')
		    };
		    paramJson = $.extend(paramJson, tf8LogHidden);
			$.ajax({
				type : 'POST',
				url : "http://ocean.taofen8.com/log/ajaxClickLog",
				data : paramJson,
				dataType : "jsonp",
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8'
			});
		});
	} else {
		$('.tf8-log').live('click', function(event) {
		    var paramJson = {
		    		'position':$(this).attr('log-position'), 
			        'bussinessType':$(this).attr('log-bussiness-type'), 
			        'content':$(this).attr('log-content'), 
			        'bmCategory':$(this).attr('log-bm-category'),
			        'code':$(this).attr('log-code')
		    };
		    paramJson = $.extend(paramJson, tf8LogHidden);
			$.ajax({
				type : 'POST',
				url : "http://ocean.taofen8.com/log/ajaxClickLog",
				data : paramJson,
				dataType : "jsonp",
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8'
			});
		});
	}
});

function logAndHref(url, o) {
	var paramJson = {
	        'position':$(o).attr('log-position'), 
	        'bussinessType':$(o).attr('log-bussiness-type'), 
	        'content':$(o).attr('log-content'), 
	        'bmCategory':$(o).attr('log-bm-category')
	    };
	    paramJson = $.extend(paramJson, tf8LogHidden);
		$.ajax({
			type : 'POST',
			url : "http://ocean.taofen8.com/log/ajaxClickLog",
			data : paramJson,
			dataType : "jsonp",
			contentType : 'application/x-www-form-urlencoded;charset=UTF-8'
		});
		
		window.location.href = url;
}

function loginUserNew(returnUrl) {
    if(!$.trim(returnUrl)) return;
    var ua = navigator.userAgent;
    var versionNum = 0;

    var productVersion = GetQueryString("productVersion");
    if(productVersion) {
        if(productVersion.indexOf("_") > 0){
            versionNum = parseFloat(productVersion.split("_")[1].substring(1));
        }else{
            versionNum = parseFloat(productVersion);
        }
    }
    if(ua.indexOf("Taofen8")>0 && versionNum>=8.4) {
        returnUrl += "&";
        returnUrl = returnUrl.replace(/(productVersion=.*?&)/g, "");
        returnUrl = returnUrl.replace(/(cookie=.*?&)/g, "");
        returnUrl = returnUrl.replace(/(loginType=.*?&)/g, "");
        returnUrl = returnUrl.replace(/(sign=.*?&)/g, "");
        returnUrl = returnUrl.replace(/(userId=.*?&)/g, "");
        window.location.href = 'native-check://login/?callback=' + encodeURIComponent(returnUrl);
    } else {
        loginUser(returnUrl);
    }
	/*
	 if(returnUrl.indexOf("productVersion") > -1) {
	 window.location.href= 'taofen8-master://wl?id='+encodeURIComponent("http://m.taofen8.com/s/login?callback=" + encodeURIComponent(returnUrl));
	 } else if(window.location.href.indexOf("productVersion") > -1) {
	 window.location.href= 'taofen8-master://wl?id='+encodeURIComponent("http://m.taofen8.com/s/login?callback=" + encodeURIComponent(returnUrl + '&productVersion=' + GetQueryString('productVersion')));

	 //window.location.href = "http://m.taofen8.com/s/login?callback=" + encodeURIComponent(returnUrl + '&productVersion=' + GetQueryString('productVersion'));
	 } else {
	 loginUser(returnUrl);
	 }
	 */
}

function GetQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}


function clickLog(itemId,type,source) {
    $.ajax({url:"http://m.taofen8.com/bizActivity/ajaxClickLog?itemId=" + itemId + "&type=" + type+"&source="+source,  dataType:'json', success:function(dataJson) {

    }});
}

function loginUser(returnUrl) {
    var locationHref = "https://oauth.taobao.com/authorize?response_type=token&client_id=12450255&state=1212&scope=item&view=wap&redirect_uri=";
    var wapRedirectUrl = "http://m.taofen8.com/iphone/login.jsp";
    var realUrl = locationHref + wapRedirectUrl + "?retain=pocket_" + returnUrl;
    window.location.href = realUrl;
}


function jumpToAPP(url) {

    var nav_user = navigator.userAgent;

    isChrome = nav_user.match(/Chrome/i) != null  && nav_user.match(/Version\/\d+\.\d+(\.\d+)?\sChrome\//i) == null;
    var ios_version = [];
    var ios_num = 0;
    if (nav_user.match(/(iPhone)/)) {
        if (nav_user.match(/Safari/)) {
            ios_version = nav_user.match(/Version\/([\d\.]+)/);
            if (ios_version) {
                ios_num = ios_version[1];
                ios_num && (ios_num = ios_num.split(".")[0])
            }
        }
    }
    if (ios_num >= 9) {
        window.location.href = url;
    }
    //else if (isChrome) {
    //	window.location = url;
    //}
    else {
        $(document.body).append('<iframe src="'+url+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
    }
}

