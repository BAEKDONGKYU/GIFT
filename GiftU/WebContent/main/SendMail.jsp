<%@page import="mail.MailSend"%>
<%@page import="mail.MailAuth"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
 
String name = request.getParameter("name");
String from = request.getParameter("from"); 
String to = request.getParameter("to");
String subject = request.getParameter("subject");
String message = request.getParameter("message");
// 입력값 받음

MailSend ms = new MailSend();//이메일 객체 생성
int result = ms.sendMail(name, from, to, subject, message);
 
if(result == 1) {
%>	
	<script type="text/javascript">
		alert("메일 전송이 완료 되었습니다.");
		history.back();
	</script>
	
<% 	
}else{
%>
	<script type="text/javascript">
		alert("오류로 인해 메일 전송에 실패 하였습니다.");
		location.href='contact.jsp'; 
	</script>

<% 		
}
%>


