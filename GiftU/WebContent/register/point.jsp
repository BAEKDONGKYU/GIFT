<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 패스 주소 얻기 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
							<td colspan="4" class="info_title">적 립 금</td>
						</tr>
						<tr align="left">
							<td colspan="2" style="border-bottom: 0; font-size: 15px; padding: 10px 0 0 50px; border-right: 0px;">현재 적립금</td>
							<td colspan="2" rowspan="2" style="border-left: 0px;">-상품 구매 시 적립됩니다.<br>-후기 작성시 추가로 적립됩니다.<br>-상품금액의 10%까지 사용 가능합니다.</td>
						</tr>
						<tr align="left">
							<td colspan="2" style="border-top: 0; font-size: 30px; padding-left: 50px; border-right: 0px;">${total}원</td>
						</tr>
						<tr>
							<th>상태</th>
							<th>금액</th>
							<th>내용</th>
							<th>적립일자</th>
						</tr>
					<c:forEach var="point" items="${pointList}">
						<tr>
						<c:if test="${point.betwen == '+'}">
							<td style="color:blue;">적립</td>
						</c:if>
						<c:if test="${point.betwen == '-'}">
							<td style="color:red;">사용</td>
						</c:if>	
						
							<td>${point.point}원</td>
							<td>${point.content}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${point.day}"/></td>
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