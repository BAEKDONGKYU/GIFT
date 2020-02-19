<%@page import="cart.cartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="../vendors/linericon/style.css">
<jsp:include page="links.jsp"></jsp:include>

<style type="text/css">
@font-face {
	font-family: 'Recipekorea';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Cafe24Dangdanghae';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.2/Cafe24Dangdanghae.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Binggrae-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff')
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

.drop {
	font-family: 'Cafe24Dangdanghae';
}

#cart {
	height: 600px;
}

.title {
	font-family: 'Cafe24Dangdanghae' !important;
	font-size: 300%;
	letter-spacing: 0.1em;
}

.subscribe {
	background-color: #f1f6f7;
}

.purple {
	color: #384aeb;
}

.noto {
	font-family: 'Cafe24Dangdanghae';
	font-size: 1.3em;
	color: #f24e66;
}

.nav-shop {
	margin-top: -16px;
}




div#popup {
	position: absolute;
	background-color: #fff;
	top: 100px;
	left: 5px;
	width: 500px;
	height: auto;
	z-index: 3;
	border-radius: 5px;
	cursor: pointer;
	border: none;
	text-align: center;
}

div#noshow {
	cursor: pointer;
	font-size: 1.2pem;
	padding: 4px;
	color: white;
	background-color: royalblue;
}

#event_span {
	font-family: 'Binggrae-Bold';
	font-size: 1.4em;
	letter-spacing: 0.1em;
	color: #d45050;
}

div#green {
	background-color: lightseagreen;
	color: white;
}

div#green:HOVER {
	text-decoration: underline;
}

div#noshow:HOVER {
	text-decoration: underline;
}

div#memo {
	font-family: 'Binggrae-Bold';
	font-size: 1.2em;
	padding-top: 0.2em;
}

.nav-item {
	font-family: 'S-CoreDream-5Medium';
	font-weight: 600;
}

.eye{
	font-family: 'S-CoreDream-5Medium';
	font-weight: 600;
	color: #f24e66;
}
</style>

<!--================ 상단 메뉴바 =================-->
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	cartDAO dao = new cartDAO();
	int cartCount = dao.getCartAmount(id, 0);
	%>
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<a class="navbar-brand logo_h" href="${contextPath}/index/index.do">
					<img src="${contextPath}/img/present.png" alt="logo" height="50px">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
						<li class="nav-item active"><a class="nav-link"
							href="${contextPath}/index/index.do" id="a">메인</a></li>
							
						<li class="nav-item active"><a class="nav-link"
							href="${contextPath}/product/listProducts.do" id="b">쇼핑</a></li>
						<%-- <li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">쇼핑 </a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/product/listProducts.do">Shop Category</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/main/single-product.jsp">Product Details</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/main/checkout.jsp">Product Checkout</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/main/confirmation.jsp">Confirmation</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/category/cart.jsp">ShoppingCart</a></li>
							</ul></li> --%>
							
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false" id="c">공지/문의</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/notice/listAllNotice.do">공지/이벤트</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${contextPath}/boarde/listBoard.do">문의</a></li>
							</ul></li>

						<li class="nav-item submenu dropdown"><a
							href="${contextPath}/member/memberInfo.do?id=<%=id %>"
							class="nav-link dropdown-toggle" id="d">내 정보</a></li>


						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/main/contact.jsp" id="e">소개</a></li>

					</ul>


					<ul class="nav-shop nav navbar-nav">
						<li class="nav-item submenu dropdown" style="margin-top: 30px;">
							<button>
								<i class="ti-search dropdown-toggle" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false"></i>
							</button>

							<form action="${contextPath}/product/goodssearch.do" method="get">
								<ul class="dropdown-menu drop">
									<li class="nav-item" style="width: 300px; height: auto;">
										<div
											style="border: 1px dotted #c6c6c6; border-radius: 8px; padding: 10px;">
											<input type="text" name="searchgoods"
												placeholder="어떤 상품을 찾으시나요?"
												style="width: 200px; height: 35px; padding: 0px 10px;">
											<input type="submit" class="btn_search" value="검색"
												style="background-color: #384aeb; color: white; border: none; padding: 6px 12px; border-radius: 8px;">
										</div>
									</li>
								</ul>
							</form>
						</li>

						<li  class="nav-item" style="margin-top: 30px;"><a class="icon_btn"
								href="${contextPath}/cart/heartList.do?id=${id}"><i class="fas fa-heart" style="color: #f24e66;"></i></a></li>
						
						<li class="nav-item" style="margin-top: 30px;">
							<button onclick="location.href='${contextPath}/cart/listCart.do?id=${id}'">
								<i class="ti-shopping-cart"></i>
								<span class="nav-shop__circle"><%=cartCount %></span>
							</button>
						</li>
						<%
					
					if (id == null) {
				%>

						<li class="nav-item"><a class="button button-header"
							href="${contextPath}/register/register.jsp">Join</a> <a
							class="button button-header" style="margin-top: 20px;"
							href="${contextPath}/member/login.do">Login</a></li>

						<%
					} else {
				%>
						<li class="nav-item"><a class="button button-header"
							href="${contextPath}/member/memberInfo.do?id=${id}">${id}님</a> <a
							class="button button-header"
							href="${contextPath}/member/logout.do" style="margin-top: 20px;">Logout</a></li>
					</ul>
					<%
					}
				%>
				</div>

			</div>
		</nav>
	</div>
</header>