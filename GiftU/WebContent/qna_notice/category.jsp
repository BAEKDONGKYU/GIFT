<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>  
<style type="text/css">

@font-face {
   font-family: 'S-CoreDream-5Medium';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

.categories_post, h5{

   font-family: 'S-CoreDream-5Medium';
}

</style>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

   <!-- ================ start banner area ================= -->
   <div style="text-align: center;">
      <img alt="qnabanner" src="../img/notice.png" width="100%"
         style="margin: 0 auto;">
   </div>
   <!-- ================ end banner area ================= -->

   <section class="blog_categorie_area">
      <div class="container">
         <div class="row">
            <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
               <div class="categories_post">
                  <img class="card-img rounded-0"
                     src="../img/giftbox2.png" alt="post">
                  <div class="categories_details" onclick="location='${contextPath}/notice/listAllNotice.do'">
                     <div class="categories_text">
                           <h5>전체보기</h5>
                        <div class="border_line"></div>
                        <p>공지사항 및 이벤트</p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
               <div class="categories_post">
                  <img class="card-img rounded-0"
                     src="../img/giftbox3.png" alt="post">
                  <div class="categories_details" onclick="location='${contextPath}/notice/listEvent.do'">
                     <div class="categories_text">
                           <h5>이벤트</h5>
                        <div class="border_line"></div>
                        <p>진행중인 이벤트</p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
               <div class="categories_post">
                  <img class="card-img rounded-0"
                     src="../img/giftbox1.png" alt="post">
                  <div class="categories_details" onclick="location='${contextPath}/notice/listNotice.do'">
                     <div class="categories_text">
                           <h5>공지사항</h5>
                        <div class="border_line"></div>
                        <p>모든 공지사항</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>