<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>   

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Blog Details</title>
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


	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="contact">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Question And Answer</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">문의</a></li>
              <li class="breadcrumb-item active" aria-current="page">답변</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	
		<!-- 게시판 -->
	<section class="section-margin--small">
		<article style="height: auto;">
		
		<form action="${contextPath}/boarde/updateProBoard.do" method="post">
			<input type="hidden" name="num" value="${board.num}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<table id="notice" align="center" border="1" style="width: 680px;  line-height: 30px;">
				<tr>
					<td>작성자</td>
					<td><input type="text" class="form-control" name="name" style="width: 335px; height: 28px;" value="${board.name}" readonly></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td><input type="text" class="form-control" name="subject" style="width: 335px; height: 28px;" value="${board.subject}"></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td><textarea name="message" rows="13" cols="30" style="width: 100%;" class="form-control different-control w-100">${board.message}</textarea></td>
				</tr>
			</table>

				<div id="table_search" align="right" style="width: 68%; margin-top: 20px;">
					<input type="submit" value="글수정" class="button button--active button-contactForm">
					<input type="reset" value="다시 작성" class="button button--active button-contactForm">
					<input type="button" value="취소" class="button button--active button-contactForm" onclick="viewboard.do?num=${board.num}&pageNum=${pageNum}'">
					<input type="button" value="글목록" class="button button--active button-contactForm" onclick="location.href='listBoard.do?pageNum=${pageNum}'">
			</div>
		</form>
				
			<div class="clear"></div>
			<div id="page_control">
	
			</div>
		</article>
		<!-- 게시판 -->
	</section>
		<!-- 게시판 -->
		<!--        ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★                           -->
<%--
<section class="section-margin--small">
    <div class="container">
    <article style="height:auto; text-align:center;">
			<h5>[전체 글 개수 : ${count}]</h5>
			<h5></h5>
			<table id="notice" align="center" style="width: 780px;  line-height: 30px;">
				<tr style="background-color: white; cursor: default; border-bottom: 2px solid black; margin-bottom: 5px;">
					<th class="tno" width="50px;" style="text-align: center;">No.</th>
					<th class="tanswer" width="100px;" style="text-align: center;">답변여부</th>
					<th class="ttitle" width="400px;" style="text-align: center;">제목</th>
					<th class="twrite" width="100px;" style="text-align: center;">작성자</th>
					<th class="tdate" width="80px;" style="text-align: center;">날짜</th>
					<th class="tread" width="50px;" style="text-align: center;">조회수</th>
				</tr>
	 <c:choose>
		<c:when test="${boardList != null}" >
			<c:forEach  var="board" items="${boardList}" varStatus="boardNum" >
				<tr onclick="location.href='${contextPath}/boarde/viewboard.do?num=${board.num}&pageNum=${pageNum}'" style="border-bottom: 1px solid black;">
					<td>${board.num}</td>
					<td>
						<c:if test="${board.answer == null}">
							답변 대기중
						</c:if>
						<c:if test="${board.answer != null}">
							<b>답변 완료</b>
						</c:if>
					</td>

					<td class="left">${board.subject}</td>
					<td>${board.name}</td>
					<td><fmt:formatDate value="${board.date}"/></td>
					<td>${board.readcount}</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:when test="${boardList == null}" >
				<tr>
					<td colspan="5" style="padding-top: 30px;">게시판에 글 존재하지 않음</td>
				</tr>
		</c:when>
	</c:choose>
			</table>
			<div id="table_search" style="float:inherit; padding-top: 30px; padding-bottom: 30px;">
				<form action="notice.jsp" method="post">
					<input type="text" name="searchText" style="padding: 5px 0 5px 0;"> 
					<input type="submit" value="검색" class="button button--active button-contactForm" style="padding-top: 5px; padding-bottom: 5px;">
				</form>
			</div>
			<div class="clear"></div>
			<div id="page_control">
				아래의 페이지 번호 출력 부분
				
 	 <c:choose>
		<c:when test="${boardList != null}" >
						
			<!-- [이전] 시작페이지 번호가 한 화면에 보여줄 페이지 수보다 클 때 -->
			<c:if test="${startPage > pageBlock}" >
				<a href="${contextPath}/boarde/listBoard.do?pageNum=${startPage-pageBlock}">[이전]</a>
			</c:if>
						
			<c:forEach  var="i" begin="${startPage}" end="${endPage}" >
				<a href="${contextPath}/boarde/listBoard.do?pageNum=${i}">[${i}]</a>
			</c:forEach>
						
			<c:if test="${endPage < pageCount}">
				<a href="${contextPath}/boarde/listBoard.do?pageNum=${endPage+1}">[다음]</a>
			</c:if>
			
		</c:when>
	</c:choose> --%>
			</div>
	</article>
    </div>
</section>
	<!--================Blog Area =================-->
  
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