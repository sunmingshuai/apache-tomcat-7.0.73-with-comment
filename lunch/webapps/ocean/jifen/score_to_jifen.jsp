<%@ page isELIgnored="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="background:#eeeeee;" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="no-cache" http-equiv="Cache-control">
<script type="text/javascript" src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
<title>我的粉元宝</title>
<link rel="stylesheet" type="text/css" href="/css/vip.css?v=04010618" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
<div class="vip">
	<div class="fyb_head">
        <p class="fyb_p1 fontSize14">可兑换粉元宝</p>
        <p class="fyb_p2 fontSize14"><span class="fontSize28">${score}</span>个</p>
        <p class="fyb_p3 fontSize14">1个粉元宝=1个积分</p>
        <c:if test="${score gt 0 }">
            <a href="javascript:void(0);" class="fyb_a fontSize14" onclick="duihuan()">全部兑换</a>
        </c:if>
        <c:if test="${score le 0 }">
            <a href="javascript:void(0);" class="fyb_a fontSize14"  style="background:#999;">全部兑换</a>
        </c:if>
    </div>
    <h1 class="fyb_h1 fontSize16">积分兑换规则</h1>
    <p class="fyb_gz fontSize14">1.粉元宝与积分的兑换比例为1:1<br />&nbsp;&nbsp;1个粉元宝可兑换为1个积分</p>
    <p class="fyb_gz fontSize14">2.兑换日期为即日起，结束时间不限</p>
    <p class="fyb_gz fontSize14">3.最终解释权归淘粉吧所有</p>
</div>
<!--弹出框 strat-->
    <div class="inte_tank" id="JS_tank">
    	<div id="log_1" style="display:none;">
        	<p class="jf_div_wz fontSize14">您确定要将您的粉元宝<br />全部兑换为积分吗？</p>
            <a href="javascript:void(0);" class="jf_href" onclick="duihuansure()">确定</a>
        </div>
        <div id="log_2" style="display:none;">
        	<p class="jf_div_wz fontSize14"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2rGIWeFXXXXX6XXXXXXXXXXXX_!!2296013456.png"  /><br />兑换成功</p>
            <a href="#" class="jf_href" onclick="Close2()">确定</a>
        </div>
        <div id="log_3"  style="display:none;">
        	<p class="jf_div_wz fontSize14"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2RNgzeFXXXXbnXpXXXXXXXXXX_!!2296013456.png"  /><br />兑换失败</p>
            <a href="#" class="jf_href" onclick="Close()">确定</a>
        </div>
        <div id="log_4"  style="display:none;">
        	<p class="jf_div_wz fontSize14"><img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2RNgzeFXXXXbnXpXXXXXXXXXX_!!2296013456.png"  /><br />您的粉元宝不够，不能兑换</p>
            <a href="#" class="jf_href" onclick="Close()">确定</a>
        </div>
    </div>
    <div class="xr_opacity" id="xr_opacity"></div>
    <script type="text/javascript">
    function Close(){
		$("#JS_tank").hide();
		$("#xr_opacity").hide();
	}
    
    function Close2(){
		$("#JS_tank").hide();
		$("#xr_opacity").hide();
    	window.location.reload();
    }
    
    function duihuan(){
		$("#JS_tank").show();
		$("#xr_opacity").show();
    	$("#log_1").show();
    }
    
    
    function duihuansure(){  
    	     $("#log_1").hide();
		     $.post("${pageContext.request.contextPath}/jifen/scoreToJifenAjax",{"userId":${userId}},function(resp){
				 resp = $.parseJSON(resp);
				 if(resp.success){
					 $("#log_2").show();
				 }else{
					if(resp.status=='4'){//粉元宝不够
						$("#log_4").show();
					}else{//兑换失败 
						$("#log_3").show();
					}
				 }
			 });		
    }
    </script>
    <!--弹出框 end-->
</body>
</html>
