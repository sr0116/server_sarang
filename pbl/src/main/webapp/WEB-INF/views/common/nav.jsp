<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<nav>
	<ul class="container p-0">
		<c:forEach items="${cate}" var="c">
		<c:set var="currCate" value="${c}"></c:set>
			<li><a href="${cp}/board/list?cno=${c.cno}">${c.cname}</a></li>
		</c:forEach>	
	</ul>
</nav>