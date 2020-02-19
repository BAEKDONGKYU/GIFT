<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="id" value="${sessionScope.id}" />
<c:set var="orderList" value="${orderCartList}"/>
<c:set var="allPrice" value="0" />
<c:set var="delivery_price" value="0" />
<c:set var="length" value="${fn:length(orderCartList)}" />

<!DOCTYPE html>
<html lang="en">

<!--================ 탭 링크 =================-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>giftU: 상품주문</title>
<link rel=" shortcut icon" href="../img/favi.ico">
<link rel="icon" href="../img/favi.ico">

<!--================ 헤더 시작 =================-->
<jsp:include page="../main/header.jsp" />
<!--================ 헤더 끝 =================-->

<!--================ CSS및 그외 링크 =================-->
<link rel="stylesheet"
	href="${contextPath}/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="${contextPath}/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${contextPath}/vendors/linericon/style.css">
<link rel="stylesheet"
	href="${contextPath}/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${contextPath}/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${contextPath}/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="${contextPath}/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="${contextPath}/css/style.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/orderCart.js"></script>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/orderProduct.css">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>





<body>

	<!-- ================ start banner area ================= -->
	<div> 
		<img alt="banner" src="../img/pay_list.png" width="100%">
	</div>
	<!-- ================ end banner area ================= -->
	


		<form action="${contextPath}/history/insertCartHistory.do" method="post"
			id="insertHistoryForm">
			<section id="p_head">
				<input type="hidden" name="id" id="id" value="${id}">
				<br>

				<h4 class="index_title">1. 주문상품 할인 적용</h4>

				<div class="product_info">
					<table border="1.5px solid black">
						<colgroup>
							<col width="200px">
							<col width="700px">
							<col width="150px">
							<col width="150px">
							<col width="150px">
						</colgroup>
						<thead>
							<tr align="center">
								<th>상품 이미지</th>
								<th>상품정보</th>
								<th>개수</th>
								<th>금액</th>
								<th>배송비</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="orderList" items="${orderList}" varStatus="status">
								<tr align="center">
									<td>
										<!-- 상품 이미지  -->
										<div id="img_box">
											<img src="${contextPath}/upload/${orderList.filename}"
												width="200" height="200">
										</div>
										<input type="hidden" name="filename${status.index}" 
										id="filename${status.index}" value="${orderList.filename}">
									</td>
									<td><a> <span class="subject"> <!-- 상품이름 --> <strong>
													${orderList.name} </strong>
										</span>
										<input type="hidden" name="pname${status.index}" 
										id="pname${status.index}" value="${orderList.name}">
									</a>
										<ul>
											<li>
												<!-- 상품단가   -->
												<div>${orderList.price*orderList.count}</div>
												<input type="hidden" name="price${status.index}" value="${orderList.price}">
											</li>
										</ul></td>
									<!-- 개수 -->
									<td>${orderList.count}개  <input type="hidden" name="pcount${status.index}" value="${orderList.count}">  </td>
									<!-- 금액(단가 * 개수) -->
									<td>${orderList.price*orderList.count}
									</td>
									<td>
									 	<c:choose>
									 		<c:when test="${status.last}">
									 			<c:set var="allPrice"  value="${allPrice+(orderList.price*orderList.count)}"/>
									 			<c:if test="${allPrice < 50000}">
									 				<c:set var="delivery_price" value="3000"/>
									 			</c:if>
									 			${delivery_price}
									 		</c:when>
									 		<c:otherwise>
									 			<c:set var="allPrice"  value="${allPrice+(orderList.price*orderList.count)}"/>
									 			${delivery_price}
									 		</c:otherwise>
									 	</c:choose>
									</td>
								</tr>
							</c:forEach>	
						</tbody>
					</table>
				</div>

								<div class="totalMoney">
					<table>
						<colgroup>
							<col width="131px">
							<!-- 상품금액 -->
							<col width="24px">
							<!-- plus -->
							<col width="24px">
							<!-- 여백 -->
							<col width="131px">
							<!-- 배송비 -->
							<col width="24px">
							<!-- = -->
							<col width="24px">
							<!-- 여백 -->
							<col width="147px">
							<!-- 최종결제금액 -->
						</colgroup>
						<thead>
							<tr>
								<!-- 상품금액 제목 -->
								<th class="vb">쿠폰</th>
								<!-- 여백 -->
								<td>&nbsp;</td>
								<!-- 여백 -->
								<td>&nbsp;</td>
								<!-- 할인금액  제목-->
								<th class="layer vb">할인금액</th>
								<!-- 여백 -->
								<td>&nbsp;</td>
								<!-- 여백 -->
								<td>&nbsp;</td>
								<!-- 할인적용 금액 제목 -->
								<th>할인적용금액</th>
							</tr>
							
							
							
							<tr class="money">
								<!-- 상품 금액 -->
								<td class="vt"><div id="qwerty"></div>
									<select name="coupon" id="coupon" class="abc">
										<option value="">선택없음</option>
											<c:choose>
												<c:when test="${CouponList != null}">
													<c:forEach var="coupon" items="${CouponList}" varStatus="listNum">
															<option value="${coupon.subject}/${coupon.percent}">${coupon.subject} / ${coupon.percent}%</option>
													</c:forEach>
												</c:when>
											</c:choose>
									</select>
								</td>
								<!-- 쿠폰 값  -->
								<td class="vt"></td>
								<td></td>
								<!-- 할인금액 -->
								<td id="discountPrice" class="vt">0</td>
								<td class="vt"></td>
								<td class="vt">&nbsp;</td>
								
								<!-- 할인 적용 금액 -->
								<td id="discountedPrice"></td>
							</tr>
							<tr>
								<!-- 상품금액 제목 -->
								<th class="vb"><img
									src="${contextPath}/img/product/txt_rebasket01.gif"></th>
								<!-- plus -->
								<td>&nbsp;</td>
								<!-- 여백 -->
								<td>&nbsp;</td>
								<!-- 배송비  제목 -->
								<th class="layer vb"><img
									src="${contextPath}/img/product/txt_rebasket02.gif"></th>
								<!-- =기호 -->
								<td>&nbsp;</td>
								<!-- 여백 -->
								<td>&nbsp;</td>
								<!-- 최종 결제 금액 제목 -->
								<th><img
									src="${contextPath}/img/product/txt_rebasket04.gif"></th>
							</tr>
							
							
							
							
							<!-- 최종 상품 금액 -->
							<tr class="money" >
								<!-- 상품 금액 -->
								<td class="vt" id="discoutedPrice2">${allPrice}</td>
								<!-- plus 기호 -->
								<td class="vt"><img
									src="${contextPath}/img/product/ico_plus.gif"></td>
								<td></td>
								<!--  결제 50000원 이상 일 경우에만 배송비 무료 -->
								<td class="vt">${delivery_price}</td>

								<td class="vt"><img
									src="${contextPath}/img/product/ico_total.gif"></td>
								<td class="vt">&nbsp;</td>
								<!-- 총 비용 -->
								<td id="finalAllPrice">${allPrice+delivery_price}</td>
							</tr>
						</thead>
					</table>
				</div>
			</section>

			<section id="p_body" style="clear: both">
				<h4 class="index_title">
					2. 배송지 정보 입력 <small style="color: red; margin-left: 10px;">(*필수입력)</small>
				</h4>
				<div class="delivery-info">
					<table>
						<colgroup>
							<col style="width: 15%">
							<col style="width: 85%">
						</colgroup>
						<tbody>
							<!--  배송지 선택 -->
							<tr>
								<th rowspan="1" class="delevery_info_th" bgcolor="#ddd"><span
									style="color: red; padding-left: 10px;">*</span> 배송지 선택</th>
								<td class="delevery_info_value">
									<!-- 기본적으로 새로운 배송지를 입력할 수 있게 기본값으로 checked를 주고 
											회원가입시 입력한 주소가 동일하다면 나의 기존 배송지를 클릭시 값을 가져옴 --> 
									<label for="newAddress">새로운 배송지</label>
									<input type="radio" id="newAddress" name="addressRadio" 
										class="addressRaido" value="newAddress" checked="checked"> 
									<label for="myAddress">나의 기존 배송지</label> 
									<input type="radio" id="myAddress" name="addressRadio"
									class="addressRaido" value="myAddress">
								</td>
							</tr>
							<tr>
								<th rowspan="1" class="delevery_info_th" bgcolor="#ddd"><span
									style="color: red; padding-left: 10px;">*</span> 이름</th>
								<td class="delevery_info_value"><input type="text"
									id="name" name="name" placeholder="이름"></td>
							</tr>
							<tr>
								<th rowspan="1" class="delevery_info_th" bgcolor="#ddd"><span
									style="color: red; padding-left: 10px;">*</span> 주소</th>
								<td class="delevery_info_value"><input type="text"
									id="postcode" name="postcode" readonly="readonly"> <input
									type="button" value="우편번호 검색" id="postCode_button"></td>
							</tr>
							<tr>
								<th rowspan="1" class="delevery_info_th" bgcolor="#ddd"><span
									style="color: red; padding-left: 10px;"></span></th>
								<td class="delevery_info_value"><input type="text"
									placeholder="주소" id="address" name="address"
									readonly="readonly"> <input type="text"
									placeholder="상세주소" id="detailAddress" name="detailAddress">
								</td>
							</tr>
							<tr>
								<th rowspan="1" class="delevery_info_th" bgcolor="#ddd"><span
									style="color: red; padding-left: 10px;">*</span> 연락처</th>
								<td class="delevery_info_value"><input type="text"
									readonly="readonly" value="010" class="phone" id="phone1"
									name="phone1"> <input type="text" maxlength="4"
									class="phone" id="phone2" name="phone2"> <input
									type="text" maxlength="4" class="phone" id="phone3"
									name="phone3"></td>
							</tr>
							<tr>
								<th rowspan="1" class="delevery_info_th" bgcolor="#ddd"><span
									style="padding-left: 20px;">배송메세지</span></th>
								<td class="delevery_info_value"><input type="text"
									placeholder="택배 기사님께 전달할 배송 메세지를 입력해주세요" id="msg" name="msg"
									maxlength="100" style="float: left">
									<div style="float: left; margin-left: 20px;">
										<span id="msgCount">0</span><span>/50자</span><br>
									</div></td>
							</tr>

						</tbody>
					</table>
				</div>
			</section>

			<section id="p_footer">
				<h4 class="index_title">3.결제 수단</h4>

				<div class="payment_total">
					<div class="payment_option">
						<div class="select_payment">
							<label for="credit_card">카드결제</label> <input type="radio"
								name="payment" class="payment" id="credit_card"
								value="credit_card"> <label for="bank_fransfer">무통장
								입금</label> <input type="radio" name="payment" class="payment"
								id="bank_fransfer" value="bank_transfer">
						</div>
						<div class="payment_info" style="display: none">
							<table>
								<colgroup>
									<col style="width: 20%">
									<col style="width: 80%">
								</colgroup>
								<tbody>
									<tr>
										<th rowspan="1" class="payment_info_th" bgcolor="#ddd"><span
											style="color: red; padding-left: 10px;">*</span> 입금자명</th>
										<td class="payment_info_value"><input type="text"
											name="depositor_name" id="depositor_name"></td>
									</tr>
									<tr>
										<th rowspan="1" class="payment_info_th" bgcolor="#ddd"><span
											style="color: red; padding-left: 10px;">*</span> 입금은행</th>
										<td class="payment_info_value"><select id="bank"
											name="bank">
												<option value="선택해주세요">:) 선택해주세요~!!!</option>
												<option value="국민은행">국민은행 111111111111 (주)기프트유</option>
												<option value="하나은행">하나은행 111111111111 (주)기프트유</option>
												<option value="기업은행">기업은행 111111111111 (주)기프트유</option>
										</select></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- end info -->

						<div><input type="button" value="결제하기" id="payment_button" class="paymentButton"></div>
						<div><input type="button" value="장바구니로 이동" id="cart_button" class="paymentButton"></div>
						
		
						<!-- end info2 -->
					</div>
					<!-- end option -->
					
					<!-- 카드 결제시 넘겨야할 값들 -->
					<input type="hidden" id="allPrice" name="allPrice" value="${allPrice+delivery_price}">
					<input type="hidden" id="productName" name="productName" value="${orderCartList[0].name} 외  ${fn:length(orderCartList)-1} ">
					<input type="hidden" id="email" name="email">
					<input type="hidden" id="payment_type" name="paymentType" value="creditcard">
					<input type="hidden" id="fcount" name="fcount" value="${length}">
				</div>
				<!-- end total -->
			</section>
		</form>
	
	<script type="text/javascript">
	
	$("#coupon").on("change", function () {

		/* $("#ababab").text(""); */
		var subIndex = $("#coupon").val().indexOf('/'); // 인덱스 위치
 		var discountPercent = $("#coupon").val().substring(subIndex+1); // 쿠폰 할인 퍼센트 값
 		var allPrice = '${allPrice}'; // 할인 적용전 상품 전체 가격
 		var discountPrice = Math.floor(allPrice*(discountPercent*0.01)); //할인 값 
 		var dicountedPrice = Number(allPrice-discountPrice); // 할인 적용한 값
 		var delivery_price =Number('${delivery_price}'); // 배송비
 		var finalAllPrice = delivery_price+dicountedPrice; // 최종 가격
 		
 		$("#discountPrice").text("<c:set var='discountPrice' value='"+discountPrice+"'/>${discountPrice}");
 		$("#discountedPrice").text(dicountedPrice);
 		$("#discoutedPrice2").text(dicountedPrice);
 		$("#finalAllPrice").text(dicountedPrice+delivery_price);
 		$("#allPrice").val(finalAllPrice);
 		
	});
	
	</script>
	
	
	<!--================ 푸터  =================-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ 푸터 끝  =================-->
</body>
</html>