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
	<link rel="stylesheet" href="/css/cmbc_creditcard_cardpage.css">
	<title>办卡狂送集分宝</title>
</head>
<body>
	<div id="container" class="fs12">
		<input id="userId" value="${userId}" type="hidden">
	    <input id="cookie" value="${cookie}" type="hidden">
	    <input id="telephone" value="${telephone}" type="hidden">
	    <input id="needPopup" value="${needPopup}" type="hidden">
	    <input id="loginUrl" value="${loginUrl}" type="hidden">
	    <header class="fs16">民生银行热门信用卡申领</header>
	    <!-- 信用卡列表 -->
		<ul class="card-list">
			<li>
				<div class="title fs14">民生女人花信用卡</div>
				<div class="apply-btn fs14" data-type="1">立即申领</div>
				<div class="info">
					<img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2M5UmhCBjpuFjy1XdXXaooVXa_!!2296013456.png" />
					<div class="tags">
						<p>•女人花开正当时！</p>
						<p>•开卡即领两千元开卡礼</p>
						<p>•每月送120元面膜金</p>
						<p>•享周四双倍积分</p>
					</div>
				</div>
				<div class="detail-wrap">
					<div class="title"><span>详细介绍</span></div>
					<div class="detail">
						<p><span class="pink">【新卡福利】</span>首次申办民生女人花卡的客户，在核卡后两个月内，激活卡片，即可领取价值2000元的礼券。</p>
						<p><span class="pink">【每月送面膜金】</span>新老客户均可参与，至2017年7月底前，每月计积分消费3笔99元，即可领取一笔面膜金。普卡、金卡每月获面膜金30元，标准白金卡每月获面膜金50元。客户可自主选择在京东、乐蜂网、御泥坊APP或屈臣氏使用面膜金。</p>
						<p><span class="pink">【首张异形卡免年费】</span>民生女人花异型卡延续既有卡面，以鲜花为灵感，提供玫瑰、牡丹、樱花、郁金香四大花型。</p>
					</div>
				</div>
			</li>
			<li>
				<div class="title fs14">年轻主题信用卡</div>
				<div class="apply-btn fs14" data-type="2">立即申领</div>
				<div class="info">
					<img src="https://img.alicdn.com/imgextra/i1/2296013456/TB2TrZ9hq8lpuFjy0FpXXaGrpXa_!!2296013456.png" />
					<div class="tags">
						<p>•年轻白领时尚必备</p>
						<p>•1积分兑换星巴克咖啡</p>
						<p>•支付宝消费计积分</p>
					</div>
				</div>
				<div class="detail-wrap">
					<div class="title"><span>详细介绍</span></div>
					<div class="detail">
						<p><span class="pink">【1积分兑换星巴克大杯咖啡饮品】</span>每自然周内，年轻主题卡计积分刷卡累计满399元（含）以上或等值外币的客户，即可申请1积分兑换星巴克大杯咖啡特权一次。</p>
						<p><span class="pink">【线上消费计积分】</span>年轻主题卡客户享支付宝、财付通快捷支付交易计积分特权。每月每个账户最高获赠1000分。</p>
					</div>
				</div>
			</li>
			<li>
				<div class="title fs14">百度外卖信用卡</div>
				<div class="apply-btn fs14" data-type="3">立即申领</div>
				<div class="info">
					<img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2IDoZhrplpuFjSspiXXcdfFXa_!!2296013456.png" />
					<div class="tags">
						<p>•开卡即送200元外卖代金券</p>
						<p>•每月两次免配送费</p>
					</div>
				</div>
				<div class="detail-wrap">
					<div class="title"><span>详细介绍</span></div>
					<div class="detail">
						<p><span class="pink">【新卡福利】</span>即日起至2017年5月19日，首次成功办理民生百度外卖联名信用卡的持卡人，激活卡片后即可获赠200元百度外卖代金券礼包。</p>
						<p><span class="pink">【每月免2次配送费】</span>每月任意刷卡消费一笔，次月即可享受2次外卖免配送费权益。</p>
					</div>
				</div>
			</li>
			<li>
				<div class="title fs14">民生车车卡</div>
				<div class="apply-btn fs14" data-type="4">立即申领</div>
				<div class="info">
					<img src="https://img.alicdn.com/imgextra/i4/2296013456/TB2GHMDi4lmpuFjSZPfXXc9iXXa_!!2296013456.png" />
					<div class="tags">
						<p>•免年费</p>
						<p>•加油最高月返100</p>
						<p>•每月1元洗车全年</p>
						<p>•机场1元停车</p>
						<p>•车险最高15%回馈</p>
					</div>
				</div>
				<div class="detail-wrap">
					<div class="title"><span>详细介绍</span></div>
					<div class="detail">
						<p><span class="pink">【详细介绍】</span>金卡及标准白金卡均可享受免年费政策，金卡一年可省1200元，标白卡一年可省2400元!</p>
						<div class="tb">
							<table>
								<tbody>
									<tr>
										<td>卡种权益</td>
										<td>车车金卡</td>
										<td>车车白金</td>
									</tr>
									<tr>
										<td>加油返还</td>
										<td>加油交易金额的5%<br/>（当月上限50元）</td>
										<td>加油交易金额的8%<br/>（当月上限100元）</td>
									</tr>
									<tr>
										<td>1元洗车</td>
										<td>2次/月</td>
										<td>4次/月</td>
									</tr>
									<tr>
										<td>参与条件</td>
										<td>当月刷卡交易<br/>1500元</td>
										<td>当月刷卡交易<br/>2500元</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</li>
			<li class="qb">
				<div class="title fs14">VISA全币种卡</div>
				<div class="apply-btn fs14" data-type="5">立即申领</div>
				<div class="info">
					<img src="https://img.alicdn.com/imgextra/i3/2296013456/TB2ka.qi90mpuFjSZPiXXbssVXa_!!2296013456.png" />
					<div class="tags">
						<p>•享国际机票代金券</p>
						<p>•免外币交易手续费</p>
						<p>•免境外取现手续费！</p>
					</div>
				</div>
				<div class="detail-wrap">
					<div class="title"><span>详细介绍</span></div>
					<div class="detail">
						<span class="pink">【最省钱】</span>
						<p>1、节约外币交易手续费，任意币种交易，均可免高达1.5%的外币交易手续费；</p>
						<p>2、经VISA网络ATM机提取现金或领回溢缴款，免收3% 的取现手续费。</p>
						<span class="pink">【最便捷】</span>
						<p>1、境外所有可受理VISA卡的POS机和ATM机均可使用，范围最广；</p>
						<p>2、外币消费人民币轻松还款（在境外消费，均可通过人民币轻松还款）。</p>
					</div>
				</div>
			</li>
		</ul>
		<!-- 活动权益 -->
		<div class="rights">
			<img src="https://img.alicdn.com/imgextra/i2/2296013456/TB2EyhCjb4npuFjSZFmXXXl4FXa_!!2296013456.png" />
			<div class="title"><span class="fs16">民生银行特惠权益活动</span></div>
			<p>即日起至2017年4月，刷民生信用卡当月计积分消费满3笔99元，即可于达标当月的每周一至每周日享受不同的优惠特权，每天名额有限，先到先得</p>
			<div class="tb">
				<table>
					<thead>
						<tr>
							<th>主题</th>
							<th>权益内容</th>
							<th>合作商</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>周一咖啡日</td>
							<td>10元享COSTA中杯经典咖啡或者五星经典咖啡一杯</td>
							<td>COSTA咖啡</td>
						</tr>
						<tr>
							<td>周二甜蜜日</td>
							<td>10元享哈根达斯单球一枚</td>
							<td>哈根达斯</td>
						</tr>
						<tr>
							<td>周三分红日</td>
							<td>0元抢分期手续费红包</td>
							<td></td>
						</tr>
						<tr>
							<td>周四爱车日</td>
							<td>1元洗车</td>
							<td>宽途汽车有限公司</td>
						</tr>
						<tr>
							<td>周五美食日</td>
							<td>大众点评满50元减30元</td>
							<td>大众点评</td>
						</tr>
						<tr>
							<td>周六观影日</td>
							<td>免费领30元电影券</td>
							<td>大众点评</td>
						</tr>
						<tr>
							<td>周日享购日</td>
							<td>屈臣氏消费满100减50元，最高减50元</td>
							<td>屈臣氏</td>
						</tr>
					</tbody>
				</table>				
			</div>
		</div>
		<!-- 模态框遮挡层 -->
		<div id="backdrop"></div>
		<!-- 填写手机号弹窗 -->
		<div class="modal" id="telephoneModal">
			<div class="modal-close"></div>
			<div class="modal-header fs18">填写手机号</div>
	        <div class="modal-body">
	            <p class="fs14">请填写收取集分宝奖励联系手机号</p>
	            <p class="tip">注意：该手机号必须与申领信用卡的手机号一致，否则将无法获得奖励！</p>
	            <div class="group">
	            	<input type="tel" id="phoneNo" maxlength="11" placeholder="请输入手机号" />
	            	<p class="error-msg" id="phoneNoMsg"></p>
	            </div>
	            <div class="group">
	            	<input type="text" id="verifyCode" placeholder="请输入验证码" />
	            	<div class="fs14 btn active" id="verifyCodeBtn">获取验证码</div>
	            	<p class="error-msg" id="verifyCodeMsg"></p>
	            </div>
	        </div>
	        <div class="modal-footer">
				<div class="fs14 btn" id="submitBtn">确定</div>
	        </div>
	    </div>
	</div>
	<script src="https://m.taofen8.com/js/jquery-2.1.4.min.js"></script>
	<script src="/js/cmbc_creditcard_cardpage.js"></script>
</body>
</html>