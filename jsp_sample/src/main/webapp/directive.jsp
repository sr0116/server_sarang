<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%-- 
	<%@ %> : directive 지시어
	<% %> : scriptlet 스크립트 구문
	<%! %> : declare 선언부
	



 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=new Date()%></h2>
	<h3><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></h3>
	<h3>한글 테스트</h3>
	<%!
		static int si = 10;
		String m() {
			return "abcd";
		}
	%>
	<h3><%=m() + 1234 %></h3>
</body>
</html>