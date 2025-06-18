<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>
<div class="container p-0">
        <main>

            <div class="small border-bottom border-3 border-black p-0 pb-2">
                <a href="#">
                    <div><span class="text-primary">${board.cno}</span> 카테고리</div>
                </a>
            </div>
            <div class="small p-0 py-2">
                <span class="px-2 border-end border-1">잡담</span>
                <span class="px-2">${board.title}</span>
                <div class="float-end small">
                    <span class="text-muted"><i class="fa-solid fa-eye"></i> ${board.cnt}</span>
                    <span class="text-muted"><i class="fa-regular fa-comment-dots"></i> 2</span>
                </div>
            </div>
            <div class="p-0 py-2 bg-light small border-top borrder-2 border-muted">
                <span class="px-2">${board.id}</span>
                <a href="#" class="text-muted small">board.html</a>
                <span class="float-end text-muted small me-3">${board.regdate}</span>
            </div>
            <div class="p-0 border-bottom border-muted">
                <div></div>
            </div>
            <div class="p-0 py-5 ps-1 small border-bottom border-1 border-muted">
                ${board.content}
            </div>
            <div>
                <a href="list" class="btn btn-secondary btn-sm">목록</a>
                <div class="float-end">
                    <button class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-share-nodes"></i> 공유</button>
                    <button class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-clipboard"></i> 스크랩</button>
                </div>
            </div>
        </main>

    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>