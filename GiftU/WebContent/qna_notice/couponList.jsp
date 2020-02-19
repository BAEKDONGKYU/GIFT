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
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../register/register.css">
<script type="text/javascript">
function coupon_check(){
	
	if(subject.value==""){
		$("#coupon_check_message").text("쿠폰 명을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(content.value == ""){
		
		$("#coupon_check_message").text("쿠폰 설명을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(percent.value == ""){
		
		$("#coupon_check_message").text("쿠폰의 할인률을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(day1.value == ""){
		
		$("#coupon_check_message").text("시작일을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(day2.value == ""){
		
		$("#coupon_check_message").text("종료일을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else if(price.value == ""){
		
		$("#coupon_check_message").text("조건가격을 입력해주세요");
		$("#coupon_check_message").css("color","red");
		
	}else{
		$("#CouponForm").submit();
	}
}

</script>

<style type="text/css">
#c {
	color: #384aeb;
}
</style>

</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->


	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" style="height: 150px; margin-bottom: 100px;">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>쿠폰 등록</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<div style="width: 1200px; margin: 0 auto;">
		<form id="CouponForm" action="${contextPath}/listcoupon/addCoupon.do">
		<table class="info table-bordered"
			style="text-align: center; color: black;">

			<tr style="font-size: 15px;">
				<td width="200"><input type="text" id="subject" name="subject" class="form-control" placeholder="쿠폰 명"></td>
				<td><input type="text" id="content" name="content" class="form-control" placeholder="설명"></td>
				<td width="90"><input type="text" id="percent" name="percent" class="form-control" placeholder="할인률"></td>
				<td width="90"><select name="multi">
						<option value="0">일부상품</option>
						<option value="1">전체상품</option>
					</select></td>
				<td width="200"><input type="date" id="day1" name="day1" class="form-control" placeholder="시작일"> ~ 
					<input type="date" id="day2" name="day2" class="form-control" placeholder="마감일"></td>
				<td width="150" style=""><input type="text" id="price" name="price" class="form-control" placeholder="일정금액 이상"></td>
			</tr>
		</table>
		<div align="right">
			<div id="coupon_check_message" style="float: left;"></div>
			<input type="reset" value="재작성" class="button button--active button-contactForm" style="width: 100px; margin-right: 10px;">
			<input type="button" onclick="coupon_check();" value="등록" class="button button--active button-contactForm" style="width: 100px;">
		</div>
		</form>
	</div>
	
	<div style="height: 100px;"></div>


	<div style="width: 1200px; margin: 0 auto;">
		<table class="info table-bordered"
			style="text-align: center; color: black;">
			<tr>
				<td colspan="6" class="info_title">쿠 폰 목 록</td>
			</tr>
			<tr>
				<th width="200">쿠폰 명</th>
				<th>상세</th>
				<th width="90">할인률</th>
				<th width="90">적용 범위</th>
				<th width="200">사용기한</th>
				<th width="150">조건</th>
			</tr>
			<c:choose>
				<c:when test="${ListCouponList != null}">
					<c:forEach var="coupon" items="${ListCouponList}">
						<tr>
							<td>${coupon.subject}</td>
							<td>${coupon.content}</td>
							<td>${coupon.percent}%</td>
							<c:if test="${coupon.multi == 0}">
								<td>일부상품</td>
							</c:if>
							<c:if test="${coupon.multi == 1}">
								<td>전체상품(일부제외)</td>
							</c:if>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.day1}"/> ~
								<fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.day2}"/>
							</td>
							<td>${coupon.price}원이상</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>


	<!--================ 푸터 영역  =================-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ 푸터 영역  =================-->

</body>
</html>