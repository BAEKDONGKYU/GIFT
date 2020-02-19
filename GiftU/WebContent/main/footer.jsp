<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 


<footer class="footer">
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">무통장 입금 계좌 안내</h4>
							<p>
								부산 150-584-56453<br>
								예금주: (주)기프트유
							</p>
							<p>
								<select>
									<option>인터넷뱅킹 바로가기</option>
								</select>
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">자주 찾는 메뉴</h4>
							<ul class="list">
								<li><a href="${contextPath}/main/index.jsp">Home</a></li>
								<li><a href="${contextPath}/product/listProducts.do">Shop</a></li>
								<li><a href="${contextPath}/notice/listAllNotice.do">Notice</a></li>
								<li><a href="${contextPath}/member/memberInfo.do?id=${id}">MyPage</a></li>
								<li><a href="${contextPath}/main/contact.jsp">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">교환 | 반품</h4>
							<p>자세한 사항은 고객센터로 연락바랍니다.</p>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="../img/r1.png" alt="" width="70px" onclick="location.href='${contextPath}/boarde/listBoard.do'"></li>
								<li><img src="../img/r2.png" alt="" width="70px" onclick="location.href='${contextPath}/cart/heartList.do?id=${id}'"></li>
								<li><img src="../img/r3.png" alt="" width="70px"></li>
								<li><img src="../img/r4.png" alt="" width="70px"></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">연락망</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>부산광역시 부산진구<br>부전동 112-3</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+8210 9494 9494 <br>
									+8210 9494 9494
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									giftyou940@gmail.com <br>
									www.giftyou.com
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
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy; 기프트유 All rights reserved 
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
