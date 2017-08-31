<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta name="format-detection" content="telephone=no, email=no" />
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ocean.taofen8.com/js/tf8common_ocean.js" type="text/javascript"></script>
<title></title>
<style type="text/css">
		body{width: 10rem;margin: 0 auto;padding:0;}
		.w100{width: 100%;}
		.money_jc{width: 10rem;font-size: 0;overflow: hidden;margin-bottom:1.59rem; }
		.money_jc .download{width: 10rem;height:1.87rem;display: block;font-size:0;overflow: hidden;position: fixed;bottom: 0;z-index: 100;}
</style>

</head>
<body>
	<input class="tf8-log-hidden" type="hidden" name="pageType" value="mobile" />
	<input class="tf8-log-hidden" type="hidden" name="pageName" value="invest_course" />
	<input class="tf8-log-hidden" type="hidden" name="code" value="mnw" />
	<input class="tf8-log-hidden" type="hidden" name="channel" value="task" />
	<input class="tf8-log-hidden" type="hidden" name="userId" value="${userId}" />


	<div class="money_jc">
		<img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2Cl51tVXXXXXHXXXXXXXXXXXX_!!2296013456.jpg_q80.jpg" class="w100" />
		<img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2of5gtVXXXXayXpXXXXXXXXXX_!!2296013456.jpg_q80.jpg" class="w100" />
		<img src="https://img.alicdn.com/imgextra/i3/2296013456/TB29FGTtVXXXXaQXXXXXXXXXXXX_!!2296013456.jpg_q80.jpg" class="w100" />
		<img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2j_yDtVXXXXcjXXXXXXXXXXXX_!!2296013456.jpg_q80.jpg" class="w100" />
		<img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2ks0.tVXXXXbGXpXXXXXXXXXX_!!2296013456.jpg_q80.jpg" class="w100" />
		<img src="https://img.alicdn.com/imgextra/i4/2296013456/TB21emztVXXXXcGXXXXXXXXXXXX_!!2296013456.jpg_q80.jpg" class="w100" />
		<a href="javascript:void(0);" onClick="logAndHref('${investUrl}', this);" class="download"  log-content="现在去赚钱" log-position="bottom-button">
			<img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2z1qgtVXXXXaNXpXXXXXXXXXX_!!2296013456.png" class="w100" alt="现在去赚钱" />
		</a>	
	</div>
</body>
</html>