<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<%
	String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html lang="en">

<!--================ 탭 링크 =================-->

<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>giftU: 찜한 상품</title>
  	<link rel=" shortcut icon" href="../img/favi.ico">
	<link rel="icon" href="img/favi.ico">

<!--================ CSS및 폰트링크 =================-->		
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
$(function(){
	$("#allCheck").click(function(){
		if($("#allCheck").is(":checked"))
			$("input:checkbox[name=delHeartList]").attr("checked","true");
		else
			$("input:checkbox[name=delHeartList]").removeAttr("checked");
	});
});


	function checkdel(){
	$("#heartForm").attr("action","${contextPath}/cart/delHeartList.do").submit();
	}

</script>



</head>
<body>
	<!--================ Start Header Menu Area =================-->


	<jsp:include page="../main/header.jsp"></jsp:include>

	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->
	<div> 
		<img alt="banner" src="../img/heart_list.png" width="100%">
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
								<th width="2%"><input type="checkbox"  id="allCheck" name="allCheck"></th>
								<th scope="col">name</th>
								<th scope="col">price</th>
								<th scope="col">inventory</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${heartList == null }">
									<tr align="center">
										<td rowspan="4"><h1></h1></td>
									</tr>
								</c:when>
								<c:otherwise>
									<form action="" method="get" name="heartForm" id="heartForm">
										<input type="hidden" name="id" value="${id }">
										<c:forEach items="${heartList}" var="list">
										<%-- <input type="hidden" name="num" value="${list.num }"> --%>
											<tr align="center">
												<td width="1%"><input type="checkbox"
													value="${list.num}" name="delHeartList"> <img
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
													<h5>${list.price }</h5>
												</td>
												<td>
													<h5>${list.inventory }</h5>
												</td>
											</tr>
										</c:forEach>
								</c:otherwise>

							</c:choose>


							<tr class="bottom_button">
								<td><button onclick="checkdel()" class="button">delete</button> </td>
								<td></td>
								<td></td>
								<td>
									
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