<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<meta name="format-detection"content="telephone=no, email=no" />
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<title>支出明细</title>
<link rel="stylesheet" type="text/css" href="/css/vip.css?v=04010618" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script language="javascript">
$(document).ready(function(){
	 var currentpage = 1;
	 var maxpage = ${totalPage};
	 var userId= "${userId}";
						
					 
	$(window).scroll(function(){
		var scrollTop = $(this).scrollTop();               //滚动条距离顶部的高度
		var scrollHeight = $(document).height();           //当前页面的总高度
		var windowHeight = $(this).height();               //当前可视的页面高度
		scrollTop = scrollTop+50;
	　	if(scrollTop + windowHeight >= scrollHeight){        //距离顶部+当前高度 >=文档总高度 即代表滑动到底部
			if(currentpage == maxpage){                         //如果加载ajax达到2次 停止加载
				return false;                              //如果条件满足 停止运行该判断
			}
			ajaxRed();   //开始加载ajax
		}
	});
	function ajaxRed(){
		  $(".loading_text").ajaxStart(function(){    //ajax开始执行
			  $(this).show(); 
			  }).ajaxStop(function(){                 //ajax结束执行
			  $(this).hide();
		  });
		currentpage++;                           //执行成功页码+1
		if (currentpage>maxpage){
			return currentpage;                       //判断页码是否达到限定的加载次数;
			return false;
		}
		  $.ajax({
		        type:'GET',
		        url:'${pageContext.request.contextPath}/jifen/jifenExpendAjax',
		        data:{'pageNo':currentpage,'userId':userId},
		        dataType:'json',
		        timeout:10000,
		        success:function (itemList) {
		        	for(var i = 0; i < jifenList.length; i++) {
		        		var jifen = jifenList[i];
						var html = '<div class="vip_money"><p class="hb_left"><img src="'+jifen.imageUrl+'" class="w100" /></p>'+
						'<div class="hb_right"><p class="hb_right_p1 fontSize14">'+jifen.typeStr+'</p>'+
						'<p class="hb_right_p3 fontSize14">'+jifen.srcTimeStr+'<span class="mx_right" ><span class="hong">'+jifen.jifen+'</span>积分</span></p>'+
						'</div></div>';
						$("#jifen_expend").append(html);
		        	}
		        }
		  });
	}    
});
</script> 
</head>

<body>
<div class="vip" id="jifen_expend">
	<c:if test="${not empty jifenList}">
		<c:forEach items="${jifenList}" var="jifen" varStatus="num">
		<div class="vip_money">
	        <p class="hb_left"><img src="${jifen.imageUrl}"  class="w100" /></p>
	        <div class="hb_right">
	            <p class="hb_right_p1 fontSize14">${jifen.typeStr}</p>
	            <p class="hb_right_p3 fontSize14">${jifen.srcTimeStr} <span class="mx_right" ><span class="hong">${jifen.jifen}</span>积分</span></p>
	        </div>
	    </div>		
		</c:forEach>		
	</c:if>
	<c:if test="${empty jifenList }">
		<div style="width:10rem; height:auto; overflow:hidden; text-align:center;color:#585858;padding-top:4.5rem;" class="fontSize14">
		<img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2gQdbeVXXXXb0XpXXXXXXXXXX_!!2296013456.png" style="width:3.8rem; height:2.65rem;"  />
		<br />您还没积分，<br />赶紧去超高返下单领取积分吧！</div>		
	</c:if>
	
	
</div>
</body>
</html>
