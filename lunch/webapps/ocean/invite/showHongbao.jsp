<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html style="background: #a90ac2;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta name="format-detection" content="telephone=no, email=no" />
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://m.taofen8.com/js/common.js?v=06171815" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://m.taofen8.com/css/yqyj.css"/>
<title>领取红包成功</title>
<%@ include file="../wechat_share.jsp"%>
</head>
<body>
	<div class="lq_hb_k" style="display: block;">
    <div class="lq_hb_text" style="margin-bottom: 0.5rem;">
        <div class="lq_hb_text_content">
            <div class="lq_hb">
                <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB24QzmsFXXXXbSXpXXXXXXXXXX_!!2296013456.png" class="w100">
            </div>
            <p class="lq_hb_text_p1 fs17">50元红包领取成功！</p>
            <p class="lq_hb_text_p2 fs14" style=" width: 7.8rem; margin: 0 auto;">红包具体使用规范请登录淘粉吧APP，我的-我的红包查看红包详情。</p>
            <a class="fs17 lq_hb_text_bt" onclick="jumpToDownload()" style="color:#fff; width: 7.8rem; margin: 0.578rem auto 0;" href="javascript:void(0)">下载淘粉吧APP</a>
            <div class="fs0" style="width: 7.8rem; margin: 0.47rem auto 0;">
                <img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2Ski_tXXXXXb.XXXXXXXXXXXX_!!2296013456.png" alt="5元" style="margin-top: 0.16rem;" class="w100">
                <img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2Ski_tXXXXXb.XXXXXXXXXXXX_!!2296013456.png" alt="5元" style="margin-top: 0.16rem;" class="w100">
                <img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2kLaOtXXXXXaNXpXXXXXXXXXX_!!2296013456.png" alt="20元" style="margin-top: 0.16rem;" class="w100">
                <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB26LDdtXXXXXblXXXXXXXXXXXX_!!2296013456.png" alt="10元" style="margin-top: 0.16rem;" class="w100">
                <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB26LDdtXXXXXblXXXXXXXXXXXX_!!2296013456.png" alt="10元" style="margin-top: 0.16rem;" class="w100">
            </div>
        </div>
    </div>
	</div>
	<script type="text/javascript">
	setShareMessage(
			"${shareTitle}",
			"${shareDescription}",
			"${shareUrl}",
			"${shareImageUrl}",
			function(){
			},
			function(){
			}
		);	
	</script>
</body>
</html>