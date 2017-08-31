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
		*{margin: 0;padding: 0;box-sizing: border-box;word-break:break-all;}
		body{width: 10rem; margin: 0 auto;}
		ul.list{padding: 0 0.22rem;}
		ul.list li{padding: 0.31rem 0;border-bottom: 2px solid #e5e5e5;}
		ul.list figure{overflow: hidden;}
		ul.list figure img{float: left;width:3.12rem;height:3.12rem;margin-right: 0.3rem;}
		ul.list figure figcaption{float: left;width: 6.14rem;color: #333;}
		ul.list figcaption p{margin-top: 0.31rem;line-height: 1.6;}
		
		.oneRow{white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}
		.twoRow{display: -webkit-box;overflow: hidden;text-overflow: ellipsis;-webkit-line-clamp: 3;-webkit-box-orient: vertical;} 

		.fontSize12{font-size: 12px;}
		[data-dpr="2"] .fontSize12{font-size: 24px;}
		[data-dpr="3"] .fontSize12{font-size: 36px;}
		.fontSize14{font-size: 14px;}
		[data-dpr="2"] .fontSize14{font-size: 28px;}
		[data-dpr="3"] .fontSize14{font-size: 42px;}		
</style>

</head>
<body>
<input class="tf8-log-hidden" type="hidden" name="pageType" value="mobile" />
<input class="tf8-log-hidden" type="hidden" name="pageName" value="list" />
<input class="tf8-log-hidden" type="hidden" name="code" value="welfare" />
<input class="tf8-log-hidden" type="hidden" name="channel" value="${channel}" />
<input class="tf8-log-hidden" type="hidden" name="userId" value="${userId}" />

	<ul class="list">
		<c:forEach items="${mobilewelfares}" var="mobilewelfare" varStatus="idx">
			<li><a href="javascript:void(0);"
				onClick="logAndHref('${mobilewelfare.redirectUrl }', this);"
				log-content="${mobilewelfare.title}" log-position="${idx.index}">
					<figure>
						<img src="${mobilewelfare.image }" alt="">
						<figcaption>
							<h1 class="fontSize14 oneRow">${mobilewelfare.title }</h1>
							<p class="fontSize12 twoRow">${mobilewelfare.description }</p>
						</figcaption>
					</figure>
			</a></li>
		</c:forEach>
	</ul>
</body>
</html>