<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--컨텍스트 패스 주소 얻기 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>

<!--================ 탭 링크 =================-->

<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>giftU: 회원가입</title>
  	<link rel=" shortcut icon" href="../img/favi.ico">
	<link rel="icon" href="img/favi.ico">
	
<!--================ CSS및 폰트링크 =================-->		
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet"
	href="../vendors/themify-icons/themify-icons.css">
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

 <!--================ 회원가입 유효성 체크 =================-->	
    <script type="text/javascript" src="CheckForm.js"></script>
    
 <!--================ 우편번호 API =================-->	
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
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
								}
								document.getElementById('sample4_postcode').value = data.zonecode;
								document.getElementById("sample4_address").value = addr;
								document
										.getElementById("sample4_detailAddress")
										.focus();
							}
						}).open();
			}
		</script>



<style>
@font-face {
	font-family: 'Binggrae-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face { font-family: 'S-CoreDream-4Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-6Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff'); font-weight: normal; font-style: normal; }

.register_form_in {
	box-shadow: 0px 10px 40px 0px rgba(56, 74, 235, 0.1);
	text-align: center;
	padding-top: 70px;
	border-top: solid 2px #f54245; 
	width: 800px;
	margin: 0 auto; 
	margin-bottom: 0px;
}

.big{
	margin-bottom: 50px;
}

.register_form_in h3 {
	color: #222;
	text-transform: uppercase;
	font-size: 25px;
	margin-bottom: 60px;
	margin-top: -30px;
}

.register_form_in .register_form {
	max-width: 800px;
	margin: auto;
	font-family: 'S-CoreDream-4Regular';
}

.register_lg_1 {
	-ms-flex: 0 0 100%;
	flex: 0 0 100%;
	max-width: 100%
}

.register-group {
	margin-bottom: 1.5em;
	margin-left: 2em;
}

.register-group label {
	margin-left: -70px;
	width: 100px;
	text-align: left;
	margin-right: 40px;
	color: black;
}

.register-control {
	display: inline;
	width: 300px;
	height: calc(2.25rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

#tel, #tel_2 {
	width: 90px;
	height: 40px;
	border: none;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
	outline: none;
	box-shadow: none;
	font-size: 14px;
	color: #999999;
	text-align: center;
}

#email {
	width: 300px;
	height: 40px;
	border: none;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
	outline: none;
	box-shadow: none;
	font-size: 14px;
	color: #999999;
}

#sample4_postcode {
	width: 140px;
	height: 40px;
	border: none;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
	outline: none;
	box-shadow: none;
	font-size: 14px;
	color: #999999;
}

#sample4_address, #sample4_detailAddress, #sample4_extraAddress {
	width: 300px;
	height: 40px;
	border: none;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
	outline: none;
	box-shadow: none;
	font-size: 14px;
	color: #999999;
	display: block;
	margin-left: 285px;
	margin-top: 5px;
}

.register_form .register-group input {
	height: 40px;
	border: none;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
	outline: none;
	box-shadow: none;
	font-size: 14px;
	color: #999999
}

.btn_r:hover {
	background: white !important;
	color: black !important;
	border: 1px solid #dae0e5 !important
}

.mini {
	font-family: 'Binggrae-Bold';
}

label {
	font-weight: 700;
}

.hr {
	border-top: dotted 1px #f54245 !important;
}


.signbtn {
	width: 370px;
	float: left;
	padding: 8px;
	border: none;
	font-family: 'Binggrae-Bold';
	color: white;
	margin-bottom: 30px;
}

.signbtn:HOVER {
	opacity: 0.8;
}

.purple {
	font-family: 'S-CoreDream-4Regular';
	margin-left: 150px;
	font-weight: 800;
	width: 800px;
	margin: 0 auto;
}

.signup{
	font-size: 3em;
	color: black;
	font-weight: 900;
	font-family: 'S-CoreDream-6Bold';
}

p{
	font-size: 0.9em;
}
</style>
</head>

<body><!--================ 헤더 시작 =================-->
<jsp:include page="../main/header.jsp" />
<!--================ 헤더 끝 =================-->

