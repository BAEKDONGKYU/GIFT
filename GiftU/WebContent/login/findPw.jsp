<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>giftU 비밀번호 찾기</title>
	<link rel="icon" href="../img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../vendors/linericon/style.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">
  <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
 	<script src="../js/findPw.js"></script>
</head>
  <c:choose>		
		<c:when test='${requestScope.msg == "email_cancel"}'>
			<script type="text/javascript">
				//웹브라우저가 body태그영역을 모두 로딩 했을떄...
				window.onload = function(){				
					alert("오류로 인해 이메일 발송이 취소 되었습니다.");
				}
			</script>
		</c:when>
		<c:when test='${requestScope.msg == "email_success"}'>
			<script type="text/javascript">
				//웹브라우저가 body태그영역을 모두 로딩 했을떄...
				window.onload = function(){				
					alert("메일을 성공적으로 발송하였습니다.");
				}				
			</script>
		</c:when> 
		
	</c:choose>
<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp"/>
	<!--================ 헤더 끝 =================-->
	
	<!-- 바디 시작  -->
	
	
		<!-- 바디 시작  -->
		
	  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="login_form_inner">
						<h3>비밀번호 찾기</h3>
						<form class="row login_form" id="findPwForm" method="post" action="${contextPath}/member/findPwPro.do">
							<div class="col-md-9 form-group">
								<input type="text" class="form-control" id="p_id" name="p_id" placeholder="아이디를 입력해주세요" 
												onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디를 입력해주세요'"
												style="float : left">
							</div>
							<div class="col-md-3 form-group">
								<input type="button" class="btn btn-info" id ="findButton" value="찾기"
												style="float : left; color: white;">
							</div>
							<p id="resultMessage"></p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
		
		
		

	
	<!-- 바디 끝 -->
	
	
	
	
	
	
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================--> 



  <script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../vendors/skrollr.min.js"></script>
  <script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../vendors/mail-script.js"></script>
  <script src="../js/main.js"></script>
</body>
</html>