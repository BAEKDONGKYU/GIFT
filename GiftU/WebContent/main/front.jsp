<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath" />
<%
	Cookie[] cookie = request.getCookies();
	String id = null;
	String pass = null;

	if (cookie != null) {
		for (int i = 0; i < cookie.length; i++) {
			String keyId = cookie[i].getName();
			if (keyId.equals("id")) {
				id = URLDecoder.decode(cookie[i].getValue(), "UTF-8");
				System.out.println(id);
			} else if (keyId.equals("pass")) {
				pass = URLDecoder.decode(cookie[i].getValue(), "UTF-8");
			}
		}
		if (id != null && pass != null) {
			RequestDispatcher dispatch = request.getRequestDispatcher("../member/cookieLogin.do?id=" + id + "&pass=" + pass);
			dispatch.forward(request, response);
		}
		else if (id == null && pass == null) {
			response.sendRedirect("../index/index.do");
		}
	} else if (cookie == null) {
		response.sendRedirect("../index/index.do");
	}

	/* 		response.sendRedirect("../index/index.do"); */
%>