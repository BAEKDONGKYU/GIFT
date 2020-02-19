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
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰수정</title>
<link rel="icon" href="../img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../css/shop.css">
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
  
	function viewFile(obj) {
		if (obj.files && obj.files[0]) {
			$("#preview").html(
					"<img id='previewFile' src='#' width=200 height=200/>");

			var reader = new FileReader();

			reader.readAsDataURL(obj.files[0]);

			reader.onload = function(ProgressEvent) {
				$("#previewFile").attr("src", ProgressEvent.target.result);

			}
		}
	}
</script>
<style type="text/css">
@font-face { font-family: 'Binggrae-Bold'; src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff'); font-weight: normal; font-style: normal;}
@font-face { font-family: 'S-CoreDream-4Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-6Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-6Bold.woff') format('woff'); font-weight: normal; font-style: normal; }
		}
#b{
	color: #384aeb;
}

.r_title{
	font-size: 1.5em;
	font-family:'S-CoreDream-6Bold';
	color: black;
	margin-left: 600px;
	margin-bottom: -3px;
}
.text-center{
	
	width: 50%;
	height:80%;
	margin: 10px auto;
	margin-top: 70px;
}
.r_table{
	border: 1px solid #c6c6c6;
	border-top: 2px solid red;
	text-align: left;
	margin: 0 auto;
	text-align:left;
	font-family: 'S-CoreDream-6Bold';
	
}
.r_table tr{
	border-bottom: 1px solid #c6c6c6;
	text-align: center;
}
.td_b{
	background-color:#EAEAEA;
	color: black;
	text-align: center;
}
.btn_review{
	width:100px;
	height: 44px;
	padding:5px;
	background-color: #384aeb;
	border-radius:30px;
	color:white;
	font-family: 'S-CoreDream-6Bold';
	font-size: 15px;
	border: none;
	cursor: pointer;
}

.btn_review:HOVER {
	background-color: white;
	color: black;
	border: 2px solid #384aeb;
}
</style>
</head>
<body>
<!--================ Start Header Menu Area =================-->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->

	
		<!-- 게시판 -->
	<section class="section-margin--small" >
		<article style="height: auto;">
		<p class="r_title" >Comment 수정</p>
		<form action="${contextPath}/product/updateProReview.do?num=${comment_r.num}&pageNum_r=${pageNum_r}&num_c=${comment_r.num_c}" method="post" enctype="multipart/form-data">
			<p style="margin-left: 600px; font-family:  'S-CoreDream-6Bold';"><span style="color: red;"><i class="fab fa-gratipay" style="margin-right: 10px;"></i></span><b style="color: #eb4821;font-size: 18px;">${id}님</b>의 
			리뷰를 <b style="color: #384aeb;font-size: 18px;">수정</b>해보세요</p>
			<table id="notice" style="width: 700px;  line-height: 30px;" class="r_table">
			
				<tr>
					<td style="width: 25%" class="td_b">작성자</td>
					<td style="text-align: left;"><input type="text" name="name" style="width: 200px; height: 100%;" value="${comment_r.name}"  readonly></td>
				</tr>
				<tr>
					<td style="width: 25%" class="td_b">별점</td>
			
					<td style="text-align: left;">
					<c:if test="${comment_r.starcount=='1'}"> 
		
						<input type="radio" name="starcount" id="one" value="1" checked="checked" style="margin-left: 10px;">1
			            <input type="radio" name="starcount" id="two" value="2" style="margin-left: 5px;"> 2
			            <input type="radio" name="starcount" id="three" value="3" style="margin-left: 5px;"> 3
			            <input type="radio" name="starcount" id="four" value="4" style="margin-left: 5px;"> 4
			            <input type="radio" name="starcount" id="five" value="5" style="margin-left: 5px;"> 5 
			            
		             </c:if>  
		          
		           	 <c:if test="${comment_r.starcount=='2'}"> 
						<input type="radio" name="starcount" id="one" value="1" style="margin-left: 5px;">1 
			            <input type="radio" name="starcount" id="two" value="2"  checked="checked" style="margin-left: 10px;"> 2
			            <input type="radio" name="starcount" id="three" value="3" style="margin-left: 5px;"> 3
			            <input type="radio" name="starcount" id="four" value="4" style="margin-left: 5px;"> 4
			            <input type="radio" name="starcount" id="five" value="5" style="margin-left: 5px;"> 5 
		            </c:if>  
		            <c:if test="${comment_r.starcount=='3'}"> 
						<input type="radio" name="starcount" id="one" value="1" style="margin-left: 5px;">1 
			            <input type="radio" name="starcount" id="two" value="2" style="margin-left: 5px;"> 2
			            <input type="radio" name="starcount" id="three" value="3"  checked="checked" style="margin-left: 10px;"> 3
			            <input type="radio" name="starcount" id="four" value="4" style="margin-left: 5px;"> 4
			            <input type="radio" name="starcount" id="five" value="5" style="margin-left: 5px;"> 5 
		            </c:if>  
		             <c:if test="${comment_r.starcount=='4'}"> 
						<input type="radio" name="starcount" id="one" value="1" style="margin-left: 5px;">1 
			            <input type="radio" name="starcount" id="two" value="2" style="margin-left: 5px;"> 2
			            <input type="radio" name="starcount" id="three" value="3" style="margin-left: 5px;"> 3
			            <input type="radio" name="starcount" id="four" value="4"  checked="checked" style="margin-left: 10px;"> 4
			            <input type="radio" name="starcount" id="five" value="5" style="margin-left: 5px;"> 5 
		             </c:if>  
		             <c:if test="${comment_r.starcount=='5'}"> 
						<input type="radio" name="starcount" id="one" value="1"  style="margin-left: 5px;">1 
			            <input type="radio" name="starcount" id="two" value="2" style="margin-left: 5px;"> 2
			            <input type="radio" name="starcount" id="three" value="3" style="margin-left: 5px;"> 3
			            <input type="radio" name="starcount" id="four" value="4" style="margin-left: 5px;"> 4
			            <input type="radio" name="starcount" id="five" value="5" checked="checked" style="margin-left: 10px;"> 5 
		              </c:if>  
		                 
					</td>
				</tr>
				<tr style="height: 100px; ">
					<td style="width: 25%;" class="td_b" rowspan="2">사진 올리기</td>
					<td style="text-align: left;">
						<img class="img-fluid" src="../review_upload/${comment_r.filename}" style="width:200px; height: 200px;float: left;">
						<p id="preview" style="margin-left: 20px;"></p>
					</td>
				</tr>
				<tr>
					<td>
						 <input type="file" name="filename" onchange="viewFile(this);" placeholder="사진을 올려주세요" style="border: 2px solid #384aeb;width:100%; ">
			
					</td>
				</tr>
				<tr style="height: 200px;">
					<td style="width: 25%;" class="td_b">글내용</td>
					<td style="text-align: left;"><textarea name="content" style="width: 100%; height: 200px;" class="form-control different-control w-100">${comment_r.content}</textarea></td>
				</tr>
			</table>

				<div id="table_search" align="right" style="width: 68%; margin-top: 20px;">
					<input type="submit" value="글수정" class="btn_review">
					<input type="reset" value="다시 작성" class="btn_review">
					<input type="button" value="취소" class="btn_review" onclick="history.back();">
			</div>
		</form>
	
		</article>
	</section>
		<!-- 게시판 -->
		
  
  
	<jsp:include page="../main/footer.jsp"></jsp:include>


</body>
</html>