<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${contextPath}/resources/css/groupBoard-style.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Group Board</title>
</head>
<body>
	<c:import url="" />
	<!-- 메뉴바, 모임 메뉴바 import -->

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

				<tr>
					<td align="center" id="board-td-no">1</td>
					<td align="left" id="board-td-title">첫 번째 테스트 글입니다</td>
					<td align="center" id="board-td-writer">박재식</td>
					<td align="center" id="board-td-date">2019-09-24</td>
					<td align="center" id="board-td-count">31</td>
				</tr>
			</table>
		</div>

		<div id="button-part">
			<button type="button" class="btn btn-primary" id="board-btn-write">글쓰기</button>
		</div>

		<div id="pagination-part">
			<a href=""><</a>&nbsp;
			<a href="">1</a>&nbsp;
			<a href="">2</a>&nbsp;
			<a href="">3</a>&nbsp;
			<a href="">></a>
		</div>
	</div>
</body>
</html>