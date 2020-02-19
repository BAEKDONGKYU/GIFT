<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 패스 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<div class="register_form_in">
	<div class="row register_form">
		<table class="register_lg_1 table-bordered table-striped">
			<tr>
				<td colspan="2"><p>
						<span style="color: red;"><i class="fab fa-gratipay"></i></span><br>Hello,"${id}"</p></td>
				<td colspan="2"><strong>회원정보관리</strong></td>
				<td colspan="2"><strong>결제정보</strong></td>
				<td><strong>내가 쓴 글 관리</strong></td>
			</tr>
			<tr>
				<td><a href="${contextPath}/member/memberCoupon.do?id=${id}"><i class="fas fa-ticket-alt"></i><br>${count}장</a></td>
				<td><a href="${contextPath}/member/memberPoint.do?id=${id}"><i class="fas fa-won-sign"></i><br>${total}원</a></td>
				<td><a href="${contextPath}/member/memberModi.do?id=${id}" class="selected">개인정보수정</a></td>
				<td><a href="${contextPath}/member/memberPass.do?id=${id}" class="">비밀번호변경</a></td>
				<td><a href="${contextPath}/history/searchHistory.do?month=three" class="">구매내역</a></td>
				<td><a href="../mypage/purchase_cancel.jsp" class="">취소/반품내역</a></td>
				<td><a href="${contextPath}/boarde/listBoard.do" class="">문의하기</a></td>
			</tr>
		</table>
	</div>
</div>