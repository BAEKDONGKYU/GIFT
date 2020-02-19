<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<!--================ 탭 링크 =================-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>giftU: 로그인</title>
<link rel=" shortcut icon" href="../img/favi.ico">
<link rel="icon" href="img/favi.ico">

<!--================ CSS및 링크 =================-->
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/login.js"></script>


<style type="text/css">
@font-face {
	font-family: 'S-CoreDream-4Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'S-CoreDream-6Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.purple {
	font-family: 'S-CoreDream-4Regular';
	font-weight: 800;
	font-size: 0.85em;
	width: 700px;
	margin: 0 auto;
	margin-top: 20px;
}

.mypage {
	font-size: 3em;
	color: black;
	font-weight: 900;
	font-family: 'S-CoreDream-6Bold';
}

.login_form_inner {
	padding-top: 50px !important;
	width: 700px;
	margin: 0 auto;
	border: dotted red 1px;
	border-radius: 30px;
	margin-bottom: 40px;
	font-family: 'S-CoreDream-4Regular';
	color: black;
}

.center {
	margin-left: 80px;
}

.center a {
	color: black !important;
	font-weight: 600;
}

.center a:HOVER {
	color: red !important;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#f-option2").click(function() {
			if ($("#f-option2").is(":checked"))
				alert("개인 컴퓨터에서만 저장하시길 바랍니다. 보안의 위험이 있습니다!!!");
		});
	});
</script>
</head>
<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp" />
	<!--================ 헤더 끝 =================-->

	<!--================로그인창 =================-->
	<p class="purple">
		<span class="mypage">LOGIN</span>&nbsp;&nbsp;가장 특별한 선물을 발견할 수 있는 공간,
		기프트유 <span style="color: red;"><i class="fab fa-gratipay"></i></span>
	</p>

	<div class="container">

		<div class="login_form_inner">
			<form class="row login_form" id="contactForm" method="post"
				action="${contextPath}/member/checkLogin.do">
				<div class="col-md-12 form-group">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="아이디" onfocus="this.placeholder = ''"
						onblur="this.placeholder = '아이디'">
				</div>
				<div class="col-md-12 form-group">
					<input type="password" class="form-control" id="pass" name="pass"
						placeholder="패스워드" onfocus="this.placeholder = ''"
						onblur="this.placeholder = '패스워드'">
				</div>
				<div class="col-md-12 form-group">
					<div>
						<p id="login_check_message"></p>
					</div>
					<div class="creat_account">
						<input type="checkbox" id="f-option2" name="selector"> <label
							for="f-option2">로그인 상태 유지</label>
					</div>
				</div>
				<div class="col-md-12 form-group">
					<button type="button" class="button button-login w-100"
						id="login_button">로그인</button>
					<span class="center"> 
						<a href="${contextPath}/member/findId.do" style="float: left; margin-left: 50px;">아이디 찾기 /&nbsp;</a>
						<a href="${contextPath}/member/findPw.do" style="float: left">비밀번호 찾기 /&nbsp;</a>
						<a href="${contextPath}/member/memberForm.do" style="float: left">회원가입 </a>
					</span>
				</div>
			</form>
		</div>
	</div>



	<!--================ 푸터 =================-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ 푸터 끝=================-->

</body>
</html>