<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="list-group">

    <!-- 헤더 -->
    <div class="list-group-item small">
        <div class="row text-center align-items-center text-muted">
            <div class="col-1">글번호</div>
            <div class="col-1">카테고리</div>
            <div class="col text-start">제목</div>
            <div class="col-1">작성일</div>
            <div class="col-1">조회수</div>
        </div>
    </div>

    <!-- 예시 더미 항목 -->
    <a href="board_view.html" class="list-group-item list-group-item-action list-group-item-secondary">
        <div class="row text-center align-items-center text-muted">
            <div class="col-1">1</div>
            <div class="col-1">자유</div>
            <div class="col text-start fw-bold text-black">제목</div>
            <div class="col-1"><span>25.06.13</span></div>
            <div class="col-1"><span>13</span></div>
        </div>
    </a>

    <!-- 반복 항목 -->
    <c:forEach items="${boards}" var="board">
        <a href="view?bno=${board.bno}&${pageDto.cri.qs2}" class="list-group-item list-group-item-action">
            <div class="row text-center align-items-center text-muted">
                <div class="col-1">${board.bno}</div>
                <div class="col-1">${board.cno}</div>
                <div class="col text-start fw-bold text-black">
                    ${board.title}
                    <span class="small text-danger fw-bold">${board.replyCnt}</span>
                    <c:if test="${board.attachCnt > 0 }">
                    <i class="fa-solid fa-paperclip"></i>
                    </c:if>
                </div>
                <div class="col-1">
                    <fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
                    <fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd" />
                </div>
                <div class="col-1">${board.cnt}</div>
            </div>
        </a>
    </c:forEach>
    <div>
    </div>

</div>
