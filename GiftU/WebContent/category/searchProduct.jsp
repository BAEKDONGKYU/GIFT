
<%@page import="java.util.List"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath }"/>

<%
	request.setCharacterEncoding("UTF-8");
 
%>
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
<link rel="stylesheet" href="../css/shop.css">
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
#b{
	color: #384aeb;
}
</style>

</head>
<body>
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp"/>
	<!--================ 헤더 끝 =================-->

	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shop
								Category</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories">
						<div class="head">Browse Categories</div>
						<ul class="main-categories">
							<li class="common-filter">
								<form action="#">
									<ul>
										<li class="filter-list">
											<input class="pixel-radio" type="radio" id="men" name="brand">
												<label for="men">남자<span>(3600)</span></label>
										</li>
										<li class="filter-list">
											<input class="pixel-radio" type="radio" id="women" name="brand">
												<label for="women">여자<span> (3600)</span></label>
										</li>
										<li class="filter-list">
											<input class="pixel-radio" type="radio" id="nomatter" name="brand">
											<label for="accessories">중성<span> (3600)</span></label>
										</li>										
									</ul>
								</form>
							</li>
						</ul>
					</div>
					<div class="sidebar-filter">
						<div class="top-filter-head">Product Filters</div>
						<div class="common-filter">
							<div class="head">event</div>
								<form action="#">
               						 <ul>
                 						 <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="apple">생일<span>(29)</span></label></li>
                 						 <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="asus">환갑잔치<span>(29)</span></label></li>
                  						<li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">발렌타인데이<span>(19)</span></label></li>
               						 </ul>
             					 </form>
						</div>
						<div class="common-filter">
				<div class="head">age</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="color"><label for="black">10대<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="color"><label for="balckleather">20대
                      <span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="blackred" name="color"><label for="blackred">30대
                      <span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="gold" name="color"><label for="gold">40대<span>(19)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="spacegrey" name="color"><label for="spacegrey">50대이상<span>(19)</span></label></li>
                </ul>
              </form>
						</div>
						<div class="common-filter">
							<div class="head">Price</div>
							<div class="price-range-area">
								<div id="price-range"></div>
								<div class="value-wrapper d-flex">
									<div class="price">Price:</div>
									<span>$</span>
									<div id="lower-value"></div>
									<div class="to">to</div>
									<span>$</span>
									<div id="upper-value"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-9 col-lg-8 col-md-7">
					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting">
							<select>
								<option value="1">Default sorting</option>
								<option value="1">Default sorting</option>
								<option value="1">Default sorting</option>
							</select>
						</div>
						<div class="sorting mr-auto">
							<select>
								<option value="1">Show 12</option>
								<option value="1">Show 12</option>
								<option value="1">Show 12</option>
							</select>
						</div>
						<div>
							<div class="input-group filter-bar-search">
								<input type="button" value="상품 등록"
									onclick="location.href='${contextPath}/product/productWriteForm.do'">
								<input type="text" placeholder="Search">
								<div class="input-group-append">
									<button type="button">
										<i class="ti-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Filter Bar -->
					<!-- Start Best Seller -->
					<section class="lattest-product-area pb-40 category-list">

						<div class="row">
							<c:choose>
								<c:when test="${requestScope.v == null }">
									<h1>등록된 상품이 없습니다.</h1>
								</c:when>
								<c:otherwise>
									<c:forEach items="${requestScope.v }" var="PBean" >
										<div class="col-md-6 col-lg-4">
											<div class="card text-center card-product">
												<div class="card-product__img">
													<img class="card-img" src="../upload/${PBean.filename}" >
													<ul class="card-product__imgOverlay">
														<li><button>
																<i class="ti-search"></i>
															</button></li>
														<li><button>
																<i class="ti-shopping-cart"></i>
															</button></li>
														<li><button>
																<i class="ti-heart"></i>
															</button></li>
													</ul>
												</div>
												<div class="card-body">
													<h4 class="card-product__title">
														<a href="${contextPath }/product/viewDetail.do?num=${PBean.num}">${PBean.name }</a>
													</h4>
													<p class="card-product__price">${PBean.price }</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>

					</section>
					<!-- End Best Seller -->
				</div>
			</div>
		</div>
	</section>
	<!-- ================ category section end ================= -->

	<!-- ================ top product area start ================= -->
	<section class="related-product-area">
		<div class="container">
			<div class="section-intro pb-60px">
				<p>Popular Item in the market</p>
				<h2>
					Top <span class="section-intro__style">Product</span>
				</h2>
			</div>
			<div class="row mt-30">
				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-4.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-5.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-6.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-7.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-8.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-9.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ top product area end ================= -->

	<!-- ================ Subscribe section start ================= -->
	<section class="subscribe-position">
		<div class="container">
			<div class="subscribe text-center">
				<h3 class="subscribe__title">Get Update From Anywhere</h3>
				<p>Bearing Void gathering light light his eavening unto dont
					afraid</p>
				<div id="mc_embed_signup">
					<form target="_blank"
						action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
						method="get" class="subscribe-form form-inline mt-5 pt-1">
						<div class="form-group ml-sm-auto">
							<input class="form-control mb-1" type="email" name="EMAIL"
								placeholder="Enter your email" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Your Email Address '">
							<div class="info"></div>
						</div>
						<button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe
							Now</button>
						<div style="position: absolute; left: -5000px;">
							<input name="b_36c4fd991d266f23781ded980_aefe40901a"
								tabindex="-1" value="" type="text">
						</div>

					</form>
				</div>

			</div>
		</div>
	</section>
	<!-- ================ Subscribe section end ================= -->


	<!--================ Start footer Area  =================-->
	<!-- 	<footer>
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="img/gallery/r1.jpg" alt=""></li>
								<li><img src="img/gallery/r2.jpg" alt=""></li>
								<li><img src="img/gallery/r3.jpg" alt=""></li>
								<li><img src="img/gallery/r5.jpg" alt=""></li>
								<li><img src="img/gallery/r7.jpg" alt=""></li>
								<li><img src="img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p>
				</div>
			</div>
		</div>
	</footer> -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->



	<script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="../vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="../vendors/skrollr.min.js"></script>
	<script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="../vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="../vendors/nouislider/nouislider.min.js"></script>
	<script src="../vendors/jquery.ajaxchimp.min.js"></script>
	<script src="../vendors/mail-script.js"></script>
	<script src="../js/main.js"></script>
</body>
</html>