<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/groupBoardDetail-style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">게시판</h1>
	<div id="board-detail-container">
		<div id="board-part">
			<div id="board-viewCount">
				<span id="viewCount">VIEW </span>
			</div>

			<div id="board-writer">
				<span id="writer">박재식</span>
			</div>

			<div id="board-writeDate">
				<span id="writeDate">2019.09.26</span>
			</div>

			<div id="board-title">
				<span id="title">여보세요 나야 거기 잘 지내니</span>
			</div>

			<div id="board-content">
				<textarea name="" id="content" cols="" rows="" readonly></textarea>
			</div>

			<div id="board-attach">
				<span id="attachment">첨부파일 : </span>
			</div>

			<div id="board-button">
				<button class="btn btn-primary" id="btn-board-modify">수정</button>
				<button class="btn btn-primary" id="btn-board-delete">삭제</button>
				<button class="btn btn-primary" id="btn-board-list">목록</button>
			</div>
		</div>

		<div id="reply-part">
			<div id="reply-insert">
				<div id="reply-insert-text">
					<textarea name="" id="replyInsert" cols="" rows=""></textarea>
				</div>
				<div id="reply-insert-button">
					<button class="btn btn-primary" id="btn-reply-insert">댓글등록</button>
				</div>
			</div>

			<div id="reply-count">
				<span id="replyCount"></span>
			</div>

			<div id="reply-list">
				<table></table>
			</div>
		</div>
	</div>
</body>
</html>