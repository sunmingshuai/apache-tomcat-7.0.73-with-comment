//获取url参数对应值 
function GetQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}
 
//WAP用户登陆逻辑，参数为回调url(新的统一接口)
function loginUserNew(returnUrl) {
    if(returnUrl.indexOf("productVersion") > -1) {
        window.location.href = "http://m.taofen8.com/s/login?callback=" + encodeURIComponent(returnUrl);
    } else if(window.location.href.indexOf("productVersion") > -1) {
        var pvStr = returnUrl.indexOf("?")>-1 ? "&productVersion=" : "?productVersion=";
        window.location.href = "http://m.taofen8.com/s/login?callback=" + encodeURIComponent(returnUrl + pvStr + GetQueryString('productVersion'));
    } else {
        loginUser(returnUrl);
    }
}
 
//WAP用户登陆逻辑，参数为回调url
function loginUser(returnUrl) {
    var locationHref = "https://oauth.taobao.com/authorize?response_type=token&client_id=12450255&state=1212&scope=item&view=wap&redirect_uri=";
    var wapRedirectUrl = "http://m.taofen8.com/iphone/login.jsp";
    var realUrl = locationHref + wapRedirectUrl + "?retain=pocket_" + encodeURIComponent(returnUrl);
    window.location.href = realUrl;
}
 
// 分享活动
function shareHuodong(shareUrl,returnUrl) {
    var shareUrl = 'share://taofen8.com?callBackUrl='+encodeURIComponent(returnUrl)+'&shareDialogDescription='+encodeURIComponent('分享后,选择“返回淘粉吧”回到本页面领取红包')+
            '&code=1234&shareDialogTitle='+encodeURIComponent('分享一下红包立即到手') +'&shareDescription='+encodeURIComponent('100000清凉费来袭！名额不限，人人可领！')+
            '&shareUrl='+encodeURIComponent(shareUrl)+'&shareImageUrl='+encodeURIComponent('https://img.alicdn.com/imgextra/i4/1086204413/TB2FA7KsVXXXXXcXFXXXXXXXXXX_!!1086204413.png')+
            '&shareTitle='+encodeURIComponent('送高温补贴啦！20元清凉费人人可领>>')+'&showFlag=1100';
    $(document.body).append('<iframe src="'+shareUrl+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
}


//下载淘粉吧客户端
function jumpToDownload(url) {
    var jumpUrl;
    var ua = navigator.userAgent;
    if(ua.indexOf("MicroMessenger") > 0) {
        jumpUrl="http://a.app.qq.com/o/simple.jsp?pkgname=com.leixun.taofen8";              
    }else{
    	jumpToAPP('taofen8-master://wl/?id='+url);
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
    setTimeout(function(){
    	document.location = jumpUrl;
    },300);
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
    //  window.location = url;
    //} 
    else {
    	$(document.body).append('<iframe src="'+url+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
    }
}

var tf8 = {};
//判断手机号码
tf8.isMobile = function(str) {
    return (/^(1\d{10})$/.test(str));
};
//判断为空
tf8.isEmpty = function(str) {
    if (str === undefined || $.trim(str) === "" || str === null) {
        return true;
    }
    return false;
};