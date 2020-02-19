<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 패스 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<!--================ 탭 링크 =================-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>giftU: 마이페이지</title>
<link rel=" shortcut icon" href="../img/favi.ico">
<link rel="icon" href="img/favi.ico">

<!--================ CSS및 폰트링크 =================-->
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../register/register.css">
<style type="text/css">
#d{
	color: #384aeb;
}
</style>

<!--================ 그외  =================-->
<script type="text/javascript" src="CheckForm.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--================ 회원정보 수정 체크  =================-->
<c:choose>
	<c:when test='${requestScope.msg == "modified"}'>
		<script type="text/javascript">
			//웹브라우저가 body태그영역을 모두 로딩 했을떄...
			window.onload = function() {
				alert("회원 정보를 수정 했습니다.");
			}
		</script>
	</c:when>
	<c:when test='${requestScope.msg == "deleted"}'>
		<script type="text/javascript">
			//웹브라우저가 body태그영역을 모두 로딩 했을떄...
			window.onload = function() {
				alert("회원 정보를 삭제 했습니다.");
			}
		</script>
	</c:when>
</c:choose>
</head>

<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp" />
	<!--================ 헤더 끝 =================-->

	<!--================ 회원정보 수정창=================-->
	<p class="purple">
		<span class="mypage">MY PAGE</span>&nbsp;&nbsp;회원정보 수정 및 탈퇴
	</p>
	<%--session영역에 id값이 저장되어 있지 않다면 회원정보가 등록되어 있지 않은 것이므로 로그인/회원가입창으로 안내 --%>
	<c:choose>
		<c:when test="${id == null}">
			<div class="register_form_in">
				<div class="row register_form">
					<table class="register_lg_1">
						<tr>
							<td colspan="5" style="padding-top: 50px;"><b>등록된 회원정보가
									없습니다. <br> <span class="red">로그인/회원가입</span>을 진행해주세요.
							</b>
								<div class="register_lg_1 register-group"
									style="margin-top: 50px; margin-bottom: 35px;">
									<button type="button" class="button button-tracking"
										style="width: 22%; margin-left: -30px; margin-right: 20px;"
										onclick="location.href='../login/login.jsp'">로그인</button>
									<button type="button" class="button button-tracking"
										style="width: 22%; margin-left: -20px;"
										onclick="location.href='${contextPath}/register/register.jsp'">회원가입</button>
								</div></td>
						</tr>
					</table>
				</div>
			</div>
		</c:when>
		<%--session영역에 id값이 저장되어 있다면 등록된 회원정보 불러오기 --%>
		<c:when test="${id != null }">

			<!--================ 레지스터헤드 시작 =================-->
			<jsp:include page="../register/Register_Main.jsp" />
			<!--================ 레지스터헤더 끝 =================-->

			<div class="register_form_in">
				<div class="row register_form">
					<span class="notice"><span class="red"> > </span>${id}님의 현재
						정보는 아래와 같습니다.</span><br>
					<table class="info table-bordered">
						<tr>
							<td colspan="6" class="info_title">쿠 폰 목 록</td>
						</tr>
						<tr>
							<th width="250">쿠폰 명</th>
							<th>할인</th>
							<th>적용 범위</th>
							<th>사용기한</th>
							<th>조건</th>
						</tr>
						<c:forEach var="coupon" items="${couponsList}">
							<tr>
								<td>${coupon.subject}</td>
								<td>${coupon.percent}%</td>
								<c:if test="${coupon.multi == 0}">
									<td>일부상품</td>
								</c:if>
								<c:if test="${coupon.multi == 1}">
									<td>전체상품(일부제외)</td>
								</c:if>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.day1}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.day2}"/></td>
								<td>${coupon.price}원이상</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</c:when>
	</c:choose>
	<!--================ 푸터 =================-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ 푸터 끝=================-->

</body>
</html>