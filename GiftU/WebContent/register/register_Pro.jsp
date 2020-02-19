

<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	 request.setCharacterEncoding("UTF-8");
	
%> 

 <jsp:useBean id="memberbean" class="member.MemberBean"/>
 <jsp:setProperty property="*" name="memberbean"/>
 
 
 <%

 
 MemberDAO memberDao = new MemberDAO();
 
 memberDao.insertMember(memberbean);

 response.sendRedirect("../login/login.jsp");
 
 %>
 
 
 
 
 



