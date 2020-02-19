<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<%String id = (String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html lang="en">

<!--================ 탭 링크 =================-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>giftU: 장바구니</title>
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
<link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">

<link rel="stylesheet" href="../css/style.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function checkdel(){
		if($("input:checkbox[name=cartDelList]").is(":checked")) {
			$("#cartform").attr("action","${contextPath}/cart/delList.do").submit();	
		}
		else {
			alert("삭제 하실 상품을 체크해주세요");
		}
	}

	function checkmod(){
		$("#cartform").attr("action","${contextPath}/cart/modCart.do").submit();
	}
	
	
	function checkbuy() {
		if($("input:checkbox[name=cartDelList]").is(":checked")) {
			$("#cartform").attr("action","${contextPath}/product/buyCartProduct.do").submit();
		}
		else {
			alert("구매하실 상품을 체크해주세요");
		}
	}
	
	
	
	$(function(){
		$("#allCheck").click(function(){
			if($("#allCheck").is(":checked"))
				$("input:checkbox[name=cartDelList]").attr("checked","true");
			else
				$("input:checkbox[name=cartDelList]").removeAttr("checked");
		});
	});

</script>



</head>
<body>
	<!--================ Start Header Menu Area =================-->

	<jsp:include page="../main/header.jsp"></jsp:include>

	<!--================ End Header Menu Area =================-->


	<!-- ================ start banner area ================= -->
	<div> 
		<img alt="banner" src="../img/cart_list.png" width="100%">
	</div>
	<!-- ================ end banner area ================= -->



	<!--================Cart Area =================-->
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table" align="center">
						<thead>
							<tr align="center">
								<th width="1%" scope="col"><input type="checkbox" id="allCheck"></th>
								<th scope="col">상품명</th>
								<th scope="col">가격</th>
								<th scope="col">수량</th>
								<th scope="col" width="20%">총 가격</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${cartList == null }">
									<tr align="center">
										<td rowspan="5"><h1>장바구니가 비었습니다.</h1></td>
									</tr>
								</c:when>
								<c:otherwise>
									<form action="" method="get" name="cartform" id="cartform">
										<input type="hidden" name="id" value="${id }">
										<c:forEach items="${cartList}" var="list">
										<input type="hidden" name="num" value="${list.num }">
											<tr align="center">
												<td width="1%"><input type="checkbox"
													value="${list.num}" name="cartDelList"> <img
													src="../upload/${list.filename }" width="50" height="50">
												</td>
												<td>
													<div class="media">
														<div class="d-flex"></div>
														<div class="media-body">
															<a
																href="${contextPath}/product/viewDetail.do?num=${list.pro_num}"><p>${list.name }</p></a>
														</div>
													</div>
												</td>
												<td>
													<h5><fmt:formatNumber value="${list.price }"  type="number"/>원</h5>
												</td>
												<td>
													<div class="product_count">
														<input type="text" name="count" id="sst${list.num}" maxlength="12"
															value="${list.count}" title="Quantity:"
															class="input-text qty" >
														<button onclick="var result = document.getElementById('sst${list.num}'); var sst${list.num} = result.value; if( !isNaN( sst${list.num} ) &amp;&amp; sst${list.num} >= 0 ) result.value++;return false;"
															 class="increase items-count" type="button">
															<i class="lnr lnr-chevron-up"></i>
														</button>
														<button
															onclick="var result = document.getElementById('sst${list.num}'); var sst${list.num} = result.value; if( !isNaN( sst${list.num} ) &amp;&amp; sst${list.num} > 0 ) result.value--;return false;"
															class="reduced items-count" type="button">
															<i class="lnr lnr-chevron-down"></i>
														</button>	
														<button onclick="checkmod()">수정</button>
													</div>
												</td>
												<td>
													   <h5><fmt:formatNumber value="${list.count * list.price }" type="number"/>원</h5>
												</td>
											</tr>
										</c:forEach>
								</c:otherwise>

							</c:choose>


							<tr class="bottom_button">
								<td><button onclick="checkdel()" class="button">delete</button> </td>
								<td><a class="button"  onclick="checkbuy()">Buy</a></td>
								<td></td>
								
								<td>
								<!-- <div class="checkout_btn_inner d-flex align-items-center"> -->
										
								<!-- 	</div> -->
								</td>
								<td>
									<b>total  : <fmt:formatNumber value="${amount}" type="number"/> 원</b>
								</td>
							</tr>
					
						
							<tr class="out_button_area">
								<td class="d-none-l"></td>
								<td class=""></td>
								<td></td>
								<td>
									
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--================End Cart Area =================-->

	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->




</body>
</html>