<!-- ================ start banner area ================= -->
<div class="big">

				<p class="purple">
					<span class="signup">SIGN UP</span><br>
					기프트유의 회원의 되어 다양한 혜택을 누려보세요<i class="far fa-smile"></i>
				</p>
				<div class="row">
				
				<div class="register_form_in">
				<form class="row register_form"
					action="${contextPath}/member/insertMember.do" id="register_form"
					name="register_form" onsubmit="return CheckForm();">
					<div class="register_lg_1 register-group">
						<label>아이디</label> <input type="text" class="register-control"
							id="id" name="id" placeholder="User ID" style="width: 170px;"
							required="required">
						<button id="id_check" onclick="IDCheck();"
							style="width: 100px; height: 40px; margin-left: 20px; padding: 0;"
							class="button button-tracking">중복 확인</button>
					</div>

					<div class="register_lg_1 register-group">
						<label>비밀번호</label> <input type="password"
							class="register-control" id="pass" name="pass"
							placeholder="영문/숫자/특수기호 8자리 이상" required="required">
					</div>
					<div class="register_lg_1 register-group">
						<label>비밀번호 확인</label> <input type="password"
							class="register-control" id="pass_2" name="pass_2"
							placeholder="비밀번호를 재입력해주세요" required="required">
					</div>

					<div class="register_lg_1 register-group">
						<label>이름</label> <input type="text" class="register-control"
							id="name" name="name" placeholder="이름" required="required">
					</div>
					<div class="register_lg_1 register-group">
						<label>이메일</label> <input type="text" class="register-control"
							id="email" name="email" placeholder="이메일" required="required">
					</div>

					<div class="register_lg_1 register-group">
						<label>주소 </label> <input type="text" class="register-control"
							id="sample4_postcode" name="address" placeholder="우편번호"
							required="required">
						<button onclick="post_number();"
							style="width: 140px; height: 40px; margin-left: 15px; padding: 0;"
							class="button button-tracking">우편번호 검색</button>
						<br> <input type="text" class="register-control"
							id="sample4_address" name="address_2" placeholder="주소"
							required="required"> <input type="text"
							class="register-control" id="sample4_detailAddress"
							name="address_3" placeholder="상세주소" required="required">
					</div>

					<div class="register_lg_1 register-group">
						<label>휴대폰 번호</label> <input type="text" class="register-control"
							value="010"
							style="text-align: center; width: 90px; margin-left: 4px;">
						- <input type="text" class="register-control" id="tel" name="tel"
							required="required"> - <input type="text"
							class="register-control" id="tel_2" name="tel_2"
							required="required">
					</div>


					<!--************* 추가입력창(기념일 알람서비스) *************-->
					<div class="register_form_in hr">
						<h5 class="mini"
							style="color: #f54245; text-align: center; margin-top: -30px;">
							선택항목 <i class="far fa-calendar-check"></i>
						</h5>
						<p>기념일을 등록해두시면 일주일 전부터 팝업창으로 알려드려요!</p>
						<br>
						<div class="register_lg_1 register-group">
							<label>기념일 1</label> 
							<input type="text" placeholder="기념일명을 입력" id="dday_1" name="dday_1"> 
							<input type="date" id="ddate_1" name="ddate_1">
						</div>
						<div class="register_lg_1 register-group">
							<label>기념일 2</label>
							<input type="text" placeholder="기념일명을 입력" id="dday_2" name="dday_2"> 
							<input type="date" id="ddate_2" name="ddate_2">
						</div>
						<div class="register_lg_1 register-group">
							<label>기념일 3</label>
							<input type="text" placeholder="기념일명을 입력" id="dday_3" name="dday_3"> 
							<input type="date" id="ddate_3" name="ddate_3">
						</div>
					<div class="register_lg_1 register-group" style="margin-top: 50px;">
						<button type="submit" value="submit" class="signbtn"
							style="background-color: #384aeb;">가입</button>
						<button type="reset" value="reset" class="signbtn"
							style="background-color: #f54245;">취소</button>
					</div>
					</div>
				

				</form>
	</div>
					</div>		
	
</div>

<!--================ 푸터 =================-->
<jsp:include page="../main/footer.jsp"></jsp:include>
<!--================ 푸터 끝=================-->

</body>
</html>