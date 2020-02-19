
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<!--================ 탭 링크 =================-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>giftU: 기프트유 안내</title>
<link rel=" shortcut icon" href="../img/favi.ico">
<link rel="icon" href="../img/favi.ico">

<!--================ CSS및 그외 링크 =================-->
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="css/style.css">
</head>
<style type="text/css">

@font-face { font-family: 'S-CoreDream-6Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff'); font-weight: normal; font-style: normal; }

#e{
	color: #384aeb;
}

.signup{


	font-size: 2em;
	color: black;
	font-weight: 900;
	font-family: 'S-CoreDream-6Bold';
}
.span{
	width: 500px;
	margin: 0 auto;
	margin-top: 30px;
}
.center{
	width: 800px;
	margin: 0 auto;
	padding-left: 100px;
}

.para{
	text-align: center;
	font-family: 'S-CoreDream-6Bold';
}

</style>


<script type="text/javascript">

/*폼 전송 전 공백 검사 메서드 */
function checkForm(){
	
	if($("#name").val()==""){
		alert("성함/회사명을 입력하지 않으셨습니다.");
		$("#name").focus();
		return false;
	}else if($("#from").val()==""){
		alert("이메일을 입력하지 않으셨습니다.");
		$("#from").focus();
		return false;
	}else if($("#subject").val()==""){
		alert("제목을 입력하지 않으셨습니다.");
		$("#subject").focus();
		return false;
	}else if($("#message").val()==""){
		alert("내용을 입력하지 않으셨습니다.");
		$("#message").focus();
		return false;
	}else return;
}


</script>

<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp" />
	<!--================ 헤더 끝 =================-->


	<!-- ================ start banner area ================= -->
	<div> 
		<img alt="banner" src="../img/contact_banner.png" width="100%">
	</div>
	<!-- ================ end banner area ================= -->

	<!-- ================ contact section start ================= -->

	<div class="container">
	<div class="span">
		<span class="signup">찾아오시는 길</span>
	</div>
	<div class="d-none d-sm-block mb-5 pb-4">

		<div id="map"
			style="width: 500px; height: 400px; margin-left: auto; margin-right: auto;">

			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3261.9233079762116!2d129.05981581554076!3d35.15853336606691!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568eb65dfc29879%3A0x655be9f8c74938f8!2z7IK87ZWc6rOo65Og6rKM7J207Yq4!5e0!3m2!1sko!2skr!4v1580691945763!5m2!1sko!2skr"
				width="600" height="450" frameborder="0" style="border: 0;"
				allowfullscreen=""></iframe>

		</div>
	</div>

	<div class="center">

		<p class="para">
			자세한 입점 및 제휴 관련 문의는 하단의 폼을 이용하셔서 이메일을 보내주시면 감사하겠습니다. <br> 메일 확인
			후, 관련 사항에 대해서는 개별적으로 답신드리겠습니다.
		</p>


		<form action="SendMail.jsp" class="form-contact contact_form" method="post" id="contactForm" novalidate="novalidate" onsubmit="return checkForm();">
		<input type="hidden" name="to" value="hyerandotcom@gmail.com" id="to">
			<div class="row">
				<div class="col-lg-5">
					<div class="form-group">
						<input class="form-control" name="name" id="name" type="text" placeholder="성함/회사명을 입력해주세요.">
					</div>
					<div class="form-group">
						<input class="form-control" name="from" id="from" type="email" placeholder="이메일을 입력해주세요.">
					</div>
					<div class="form-group">
						<input class="form-control" name="subject" id="subject" type="text" placeholder="제목을 입력해주세요.">
					</div>
				</div>
				<div class="col-lg-7">
					<div class="form-group">
						<textarea class="form-control different-control w-100" name="message" id="message" cols="30" rows="5"
							placeholder="내용을 입력해주세요."></textarea>
					</div>
				</div>
			</div>
			<div class="form-group text-center text-md-right mt-3">
				<button type="submit" class="button button--active button-contactForm">메일 보내기</button>
			</div>
		</form>
	</div>
	</div>

	<!-- ================ contact section end ================= -->





	<jsp:include page="footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->



	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery.form.js"></script>
	<script src="vendors/jquery.validate.min.js"></script>
	<script src="vendors/contact.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
