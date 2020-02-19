<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    
  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog</title>
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
<style type="text/css">
	#c{
		color: #384aeb;
	}
</style>

</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->


	<!--================ 상단 배너, 카테고리 별 보기 =================-->
	<jsp:include page="../qna_notice/category.jsp"></jsp:include>
	<!--================ 상단 배너, 카테고리 별 보기 =================-->

	<!--================Blog Area =================-->
	<section class="section-margin--small" style="margin-top: 0px;">
		<article style="height: auto;">
		<form action="${contextPath}/notice/updateProNotice.do?num=${num}&pageNum=${pageNum}" method="post" enctype="multipart/form-data">
			<table id="notice" align="center" style="width:900px; line-height: 30px;">
				<tr style="background-color:#f9f9f9; border-top: 1px solid #e3e3e3;">
					<td style="padding-left: 30px; height: 70px;">
						<!-- <select name="multi"> -->
						<c:if test="${notice.multi == 0}">
							<!-- <option value="0" selected>공지사항</option>
							<option value="1">이벤트</option> -->
							<input type="text" class="form-control" style="width: 100px;" placeholder="공지사항" readonly>
							<input type="hidden" name="multi" value="0">
						</c:if>
						<c:if test="${notice.multi == 1}">
							<!-- <option value="0">공지사항</option>
							<option value="1" selected>이벤트</option> -->
							<input type="text" class="form-control" style="width: 100px;" placeholder="이벤트" readonly>
							<input type="hidden" name="multi" value="1">
						</c:if>
						<!-- </select> -->
					</td>
				</tr>
				<tr>
					<td align="left" style="font-size: 30px; height: 70px; padding: 0 30px 0 30px;
						background-color:#f9f9f9;">
						<input type="text" name="subject" class="form-control" placeholder="제목" value="${notice.subject}">
					</td>
				</tr>
				<tr style="height:auto; border-top: 1px solid #e3e3e3; border-bottom: 1px solid #e3e3e3;">
					<td colspan="2" align="left" style="font-size: 17px;">
					<c:if test="${notice.multi==0}">
						<textarea id="summernote" name="message">${notice.message}</textarea>
					</c:if>
					<c:if test="${notice.multi==1}">
						<textarea rows="10" cols="110" name="message">${notice.message}</textarea>
					</c:if>
					</td>
				</tr>
				<tr>
					<td>
					<c:if test="${notice.multi==1}">
						<b>배너<input type="file" name="banner"></b>
						<input type="text" name="rebanner" value="${notice.banner}"><br>
						<b>이벤트<input type="file" name="file"></b>
						<input type="text" name="refile" value="${notice.file}">
					</c:if>
					</td>
				</tr>
			</table>
			<div id="table_search" align="right" style="width: 74%; margin-top: 20px; margin-bottom: 30px;">
				<input type="button" value="취소" class="button button--active button-contactForm" onclick="location.href='viewNotice.do?num=${notice.num}&pageNum=${pageNum}'">
				<input type="submit" value="공지사항 수정 완료" class="button button--active button-contactForm">
			</div>
		</form>
		</article>
	</section>
	<!--================Blog Area =================-->



	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->
	
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

	</script>

</body>
</html>