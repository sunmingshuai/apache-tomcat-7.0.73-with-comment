//无线商品跳转
function viewItemDetailInWap(itemId) {
	var ua = navigator.userAgent;
	var productVersion = GetQueryString("productVersion");
	var isApp = GetQueryString("isApp");
	var userId  = GetQueryString("userId");
	var mobilePage = $('#mobilePage').val();
	if(ua.indexOf("Taofen8") > 0 && ua.toLowerCase().indexOf("ipad") < 0){
		document.location.href = 'taofen8-master://bl?id=http://m.taofen8.com/item/' + itemId 
       +'?sid=null%26cancelAlert=1%26ttid=400000_12450255@taofen8_wap%26f='+mobilePage+'%26p='+productVersion+'&p='+itemId +',,yes,http://m.taofen8.com/item2/'+ itemId 
       +'?sid=null%26cancelAlert=1%26ttid=400000_12450255@taofen8_wap%26f='+mobilePage+',';			
	} else if(productVersion) {
		
		document.location.href = 'taofen8-master://bl?id=http://m.taofen8.com/item/' + itemId 
				         +'?sid=null%26cancelAlert=1%26ttid=400000_12450255@taofen8_wap%26f='+mobilePage+'%26p='+productVersion+'&p='+itemId +',,yes,http://m.taofen8.com/item2/'+ itemId 
				         +'?sid=null%26cancelAlert=1%26ttid=400000_12450255@taofen8_wap%26f='+mobilePage+',';
		setTimeout(function () {
			
		document.location.href = "http://m.taofen8.com/d.jsp?i=" + itemId + "&r=iDetail&t="+mobilePage+"&isApp="+isApp+"&userId="+userId+"&p="+productVersion;
		}, 1000); 
	} else {
		productVersion = GetQueryString("p");
		document.location.href = "http://m.taofen8.com/d.jsp?i=" + itemId + "&r=iDetail&t="+mobilePage+"&isApp="+isApp+"&userId="+userId+"&p="+productVersion;
	}
}

//获取url参数对应值 
function GetQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}

//验证手机号码
function isMobileNumber(str) {
	return (/^1[3|4|5|7|8][0-9]\d{8}$/.test(str));
}

//验证邮箱
function isEmail(str) {
	return (/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(str));
}