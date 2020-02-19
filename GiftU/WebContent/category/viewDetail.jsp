<%@page import="java.text.DecimalFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id");
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Product Details</title>
	<link rel="icon" href="../img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../vendors/linericon/style.css">
  <link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/view.css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  <script type="text/javascript">

	function viewFile(obj) {
		if (obj.files && obj.files[0]) {
			$("#preview").html(
					"<img id='previewFile' src='#' width=200 height=150/>");

			var reader = new FileReader();

			reader.readAsDataURL(obj.files[0]);

			reader.onload = function(ProgressEvent) {
				$("#previewFile").attr("src", ProgressEvent.target.result);

			}
		}
	}
	
	

	function addCart() { //장바구니 버튼 클릭시 수량체크 후 폼태그에 action값을 설정해줘서 전송
		var count = parseInt($("#amount").val());
		var inven = parseInt($("#inventory").val());
		if (count > inven) {
			alert("수량초과!!");
		} else {
			$("#viewForm").attr("action", "${contextPath}/cart/addCart.do?count="+count)
					.submit();
		}
	}
	function modProduct() { //상품 수정
		$("#viewForm").attr("action", "${contextPath}/product/modProduct.do")
				.submit();
	}
	function buyPro() { //구매하려고할때 남은 수량과 비교 체크 후 구매 do로 이동
		var count = parseInt($("#amount").val());
		var inven = parseInt($("#inventory").val());
		if (count > inven) {
			alert("수량초과!!");
		} else {
			$("#viewForm").attr("action",
					"${contextPath}/product/buyProduct.do?count="+count).submit();
		}
	}

	function send() {
		$("#writeReviewForm").attr("action",
				"${contextPath}/product/addComment_r.do").submit();
	}
	
	$(function() {
		$(".thumbs a").click(function() {
			var imgPath = $(this).children("img");
			$("#big_img").attr("src", imgPath.attr("src")).hide().fadeIn();
			return false;
		});
	});
	
	
	
	var sell_price;
	var amount;
	var inventory;

	function init () {
		sell_price = document.form.sell_price.value;
		inventory=document.form.inventory.value;
		amount = document.form.amount.value;
		document.form.sum.value = sell_price;
		change();
	}

	function plus () {
		hm = document.form.amount;
		sum = document.form.sum;
		
		if(hm.value<parseInt(inventory)){
			hm.value ++ ;
			sum.value = parseInt(hm.value) * sell_price;
		}
		
		
	}

	function minus() {
		hm = document.form.amount;
		sum = document.form.sum;
			if (hm.value > 1) {
				hm.value -- ;
				sum.value = parseInt(hm.value) * sell_price;
			}
	}

	function change () {
		hm = document.form.amount;
		sum = document.form.sum;

			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * sell_price;
	}  	

</script>
<style type="text/css">
#b{
	color: #384aeb;
}
</style>
	
