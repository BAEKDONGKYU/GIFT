<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--================ 헤더링크 =================-->
<jsp:include page="links.jsp"></jsp:include>
<!--================ 헤더링크 끝=================-->

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%--컨텍스트 패스 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- ================ 채널톡 플러그인================= -->
<script>
	(function() {
		var w = window;
		if (w.ChannelIO) {
			return (window.console.error || window.console.log || function() {
			})('ChannelIO script included twice.');
		}
	var d = window.document;
		var ch = function() {
			ch.c(arguments);
		};
		ch.q = [];
		ch.c = function(args) {
			ch.q.push(args);
		};
		w.ChannelIO = ch;
		function l() {
			if (w.ChannelIOInitialized) {
				return;
			}
			w.ChannelIOInitialized = true;
			var s = document.createElement('script');
			s.type = 'text/javascript';
			s.async = true;
			s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
			s.charset = 'UTF-8';
			var x = document.getElementsByTagName('script')[0];
			x.parentNode.insertBefore(s, x);
		}
		if (document.readyState === 'complete') {
			l();
		} else if (window.attachEvent) {
			window.attachEvent('onload', l);
		} else {
			window.addEventListener('DOMContentLoaded', l, false);
			window.addEventListener('load', l, false);
		}
	})();
	ChannelIO('boot', {
		"pluginKey" : "d3b0abba-357b-4848-abaf-192115f00660"
	});
</script>
<!-- ================ 채널톡 플러그인 끝================= -->

<!--================ 할인 이벤트 팝업창 =================-->
<script type="text/javascript">
	$(document).ready(function() {
		var result = getCookie('popup');
		if (result == 'end') {
			$("#popup").css("display", "none");
		}
	})

	//팝업창에서 '오늘 그만보기' 클릭시 종료하고 쿠키를 삽입하는 함수
	function noshow() {
		setCookie("popup", "end", 1);
		$("#popup").css("display", "none");
	}

	//쿠키 셋팅하기 
	function setCookie(cookie_name, value, days) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + days);

		var cookie_value = escape(value)
				+ ((days == null) ? '' : ';    expires=' + exdate.toUTCString());

		document.cookie = cookie_name + '=' + cookie_value;
	}

	//쿠키 가져오기 
	function getCookie(cookie_name) {
		var x, y;
		var val = document.cookie.split(';');
		for (var i = 0; i < val.length; i++) {

			x = val[i].substr(0, val[i].indexOf('='));
			y = val[i].substr(val[i].indexOf('=') + 1);
			x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기

			if (x == cookie_name) {
				return unescape(y); // unescape로 디코딩 후 값 리턴
			}
		}
	}

	function CheckForm() {

		if ($("select[name=event]").val() == null) {
			alert("이벤트를 선택해주세요");
			return false;
		}

		if ($("select[name=gender]").val() == null) {
			alert("성별을 선택해주세요");
			return false;
		}

		if ($("select[name=age]").val() == null) {
			alert("나이를 선택해주세요");
			return false;
		}

		if ($("select[name=price]").val() == null) {
			alert("가격대를 선택해주세요");
			return false;
		}

	}
</script>
<style type="text/css">
#a {
	color: #384aeb;
}

#quick_menu {
	width: 30px;
	text-align: center;
	position: absolute;
	top: 100px;
	right: -96px;
}

