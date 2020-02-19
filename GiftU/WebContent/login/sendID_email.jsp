<%@page import="member.MemberDAO"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mail.*" %>

<%
	//아이디 찾기 페이지에서 넘어온 email
	String email = (String)request.getAttribute("find_email");
	MailSend ms = new MailSend();
	int result = ms.findID(email);
	if(result == 1) {
%>
	<script type="text/javascript">
		alert("메일 전송이 완료 되었습니다.");
		location.href= "../index.jsp";
	</script>
<% 		
		
	}
	else {
%>	<script type="text/javascript">
		alert("오류로 인해 메일 전송에 실패 하였습니다.");
		location.href = "findId.jsp";
	</script>
<%		

		
	}

	

%>