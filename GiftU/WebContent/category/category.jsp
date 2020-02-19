<%@page import="java.util.List"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="totalProduct" value="${totalProduct }" />
<c:if test="${not empty productMap.listProducts}">
	<c:set var="listProducts" value="${productMap.listProducts }" />
</c:if>
<c:if test="${not empty productList }">
	<c:set var="listProducts" value="${productList}" />
</c:if>
<c:set var="section" value="${productMap.section }" />
<c:set var="pageNum" value="${productMap.pageNum }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Category</title>
<link rel="icon" href="../img/Fevicon.png" type="image/png">
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


	<%
		request.setCharacterEncoding("utf-8");
		String id=(String)session.getAttribute("id");
	
	%>
<script type="text/javascript">
	$(function() {

		$(".pixel-radio")
				.click(
						function() {

							var st1 = $(":input:radio[name=gender]:checked")
									.val();
							var st2 = $(":input:radio[name=event]:checked")
									.val();
							var st3 = $(":input:radio[name=age]:checked").val();
							var st4 = $(":input:radio[name=price]:checked")
									.val();

							var _jsonInfo = '{"gender":"' + st1 + '","event":"'
									+ st2 + '","age":"' + st3 + '","price":"'
									+ st4 + '"}';

							$
									.ajax({
										//서블릿으로 요청할 요청방식 지정
										type : "get",
										//동기 방식으로 요청 할것인지 비동기 방식으로 요청 할건지 지정
										async : true,
										//서블릿으로 응답받을 데이터 유형 지정
										data : {
											jsonInfo : _jsonInfo

										},

										//요청할 웹애플리케이션 서버가 실행할 페이지 주소 지정
										url : "${contextPath}/category.do?id='${id}'",

										//전송과 응답통신에 모두 성공 했을떄 응답 데이터 받기
										success : function(data, textStatus) {

											var id = $(data).find("id").text();
		
											if (data != "null") {

												if (id == "'admin'") {
													//id 가 admin일떄
													$("#row ").empty();
													$(data)
															.find("product")
															.each(
																	function() {

																		var filename = $(
																				this)
																				.find(
																						"filename")
																				.text();
																		var name = $(
																				this)
																				.find(
																						"name")
																				.text();
																		var price = $(
																				this)
																				.find(
																						"price")
																				.text();
																		var num = $(
																				this)
																				.find(
																						"num")
																				.text();
																		

																		$(
																				"#row")
																				.append(
																						//상품있을떄

																						"<input type='hidden' value='1' name='qty'>"
																								+ "<div class='col-md-6 col-lg-4' style='display: inline-block;'>"
																								+ "<div class='card text-center card-product'>"
																								+ "<div class='card-product__img'>"
																								+ "<a href='${contextPath }/product/viewDetail.do?num="
																								+ num
																								+ "&filename="
																								+ filename
																								+ "'>"
																								+ "<img class='card-img' src='../upload/"+filename+"' ></a>"
																								+ "<ul class='card-product__imgOverlay'><a><li><button>"
																								+ "<i class='ti-search'></i></button></li></a>"
																								+ "<a><li><button><i class='ti-shopping-cart'></i></button></li></a>"
																								+ "<a><li><button><i class='ti-heart'></i></a>"
																								+ "</button>"
																								+ "</li>"
																								+ "</ul>"
																								+ "</div>"
																								+ "<div class='card-body'>"
																								+ "<p class='card-product__title'>"
																								+ "<input type='checkbox' value='"+num+"' name='delList'>"
																								+ "<a href='${contextPath }/product/viewDetail.do?num="
																								+ num
																								+ "&filename="
																								+ filename
																								+ "'>"
																								+ name
																								+ "</a>"
																								+ "</p>"
																								+ "<p class='card-product__price'>"
																								+ "원"+"</p>"
																								+ "</p>"
																								+ "</div></div></div>"

																				);

																	});
												} else if (id != "'admin'"
														|| id == "''") {
							
													//id가 admin이 아닐때
													$("#row ").empty();
													$(data)
															.find("product")
															.each(
																	function() {
																		var id = $(this).find("id").text();
																		var filename = $(
																				this)
																				.find(
																						"filename")
																				.text();
																		var name = $(
																				this)
																				.find(
																						"name")
																				.text();
																		var price = $(
																				this)
																				.find(
																						"price")
																				.text();
																		var num = $(
																				this)
																				.find(
																						"num")
																				.text();
																		
																		var event = $(
																				this)
																				.find(
																						"event")
																				.text();
																		

																		$(
																				"#row")
																				.append(
																						"<input type='hidden' value='"+num+"' name='num'>"
																								+ "<input type='hidden' value='${id}' name='id'>"
																								+ "<input type='hidden' value='1' name='qty'>"
																								+ "<input type='hidden' value='" +filename+ "'name='filename'>"
																								+ "<input type='hidden' value='"+name+"' name='name'>"
																								+ "<input type='hidden' value='"+price+"' name='price'>"
																								+ "<div class='col-md-6 col-lg-4' style='display: inline-block;'>"
																								+ "<div class='card text-center card-product'>"
																								+ "<div class='card-product__img'>"
																								+ "<a href='${contextPath }/product/viewDetail.do?num="
																								+ num
																								+ "&id="+'${id}'+"&event="+event+"&filename="+filename+"'>"
																								+ "<img class='card-img' src='../upload/"+filename+"'></a>"
																								+ "<ul class='card-product__imgOverlay'><a onclick=''><li><button>"
																								+ "<i class='ti-search'></i></button></li></a>"
																								+ "<li><a onclick='addCart('"
																								+ num
																								+ "');''><button onclick='addCart('"
																								+ num
																								+ "');'>"
																								+ "<i class='ti-shopping-cart'></i></button></a></li>"
																								+ "<li><a onclick='addHeart('"
																								+ num
																								+ "');'><button onclick='addHeart('"
																								+ num
																								+ "');'>"
																								+ "<i class='ti-heart'></i></button></a></li>"
																								+ "</ul>"
																								+ "</div>"
																								+ "<div class='card-body'>"
																								+ "<p class='card-product__title'>"
																								+ "	<a href='${contextPath }/product/viewDetail.do?num="
																								+ num
																								+ "&id="+'${id}'+"&event="+event+"&filename="+filename+"'>"+ name
																								+ "</a>"
																								+ "</p>"
																								+ "<p class='card-product__price'>"
																								+ price 
																								+ "원"+"</p>"
																								+ "</div></div></div>"

																				);

																	});
												}

											} else {//상품없을때
												$("#row ").empty();
												$("#row")
														.append(
																"<div style='width: 80%; height: 200px;'>"
																		+ "<p style='font-family: Binggrae-Bold; font-size: 30px; margin-left:40px;'>"
																		+ " 검색하신 조건에 대한 해당 <span style='color:purple;'>상품</span>이 없습니다.</p>"
																		+ "</div>");
											}
										},
										error : function(data, textStatus) {
											alert("에러가 발생 했습니다!");
										}

									});

						});

	});
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