@font-face {
	font-family: 'S-CoreDream-8Heavy';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-8Heavy.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.main {
	width: 100%;
	height: 600px;
	background-color: #f1f6f7;
}

.a {
	background-image: url( "../img/home/hero-banner.png" );
	background-repeat: no-repeat;
	background-position: -40px;
	height: auto;
}

.subscribe-form {
	font-family: 'S-CoreDream-8Heavy'
}

.section-margin.calc-60px {
	margin: 0px 0 70px 0;
}
</style>

</head>
<body>
	<!--================ 할인 이벤트 팝업창 =================-->
	<div id="popup" style="background-color: #faece8;">
		<MARQUEE scrollamount="3">
			<span id="event_span">♥기프트유 이달의 이벤트♥</span>
		</MARQUEE>
		<div>
			<img src="../img/popup1.png" id="pop1" width="50%"><img
				src="../img/popup2.png" width="50%">
		</div>
		<div id="noshow" onclick="noshow()">
			<input type="checkbox"> 오늘 그만보기
		</div>
	</div>
	<!--================ 할인 이벤트 팝업창 끝=================-->

	<!--================ 디데이 알람 시작 =================-->
	<jsp:include page="../main/dday.jsp" />
	<!--================ 디데이 알람 끝 =================-->

	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp" />
	<!--================ 헤더 끝 =================-->



	<!--================ 메인 검색 배너 =================-->
	<div class="main a">
		<div
			style="width: auto; height: 600px; margin: 0 auto; text-align: center; padding: 180px; margin-left: 150px; opacity: 0.8;">
			<h3 class="subscribe__title title">
				<span class="purple">기프트유</span> 에서는 선물하는 대상과 <br>상황에 따라 알맞는
				제품을 추천해드립니다.
			</h3>
			<p class="noto">아래의 버튼을 이용하여 항목을 선택해주시면 선물을 찾아드려요 :)</p>

			<div id="mc_embed_signup" style="width: 1000px; margin: 60px auto;">
				<form action="${contextPath}/product/ProductSearchController.do"
					class="subscribe-form form-inline" onsubmit="return CheckForm();">
					<input type="hidden" value="${id }" name="id">
					<div class="form-group ml-sm-auto">
						<select name="event" id="event">
							<option value="" disabled selected>이벤트를 선택해주세요</option>
							<option value="생일">생일</option>
							<option value="발렌타인데이">발렌타인데이</option>
						</select> <select name="gender" id="">
							<option value="" disabled selected>성별을 선택해주세요</option>
							<option value="woman">여성</option>
							<option value="man">남성</option>
							<option value="nomatter">관계없음</option>
						</select> <select name="age" id="">
							<option value="" disabled selected>연령대를 선택해주세요</option>
							<option value="10">10대</option>
							<option value="20">20대</option>
							<option value="30">30대</option>
							<option value="40">40대</option>
							<option value="50">50대 이상</option>
						</select> <select name="price" id="">
							<option value="" disabled selected>금액대를 선택해주세요</option>
							<option value="0">1만원 미만</option>
							<option value="10000">1만원이상 ~ 2만원 미만</option>
							<option value="20000">2만원이상 ~ 3만원 미만</option>
							<option value="30000">3만원이상 ~ 4만원 미만</option>
							<option value="40000">4만원 이상~</option>
						</select>
					</div>

					<input class="button button-subscribe" type="submit"
						value="내가 찾던 선물 보러가기">
				</form>
			</div>
		</div>
	</div>


	<!-- ================ 메인 검색 배너 끝================= -->

	<!-- ================ 베스트 상품 영역================= -->
	<div class="container">
		<div class="section-intro pb-60px">
			<p>&nbsp;</p>
			<br> <br>
			<h2>
				<span class="purple">BEST</span> <span class="section-intro__style">Product</span>
			</h2>
		</div>
		<c:if test="${list != null }">
			<div class="owl-carousel owl-theme hero-carousel">
				<c:forEach items="${list}" var="list">
					<div class="hero-carousel__slide">
						<img src="../upload/${list.filename }" alt="" width="300"
							height="350"> <a
							href="${contextPath}/product/viewDetail.do?num=${list.num}&id=${id}&event=${list.event}&filename=${list.filename}"
							class="hero-carousel__slideOverlay">
							<h3>${list.name }</h3>
							<p>${list.price }</p>
						</a>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${list == null }">
			<div class="owl-carousel owl-theme hero-carousel">
				<h1>상품이 존재하지 않습니다.</h1>
			</div>
		</c:if>
	</div>

	<div id="quick_menu"
		style="width: auto; height: auto; margin-left: -100px; margin-right: 100px; padding-top: 10px; border-radius: 8px; border: solid lightgrey 1px; background-color: white">
		<p class="eye">
			<i class="fas fa-eye"></i> 최근 본 상품
		</p>
		<ul>
			<%
				Cookie[] c = request.getCookies();

				if (c != null) {
					if (c.length >= 4) {
						for (int i = c.length - 1; i >= c.length - 3; i--) {
							String cName = c[i].getName();
							if (cName.indexOf("item") != -1) {
								String value = c[i].getValue();
								String cValue = URLDecoder.decode(value, "UTF-8");
								System.out.println(cValue);
			%>
			<li>
				<a href="${contextPath}/product/viewPro.do?filename=<%=cValue%>"> 
					<img src="../upload/<%=cValue%>" style="width: 100px; height: 100px;" />
				</a>
			</li>
			<%
				}
						}
					} else {
						for (int i = 0; i < c.length; i++) {
							String cName = c[i].getName();
							if (cName.indexOf("item") != -1) {
								String value = c[i].getValue();
								String cValue = URLDecoder.decode(value, "UTF-8");
								System.out.println(cValue);
			%>
			<li>
				<a href="${contextPath}/product/viewPro.do?filename=<%=cValue%>">
					<img src="../upload/<%=cValue%>" style="width: 100px; height: 100px;" />
				</a>
			</li>
			<%
				}
						}
					}

				}
			%>
		</ul>
	</div>
	<!-- ================ 베스트 상품 영역 끝================= -->

	<!-- ================ 이벤트 배너 영역 ================= -->
	<div class="container" style="margin-top: 50px;">
		<img alt="event" src="../img/valen.png" width="100%"> <br>
		<br>
	</div>
	<!-- ================ 이벤트 배너 영역 끝================= -->

	<!--================ 푸터 =================-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!--================ 푸터 끝=================-->
</body>
</html>