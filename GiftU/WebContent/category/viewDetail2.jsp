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
		var count = $("#amount").val();
		var inven = $("#viewForm #inventory").val();
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
		var count = $("#amount").val();
		var inven = $("#viewForm #inventory").val();
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
						<td colspan="3"><span class="mypage">${productDetail.name}</span></td>
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
							<input type=hidden name="inventory" value="${productDetail.inventory}"> 
							
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
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-controls="home"
					 aria-selected="false"> 상세설명</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
					 aria-selected="false"> 관련상품</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active show" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
					 aria-selected="false" >댓글보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="review-tab" href="${contextPath}/product/viewDetail.do?num=${productDetail.num}&event=${productDetail.event}"  aria-controls="review"
					 aria-selected="false"> 리뷰보기</a>
				</li>
			</ul>
			
			
			<div class="tab-content" id="myTabContent" style="height: auto;">
				
				 <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
						<div style="margin-left: 10px;">
							<i class="fas fa-heart" style="color:red; float: left; margin-top: 5px;"></i> <p class="review_left" style="width: 96%; font-size: 18px;">Product 설명 </p>
							<p class="review_a">저희제품에 대해  <span class="review_side2">소개</span>해드립니다.</p>
						
						</div>
						<div>
							<p style=" font-family: 'S-CoreDream-4Regular'; font-size: 15px; margin-left: 40px;"> ${productDetail.content} </p>
				 		</div> 
				 
				 </div>
				
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
		<!-- 일반댓글 -->
				<div class="tab-pane fade active" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<c:if test="${id!=null}">
					
								<div class="review_title">
									<i class="fas fa-heart" style="color:red; float: left; margin-top: 5px;"></i><p class="review_left">Comment </p>
									<p class="review_side">당신의 소중한  <span class="review_side2">댓글</span>을 남겨보세요!</p>
								</div>
					
					<div class="row">
						<div class="col_11" style="height: auto;">
							
						
							<c:if test="${id!='admin'}">
							 <c:if test="${id== hid && productDetail.filename == hfname}"> 
								<div class="box_total" style="margin-top: -3px; margin-bottom: 20px;">
									<div class="box_1" style="width: 100%;height: 270px; background-color: #f1f6f7; padding: 10px;">
									
									<img src="../img/review.png" style="width:50px; height: 50px; float: left; margin-left: 20px;">
									<p class="p_col">Comment<span style="color: black;">쓰기</span></p>
									<form action="${contextPath}/product/addComment.do">
							
										<input type="hidden" name="num" value="${productDetail.num}">
										<input type="hidden" name="comment_num" value="1">
										<input type="hidden" name="id" value="${id}">
										<textarea name="comment" style="margin-left: 200px; width: 600px; height: 125px;"></textarea>
										<input type="submit" class="comment_b" value="답글달기">
				
									</form>
									</div>
								</div>
								</c:if>
							</c:if>
								
							 <p style="font-size: 15px; border-bottom: 1px solid #c6c6c6;font-family: 'S-CoreDream-6Bold';">
							<span style="font-size: 20px;">${count}</span>개의 댓글</p>
						<c:choose>
						
						
						<c:when test="${clist != null}" >
						
							<c:forEach  var="comment" items="${clist}">
								<div class="comment_list" >
									<div class="review_item" style="margin-bottom: 20px; padding: 20px; margin-top: 5px;">
										<div class="media">
							   
											<div class="media-body">
												<c:if test="${id!='admin'}">
													<c:if test="${comment.name==id}">
														<i class="fas fa-heart" style="color:red; float: left; margin-top: 10px;"></i>
														<p style="font-family: 'Binggrae-Bold';">내 댓글보기</p>
													</c:if>
													<c:if test="${comment.name!=id}">
														<i class="fas fa-heart" style="color:red; float: left; margin-top: 10px;"></i>
														<p style="font-family: 'Binggrae-Bold';">다른사람 댓글보기</p>
													</c:if>
												</c:if>
											
												<table class="review_table">
													<tr class="review_tr">
														<td class="td">
															<p class="review_p2">
															<span style="font-family: 'Binggrae-Bold'; font-size: 17px;"> 작성자</span>
															</p>
														</td>
														<td>
															<p class="review_p2">
															<span style="font-family: 'Binggrae-Bold'; font-size: 17px;;"> 작성날짜</span>
															</p>
														</td>
													</tr>
													<tr>
														<td class="td">
															<p class="review_p2" style="border-bottom: none;">${comment.name}</p>
														</td>
														<td>
															<p class="review_p2" style="border-bottom: none;">${comment.date}</p>
														</td>
													</tr>
													<tr  class="review_tr" style="text-align: center;">
														<td colspan="2" >
															<p class="review_p3">
															<span style="font-family: 'Binggrae-Bold'; font-size: 17px;">작성 내용</span>
															</p>
															
														</td>
													</tr>
													<tr  style="text-align: center; border-bottom: 1px solid #dee2e6;">
														<td colspan="2">
															<p class="review_p3" style="border-bottom: none;">${comment.content}</p>
														</td>
													</tr>
										<c:if test="${id!='admin'}">
											<c:if test="${comment.name==id}">
												<tr height="40px;">
												<td class="btn_m">
												<a style="color: white;" href="${contextPath}/product/modifyComment.do?num=${comment.num}&num_c=${comment.num_c}&pageNum=${pageNum}"
													>수정하기</a>
												</td>
												<td class="btn_c">
												<a style="color: white;" href="${contextPath}/product/delComment.do?num=${comment.num}&num_c=${comment.num_c}&pageNum=${pageNum}"
													 >삭제하기</a>

												</td>
												</tr>
											</c:if>
										</c:if>
										
										</table>
											<c:if test="${id=='admin'}">
												<div style="margin-left: 30px; ">
												<p class="review_p" style="border:none; width: 120px;"><i class="fas fa-chevron-circle-right" style="color: #384aeb;"></i>
												<span style="font-family: 'Binggrae-Bold'; font-size: 17px;"> 답글 : </span>
												</p>	
												<form action="${contextPath}/product/replyComment.do" style="display: inline; float: left;">
													<input type="hidden" name="num" value="${comment.num}">
													<input type="hidden" name="num_c" value="${comment.num_c}">
													<input type="hidden" name="id" value="${id}">
													<input type="hidden" name="comment_num" value="1">
													<textarea rows="1" cols="30" name="comment_reply" ></textarea> 
											
													<input type="submit" value="답변하기" class="btn_reply" style="float: right;display: inline;margin-left: 20px;"/>			
												</form>		
												</div>
											
											</c:if>
										<c:choose>
														
											<c:when test="${list_c != null}" >
														
											<c:forEach  var="list_comment" items="${list_c}">
												<c:if test="${list_comment.seq==comment.num_c}">
												<div class="manager_h">													
												<div class="manager_h1">
													<div style="float: left;">
													<i class="fas fa-heart" style="color:red; float: left; margin-top: 8px;"></i>
													<p class="review_side" style="font-size: 18px; margin-top: -10px;" >관리자<span style="font-size: 14px;"> 댓글</span></p>	
													<p style="margin-left: 10px; font-size: 14px; margin-top: -6px;">${list_comment.date}</p>
													<p style="margin-top: -3px; margin-left: 20px;">${list_comment.content}</p>
													</div>
													<div style="margin-left: 600px;margin-top: 10px;">
													<c:if test="${id=='admin'}">
									 					<a class="btn_s" href="${contextPath}/product/delReview_d.do?num=${list_comment.num}&num_c=${list_comment.num_c}&pageNum_r=${pageNum_r}"
									 					style="width:110px; height: 30px;"
									 					>삭제하기</a>	
									 				</c:if>
									 				</div>
									 			</div>
											</div>	
									 			</c:if>	
									 			<c:if test="${list_comment.seq!=comment.num_c}">
									 				<div class="media-body">
													</div>
									 			</c:if>	
								 			</c:forEach>							
											</c:when>
														
											<c:when test="${list_c == null}" >
			
												<div class="secret">
													<div style="margin-left: 140px;">
													<p style="margin-left: 10px;">댓글이 존재하지 않습니다.</p>
													</div>
												</div>
															
											</c:when>
													
										</c:choose>
												
											
								
								</div>
											
								</div>		
							</div>
							</div>
						</c:forEach>
					</c:when>
						
					<c:when test="${clist == null}" >
			
						<div class="secret">
							<div style="margin-left: 140px;">
							<p style="margin-left: 10px;">댓글이 존재하지 않습니다.</p>
							</div>
						</div>
								
					</c:when>
				</c:choose>
			
			</div>
			
				
			</div>
			</c:if>
		
			<c:if test="${id==null}">
				<div class="secret">
					<div style="margin-left: 140px;">
					<i class="fas fa-id-card" style="color: black; margin-left: -38px; margin-top: -5px;"></i><span>리뷰를 보시려면 로그인해주세요.</span>
					<p style="margin-left: 10px;">비밀댓글입니다.</p>
					<input type="button" value="로그인하기 " onclick="location.href='../login/login.jsp'" class="secret_btn">
					</div>
				</div>
					
			</c:if>
		
		<div id="page_control" style="margin-left: 500px; margin-top: 80px;">
				
			<c:choose>
				<c:when test="${clist != null}" >		
					<c:if test="${id!=null}">	
					<c:forEach  var="i" begin="${startPage}" end="${endPage}">
					<a href="${contextPath}/product/viewDetail2.do?num=${productDetail.num}&pageNum=${i}" >[${i}]</a>
					</c:forEach>	
					</c:if>
				</c:when>
			</c:choose>
		</div>
	</div>
	</div> 
	
	</div>


</section>



	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>