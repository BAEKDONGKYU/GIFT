<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog</title>
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
   function back() {
      history.back();
   }
</script>
<style type="text/css">
#c {
   color: #384aeb;
}

td a {
   color: #666;
}

div#table_search{
margin-right:380px;
margin-top: 20px;
margin-bottom: 30px;

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

   <!--================ 메인 내용 =================-->
   <section class="section-margin--small" style="margin-top: 0px;">
      <article style="height: auto;">
      
         <!-- 게시물 출력 부분 -->
         <table id="notice" align="center"
            style="width: 1140px; line-height: 30px;">
            <tr>
               <td colspan="2" align="left" style="font-size: 30px; height: 100px; padding-left: 30px; background-color: #f9f9f9; border-top: 1px solid #e3e3e3;">
                     <img src="../img/${notice.multi}.PNG" style="padding-bottom: 5px;">${notice.subject}
               </td>
            </tr>
            <tr align="right"
               style="border-top: 1px solid #e3e3e3; border-bottom: 1px solid #e3e3e3;">
               <td colspan="2" style="font-size: 12px;"><img
                  src="../img/eye.PNG">${notice.readcount}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                  src="../img/clock.PNG">${time}</td>
            </tr>
            
         <c:if test="${notice.multi == 0 }">
            <tr align="center" style="height: auto; border-bottom: 1px solid #e3e3e3;">
               <td colspan="2" align="left"style="font-size: 17px; padding: 50px 30px 50px 30px;">
                  ${notice.message}
               </td>
            </tr>
         </c:if>
         
         <c:if test="${notice.multi == 1 }">
            <tr align="center" style="height: auto; border-bottom: 1px solid #e3e3e3;">
               <td>
                  <img alt="이벤트 파일" src="../upload/${notice.num}/${notice.file}" usemap="#Map1"/>
                  <map name="Map1">
                     <area href="" onclick="coupon('${id}','${notice.coupon}');" shape="rect" coords="${notice.message}" target="_blank" alt="쿠폰 받기">
                  </map>
               </td>
            </tr>
         </c:if>
         
         </table>
         <!-- 게시물 출력 부분 끝 -->
         
         <!-- 하단 수정,삭제,목록보기 버튼 -->
         <div id="table_search" align="right">

            <c:if test="${id == 'admin'}">
               <input type="button" value="글수정"
                  class="button button--active button-contactForm"
                  onclick="location.href='${contextPath}/notice/updateNotice.do?num=${notice.num}&pageNum=${pageNum}'">
               <input type="button" value="글삭제"
                  class="button button--active button-contactForm"
                  onclick="location.href='${contextPath}/notice/deleteNotice.do?num=${notice.num}&pageNum=${pageNum}'">
            </c:if>
            <input type="button" value="목록보기"
               class="button button--active button-contactForm"
               onclick="location.href='${contextPath}/notice/listAllNotice.do?num=${notice.num}&pageNum=${pageNum}'">
         </div>
         <!-- 하단 수정,삭제,목록보기 버튼 끝 -->
         
      </article>
   </section>
   <!--================ 메인 내용 끝 =================-->



   <!--================ 다음, 이전 글 =================-->
   <div class="page_move" align="center">
      <table
         style="width: 1140px; height: 100px; line-height: 30px; border-top: 1px solid gray; border-bottom: 1px solid gray; margin-bottom: 100px;">
         <tr style="border-bottom: 1px solid gray;">
            <td width="20%"><span class="page_move_btn"
               style="margin-left: 20px;"> <a
                  href="viewNotice.do?num=${notice1.num}&pageNum=1"> <img
                     src="https://ssl.nx.com/s2/game/maplestory/renewal/common/page_up.png"
                     alt="이전글">이전글
               </a>
            </span></td>
            <c:if test="${notice1.num != null}">
               <td width="65%"><a
                  href="viewNotice.do?num=${notice1.num}&pageNum=1">${notice1.subject}</a>
               </td>
               <td width="15%" style="padding-left: 20px;"><img
                  src="../img/clock.PNG" alt="시간"> <span
                  style="margin-right: 20px; font-size: 12px;"><fmt:formatDate
                        value="${notice1.date}" /></span></td>
            </c:if>
            <c:if test="${notice1.num == null}">
               <td width="65%">이전글이 없습니다.</td>
               <td width="15%" style="padding-left: 20px;"></td>
            </c:if>
         </tr>

         <tr>
            <td><span class="page_move_btn" style="margin-left: 20px;">
                  <a href="viewNotice.do?num=${notice2.num}&pageNum=1"> <img
                     src="https://ssl.nx.com/s2/game/maplestory/renewal/common/page_down.png"
                     alt="다음글">다음글
               </a>
            </span></td>
            <c:if test="${notice2.num != null }">
               <td width="65%"><a
                  href="viewNotice.do?num=${notice2.num}&pageNum=1">${notice2.subject}</a>
               </td>
               <td width="15%" style="padding-left: 20px;"><img
                  src="../img/clock.PNG" alt="시간"> <span
                  style="margin-right: 20px; font-size: 12px;"><fmt:formatDate
                        value="${notice2.date}" /></span></td>
            </c:if>
            <c:if test="${notice2.num == null }">
               <td width="65%">다음글이 없습니다.</td>
               <td width="15%" style="padding-left: 20px;"></td>
            </c:if>
         </tr>
      </table>
   </div>
   <!--================ 다음, 이전 글 끝 =================-->


   <!--================ 푸터 영역  =================-->
   <jsp:include page="../main/footer.jsp"></jsp:include>
   <!--================ 푸터 영역  =================-->
   
   <script type="text/javascript">
      function coupon(id, coupon){
         window.open("${contextPath}/coupon/addCoupon.do?id="+id+"&coupon="+coupon,"","width=500, height=200");
      }
   </script>
</body>
</html>