</head>
<body onload="init();">
	<!--================ 헤더 시작 =================-->
	<jsp:include page="../main/header.jsp"/>
	<!--================ 헤더 끝 =================-->

	<c:if test="${id!=null || id==null}">

	
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div >
						<div class="single-prd-item">
							<img src="../upload/${productDetail.filename}" width="500" height="400" id="big_img">
						</div>
						<div class="thumbs">
						<a style="margin-right: 5px; margin-top: 5px; cursor: pointer;"
							id="0" href=""><img src="../upload/${productDetail.filename}"
							width="100" height="100" id="thum01"></a>
						<c:if test="${not empty productDetail.filename1}">
							<a style="margin-right: 5px; margin-top: 5px; cursor: pointer;"
								id="1" href=""><img
								src="../upload/${productDetail.filename1}" width="100"
								height="100" id="thum02"></a>
						</c:if>
						<c:if test="${not empty productDetail.filename2}">
							<a style="margin-top: 5px; cursor: pointer;" id="2" href=""><img
								src="../upload/${productDetail.filename2}" width="100"
								height="100" id="thum03"></a>
						</c:if>
					</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					
				<table class="register_lg_1"  style="width:500px; height: 300px; text-align: left;">
					<tr style="border-bottom: 1px solid rgba(0, 0, 0,.05); background-color: rgba(0, 0, 0,.05);text-align: center;">
						<td colspan="3"><span class="mypage">${productDetail.name}</span> </td>
					</tr>
					<tr>
						<td style="width: 60x;"><strong>판매가</strong></td>
						<td colspan="2" style="text-align: left;"><strong>
						<fmt:formatNumber value="${productDetail.price}" pattern="#,###"/>원</strong></td>
					</tr>
					<tr>
						<td style="width: 60x;"><strong>배송비</strong></td>
						<td colspan="2" style="text-align: left;"><strong>
						<fmt:formatNumber value="${2500}" pattern="#,###"/>원</strong></td>
					</tr>
					<tr>
					
						<td style="width: 60x;"><strong>재고량</strong> </td>
						<td colspan="2" style="text-align: left;"><strong>${productDetail.inventory}개</strong>
						<c:if test="${productDetail.inventory<=5}">
							<p class="purple" style="float:inherit; display: inline;" >(매진임박!!)</p>
						</c:if>
						</td>
					</tr>
				</table>
				
				<table class="register_lg_12">
					<tr id="t_1">
						<td style="width: 40%;"><strong>상품명</strong></td>
						<td style="width: 25%;"><strong>갯수</strong></td>
						<td style="width: 35%;"><strong>가격</strong></td>

					</tr>
					<tr>
						<td style="width: 40%;"><strong>${productDetail.name }</strong></td>
						
						
						<td style="width: 25%;" colspan="2">
						<form name="form" method="get" style="margin-left: -20px;">
							<input type=hidden name="sell_price" value="${productDetail.price }">
							<input type=hidden name="inventory"  id="inventory" value="${productDetail.inventory}"> 
							
							<img src="../img/minus.png" onclick="minus();" style="width: 20px; height: 20px;">
							<input type="text" name="amount" id="amount" style="width: 30px; text-align: center; border: none;" value="1" size="10" onchange="change();"/>
							<img src="../img/plus.png" onclick="plus();" style="width: 20px; height: 20px;">
							&nbsp;&nbsp;&nbsp;
							<input type="text" value="${productDetail.price}" name="sum" style="border:none; width: 80px; text-align:right;">원 
						</form>
						</td>
						
						
					</tr>
				
				</table>
				<div class="btn_all">
						<div>
							<form action="" method="post" id="viewForm">
	       							<input type="hidden" name="id" value="${id}">
	       							<input type="hidden" name="num" value="${productDetail.num}">
	       							<input type="hidden" name="price" value="${productDetail.price }">
	       							<input type="hidden" name="name" value="${productDetail.name }">
	       							<input type="hidden" name="filename" value="${productDetail.filename }">
									<input type="button" class="btn1" value="장바구니" onclick="addCart();"/>    
							</form>
						</div>	
					<div class="btn2" ><a onclick="buyPro();">바로구매</a></div>
					<div class="btn2"><a a href="${contextPath}/cart/addHeart.do?num=${productDetail.num}&id=${id}">찜하기</a></div>		
				</div>
			</div>
		</div>
	</div>
  </div> 