section.section-margin--small.mb-5 {
	font-family: 'Binggrae-Bold';
}

div.xl-9.col-lg-8.col-md-7 {
	font-family: 'Binggrae-Bold';
}

p.card-product__title {
	font-family: 'Binggrae-Bold';
	font-size: 18px;
}
p.card-product__price {
	font-family: 'Binggrae-Bold';
	font-size: 16px;
}
#b {
	color: #384aeb;
}

.no-uline {
	font-size: 10px;
	color: black;
}

</style>
</head>
<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp" />
	<!--================ 헤더 끝 =================-->

	<!-- ================ category section start ================= -->
	<section class="section-margin--small mb-5">

		<div class="container">

			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-filter" style="margin-top: -4px;">
						<div class="top-filter-head">Product Filters</div>
						<div class="common-filter">
							<div class="head">
								<i class="fas fa-chevron-circle-right"
									style="color: #384aeb; margin-right: 3px;"></i>Gender
							</div>
							<form action="${contextPath}/product/category.do" id="gender"
								name="selectCategory">
								<ul>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="man" value="man" name="gender"> <label
										for="man">남자</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="woman" value="woman" name="gender"> <label
										for="women">여자</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="nomatter" value="nomatter" name="gender">
										<label for="accessories">관계없음</label></li>
								</ul>
							</form>
						</div>
						<div class="common-filter">
							<div class="head">
								<i class="fas fa-chevron-circle-right"
									style="color: #384aeb; margin-right: 3px;"></i>event
							</div>
							<form action="#">
								<ul>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="생일" name="event"> <label
										for="apple">생일 </label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="발렌타인데이" name="event"> <label
										for="gionee">발렌타인데이 </label></li>
								</ul>
							</form>
						</div>
						<div class="common-filter">
							<div class="head">
								<i class="fas fa-chevron-circle-right"
									style="color: #384aeb; margin-right: 3px;"></i>age
							</div>
							<form action="#">
								<ul>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="10" name="age"> <label for="black">10대
									</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="20" name="age"> <label
										for="balckleather">20대 </label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="30" name="age"> <label
										for="blackred">30대 </label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="40" name="age"> <label for="gold">40대

									</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="50" name="age"> <label
										for="spacegrey">50대이상 </label></li>
								</ul>
							</form>
						</div>
						<div class="common-filter">
							<div class="head">
								<i class="fas fa-chevron-circle-right"
									style="color: #384aeb; margin-right: 3px;"></i>price
							</div>
							<form action="#">
								<ul>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="0" name="price"> <label
										for="apple">1만원이하 </label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="10000" name="price"> <label
										for="asus">1만원이상~2만원미만 </label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="20000" name="price"> <label
										for="gionee">2만원이상~3만원미만 </label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="30000" name="price"> <label
										for="gionee">3만원이상~4만원미만 </label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" value="40000" name="price"> <label
										for="gionee">4만원이상~ </label></li>
								</ul>
							</form>
						</div>
						<div>
							<img src="../img/category/ye.png"
								style="height: 300px; width: 100%;">

						</div>
					</div>

				</div>

				<div class="col-xl-9 col-lg-8 col-md-7">
					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting">
							<select onchange="window.location.href=this.value">

								<option value="${contextPath}/product/listProducts.do">전체보기</option>
								<option value="${contextPath}/product/datesearch.do">등록일순</option>
								<option value="${contextPath}/product/popsearch.do">인기순</option>
								<option value="${contextPath}/product/reviewsearch.do">리뷰순</option>

							</select>
						</div>

						<div>
							<c:if test="${id == 'admin' }">
								<div class="input-group filter-bar-search">
									<input type="button" value="선택삭제" onclick="checkdel();">
									<input type="button" value="상품 등록"
										onclick="location.href='${contextPath}/product/productWriteForm.do'">
									<input type="text" placeholder="Search">
									<div class="input-group-append">
										<button type="button">
											<i class="ti-search"></i>
										</button>
									</div>
								</div>
							</c:if>
						</div>
					</div>
					<!-- End Filter Bar -->
					<!-- Start  Category -->
					<section class="lattest-product-area pb-40 category-list"
						id="catelist">

						<c:choose>
							<c:when test="${listProducts == null }">
								<div
									style="border: 1px solid #e6e6e6; width: 80%; height: 200px;">
									<i class="fas fa-gift"
										style="color: purple; width: 80px; height: 80px;"></i>
									<p style="font-family: 'Binggrae-Bold'; font-size: 20px;">검색하신
										조건에 대한 해당 상품이 없습니다.</p>
								</div>
							</c:when>
							<c:when test="${listProducts != null }">
								<c:if test="${id == 'admin'}">
									<form action="" method="post" id="category-form"
										class="lattest-product-area pb-40 category-list">
										<div class="row" id="row">
											<input type="hidden" value="1" name="qty">
											<c:forEach items="${listProducts}" var="product">
												<div class="col-md-6 col-lg-4">
													<div class="card text-center card-product">
														<div class="card-product__img">
															<a href="${contextPath}/product/viewDetail.do?num=${product.num}&filename=${product.filename}&event=${product.event}">
																<img style="height: 254.94px;" class="card-img" src="../upload/${product.filename}">
															</a>
															<ul class="card-product__imgOverlay">
																<li>
																	<button onclick="modProduct('${product.num}')">
																		<i class="ti-search"></i>
																	</button>
																</li>
															</ul>
														</div>
														<div class="card-body">
															<p class="card-product__title"
																style="font-size: 13px; font-family: 'S-CoreDream-4Regular';">
																<input type="checkbox" value="${product.num}" name="delList"> 
																	<a href="${contextPath}/product/viewDetail.do?num=${product.num}&filename=${product.filename}&event=${product.event}">${product.name }</a>
															</p>
															<p class="card-product__price"><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</p>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</form>
								</c:if>
								<c:if test="${id != 'admin' || id == null }">
									<form action="" method="post"
										class="lattest-product-area pb-40 category-list"
										id="form-custom-category">
										<div class="row" id="row">
											<c:forEach items="${listProducts }" var="product">
												<input type="hidden" value="${product.num}" name="num">
												<input type="hidden" value="${id}" name="id" id="id">
												<input type="hidden" value="1" name="qty">
												<input type="hidden" value="${product.filename}"
													name="filename">
												<input type="hidden" value="${product.name }" name="name">
												<input type="hidden" value="${product.price }" name="price">
												<div class="col-md-6 col-lg-4"
													style="display: inline-block;">
													<div class="card text-center card-product">
														<div class="card-product__img">
															<a href="${contextPath }/product/viewDetail.do?num=${product.num}&id=${id}&filename=${product.filename}&event=${product.event}">
																<img style="height: 254.94px;"  class="card-img" src="../upload/${product.filename}">
															</a>
															<ul class="card-product__imgOverlay">
																<li>
																	<button onclick="addCart('${product.num}');">
																		<i class="ti-shopping-cart"></i>
																	</button>
																</li>
																<li>
																	<button onclick="addHeart('${product.num}');">
																		<i class="ti-heart"></i>
																	</button>
																</li>
															</ul>
														</div>
														<div class="card-body">
															<p class="card-product__title" style="font-size: 18px;">
																<a href="${contextPath }/product/viewDetail.do?num=${product.num}&id=${id}&filename=${product.filename}&event=${product.event}">${product.name }</a>
															</p>
															<p class="card-product__price" style="font-size: 16px;"><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</p>
															
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</form>

								</c:if>
							</c:when>
						</c:choose>


					</section>
				</div>


				<!-- category 페이징 -->
				<section
					style="margin-left: auto; margin-right: auto; font-size: 25px;">
					<c:if test="${totalProduct != null}">
						<c:choose>
							<c:when test="${totalProduct < 90 }">
								<c:forEach var="page" begin="1" end="${totalProduct/9 +1}"
									step="1">

									<c:if test="${page==pageNum }">
										<a class="sel-page"
											href="${contextPath }/product/listProducts.do?section=${section}&pageNum=${page}">${page }
										</a>
									</c:if>


									<c:if test="${page != pageNum }">
										<a class="no-uline"
											href="${contextPath }/product/listProducts.do?section=${section}&pageNum=${page}">${page }
										</a>
									</c:if>
								</c:forEach>
							</c:when>

							<c:when test="${totalProduct == 90 }">
								<c:forEach var="page" begin="1" end="10" step="1">
									<a class="no-uline"
										href="${contextPath}/product/listProducts.do?section=${section}&pageNum=${page}">${page}
									</a>
								</c:forEach>
							</c:when>

							<c:when test="${totalProduct > 90 }">
								<c:forEach var="page" begin="1" end="10" step="1">
									<c:if test="${section >1 && page==1 }">
										<!-- 이전 페이지로 갈 수 있는 a태그  -->
										<a class="no-uline"
											href="${contextPath }/product/listProducts.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;
											이전 </a>
									</c:if>
									<a class="no-uline"
										href="${contextPath }/product/listProducts.do?section=${section}&pageNum=${page}">${(section-1)*10 +page }
									</a>

									<c:if test="${page ==10 }">
										<a class="no-uline"
											href="${contextPath }/product/listProducts.do?section=${section+1}&pageNum=${section*10+1}">&nbsp;
											다음</a>
									</c:if>
								</c:forEach>
							</c:when>
						</c:choose>
					</c:if>
				</section>

			</div>
		</div>

	</section>
	<!-- ================ category section end ================= -->


	<!--================ Start footer Area  =================-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->
	<script type="text/javascript">
		function checkdel() {
			$("#category-form").attr("action",
					"${contextPath}/product/delList.do").submit();
		}
		function addCart(obj) {
	         if ($("#id").val() == "" || $("#id").val() == null) {
	            alert("로그인 후 이용해 주세요");
	         } else {
	            $("#form-custom-category").attr("action",
	                  "${contextPath}/cart/addCart-form.do?num=" + obj)
	                  .submit();
	            window.location.reload();
	         }
	      }
	     function addHeart(obj) {
	   if ($("#id").val() == "" || $("#id").val() == null) {
	            alert("로그인 후 이용해 주세요");
	         } else {
	            $("#form-custom-category").attr("action",
	                  "${contextPath}/cart/addHeart.do?num=" + obj).submit();
	         }
	      }
		function modProduct(obj) { //상품 수정
			$("#category-form").attr("action",
					"${contextPath}/product/modProduct.do?num=" + obj).submit();
		}

		function myFunction() {
			var x = document.getElementById("mySelect").value;

			if (x == "all") {
				window.location.href = "${contextPath}/product/listProducts.do";

			}
			if (x == "date") {
				window.location.href = "${contextPath}/product/datesearch.do";
			}
			if (x == "pop") {
				window.location.href = "${contextPath}/product/popsearch.do";
			}
			if (x == "review") {
				window.location.href = "${contextPath}/product/reviewsearch.do";
			}

		}

		$(document).ready(function() {
			var action = '${action}';
			if (action == "/listProducts.do") {
				$(".nice-select .current").text("전체보기");
			} else if (action == "/datesearch.do") {
				$(".nice-select .current").text("등록일순");
			} else if (action == "/popsearch.do") {
				$(".nice-select .current").text("인기순");
			} else if (action == "/reviewsearch.do") {
				$(".nice-select .current").text("리뷰순");
			}
		});
	</script>

</body>
</html>