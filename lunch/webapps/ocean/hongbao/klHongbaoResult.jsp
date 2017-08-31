<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta name="format-detection" content="telephone=no, email=no" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<link rel="stylesheet" type="text/css" href="../css/kl_hongbao.css" />
<title></title>
</head>

<body background="#ffffff" style="width: 10rem; margin: 0 auto;">
		<div class="jf_success_k">
				<div class="js_sc_k fs15">
					<div class="jf_sc_img">
						<img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2_2vKmpXXXXbFXpXXXXXXXXXX_!!2296013456.png" class="w100"/>
					</div>
					<p>恭喜您，红包领取成功！</p>
					<p>使用红包购物更优惠哦~</p>
				</div>
				<div class="jf_sc_bt fs14">
					<a href="/hongbao/myHongbao?userId=${userId }" class="js_sc_bt1">
						去查看我的红包
					</a>
					<a href="#" class="js_sc_bt2" onclick="jumpToAPP()">
						去看看超高返商品
					</a>
				</div>
		</div>
	</body>
	<script>
	
	//唤起客户端相应页面
	function jumpToAPP() {
		var url = 'taofen8-master://sid?id=member_46';
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
	    else {
	        $(document.body).append('<iframe src="'+url+'" style="display:none;" onload="javascript:document.body.removeChild(this);"></iframe>');
	    }
	}
	</script>
</html>