<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/board/groupBoard-style.css" type="text/css">
<title>Group Board</title>
</head>
<body>
	<div id="board-container">
		<h1 align="center">게시판</h1>

		<div id="board-part">
			<table align="center">
				<tr>
					<td align="center" id="board-th-no">번호</td>
					<td align="center" id="board-th-title">제목</td>
					<td align="center" id="board-th-writer">작성자</td>
					<td align="center" id="board-th-date">작성일</td>
					<td align="center" id="board-th-count">조회수</td>
				</tr>
				<!--  -->
				<c:set var="boardCount" value="${ pi.listCount }"/>
				<c:set var="limit" value="${ pi.limit }"/>
				<c:set var="currentPage" value="${ pi.currentPage }"/>
				
				<c:forEach var="b" items="${ list }" varStatus="status">
					<tr>
						<td align="center" class="board-td-no">${ (boardCount - ((currentPage - 1) * limit)) - status.index }</td>
						<td align="left" class="board-td-title">
							<c:url var="boardDetail" value="bdetail.ij">
								<c:param name="boardNo" value="${ b.boardNo }"/>
								<c:param name="page" value="${ pi.currentPage }"/>
							</c:url>
							<a href="${ boardDetail }">${ b.boardTitle }</a>
						</td>
						<td align="center" class="board-td-writer">${ b.memberName }</td>
						<td align="center" class="board-td-date">${ b.boardCreateDate }</td>
						<td align="center" class="board-td-count">${ b.boardCount }</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>

		<div id="button-part">
			<button onclick="location.href='binsertView.ij';" type="button" class="btn btn-primary" id="board-btn-write">글쓰기</button>
		</div>

		<div id="pagination-part">
			<c:if test="${ pi.currentPage <= 1 }">
				&lt; &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="blist.ij">
					<c:param name="page" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }">&lt;</a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq currentPage }">
					<font color="red" size="5"><b>${ p }</b>&nbsp;</font>
				</c:if>
				
				<c:if test="${ p ne currentPage }">
					<c:url var="pagination" value="blist.ij">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a>&nbsp;
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				>
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="blist.ij">
					<c:param name="page" value="${ pi.currentPage + 1 }"/>
				</c:url>
				<a href="${ after }">></a>
			</c:if>
		</div>
	</div>
</body>
</html>