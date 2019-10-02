<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/groupBoardModify-style.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Group Board Modify</title>
</head>
<body>
	<div id="board-container">
		<h1 align="center">게시글 수정</h1>

		<div id="board-part">
			<div id="board-check">
				<input type="checkbox" name="check" id="check" value="" disabled>
				<label for="check"></label>
			</div>

			<div id="board-writer">
				<span id="writer"></span>
			</div>

			<div id="board-title">
				<input type="text" id="title" placeholder="제목" autocomplete="off">
			</div>

			<div id="board-content">
				<textarea id="content" placeholder="내용"></textarea>
			</div>
		</div>

		<div id="attachment-part">
			<div id="board-attachment">
				<span id="attachment">첨부파일 : </span>
			</div>
		</div>

		<div id="button-part">
			<div id="board-button">
				<button type="button" class="btn btn-primary" id="board-btn-modify">수정</button>
				<button type="button" class="btn btn-primary" id="board-btn-cancel">취소</button>
			</div>
		</div>
	</div>
</body>
</html>