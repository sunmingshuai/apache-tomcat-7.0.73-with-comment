<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="yes" name="apple-touch-fullscreen">
	<meta content="telephone=no,email=no" name="format-detection">
	<script src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
	<link rel="stylesheet" href="/css/cmbc_creditcard_progresspage.css">
	<title>信用卡申请进度查询</title>
</head>
<body>
	<div id="container" class="fs12">
		<dl>
			<dt class="fs16">方式一：网上在线咨询</dt>
			<dd class="fs14">网上查询请点击：<a href="https://kefu.creditcard.cmbc.com.cn/wdxykindex.shtml?age=11#dingWeiAllByHSY">民生银行信用卡申请进度网上查询通道</a></dd>
			<dt class="fs16">方式二：客服电话查询</dt>
			<dd class="fs14">客服电话查询请拨打：400-66-95568</dd>
			<dt class="fs16">方式三：微信查询</dt>
			<dd class="fs14">
				<div class="qrcode"><img src="https://img.taofen8.com/show/image/01170322d3905f8bea9d4507850f014263ad4623.png" /></div>
				<p>扫一扫民生银行官方二维码，即可查询信用卡申请进度</p>
				<p class="fs12 tip">具体操作：关注“中国民生银行”，微信号“cmbcwxbank”，点击“悦理财-信用卡服务”，输入“6”。</p>
			</dd>
		</dl>
		<img id="mask" src="https://img.alicdn.com/imgextra/i1/2296013456/TB27SvnXOpnpuFjSZFIXXXh2VXa_!!2296013456.png">
	</div>
<script src="https://m.taofen8.com/js/jquery-2.1.4.min.js"></script>
<script>
$(function(){
	// 长按二维码
    $(".qrcode").on("touchstart", function() {
        $("#mask").show();
        setTimeout(function() {
            $('#mask').hide()
        }, 1000);
    });
});
</script>
</body>
</html>