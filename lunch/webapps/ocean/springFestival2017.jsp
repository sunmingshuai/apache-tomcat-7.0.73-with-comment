<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <script src="https://g.alicdn.com/mtb/??lib-flexible/0.3.2/flexible_css.js,lib-flexible/0.3.2/flexible.js"></script>
    <link rel="stylesheet" href="../css/swiper.min.css">
    <link rel="stylesheet" href="../css/spring_festival2017.css">
    <title>金鸡送福</title>

</head>
<body>
<div id="contentWrap">
    <input id="userId" value="${userId}" type="hidden">
    <input id="stage" value="${stage}" type="hidden">
    <input id="lastLotteryDay" value="${lastLotteryDay}" type="hidden">
    <input id="lotteryCount" value="${lotteryCount}" type="hidden">
    <input id="isLotteryUsed" value="${isLotteryUsed}" type="hidden">
    <input id="hasGetBag" value="${hasGetBag}" type="hidden">
    <!-- //控制是否要分享 -->
    <input type="hidden" id="shareController" value="${shareController}">
    <!-- //分享面板标题 -->
    <input type="hidden" id="shareDialogTitle" value="${shareDialogTitle }">
    <!-- //分享面板描述 -->
    <input type="hidden" id="shareDialogDescription" value="${shareDialogDescription }">
    <!-- //分享描述 -->
    <input type="hidden" id="shareDescription" value="${shareDescription }">
    <!-- //分享图片 -->
    <input type="hidden" id="shareImageUrl" value="${shareImageUrl }">
    <!-- //分享标题 -->
    <input type="hidden" id="shareTitle" value="${shareTitle }">
    <!-- //分享渠道  1111 表示 朋友圈、微信、微博、QQ空间  -->
    <input type="hidden" id="showFlag" value="${showFlag }">
    <!-- //分享链接 -->
    <input type="hidden" id="shareUrl" value="${shareUrl }">
    <div id="topBanner">
        <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2rwuudJBopuFjSZPcXXc9EpXa_!!2296013456.jpg" />
    </div>
    <!-- 点福灯抽奖 -->
    <c:if test="${stage == '1'}">
    <div id="lotteryWrap">
        <div class="title">
            <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2lsmSdSFmpuFjSZFrXXayOXXa_!!2296013456.png" />
        </div>
        <div class="turnplateWrap">
            <div class="rule fs12">
                <div class="f-left fs13" id="endPos">x <span class="lantern-count">0</span></div>
                <a class="f-right rule-btn" href="javascript:void 0;">活动说明</a>
            </div>
            <!-- 抽奖九宫格 -->
            <div id="turnplate">
                <table>
                    <tbody>
                    <tr class="lottery-group">
                        <td class="lottery-unit">
                        </td>
                        <td class="lottery-unit">
                        </td>
                        <td class="lottery-unit">
                        </td>
                    </tr>
                    <tr class="lottery-group">
                        <td class="lottery-unit">
                        </td>
                        <td id="lotteryBtn">
                            <a href="javascript:void 0;">
                                <c:if test="${isLotteryUsed eq 'yes'}">
                                    <img src="https://img.alicdn.com/imgextra/i4/2296013456/TB29Nfdc90jpuFjy0FlXXc0bpXa_!!2296013456.png" />
                                </c:if>
                                <c:if test="${isLotteryUsed eq 'no'}">
                                    <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2a1eSdOpnpuFjSZFkXXc4ZpXa_!!2296013456.png" />
                                <img src="https://img.alicdn.com/imgextra/i4/2296013456/TB29Nfdc90jpuFjy0FlXXc0bpXa_!!2296013456.png" style="display:none;" />
                                </c:if>
                            </a>
                        </td>
                        <td class="lottery-unit">
                        </td>
                    </tr>
                    <tr class="lottery-group">
                        <td class="lottery-unit">
                        </td>
                        <td class="lottery-unit">
                        </td>
                        <td class="lottery-unit">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div id="awardList"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2J4GWdJ4opuFjSZFLXXX8mXXa_!!2296013456.png" /></div>
            </div>
        </div>
    </div>
    </c:if>
    <!-- 福袋 -->
    <c:if test="${stage == '1'}">
    <div id="luckyBagWrap">
        <div class="title">
            <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2uAvdcYXlpuFjy1zbXXb_qpXa_!!2296013456.png" />
        </div>
        <ul class="lantern-list">
            <li></li><li></li><li></li><li></li><li></li>
        </ul>
        <ul class="lantern-list">
            <li></li><li></li><li></li><li></li><li></li>
        </ul>
        <div style="position:relative;">
            <div class="img-wrap" id="luckyBag"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2akKWdHBmpuFjSZFAXXaQ0pXa_!!2296013456.png" /></div>
            <div id="luckyBagBtn"></div>
            <div class="desc fs12">
                <p>点亮的福灯越多 红包越大哦！</p>
                <p>2月4日－2月11日福袋开启</p>
            </div>
        </div>
    </div>
    </c:if>
    <!-- 密令 start -->
    <c:if test="${!empty secretWordActDTOList}">
    <div id="pwdRedPacket">
        <div class="title">
            <img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2GRYhc9FjpuFjSspbXXXagVXa_!!2296013456.png" />
        </div>
        <!--时间轴导航 Start-->
		<div id="dateNav" class="swiper-container fs12">
			<ul class="swiper-wrapper">
				<c:forEach var="secretWordActDTO" items="${secretWordActDTOList}" varStatus="dataNum">
				<li class="swiper-slide date ${secretWordActDTO.active? 'active':''}" data-indexno="${dataNum.index}">
					<p>${secretWordActDTO.date4PageByDay}</p>
					<c:choose>
					<c:when test="${secretWordActDTO.status4PageByDay==1}">
						<p class="status">正在派发</p>
					</c:when>
					<c:when test="${secretWordActDTO.status4PageByDay==-1}">
						<p class="status">已结束</p>
					</c:when>	
					<c:otherwise>
						<p class="status">预告</p>
					</c:otherwise>
					</c:choose>
				</li>
				</c:forEach>
			</ul>
		</div>
        <!--时间轴导航 End-->
        <!-- 密令每天数据 start -->
		<c:forEach var="secretWordActDTO" items="${secretWordActDTOList}">
		<div class="group-wrap ${secretWordActDTO.active? 'active':''}">
			<ul>
				<c:if test="${!empty secretWordActDTO.secretWordsByDay}">
				<c:forEach var="secretWordDTO" items="${secretWordActDTO.secretWordsByDay}">
				<c:choose>
				<c:when test="${secretWordDTO.status4Page==1}">
				<li class="started fs12">
				</c:when>
				<c:when test="${secretWordDTO.status4Page==-1}">
				<li class="expired fs12">
				</c:when>
				<c:otherwise>
				<li class="foreshow fs12">
				</c:otherwise>
				</c:choose>
					<div class="start-time">
						<span class="pic"><img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2Nx4fdYaI.eBjSspaXXXIKpXa_!!2296013456.png" class="w100"></span>
						<span class="time">${secretWordDTO.startTime4Page}</span>
						<span class="pic"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2Ux4fdYaI.eBjSspaXXXIKpXa_!!2296013456.png" class="w100"></span>
					</div>
					<div class="pwd fs15">${secretWordDTO.keyword}</div>
					<div class="copy-btn fs12">点击复制密令 粘贴到搜索框</div>
					<div class="copy-btn copied fs12"><span>已复制 请到搜索框粘贴</span></div>
					<span class="status-icon"></span>
				</li>
				</c:forEach>
				</c:if>
			</ul>
		</div>
		</c:forEach>
        <!-- 密令每天数据 end -->
    </div>
    </c:if>
    <!-- 密令 end -->
    <c:if test="${stage == '2'}">
        <div id="luckyBagWrap">
            <div class="title">
                <img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2uAvdcYXlpuFjy1zbXXb_qpXa_!!2296013456.png" />
            </div>
            <ul class="lantern-list">
                <li></li><li></li><li></li><li></li><li></li>
            </ul>
            <ul class="lantern-list">
                <li></li><li></li><li></li><li></li><li></li>
            </ul>
            <div style="position:relative;">
                <div class="img-wrap" id="luckyBag"><img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2akKWdHBmpuFjSZFAXXaQ0pXa_!!2296013456.png" /></div>
                <div id="luckyBagBtn"></div>
                <div class="desc fs12">
                    <p>点亮的福灯越多 红包越大哦！</p>
                    <p>2月4日－2月11日福袋开启</p>
                </div>
            </div>
        </div>
    </c:if>


    <!-- 模态框遮挡层 -->
    <div id="backdrop"></div>
    <!-- 弹框 -->
    <!-- 活动规则 -->
    <div class="modal rule-modal fs11" id="tipModal1">
        <div class="modal-close" style="background-image:url('https://img.alicdn.com/imgextra/i1/2296013456/TB2h0vJcYFkpuFjy1XcXXclapXa_!!2296013456.png');"></div>
        <div class="modal-header fs15">活动说明</div>
        <div class="modal-body">
            <ul>
                <li>1.1月25日至2月3日，每人每天有1次抽奖点灯机会，100%中奖，奖励内容在888集分宝、18集分宝、8集分宝、1集分宝、10积分中随机产生；</li>
                <li>2.每次抽奖都会点亮一盏福灯，根据累计点亮的福灯盏数，可对应领取不同红包面额的福袋。<br/>累计点亮1-4盏福灯，可获得1元普返红包；<br/>累计点亮5-9盏福灯，可获得3元普返红包；<br/>累计点亮10盏福灯，可获得18元红包组合。</li>
                <li>3.集分宝将在中奖后6小时内（正常为实时）发送到中奖用户绑定的支付宝帐户中，用户可以进入“支付宝-我的-余额-集分宝”里查看。返利红包将在中奖后6小时内（正常为实时）发送到中奖用户的淘粉吧账户中，用户可进入“淘粉吧-我的-我的红包”进行查看。淘粉吧积分可在淘粉吧“我的积分”中查看；</li>
                <li>4.本活动最终解释权归淘粉吧所有。</li>
            </ul>
        </div>
    </div>
    <!-- 点击灯笼区域提示 -->
    <div class="modal pure-modal fs14" id="tipModal2">
        <div class="modal-close"></div>
        <div class="modal-body">
            <p>每参与一次<span style="color:#fc4c1f;">抽奖点灯</span></p>
            <p>即可点亮一盏灯笼！</p>
        </div>
    </div>
    <!-- 已抽奖提示 -->
    <div class="modal pure-modal fs14" id="tipModal3">
        <div class="modal-close"></div>
        <div class="modal-body">
            <p>今日抽奖机会已用完 </p>
            <p class="more">明日再来</p>
        </div>
    </div>
    <!-- 抽奖结果提示 -->
    <div class="modal lantern-modal fs13" id="tipModal4">
        <div class="modal-close"></div>
        <div class="modal-header"><span class="fs18" id="startPos">点亮福灯</span></div>
        <div class="modal-body active">
            <p>您已累计点亮<span class="lantern-count">10</span>盏福灯了！</p>
            <div class="contentWrap">
                <div class="aligin-middle fs17">
                    <p>恭喜获得</p>
                    <p class="result"><span>330</span>集分宝</p>
                </div>
                <div class="aligin-middle">
                    <p style="color:#666;">明日点灯还有机会获得</p>
                    <p style="color:#999;">888集分宝</p>
                </div>
            </div>
        </div>
        <!-- 第一阶段最后一天 -->
        <div class="modal-body inactive">
            <p>您已累计点亮<span class="lantern-count">10</span>盏福灯了！</p>
            <div class="contentWrap" style="margin:.5rem auto 1.125rem;background-image:url('https://img.alicdn.com/imgextra/i2/2296013456/TB2WQKWdHBmpuFjSZFAXXaQ0pXa_!!2296013456.png');">
                <div class="aligin-middle fs17" style="height:2.34375rem;">
                    <p>恭喜获得</p>
                    <p class="result"><span>330</span>集分宝</p>
                </div>
            </div>
        </div>
        <div class="modal-footer">2.4 - 2.11期间可拆福袋哦</div>
    </div>
    <!-- 红包 -->
    <div class="modal hb-modal fs13" id="tipModal5">
        <div class="modal-close"></div>
        <div class="modal-body">
            <p class="award">您获得<span class="fs25">18</span>元红包！</p>
            <p>
                <a href="javascript:void 0;" class="btn" id="hbBtn">查看红包</a>
                <a href="javascript:void 0;" class="btn" id="jfBtn">查看积分</a>
            </p>
        </div>
    </div>
    <!-- 错误提示 -->
	<div class="modal pure-modal fs14" id="errorModal">
		<div class="modal-close"></div>
        <div class="modal-body">
            <p class="msg">网络出错！请稍后再试</p>
        </div>
	</div>
    <!-- 灯笼抛物体对象 -->
    <div id="latternObj"></div>
</div>
<div id="downloadTip">
    <p class="fs12">在淘粉吧app内才能参与活动哦！</p>
    <div class="fs14" id="downloadBtn">下载淘粉吧客户端</div>
</div>
<script src="https://m.taofen8.com/js/jquery-2.1.4.min.js"></script>
<script src="/js/swiper.jquery.min.js"></script>
<script src="/js/spring_festival2017.js"></script>
<script src="/js/lottery.js"></script>
<%@ include file="wechat_share.jsp"%>
<script>
    var fromWechat = "${fromWechat}";
    if(fromWechat === 'yes'){
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
    }
</script>
</body>
</html>