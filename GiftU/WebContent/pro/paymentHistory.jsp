<%@page import="history.HistoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp"/>
	<!--================ 헤더 끝 =================-->


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="history" value="${history}"/>
<c:set var="id" value="${sessionScope.id}"/>
<c:set var="totalRecord" value="${fn:length(history)}"/> <!-- 전체 구매 내역 수 -->
<c:set var="numPerPage" value="5" /> <!-- 한 페이지에 보여줄 구매 내역 수 -->
<c:set var="pagePerBlock" value="3" /> <!-- 한 블럭에 보여줄 페이지 수 -->
<c:set var="totalPage" value="0" />  <!-- 총 페이지 수 -->
<c:set var="totalBlock" value="0"/> <!-- 전체 블럭수 -->
<c:set var="nowPage" value="${nowPage}"/> <!-- 현재 보여질 페이지 -->
<c:set var="nowBlock" value="${nowBlock}"/> <!-- 현제 보여질 블럭 -->
<c:set var="beginPerPage" value="0"/> <!-- 각 페이지의 시작 글번호 -->
<c:set var="startDate" value="${startDate}"/>
<c:set var="endDate" value="${endDate}"/>
<c:set var="month" value="${month}"/> 

<c:choose>
	<c:when test="${totalRecord%numPerPage == 0}">
		<fmt:parseNumber var="totalPage" integerOnly="true" value="${totalRecord/numPerPage}"/>
	</c:when>
	<c:otherwise>
		<fmt:parseNumber var="totalPage" integerOnly="true" value="${(totalRecord/numPerPage)+1}"/>
	</c:otherwise>
</c:choose>


<c:choose>
	<c:when test="${totalPage%pagePerBlock == 0}">
		<fmt:parseNumber var="totalBlock" integerOnly="true" value="${totalPage/pagePerBlock}"/>
	</c:when>
	<c:otherwise>
		<fmt:parseNumber var="totalBlock" integerOnly="true" value="${(totalPage/pagePerBlock)+1}"/>
	</c:otherwise>
</c:choose>

<c:if test="${not empty nowPage}"> 
	<fmt:parseNumber var="nowPage" integerOnly="true" value="${nowPage}"/>
</c:if>


<c:if test="${not empty nowBlock}"> 
	<fmt:parseNumber var="nowBlock" integerOnly="true" value="${nowBlock}"/>
</c:if>

<c:set var="beginPerPage" value="${nowPage*numPerPage}"/>
<c:set var="pageNum" value="${param.pageNum}"/>

<c:if test="${empty pageNum}">
	<c:set var="pageNum" value="1"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>giftU 구매내역</title>
<link rel="icon" href="${contextPath}/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="${contextPath}/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${contextPath}/vendors/linericon/style.css">
<link rel="stylesheet"
	href="${contextPath}/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${contextPath}/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="${contextPath}/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="${contextPath}/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="${contextPath}/css/style.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script type="text/javascript" src="${contextPath}/js/paymentHistory.js"></script>		
<link rel="stylesheet" type="text/css" href="${contextPath}/css/purchaseHistory.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/paymentHistory.js"></script>
</head>
<body>
 <section id="p_head">
		<h2>구매내역</h2> 
		<hr>
		<h4>기간 설정</h4>
		<div class="time">
			<div class="search_time">
				<div>
					<form action="${contextPath}/history/searchHistory.do" method="post" id="searchForm">
						<input type="hidden" name ="id" id="id" value="${id}">
						<input type="hidden" name ="month" id="month">
						<input type="text" id="startDate" readonly="readonly" name="startDate">
						<label style="font-size: 40px; font-weight: bold; float : left; margin-left: 30px;">
							<b>~</b>
						</label>
						<input type="text" id="endDate" readonly="readonly" name="endDate">
						<input type="button" class="btn btn-success" value="검색" id="search">
					</form>
				</div>
			</div>
			
			 <div class="select_time_div">
				<div class="select_time">
					<button class="btn btn-danger" id="allMonths">전체</button>
				</div>
				<div class="select_time">
					<button class="btn btn-warning" id="oneMonth">1개월</button>
				</div>
				<div class="select_time">
					<button class="btn btn-info" id="threeMonths">3개월</button>
				</div>
				<div class="select_time">
					<button class="btn btn-secondary" id="sixMonths">6개월</button>
				</div>
				<div class="clear"></div>
			 </div>	 
		</div>
