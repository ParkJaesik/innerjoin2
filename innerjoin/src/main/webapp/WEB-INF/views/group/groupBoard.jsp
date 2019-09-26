<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/groupBoard-style.css" type="text/css">
<title>Group Board List</title>
</head>
<body>
	<c:import url=""/> <!-- menubar, groupMenubar import -->
	
	<div id="board-container">
		<h1 id="board" align="center">게시판</h1>
		<table align="center">
			<tr>
				<td align="center" id="board-th-no">번호</td>
				<td align="center" id="board-th-title">제목</td>
				<td align="center" id="board-th-writer">작성자</td>
				<td align="center" id="board-th-date">작성일</td>
				<td align="center" id="board-th-count">조회수</td>
			</tr>
			
			<c:forEach var="b" items="${ list }">
				<tr>
					<td id="board-td-no" align="center">
						${ b.boardNo }
					</td>
					
					<td id="board-td-title" align="left">
						<c:url var="" value="">
							<c:param name="" value=""/>
							<c:param name="" value=""/>
						</c:url>
						<a href="">
							${ b.boardTitle }
						</a>
					</td>
					
					<td id="board-td-writer" align="center">
						${ b.memberId }
					</td>
					
					<td id="board-td-date" align="center">
						${ b.boardWriteDate }
					</td>
					
					<td id="board-td-count" align="center">
						${ b.boardCount }
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>