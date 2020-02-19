
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>    

<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");

%>
    
<%--컨텍스트 패스 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Login</title>
	<link rel="icon" href="../img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../vendors/linericon/style.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">
    <script type="text/javascript" src="CheckForm.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 

  <link rel="stylesheet" href="../css/style.css">

 	
<style type="text/css">
	#quick_menu {
	width: 95px;
	text-align: center;
	position: absolute;
	top: 100px;
	right: -96px;
}


@font-face { font-family: 'S-CoreDream-4Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-6Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff'); font-weight: normal; font-style: normal; }

.purple {
	font-family: 'S-CoreDream-4Regular';
	font-weight: 800;
	font-size: 0.85em;
	width: 700px;
	margin: 0 auto; 
	margin-top: 80px;
}

.delmem{
	font-size: 3em;
	color: black;
	font-weight: 900;
	font-family: 'S-CoreDream-6Bold';
}

.deletemem_form_inner{
    padding-top: 50px !important;
    width: 700px;
    margin: 0 auto;
    border: dotted red 1px;
    border-radius: 30px;
    margin-bottom: 100px;
    font-family: 'S-CoreDream-4Regular';
    color: black;
    padding-bottom: 50px !important;
}

.password_input{
height: 40px;
    border: none;
    border-bottom: 1px solid #cccccc;
    border-radius: 0px;
    outline: none;
    box-shadow: none;
    font-size: 14px;
    color: #999999;
}

</style>

  <c:choose>		
		
		<c:when test='${requestScope.msg == "pass_confirm"}'>
			<script type="text/javascript">
				//웹브라우저가 body태그영역을 모두 로딩 했을떄...
				window.onload = function(){				
					alert("비밀번호가 맞지않습니다.");
				}				
			</script>
		</c:when> 
	</c:choose>
  
</head>
<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp"/>
	<!--================ 헤더 끝 =================-->
  
  

<p class="purple"><span class="delmem">회원탈퇴</span>&nbsp;&nbsp;가장 특별한 선물을 발견할 수 있는 공간, 기프트유 <span style="color: red;"><i class="fab fa-gratipay"></i></span></p>

 <div class="container">
 	<div class="deletemem_form_inner">
		<form action="${contextPath}/member/delmem.do?id=<%=id %>" method="post" class="delform">
			<div align="center">
					<div align="center" style="width:700px;">
						<input type="text" value="<%=id %>" readonly="readonly" name="id" style=" border : 0px; width: 100px; " >님<br>
						<p><strong><font color="red">탈퇴</font></strong>를 진행하면 다시 <strong><font color="red">복구하실수 없습니다.</font></strong><br>
						회원탈퇴를 진행하시려면 비밀번호를 입력하세요.</p>
						비밀번호 입력:<input type="password" class="password_input" id="pass" name="pass"  >
						
				
						<input type="submit" value="탈퇴하기" class="button button-tracking">
					</div>
				</div>
	
			</form>
		</div>
	</div>
		





	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->



</body>
</html>