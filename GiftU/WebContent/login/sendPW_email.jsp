<%@page import="mail.MailSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	// 아이디와 email, pw값 가져오기
	String id  =  (String)request.getAttribute("find_id");
	String pw = (String)request.getAttribute("find_pw");
	String email = (String)request.getAttribute("find_email");
	MailSend ms = new MailSend(); // 이메일 객체 생성
	int result = ms.findPW(id,email,pw);
	
	if(result == 1) {
%>		
		<script type="text/javascript">
			alert("메일 전송이 완료 되었습니다.");
			location.href= "../index.jsp";
		</script>
<%		
	}else {
%>
		<script type="text/javascript">
			alert("오류로 인해 메일 전송에 실패 하였습니다.");
			location.href = "findUserPW.jsp";
		</script>
<%		
	}	
		
%>


