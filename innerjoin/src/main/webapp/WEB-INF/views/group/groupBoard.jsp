<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/board/groupBoard-style.css" type="text/css">
<title>Group Board</title>
</head>
<body>
<%-- <jsp:include page="${contextPath}/WEB-INF/views/common/menubar.jsp"></jsp:include> --%>
<%@ include file="../group/groupMenubar.jsp" %>
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

				<%-- <c:forEach var="b" items="${ list }">
				<tr>
					<td align="center" class="board-td-no">${ b.boardNo }</td>
					<td align="left" class="board-td-title">
						<c:url var="boardDetail" value="bdetail.ij">
							<c:param name="boardNo" value="${ b.boardNo }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						<a href="boardDetail">${ b.boardTitle }</a>
					</td>
					<td align="center" class="board-td-writer">${ b.memberId }</td>
					<td align="center" class="board-td-date">${ b.boardCreateDate }</td>
					<td align="center" class="board-td-count">${ b.boardCount }</td>
				</tr>
				</c:forEach> --%>
				<c:forEach var="b" items="${ list }">
					<tr>
						<td align="center" class="board-td-no">${ b.boardNo }</td>
						<td align="left" class="board-td-title">
							<c:url var="boardDetail" value="bdetail.ij">
								<c:param name="boardNo" value="${ b.boardNo }"/>
								<c:param name="page" value="${ pi.currentPage }"/>
							</c:url>
							<a href="${ boardDetail }">${ b.boardTitle }</a>
						</td>
						<td align="center" class="board-td-writer">${ b.boardWriter }</td>
						<td align="center" class="board-td-date">${ b.boardCreateDate }</td>
						<td align="center" class="board-td-count">${ b.boardCount }</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div id="button-part">
			<button onclick="location.href='binsertView.ij';" type="button"
				class="btn btn-primary" id="board-btn-write">글쓰기</button>
		</div>

		<div id="pagination-part">
			<a href="">&lt;</a>&nbsp; <a href="">1</a>&nbsp; <a href="">2</a>&nbsp;
			<a href="">3</a>&nbsp; <a href="">&rt;</a>
		</div>
	</div>
</body>
</html>