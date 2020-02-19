<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="../js/dist/summernote-bs4.css" rel="stylesheet">
<link rel="icon" href="../img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../css/style.css">
<script src="../js/notice.js"></script>

<style type="text/css">
	#c{
		color: #384aeb;
	}
</style>

</head>
<body>
	<!--================ Start Header Menu Area =================-->
		<jsp:include page="../main/header.jsp"/>
	<!--================ End Header Menu Area =================-->

	<!--================ 상단 배너, 카테고리 별 보기 =================-->
	<jsp:include page="../qna_notice/category.jsp"></jsp:include>
	<!--================ 상단 배너, 카테고리 별 보기 =================-->

	<!--================Blog Area =================-->
	<section class="section-margin--small" style="margin-top: 0px;">
		<article style="height: auto;">
		<form action="${contextPath}/notice/addNotice.do" name="add_notice" method="post" enctype="multipart/form-data">
			<table align="center" style="width:900px; line-height: 30px; border-left: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3;">
			
				<tr style="background-color:#f9f9f9; border-top: 1px solid #e3e3e3;">
					<td style="padding-left: 30px; height: 70px;">
						<select id="multi" name="multi">
							<option value="0">공지사항</option>
							<option value="1">이벤트</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="left" style="font-size: 30px; height: 70px; padding: 0 30px 0 30px;
						background-color:#f9f9f9;">
						<input type="text" name="subject" class="form-control" placeholder="제목">
					</td>
				</tr>	
					
				<tr style="height:auto; border-top: 1px solid #e3e3e3; border-bottom: 1px solid #e3e3e3;">
					<!-- 공지사항을 선택했을 때 보여짐 -->
					<td id="message" colspan="2" align="left" style="font-size: 17px; display:none ;">
						<textarea id="summernote" name="message"></textarea>
					</td>
					<!-- 이벤트를 선택했을 때 보여짐 -->
					<td id="msg" colspan="2" align="left" style="font-size: 17px; display: none;">
						<textarea name="msg" rows="5" cols="110" placeholder="이벤트의 버튼 좌표값만 입력해주세요 (예:1159,150,126,345)"></textarea>
						쿠폰 설정 <select id="coupon" name="coupon">
						<option value="0">설정하지 않음</option>
				<c:choose>
					<c:when test="${ListCouponList != null}">
						<c:forEach var="list" items="${ListCouponList}" varStatus="listNum">
							<option value="${list.subject}">${list.num} ${list.subject}</option>
						</c:forEach>
					</c:when>
				</c:choose>
						</select>
					</td>
				</tr>
				
				<tr style="border-bottom: 1px solid #e3e3e3;">
					<td>
						<b id="banner" style="display: none;">배너<input type="file" name="banner"></b>
						<b id="file" style="display: none;">이벤트<input type="file" name="file"></b>
					</td>
				</tr>
			</table>
			<div id="table_search" align="right" style="width: 74%; margin-top: 20px; margin-bottom: 30px;">
				<input type="submit" value="공지사항 등록"
					   class="button button--active button-contactForm">
			</div>
		</form>
		</article>
	</section>

	<!--================ 푸터 영역 =================-->
	<jsp:include page="../main/footer.jsp"/>
	<!--================ 푸터 영역  =================-->
	
	<script>
	
	$(document).ready(function() {

	    $('#summernote').summernote({

	      height: 500,
		  minHeight: null,
		  maxHeight: null,
		  focus: true,
		  lang: 'ko-KR'
	    });
	    
	    
	});
	
	
 	$("#multi").on("change", function () {
		if($(this).val() == 0 || $(this).val() == "0"){
			document.add_notice.msg.value="";
			document.getElementById("message").style.display="block";
			document.getElementById("msg").style.display="none";
			document.getElementById("banner").style.display="none";
			document.getElementById("file").style.display="none";
			
		}else{
			document.getElementById("message").style.display="none";
			document.getElementById("msg").style.display="block";
			document.getElementById("banner").style.display="block";
			document.getElementById("file").style.display="block";
			
		}
	});
	
	

	</script>


</body>
</html>