<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("mycookie",URLEncoder.encode("내가 만든 쿠키","utf-8"));
	Cookie cookieName = new Cookie("mycookieName","SSR");
	Cookie cookieTel = new Cookie("mycookieTel","010-0000-0000");
	cookie.setMaxAge(60 * 60 * 24);
	response.addCookie(cookie);
	response.addCookie(cookieName);
	response.addCookie(cookieTel);
%>

</body>
</html>