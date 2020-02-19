<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#d {
	color: #384aeb;
}
</style>

<!--================ 그외  =================-->
<script type="text/javascript" src="CheckForm.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	function post_number() {

		new daum.Postcode(
				{
					oncomplete : function(data) {

						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {

							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_address").value = addr;
						document.getElementById("sample4_detailAddress")
								.focus();
					}
				}).open();

	}
</script>
<style>
</style>

</head>
<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp" />
	<!--================ 헤더 끝 =================-->

	<!--================ 마이페이지 메뉴 =================-->
	<p class="purple">
		<span class="mypage">MY PAGE</span>&nbsp;&nbsp;회원정보 수정 및 탈퇴
	</p>

	<!--================ 레지스터헤드 시작 =================-->
	<jsp:include page="../register/Register_Main.jsp" />
	<!--================ 레지스터헤더 끝 =================-->


	<!--================회원정보 수정창 =================-->
	<div class="register_form_in">
		<form class="row register_form"
			action="${contextPath}/member/memberModi_info.do?id=${memInfo.id}"
			method="post">


			<div class="register_lg_1 register-group" style="margin-top: 20px;">
				<h5 class="mini" style="color: #f54245; text-align: center;">
					필수항목 <i class="fas fa-portrait"></i>
				</h5>

				<label>아이디</label> <input type="text" class="register-control"
					id="id" name="id" readonly="readonly" value="${memInfo.id}">
			</div>

			<div class="register_lg_1 register-group" id="pass_hidden">

				<label>비밀번호</label> <input type="password" class="register-control"
					id="pass" name="pass" style="width: 300px;" value="${memInfo.pass}">

			</div>

			<div class="register_lg_1 register-group">

				<label>이름</label> <input type="text" class="register-control"
					id="name" name="name" value="${memInfo.name}">

			</div>
			<div class="register_lg_1 register-group">
				<label>이메일</label> <input type="text" id="email" name="email"
					value="${memInfo.email}">

			</div>
			<div class="register_lg_1 register-group">
				<label>주소 </label> <input type="text" id="sample4_postcode"
					name="address" placeholder="우편번호" value="${memInfo.address}">
				<button onclick="post_number();"
					style="width: 140px; height: 40px; margin-left: 15px; padding: 0;"
					class="button button-tracking">우편번호 검색</button>
				<br> <input type="text" id="sample4_address" name="address_2"
					value="${memInfo.address_2}"> <input type="text"
					id="sample4_detailAddress" name="address_3"
					value="${memInfo.address_3}">


			</div>
			<div class="register_lg_1 register-group">
				<label>휴대폰 번호</label> <input type="text" value="010"
					style="text-align: center; width: 90px; margin-left: 4px;">
				- <input type="text" id="tel" name="tel" value="${memInfo.tel}">-
				<input type="text" id="tel_2" name="tel_2" value="${memInfo.tel_2}">

			</div>

			<!--************* 추가입력창(기념일 알람서비스) *************-->
			<div class="register_form_in hr">
				<h5 class="mini"
					style="color: #f54245; text-align: center; margin-top: 20px;">
					선택항목 <i class="far fa-calendar-check"></i>
				</h5>
				<span class="notice"><span class="red"> > </span>기념일을 등록하시면
					일주일 전부터 팝업창으로 알람을 띄워드립니다.</span><br> <br>
				<div class="register_lg_1 register-group">
					<label>기념일 1</label> <input type="text" placeholder="기념일명을 입력"
						id="dday_1" name="dday_1" value="${memInfo.dday_1}"> <input
						type="date" id="ddate_1" name="ddate_1" value="${memInfo.ddate_1}">
				</div>
				<div class="register_lg_1 register-group">
					<label>기념일 2</label> <input type="text" placeholder="기념일명을 입력"
						id="dday_2" name="dday_2" value="${memInfo.dday_2}"> <input
						type="date" id="ddate_2" name="ddate_2" value="${memInfo.ddate_2}">
				</div>
				<div class="register_lg_1 register-group">
					<label>기념일 3</label> <input type="text" placeholder="기념일명을 입력"
						id="dday_3" name="dday_3" value="${memInfo.dday_3}"> <input
						type="date" id="ddate_3" name="ddate_3" value="${memInfo.ddate_3}">
				</div>

				<span class="notice"><span class="red"> > </span>위와 같이 회원정보를
					수정하시겠습니까? 수정버튼을 누르시면 수정이 완료됩니다.</span><br>
				<div class="register_lg_1 register-group" style="margin-top: 30px;">
					<button type="submit" class="button button-tracking"
						style="width: 18%; margin-left: -30px;">수정</button>
					<button type="reset" class="button button-tracking btn_r"
						style="width: 18%; margin-left: 30px; background-color: #dae0e5; color: #384aeb; border: #dae0e5;"
						onclick="location.href='memberInfo.do?id=${memInfo.id}'">취소</button>
				</div>
			</div>
		</form>

	</div>



	<!--================ 푸터 =================-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ 푸터 끝=================-->

</body>
</html>