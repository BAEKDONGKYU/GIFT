<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../css/style.css">

<script type="text/javascript">
     function fn_enable(obj){
       document.getElementById("answer").disabled=false;
       document.getElementById("bt2").style.display="block";
       document.getElementById("bt1").style.display="none";
    }
  
</script>

<style type="text/css">
@font-face {
	font-family: 'Binggrae-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

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

#c {
	color: #384aeb;
}

.tno {
	font-family: 'S-CoreDream-4Regular';
	font-weight: 800;
	font-size: 0.85em;
	width: 700px;
	margin: 0 auto;
	margin-top: 80px;
}

.purple {
	font-family: 'S-CoreDream-4Regular';
	font-weight: 800;
	font-size: 0.85em;
	width: 700px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 3px;
}

.delmem {
	font-size: 3em;
	color: black;
	font-weight: 900;
	font-family: 'S-CoreDream-6Bold';
}

table#notice.notice_table {
	border-color: red;
	font-family: 'S-CoreDream-4Regular';
	box-shadow: 10px 10px 40px 10px rgba(56, 74, 235, 0.1);
	border-spacing: 0;
	border-collapse: collapse;
}

article.qnaform {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	padding: 0px 20px 20px 40px;
}

div.table_search {
	margin-left: 230px;
}

section.section-margin--small {
	font-family: 'S-CoreDream-6Bold';
}

input.button.button-subscribe {
	background-color: white;
	color: #384aeb;
	border: 1px;
}

#bt1 {
	color: #384aeb;
	background-color: #F6F6F6;
	border: 1px;
	margin-top: -10px;
}

form.answer_form {
	text-align: center;
	background-color: #F6F6F6;
	width: 702px;
	margin-left: auto;
	margin-right: auto;
	border-top: 2px solid red;
	height: 170px;
}

form.answer_form input.button-subscribe {
	height: 131px;
	margin-left: -10px;
	margin-top: 20px;
	margin-right: 10px;
	width: 100px;
	padding: 15px;
	background-color: #F6F6F6;
}

#bt2 {
	color: #384aeb;
	background-color: #F6F6F6;
	border: 1px;
	margin-top: -10px;
}

.pad {
	padding-left: 10px;
	padding-right: 10px;
	font-size: 17px;
	color: black;
}

.list_b{
	border: 1px solid #384aeb;
	background-color: #384aeb;
	color:white;
	width:100px;
	height: 44px;
	padding: 5px 10px;
	margin-right:10px;
	border-radius: 30px;
	font-size: 15px;
}

.list_b:HOVER{
	border: 2px solid #384aeb;
	background-color: white;
	color:black;
	
}
</style>
</head>


