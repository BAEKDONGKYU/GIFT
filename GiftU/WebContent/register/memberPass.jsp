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

function PassCheck(){
	
	var pass = document.getElementById("pass");
	var pass1 = document.getElementById("pass1");
	var pass2 = document.getElementById("pass2");
	
	var pattern1 = /[0-9]/;
    var pattern2 = /[a-zA-Z]/;
    var pattern3 = /[~!@\#$%<>^&*]/;
	

	if(pass.value == ""){
		alert("기존 비밀번호를 입력하지 않았습니다.");
		pass.select();
		return
	}
	if(pass1.value == ""){
		alert("변경 할 비밀번호를 입력하지 않았습니다.");
		pass1.select();
		return
	}
	if(pass2.value == ""){
		alert("비밀번호 확인을 입력하지 않았습니다.");
		pass2.select();
		return
	}
	
	if (!pattern1.test(pass1.value) || !pattern2.test(pass1.value)
			|| !pattern3.test(pass1.value) || pass1.value.length < 8
			|| pass1.value.length > 10) {

		alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
		pass1.select();
		return;

	}
	if (pass1.value != pass2.value){
		 alert("비밀번호가 일치하지 않습니다");
		 pass1.select();
	 	 return;
	}
	 
	$("#PassForm").submit();
}

</script>

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
		<form id="PassForm" class="row register_form"
			action="${contextPath}/member/memberPass_info.do?id=${id}"
			method="post">

			<div class="register_lg_1 register-group" style="margin-top: 20px; margin-bottom: 50px;">
				<h5 class="mini" style="color: #f54245; text-align: center; margin-bottom: 50px;">
					비밀번호 변경 <i class="fas fa-portrait"></i>
				</h5>
				<div></div>
				<label>기존 비밀번호</label> 
				<input type="password" class="register-control" id="pass" name="pass">
			</div>
			
			<div class="register_lg_1 register-group">

				<label>변경 비밀번호</label> <input type="password" class="register-control" id="pass1" name="pass1">
			</div>
			
			<div class="register_lg_1 register-group">
				<label>비밀번호 확인</label> <input type="password" class="register-control" id="pass2" name="pass2">
			</div>
			


			<span class="notice" style="margin-top:100px;"><span class="red"> > </span>위와 같이 회원정보를
				수정하시겠습니까? 수정버튼을 누르시면 수정이 완료됩니다.</span> <br>
			<div class="register_lg_1 register-group" style="margin-top: 30px;">
				<button type="button" class="button button-tracking"
					style="width: 18%; margin-left: -30px;" onclick="PassCheck();">수정</button>
				<button type="reset" class="button button-tracking btn_r"
					style="width: 18%; margin-left: 30px; background-color: #dae0e5; color: #384aeb; border: #dae0e5;"
					onclick="location.href='memberInfo.do?id=${id}'">취소</button>
			</div>
		</form>

	</div>



	<!--================ 푸터 =================-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ 푸터 끝=================-->

</body>
</html>