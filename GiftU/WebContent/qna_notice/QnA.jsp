<%@page import="board.NoticeBoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<!--================ 탭 링크 =================-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>giftU: 고객상담 및 문의</title>
<link rel=" shortcut icon" href="../img/favi.ico">
<link rel="icon" href="../img/favi.ico">

<!--================ CSS및 그외 링크 =================-->
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet"
   href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
   href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../css/style.css">
<script src="../js/qna.js"></script>
<style type="text/css">
#c {
   color: #384aeb;
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

@font-face {
   font-family: 'S-CoreDream-5Medium';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

.font_slim, td {
   font-family: 'S-CoreDream-4Regular' !important;
}

#notice th {
   color: black;
   font-family: 'S-CoreDream-5Medium' !important;
}

#notice{
   margin-top: 50px;
   margin-bottom: 30px;
}

.media-body p{
   font-size: 0.95em;
}

.font h3, h5 {
   font-family: 'S-CoreDream-6Bold' !important;
}

.left {
   cursor: pointer;
}

.search_btn {
   font-family: 'S-CoreDream-6Bold' !important;
   cursor: pointer;
   padding-top: 3px;
   padding-bottom: 3px;
   border-radius: 2em !important;
}

input {
   border: none;
   border-bottom: dotted grey 1px;
}

#page_control{
   margin-bottom: 50px;
}


.purple {
   font-family: 'S-CoreDream-4Regular';
   font-weight: 800;
   font-size: 0.85em;
   width: 1100px;
   margin: 0 auto; 
   margin-top: 80px;
}

.qna_bar{
   font-size: 3em;
   color: black;
   font-weight: 900;
   font-family: 'S-CoreDream-6Bold';
}

.qna_form_in {
   box-shadow: 0px 10px 40px 0px rgba(56, 74, 235, 0.1);
   text-align: center;
   border-top: solid 2px #f54245; 
   width: 800px;
   margin: 0 auto; 
   margin-bottom: 0px;

}

.register_form_in td, .register_form_in tr {
    border: 1px solid #dee2e6;
}

.search_b1{
	width: 100px;
	height: 40px;
	padding: 5px 15px;
	background-color: #384aeb;
	color: white;
	border-radius:30px;
	font-family: 'S-CoreDream-6Bold';
	margin-left: 10px;
	
}
.search_b1:HOVER{
	background-color: white;
	border:2px solid #384aeb;
	color: black;
	font-family: 'S-CoreDream-6Bold';
	cursor: pointer;
	
}

</style>
</head>
<body>
   <!--================ Start Header Menu Area =================-->
   <jsp:include page="../main/header.jsp" />
   <!--================ End Header Menu Area =================-->


   <!-- ================ start banner area ================= -->
   <div style="text-align: center;">
      <img alt="qnabanner" src="../img/qna.png" width="100%"
         style="margin: 0 auto;">
   </div>
   <!-- ================ end banner area ================= -->

   <!-- ================ contact section start ================= -->

      <div class="container font">
         <div class="d-none d-sm-block mb-5 pb-4"></div>
         <div class="row font_slim">
            <div class="col-md-4 col-lg-3 mb-4 mb-md-0">
               <div class="media contact-info">
                  <span class="contact-info__icon"><i class="ti-home"></i></span>
                  <div class="media-body">
                     <h3>기프트유 찾아오시는 길</h3>
                     <p>부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층</p>
                  </div>
               </div>
               <div class="media contact-info">
                  <span class="contact-info__icon"><i class="ti-headphone"></i></span>
                  <div class="media-body">
                     <h3>고객센터</h3>
                     <p>
                        <a href="tel:454545654">(051)803-0908</a><br> 상담시간: 평일 9am
                        to 6pm
                     </p>
                  </div>
               </div>
            </div>
            


            
            <div class="col-md-8 col-lg-9">

               <form id="QnAForm" name="QnAForm" action="${contextPath}/boarde/addQuestion.do"
                     class="form-contact contact_form" method="post" novalidate="novalidate">
                  <div class="row">
                     <div class="col-lg-5">
                        <div class="form-group">
                           <input class="form-control" name="name" id="name" type="text"
                              placeholder="로그인 후 이용 하실 수 있습니다." value="${id}" readonly>
                        </div>
                        <div class="form-group">
                           <input class="form-control" name="email" id="email"
                              type="email" placeholder="이메일">
                        </div>
                        <div class="form-group">
                           <input class="form-control" name="subject" id="subject"
                              type="text" placeholder="제목">
                        </div>
                     </div>
                     <div class="col-lg-7">
                        <div class="form-group">
                           <textarea class="form-control different-control w-100"
                              name="message" id="message" cols="30" rows="5"
                              placeholder="내용"></textarea>
                        </div>
                     </div>
                  </div>
                  <c:if test="${id != null}">
                     <div class="form-group text-center text-md-right mt-3">
                        <div id="qna_check_message" style="float: left;"></div>
                        비밀글 여부<input type="checkbox" id="secret" name="secret" value="1" style="margin: 0 20px 0 5px;">
                        <button type="button" onclick="qna_check();"
                        class="search_b1">등록</button>
                        
                     </div>
                  </c:if>
               </form>

            </div>
         </div>
      </div>


      <div class="container" style="text-align: center;">
         <table id="notice" class="qna_form_in" align="center" style="width: 100%; line-height: 30px;"  >
            <tr style="background-color:#ebedec; cursor: default; border-bottom: 2px solid #c6c6c6;  margin-bottom: 5px;">
               <th class="tno" width="50px;"  style="text-align: center; font-size: 16px;">No.</th>
               <th class="tanswer" width="100px;" style="text-align: center; font-size:16px;">답변여부</th>
               <th class="ttitle" width="400px;" style="text-align: center; font-size: 16px;">제목</th>
               <th class="twrite" width="100px;" style="text-align: center; font-size: 16px;">작성자</th>
               <th class="tdate" width="80px;" style="text-align: center; font-size: 16px;">날짜</th>
               <th class="tread" width="50px;" style="text-align: center; font-size: 16px;">조회수</th>
            </tr>