<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->


	<!-- ================ start banner area ================= -->
	<div style="text-align: center;">
		<img alt="qnabanner" src="../img/qna.png" width="100%"
			style="margin: 0 auto;">
	</div>

	<!-- 게시판 -->
	<section class="section-margin--small">
		<article style="height: auto;" class="qnaform">
			<table id="notice" align="center"
				style="width: 680px; line-height: 30px; padding: 20px; border-bottom: 2px solid #F6F6F6;">
				<tr
					style="background-color: white; cursor: default; border-bottom: 2px solid red; margin-bottom: 5px;">
					<th colspan="2"><p class="purple">
							<span class="delmem">Question</span>&nbsp;&nbsp;가장 특별한 선물을 발견할 수
							있는 공간, 기프트유 <span style="color: red;"><i
								class="fab fa-gratipay"></i></span>
						</p></th>
				</tr>

				<tr style="border-bottom: 1px solid #dee2e6; background-color: #F6F6F6;">
					<td class="pad" style="width: 50%; border-right: 1px solid #dee2e6;" align="center" >작성자</td>
					<td class="pad" style="width: 50%;" align="center" >작성일</td>
				</tr>
				<tr style="border-bottom: 1px solid #dee2e6;">
					<td align="center" style="border-right: 1px solid #dee2e6;">${board.name}</td>
					<td align="center"><fmt:formatDate value="${board.date}"/></td>
				</tr>
				
				<tr style="border-bottom: 1px solid #dee2e6; background-color: #F6F6F6;">
					<td colspan="2" class="pad" align="center">제목</td>
				</tr>
				
				<tr style="border-bottom: 1px solid #dee2e6;">
					<td colspan="2" align="center">${board.subject}</td>
				</tr>
				
				<tr height="200px">
					<td colspan="2" align="center">${message}</td>
				</tr>
			</table>
			<div id="table_search" align="right"
				style="width: 68%; margin-top: 20px; margin-left: 220px;">

				<c:if test="${(id == 'admin' || id == board.name) && board.answer == null}">
					<input type="button" value="글수정" class="button button-subscribe" onclick="location.href='updateBoard.do?pageNum=${pageNum}&num=${board.num}'">
				</c:if>
				<c:if test="${id == 'admin' || id == board.name}">
					<input type="button" value="글삭제" class="button button-subscribe" onclick="location.href='deleteBoard.do?pageNum=${pageNum}&num=${board.num}'">
				</c:if>


			</div>


			<c:if test="${id == 'admin'}">
				<c:if test="${board.answer == null}">
					<p class="purple">
						<span class="delmem">Answer</span>&nbsp;&nbsp;고객님 답변드립니다 :)
					</p>
					<form action="${contextPath}/boarde/addAnswer.do"
						class="answer_form">
						<input type="hidden" name="num" value="${board.num}"> <input
							type="hidden" name="pageNum" value="${pageNum}">
						<textarea name="answer" rows="5" cols="70"
							style="margin-top: 20px;"></textarea>
						<div class="replyform" style="float: right;">
							<input type="submit" class="button button-subscribe" value="답글달기">
						</div>
					</form>
				</c:if>
			</c:if>

			<c:if test="${board.answer != null}">
				<table id="notice" align="center"
					style="width: 680px; line-height: 30px; background-color: #EAEAEA;">
					<tr
						style="background-color: white; cursor: default; border-bottom: 2px solid red; margin-bottom: 5px;">

						<th><p class="purple">
								<span class="delmem">Answer</span>&nbsp;&nbsp;고객님 답변드립니다 :)
							</p></th>



					</tr>
				</table>

				<div id="답글창 전체" align="left"
					style="background-color: #F6F6F6; font-size: 15px; margin-left: auto; margin-right: auto; width: 700px;">

					<form action="${contextPath}/boarde/updateAnswer.do">
						<input type="hidden" name="num" value="${board.num}"> <input
							type="hidden" name="pageNum" value="${pageNum}">
						<table align="center"
							style="width: 500px; line-height: 30px; margin-bottom: 5px; width: auto;">
							<tr>
								<td colspan="3"><textarea name="answer" id="answer"
										rows="5" cols="80"
										style="margin-top: 30px; background-color: white;" disabled>${board.answer}</textarea>
								</td>
							</tr>
							<c:if test="${id == 'admin'}">
								<tr style="text-align: right;">
									<td align="left"><input type="submit" value="수정완료"
										id="bt2" style="display: none;"> <input type="button"
										value="수정하기" style="display: block;"
										onClick="fn_enable(this.form)" id="bt1"></td>
									<td><img src="../img/del.PNG" class="del"
										onclick="location.href='deleteAnswer.do?pageNum=${pageNum}&num=${board.num}'"
										style="margin-top: -10px; display: block; margin-left: 565px;">
									</td>
								</tr>
							</c:if>
						</table>
					</form>
				</div>
			</c:if>

			<div class="table_search" align="right"
				style="width: 68%; margin-top: 20px;">

				<input type="button" value="목록보기" class="list_b"
					onclick="location.href='listBoard.do?pageNum=${pageNum}'">
			</div>

			<div class="clear"></div>
			<div id="page_control"></div>

		</article>
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