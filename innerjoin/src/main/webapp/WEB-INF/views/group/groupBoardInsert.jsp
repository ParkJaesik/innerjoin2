<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/groupBoardInsert-style.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Group Board Insert</title>
</head>
<body>
	<form action="binsert.ij" method="post" enctype="multipart/form-data">
		<div id="board-container">
			<h1 align="center">게시글 등록</h1>

			<div id="board-part">
				<div id="board-check">
					<input type="checkbox" name="check" id="check">
					<label for="check">공지글</label>
				</div>

				<div id="board-writer">
					<span id="writer">${ loginUser.memberName }</span>
				</div>

				<div id="board-title">
					<input type="text" id="title" name="title" placeholder="제목" autocomplete="off">
				</div>

				<div id="board-content">
					<textarea name="content" id="content" name="content" placeholder="내용"></textarea>
				</div>
			</div>

			<div id="attachment-part">
				<div id="board-attachment">
					<span id="attachment">첨부파일 : </span>
				</div>
			</div>

			<div id="button-part">
				<div id="board-button">
					<button type="submit" class="btn btn-primary" id="board-btn-input">등록</button>
					<button onclick="location.href='blist.ij'" type="button" class="btn btn-primary" id="board-btn-cancel">취소</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>