</c:if>


	<!--================Product Description Area =================-->
	<section class="product_description_area" style="height: auto; margin-top: -300px">
		<div class="container" style="height: auto;">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
					 aria-selected="false"> 상세설명</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
					 aria-selected="false">관련 상품</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="contact-tab"  href="${contextPath}/product/viewDetail2.do?num=${productDetail.num}&id=${id}&event=${productDetail.event}"
					 aria-selected="false" >댓글보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active show" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false"> 리뷰보기</a>
				</li>
			</ul>
			
			
			<div class="tab-content" id="myTabContent" style="height: auto;" >
				 <!-- 1. 상세 설명  -->
				 <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
						<div style="margin-left: 10px;">
							<i class="fas fa-heart" style="color:red; float: left; margin-top: 5px;"></i> <p class="review_left" style="width: 96%; font-size: 18px;">Product 설명 </p>
							<p class="review_a">저희제품에 대해  <span class="review_side2">소개</span>해드립니다.</p>
						
						</div>
						<div>
							<p style=" font-family: 'S-CoreDream-4Regular'; font-size: 15px; margin-left: 40px;"> ${productDetail.content} </p>
				 		</div> 
				 </div> 
				 <!-- 2. 관련 상품 -->
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="row">
					<c:if test="${id!=null|| id==null}">
						<div class="col-lg-6" style="max-width: none; text-align: center;">	
		
						<c:choose>
							<c:when test="${list_e != null}" >
								<i class="fas fa-heart" style="color:red; float: left; margin-top: 5px;"></i><p class="review_left">More Product </p>
								<p class="review_side"><span class="review_side2">'${productDetail.event}'</span>에 관련된 다양한 <span class="review_side2">상품</span>이 있어요!</p>
								<c:forEach  var="event_e" items="${list_e}">
								<div class="review_list2" style="margin-top: -90px;">
									<div class="review_item" style="margin-bottom: 20px;  padding: 20px;">
									
										<div class="media">	
											<div class="media-body">
												<img class="img-fluid" src="../upload/${event_e.filename}" style="width:230px; height: 250px;">
												<p style="cursor: pointer; font-family: 'S-CoreDream-6Bold';font-size: 20px;" onclick="location.href='${contextPath}/product/viewDetail.do?num=${event_e.num}&event=${event_e.event}'">
												${event_e.name}</p>
												<p style="font-family: 'S-CoreDream-4Regular'; font-size: 15px;color: black"><fmt:formatNumber value="${event_e.price}"/>원</p>
					
											</div>
										</div>	
									</div>
								</div>		
								</c:forEach>
							</c:when>
					
							<c:when test="${list_e == null}" >	
								<div class="secret">
									<div style="margin-left: 140px;">
									<p style="margin-left: -50px; margin-top: 50px;">관련상품이 존재하지 않습니다.</p>
									</div>
								</div>
							</c:when>
						</c:choose>
			
					</div>	
				</c:if>
			</div>
		</div>

	
	<!-- 3.사진 리뷰 -->
	<div class="tab-pane fade active" id="review" role="tabpanel" aria-labelledby="review-tab">
		<div class="row">	
			<c:if test="${id!=null}">
						
			<div class="review_detail">		
				<div class="row total_rate">
					<div class="review_title">
						<i class="fas fa-heart" style="color:red; float: left; margin-top: 5px;"></i><p class="review_left">Review </p>
						<p class="review_side">당신의 소중한  <span class="review_side2">리뷰</span>를 남겨보세요!</p>
					</div>
					<div class="col_11">
							<div class="box_total">
								<div style="margin-left: 80px;">
								<div style="width: 300px; height: 200px; margin-top: 20px;">
									<p class="star_ave">별점 평균</p>
									<c:if test="${sum == 0 }">
										<p style="font-family: 'S-CoreDream-6Bold'; font-size: 68px;color: #384aeb; margin-top: -30px;"><fmt:formatNumber value="${0}"/></p>
									</c:if>
									<c:if test="${sum != 0 }">
										<p style="font-family: 'S-CoreDream-6Bold'; font-size: 68px;color: #384aeb; margin-top: -30px;"><fmt:formatNumber value="${sum/count_r}" pattern="##.#" /></p>
									</c:if>
									
								</div>
								
								<div class="star">
									<ul>
										<li> <b>5</b> Stars &nbsp;&nbsp;
											<c:forEach begin="1" end="5" step="1">
												<i class="fas fa-star" style="color:#faf328;"></i> 
											</c:forEach>
										</li>
										<li> <b>4</b> Stars &nbsp;&nbsp;
											<c:forEach begin="1" end="4" step="1">
												<i class="fas fa-star" style="color:#faf328;"></i> 
											</c:forEach>
										</li>
										<li> <b>3</b> Stars &nbsp;&nbsp;
											<c:forEach begin="1" end="3" step="1">
												<i class="fas fa-star" style="color:#faf328;"></i> 
											</c:forEach>
										</li>
										<li> <b>2</b> Stars &nbsp;&nbsp;
											<c:forEach begin="1" end="2" step="1">
												<i class="fas fa-star" style="color:#faf328;"></i> 
											</c:forEach>
										</li>
										<li> <b>1</b> Stars &nbsp;&nbsp; <i class="fas fa-star" style="color:#faf328;"></i> </li>
									
									
									</ul>
									
								</div>
								</div>
							</div>
					</div>
				</div>
				
				<p style="font-size: 15px; margin-top: 60px; border-bottom: 1px solid #c6c6c6;font-family: 'S-CoreDream-6Bold'; ">
					<span style="font-size: 20px;">${count_r}</span>개의 리뷰</p>
					
				<c:choose>
				<c:when test="${clist_r != null}" >
					
					<c:forEach  var="comment_r" items="${clist_r}">
								
						<div class="review_list" style="height: auto;">
							
							<div class="review_item" style=" margin-top:40px;margin-bottom: 20px; border-bottom: 1px solid #c6c6c6; padding: 20px; ">	
								<div class="media" >
									
									<div class="media-body">
										<div class="review_h">
										<div class="review_l">				
											<c:forEach begin="1" end="${comment_r.starcount}" step="1">
												<i class="fa fa-star"></i>
											</c:forEach> 
											<br>
											<img class="img-fluid" src="../review_upload/${comment_r.filename}" style="width:250px; height: 250px;">
											<p style="font-size: 18px; margin-top: 10px;">${comment_r.content}</p>
										</div>
										
										<div class="review_r">
											<p class="review_p"><i class="fas fa-chevron-circle-right" style="color: red;"></i>
												<span style="font-family: 'Binggrae-Bold'; font-size: 17px; margin-right: 90px;"> 작성자</span> ${comment_r.name}
											</p>
											
											<p class="review_p"><i class="fas fa-chevron-circle-right" style="color: red;"></i>
												<span style="font-family: 'Binggrae-Bold'; font-size: 17px; margin-right: 70px;"> 작성 날짜</span>${comment_r.date}
											</p>
										
										
										
										
								<c:if test="${id =='admin'}">
								<div style="margin-top: 15px;">
									 <form action="${contextPath}/product/replyReview.do" method="post">
										<input type="hidden" name="num" value="${productDetail.num}">
										<input type="hidden" name="num_c" value="${comment_r.num_c}">
										<input type="hidden" name="id" value="${id}">
										<input type="hidden" name="comment_num" value="2">
										<textarea rows="1" cols="47" name="review_reply"></textarea>
										<input type="submit" class="btn_reply"  value="답변하기" /> 
									</form>
								</div>
								</c:if>
								<c:if test="${id!='admin'}">
									 <c:if test="${comment_r.name==id}">
									 	<div class="btn_r">
									 	<a href="${contextPath}/product/modifyReview.do?num=${comment_r.num}&num_c=${comment_r.num_c}&pageNum_r=${pageNum_r}" class="review_btn1" >수정하기</a>								
										<a href="${contextPath}/product/delReview.do?num=${comment_r.num}&num_c=${comment_r.num_c}&pageNum_r=${pageNum_r}" class="review_btn2">삭제하기</a>	
									 	</div>
									 </c:if>
									  <c:if test="${comment_r.name!=id}">
									 	<div class="btn_r">
									 
									 	</div>
									 </c:if>
								</c:if>
								</div> <!-- class="review_r" 끝 -->
							</div>
								
						
							<c:choose>
														
							<c:when test="${list_d != null}" >
											
										<c:forEach  var="list_review" items="${list_d}">
											<c:if test="${list_review.seq==comment_r.num_c}">		
											<div class="manager_h">				
												<div class="manager_h1">
													<div style="float: left;">
													<i class="fas fa-heart" style="color:red; float: left; margin-top: 8px;"></i>
													<p class="review_side" style="font-size: 18px; margin-top: -10px;" >관리자<span style="font-size: 14px;"> 댓글</span></p>	
													<p style="margin-left: 10px; font-size: 14px; margin-top: -6px;">${list_review.date}</p>
													<p style="margin-top: -3px; margin-left: 20px;">${list_review.content}</p>
													</div>
													<div style="margin-left: 600px;margin-top: 10px;">
													<c:if test="${id=='admin'}">
									 					<a class="btn_s" href="${contextPath}/product/delReview_d.do?num=${list_review.num}&num_c=${list_review.num_c}&pageNum_r=${pageNum_r}"
									 					style="width:110px; height: 30px;"
									 					>삭제하기</a>	
									 				</c:if>
									 				</div>
									 			</div>
									 		</div>	
									 		</c:if>	
									 		<c:if test="${list_review.seq!=comment.num_c}">
									 			<div class="media-body">
												</div>
									 		</c:if>	
								 		</c:forEach>
								 								
							</c:when>
														
							<c:when test="${list_d == null}">
			
								<div class="media-body">
									<h4>답글이 없습니다.</h4>
																
								</div>
															
							</c:when>
												
						</c:choose>
						
						
						
						</div>
					
						</div>	
					</div>
				</div>
							
							
				</c:forEach>
			</c:when>
					
			<c:when test="${clist_r == null}" >	
				<div> 리뷰없음</div>
			</c:when>
		</c:choose>
	</div>
			
				<div id="page_control" style="margin-left: 450px; margin-top: 30px;">
				<%-- 아래의 페이지 번호 출력 부분 --%>
				
				<c:choose>
					<c:when test="${clist_r != null}" >					
						<c:forEach  var="i" begin="${startPage_r}" end="${endPage_r}" >
							<a href="${contextPath}/product/viewDetail.do?num=${productDetail.num}&pageNum_r=${i}">[${i}]</a>
						</c:forEach>		
					</c:when>
				</c:choose>
				</div>
			
			<c:if test="${id!='admin'}">
				 <c:if test="${id== hid && productDetail.filename == hfname}"> 
				<div class="review_detail" style="margin-top: 50px;">
					<div class="review_box">
							
							<img src="../img/review.png" style="width:50px; height: 50px; float: left;">
							<p class="review_p1">Review<span style="color: black;">쓰기</span></p>
							
						
						
                <form  action="${contextPath}/product/addComment_r.do" enctype="multipart/form-data"  method="post"
                class="write_form">
	                  <div style="width: 30%; margin-top:10px; ;margin-left: 50px;" class="f1">
	                  	
	                    <input type="hidden" name="id" value="${id}" >
	                    <input type="hidden" name="num" value="${productDetail.num}">
	                    <input type="hidden" name="comment_num" value="2">
	                    
	                    <p class="review_p2"><i class="fas fa-chevron-circle-right" style="color: #ed4251;"></i>
						<span style="font-family: 'Binggrae-Bold'; font-size: 19px; margin-right: 90px;">별점주기</span> 
						</p>
						
						<ul style="margin-top: 10px; margin-left: 10px;">
						<li>  <input type="radio" name="starcount" id="five" value="5" style="margin-left: 10px;"> <span style="font-size: 18px;">
						5 Stars</span> &nbsp;&nbsp;
							<c:forEach begin="1" end="5" step="1">
									<i class="fas fa-star" style="color:#f7ef05;"></i> 
							</c:forEach>
						</li>
						
						<li>  <input type="radio" name="starcount" id="four" value="4" style="margin-left: 10px;"> <span style="font-size: 18px;">
						4 Stars </span>&nbsp;&nbsp;
						<c:forEach begin="1" end="4" step="1">
							<i class="fas fa-star" style="color:#f7ef05;"></i> 
						</c:forEach>
						</li>
						
						<li> <input type="radio" name="starcount" id="three" value="3" style="margin-left: 10px;"> <span style="font-size: 18px;">
						3 Stars &nbsp;&nbsp;</span>
							<c:forEach begin="1" end="3" step="1">
							<i class="fas fa-star" style="color:#f7ef05;"></i> 
							</c:forEach>
						</li>
						
						<li> <input type="radio" name="starcount" id="two" value="2" style="margin-left: 10px;"><span style="font-size: 18px;">
						 2 Stars</span> &nbsp;&nbsp;
							<c:forEach begin="1" end="2" step="1">
								<i class="fas fa-star" style="color:#f7ef05;"></i> 
							</c:forEach>
						</li>
						
						<li><input type="radio" name="starcount" id="one" value="1" style="margin-left: 10px;"> <span style="font-size: 18px;">
						1 Stars</span> &nbsp;&nbsp;
						 <i class="fas fa-star" style="color:#f7ef05;"></i> </li>
	
					</ul>
	                    
	                   
	                  </div>
	                   <div class="f1" style="width:30%; margin-top: 10px;">
	            
		                    <p class="review_p2"><i class="fas fa-chevron-circle-right" style="color: #ed4251;"></i>
							<span style="font-family: 'Binggrae-Bold'; font-size: 19px; margin-top: -20px;">사진등록</span> 
							</p>
							 <div style="margin-top: 5px; margin-bottom: 10px;">
		                   	 <input type="file" name="filename" onchange="viewFile(this);" placeholder="사진을 올려주세요" >
		                	  </div>
	                    	<p id="preview"></p>
	                    
	                   </div>
	                  <div style="width: 30%; margin-top: 20px;" class="f1">
		                  <div style="margin-top: -10px;"> 
		                  	<p class="review_p2"><i class="fas fa-chevron-circle-right" style="color: #ed4251;"></i>
							<span style="font-family: 'Binggrae-Bold'; font-size: 19px; ">내용입력 </span> 
							</p>
		                    <textarea rows="7" cols="38" placeholder="내용을 입력해주세요" name="comment_r" style="margin-left: 20px;margin-top: 6px;"></textarea>
		                  </div>

	                  </div>
		              <div style="margin-left: 50%; height: auto;">
		                  <button type="submit" class="btn_write">작성하기</button>
		               </div>
	             </form>
	              
					</div>
								 
				</div>
				</c:if>
			</c:if>
</c:if>
				
		<c:if test="${id==null }">
				<div class="secret">
					<div style="margin-left: 140px;">
					<i class="fas fa-id-card" style="color: black; margin-left: -38px; margin-top: -5px;"></i><span>리뷰를 보시려면 로그인해주세요.</span>
					<p style="margin-left: 10px;">비밀댓글입니다.</p>
					<input type="button" value="로그인하기 " onclick="location.href='../login/login.jsp'" class="secret_btn">
					</div>
				</div>
				
		</c:if>		
	
		</div>
	</div>
	<!-- 사진리뷰 -->
	
	</div>
</div>

</section>



	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>