<c:choose>
<c:when test="${boardList != null}">
   <c:forEach var="board" items="${boardList}" varStatus="boardNum">
                  
      <c:if test="${board.secret == 0}">
            <tr onclick="location.href='${contextPath}/boarde/viewboard.do?num=${board.num}&pageNum=${pageNum}'"
                        style="border-bottom: 1px solid #c6c6c6;">
      </c:if>
                     
                     
      <c:if test="${board.secret == 1}">
                     
         <c:if test="${board.name == id || board.name == 'admin'}">
            <tr onclick="location.href='${contextPath}/boarde/viewboard.do?num=${board.num}&pageNum=${pageNum}'"
                     style="border-bottom: 1px solid black;">
         </c:if>
                        
         <c:if test="${board.name != id}">
            <tr style="border-bottom: 1px solid #c6c6c6;">
         </c:if>
            
      </c:if>      
               <td>${board.num}</td>
               <td>
                  <c:if test="${board.answer == null}">
                     답변 대기중
                  </c:if> 
                  <c:if test="${board.answer != null}">
                     <b style="color: #ed4251;">답변 완료</b>
                  </c:if>
               </td>
            <c:if test="${board.secret == 0}">
               <td class="left">${board.subject}</td>
            </c:if>
            <c:if test="${board.secret == 1}">
               <c:if test="${board.name == id}">
               <td class="left">${board.message}</td>
               </c:if>
               <c:if test="${board.name != id}">
               <td class="left">비밀글 입니다.</td>
               </c:if>
            </c:if>
      		<td>${board.name}</td>
               <td><fmt:formatDate value="${board.date}" /></td>
               <td>${board.readcount}</td>
            </tr>
   </c:forEach>
</c:when>
         <c:when test="${boardList == null}">
            <tr>
               <td colspan="5" style="padding-top: 30px;">게시글이 존재하지 않습니다.</td>
            </tr>
         </c:when>
</c:choose>
         </table>
         <div id="table_search"
            style="float: inherit; padding-top: 30px; padding-bottom: 30px;">
            <form action="${contextPath}/boarde/listBoard.do" method="post">
               <input type="text" name="searchText" style="padding: 5px 0 5px 0;">
               <input type="submit" value="검색" class="search_b1">
            </form>
         </div>
         <div class="clear"></div>
         <div id="page_control">
            <%-- 아래의 페이지 번호 출력 부분 --%>

            <c:choose>
               <c:when test="${boardList != null}">

                  <!-- [이전] 시작페이지 번호가 한 화면에 보여줄 페이지 수보다 클 때 -->
                  <c:if test="${startPage > pageBlock}">
                     <a
                        href="${contextPath}/boarde/listBoard.do?pageNum=${startPage-pageBlock}">[이전]</a>
                  </c:if>

                  <c:forEach var="i" begin="${startPage}" end="${endPage}">
                     <a href="${contextPath}/boarde/listBoard.do?pageNum=${i}">[${i}]</a>
                  </c:forEach>

                  <c:if test="${endPage < pageCount}">
                     <a href="${contextPath}/boarde/listBoard.do?pageNum=${endPage+1}">[다음]</a>
                  </c:if>

               </c:when>
            </c:choose>
         </div>

      </div>

   <!--================Blog Area =================-->

   <jsp:include page="../main/footer.jsp"></jsp:include>
   <!--================ End footer Area  =================-->

   
   <script type="text/javascript">
   
   $("#secret").on("click", function () {
         
      document.getElementById("secret").value="2";
         
   });
   </script>
</body>
</html>