</section> 

<section id="p_body">
			<div id="search_result">
			<table style="width : 1200px"  class="table">
			  <thead>
				<tr class="table-info">
					<th scope="col">#</th>
					<th scope="col">주문번호</th> 
					<th scope="col">결제날자</th>
					<th scope="col">구매자</th>
					<th scope="col">상품명</th>
					<th scope="col">상품수량</th>
					<th scope="col">상품금액</th>
					<th scope="col">결제수단</th>
					<th scope="col">총금액</th>
					<th scope="col">요청 사항</th>
					<th scope="col">배송상태</th>
				</tr>
			  </thead>
			  <tbody> 	
			  	<div class="paging">
				  	<input type="hidden" id="hiddenHis" value="${fn:length(history)}">
				  	<c:set var="loop_flag" value="false"/>
				  	<c:set var="loop_flug2" value="false"/>
				  	
				  	<c:choose>
						<c:when test="${not empty history}">
							<c:forEach var="payment" items="${history}" begin="${beginPerPage}" end="${(beginPerPage+numPerPage)-1}" step="1" varStatus="status">
								<c:if test="${beginPerPage == totalRecord }">
									<c:set var="loop_flag" value="true"/>
									<c:set var="loop_flag2" value="true"/>
								</c:if>
								<c:if test="${not loop_flag}">
									<tr>
										<td>${status.index+1}</td>
										<td>${payment.order_number}</td>	
										<td>${payment.date}</td>
										<td>${payment.name}</td>
										<td>${payment.product_name}</td>
										<td>${payment.count}</td>
										<td>${payment.price}</td>
										<td>${payment.payment_type}</td>
										<td>${payment.all_price}</td>
										<td>${payment.msg}</td>
										<td>${payment.delivery}</td>
									</tr>
								</c:if>
							</c:forEach>
							<c:if test="${totalRecord > 0 && nowBlock > 0 }">
									<a href="${contextPath}/history/searchHistory.do?nowBlock=${nowBlock-1}&nowPage=${(nowBlock-1)*pagePerBlock}&month=${month}">이전</a>
							</c:if>
							<c:forEach begin="0" end="${pagePerBlock-1}" step="1" varStatus="status">
								<c:if test="${not loop_flag2}">
									<c:if test="${(nowBlock*pagePerBlock)+status.index == totalPage}">
										<c:set var="loop_flag2" value="true"/>
									</c:if>
									
									<c:if test="${(nowBlock*pagePerBlock)+1+status.index == totalRecord}">
										<c:set var="loop_flag2" value="true"/>
									</c:if>
									
									<c:if test="${not loop_flag2}">
										<c:if test="${month eq 'between'}">
											<a href="${contextPath}/history/searchHistory.do?nowBlock=${nowBlock}&nowPage=${(nowBlock*pagePerBlock)+status.index}&month=${month}&startDate=${startDate}&endDate=${endDate}">
												${nowBlock*pagePerBlock+1+status.index}
											</a>
										</c:if>
										<c:if test="${month ne 'between'}">
											<a href="${contextPath}/history/searchHistory.do?nowBlock=${nowBlock}&nowPage=${(nowBlock*pagePerBlock)+status.index}&month=${month}">
												${nowBlock*pagePerBlock+1+status.index}
											</a>
										</c:if>
									</c:if>
								</c:if>	
							</c:forEach>
							
							<c:if test="${totalBlock > nowBlock+1}">
								<a href="${contextPath}/history/searchHistory.do?nowBlock=${nowBlock+1}&nowPage=${((nowBlock+1)*pagePerBlock)}&month=${month}">
									다음
								</a>
							</c:if>
						</c:when>
						<c:otherwise>
							<tr>
								<td>데이터가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</div>
			  </tbody>	 		
			</table>
		</div>			
</section>
<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->
</body>
</html>