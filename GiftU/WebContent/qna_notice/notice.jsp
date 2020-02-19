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
<title>giftU: 공지 및 이벤트</title>
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
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
#c {
	color: #384aeb;
}

.emptyNotice {
	margin: 30px 0;
	border-top: 1px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
	padding: 70px 0;
}

.purple {
	font-family: 'S-CoreDream-4Regular';
	font-weight: 800;
	font-size: 0.85em;
	width: 700px;
	margin-left: 400px;
}

.delmem {
	font-size: 3em;
	color: black;
	font-weight: 900;
	font-family: 'S-CoreDream-6Bold';
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

	<a id="main"></a>
	<!--================ 작성버튼 =================-->
	<c:if test="${id == 'admin'}">
		<a href="${contextPath}/listcoupon/listCoupon.do"
			class="button button-blog"
			style="margin: 0 0 20px 700px; padding: 30px 50px 30px 50px; font-size: 23px;">쿠폰 등록</a>
		<a href="${contextPath}/notice/add.do" class="button button-blog"
			style="margin-left: 130px; padding: 30px 50px 30px 50px; font-size: 23px;">공지 작성</a>
	</c:if>
	<!--================ 작성버튼 =================-->
	<c:if test="${action == '/listAllNotice.do'}">
		<p class="purple">
			<span class="delmem">전체보기</span>&nbsp;&nbsp;공지사항 및 이벤트
		</p>
	</c:if>

	<c:if test="${action == '/listEvent.do'}">
		<p class="purple">
			<span class="delmem">이벤트</span>&nbsp;&nbsp;진행중인 이벤트
		</p>
	</c:if>

	<c:if test="${action == '/listNotice.do'}">
		<p class="purple">
			<span class="delmem">공지사항</span>&nbsp;&nbsp;모든공지사항
		</p>
	</c:if>

	<!--================게시물 반복 =================-->
	<section class="blog_area"
		style="margin-bottom: 100px; text-align: center;">
		<div class="container" style="text-align: left;">
			<div class="row">
				<div class="col-lg-10" style="border-bottom: 1px solid #BDBDBD;">
					<div class="blog_left_sidebar">
						<c:if test="${noticeList != null}">
							<c:forEach var="notice" items="${noticeList}"
								varStatus="noticeNum">
								<c:if test="${notice.multi == 0}">
									<article class="row blog_item"
										style="border-top: 1px solid #BDBDBD;">
										<div class="col-md-3">
											<div class="blog_info text-right" style="padding-right: 20%;">
												<ul class="blog_meta list">
													<li><a href="#"><fmt:formatDate
																value="${notice.date}" /> <i
															class="lnr lnr-calendar-full"></i> </a></li>
													<li><a href="#">${notice.readcount} <i
															class="lnr lnr-eye"></i>
													</a></li>
												</ul>
											</div>
										</div>

										<div class="col-md-9"
											onclick="location.href='${contextPath}/notice/viewNotice.do?num=${notice.num}&pageNum=${pageNum}&abc=${action}'">
											<div class="blog_post">
												<div class="blog_details">
													<h2>${notice.subject}</h2>
													<br>
													<p>${notice.message.substring(0,20)}</p>
												</div>
											</div>
										</div>
									</article>
								</c:if>

								<c:if test="${notice.multi == 1}">
									<article class="row blog_item"
										style="border-top: 1px solid #BDBDBD;">
										<div class="col-md-3">
											<div class="blog_info text-right" style="padding-right: 20%;">
												<ul class="blog_meta list">
													<li><a href="#"><fmt:formatDate
																value="${notice.date}" /><i
															class="lnr lnr-calendar-full"></i> </a></li>
													<li><a href="#">${notice.readcount} <i
															class="lnr lnr-eye"></i>
													</a></li>
												</ul>
											</div>
										</div>
										<div class="col-md-9"
											onclick="location.href='${contextPath}/notice/viewNotice.do?num=${notice.num}&pageNum=${pageNum}&abc=${action}'">
											<div class="blog_post">
												<div align="center">
													<img src="../upload/${notice.num}/${notice.banner}" />
												</div>
											</div>
										</div>
									</article>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<c:if test="${empty noticeList}">
				<div align="center" class="emptyNotice">
					<h4>게시물이 존재하지 않습니다.</h4>
				</div>
			</c:if>
		</div>

		<div id="table_search"
			style="float: inherit; padding-top: 30px; padding-bottom: 30px;">
			<form action="${contextPath}/notice${action}" method="post">
				<input type="text" name="searchText"
					style="width: 300px; padding: 5px 0 5px 0;"> <input
					type="submit" value="검색"
					class="button button--active button-contactForm"
					style="padding-top: 5px; padding-bottom: 5px;">
			</form>
		</div>
		<div id="page_control">
			<%-- 아래의 페이지 번호 출력 부분 --%>

			<c:choose>
				<c:when test="${noticeList != null}">

					<!-- [이전] 시작페이지 번호가 한 화면에 보여줄 페이지 수보다 클 때 -->
					<c:if test="${startPage > pageBlock}">
						<a
							href="${contextPath}/notice${action}?pageNum=${startPage-pageBlock}#main">[이전]</a>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${contextPath}/notice${action}?pageNum=${i}#main">[${i}]</a>
					</c:forEach>

					<c:if test="${endPage < pageCount}">
						<a href="${contextPath}/notice${action}?pageNum=${endPage+1}#main">[다음]</a>
					</c:if>

				</c:when>
			</c:choose>
		</div>
	</section>
	<!--================게시물 반복 =================-->

	<!--================ 푸터 영역  =================-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ 푸터 영역  =================-->

</body>
</html>