<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/groupBoardDetail-style.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Group Board List</title>
</head>
<body>
	<c:import url="" />

	<div id="board-container">
		<h1 align="center">게시판</h1>
		<div id="board-part">
			<div id="board-count">
				<span id="count">VIEW </span>
			</div>

			<div id="board-date">
				<span id="date">2019.09.26</span>
			</div>

			<div id="board-writer">
				<span id="writer">박재식</span>
			</div>

			<div id="board-title">
				<span id="title">첫 번째 테스트 글입니다</span>
			</div>

			<div id="board-content">
				<span id="content">흔들리는 꽃들 속에서 네 샴푸향이 느껴진거야 스쳐지나간건가? 뒤돌아보지만
					그냥 사람들만 보이는거야 다와가는 집근처에서 괜히 핸드폰만 만지는거야 한번 연락해 볼까? 용기내 보지만 그냥 내 마음만
					아쉬운 거야 걷다가 보면 항상 이렇게 너를 바라만 보던 너를 기다린다고 말할까? 지금 집앞에 계속 이렇게 너를 아쉬워
					하다 너를 연락했다 할까? 지나치는 꽃들 속에서 네 샴푸향만 보이는거야 스쳐지나간건가? 뒤돌아보지만 그냥 내 마음만
					바빠진거야 걷다가 보면 항상 이렇게 너를 바라만 보던 너를 기다린다고 말할까? 지금 집앞에 계속 이렇게 너를 아쉬워 하다
					너를 연락했다 할까? 어떤 계절이 너를 우연히라도 너를 마주치게 할까? 난 이대로 아쉬워하다 너를 바라만 보던 너를
					기다리면서 아무말 못하고 그리워만 할까 걷다가 보면 항상 이렇게 너를 바라만 보던 너를 생각한다고 말할까? 지금 집앞에
					기다리고 때론 지나치고 다시 기다리는 꽃이 피는 거리에 보고파라 이밤에 걷다가 보면 항상 이렇게 너를 아쉬워 하다 너를
					기다린다고 말할까? 지금 집앞에 계속 이렇게 너를 아쉬워 하다 너를 연락했다 할까? </span>
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
				<button type="button" class="btn btn-primary" id="board-btn-delete">삭제</button>
				<button type="button" class="btn btn-primary" id="board-btn-list">목록</button>
			</div>
		</div>

		<div id="reply-part">
			<div id="reply-input-part">
				<div id="reply-input-text">
					<textarea name="" id="text"></textarea>
				</div>

				<div id="reply-input-button">
					<button class="btn btn-primary" id="reply-btn-input">댓글등록</button>
				</div>
			</div>

			<div id="reply-count">
				<span id="replyCount">댓글 </span>
			</div>

			<div id="reply-view">
				<table align="center">
					<tr>
						<td id="reply-writer">정승화</td>
						<td id="reply-button"><a href="">수정</a> <a href="">삭제</a></td>
					</tr>

					<tr>
						<td id="reply-content">재식오빠 완전 이상해</td>
						<td id="reply-date">2019.09.30 10:30</td>
					</tr>
				</table>
			</div>
			
			<div id="reply-view">
				<table align="center">
					<tr>
						<td id="reply-writer">정승화</td>
						<td id="reply-button"><a href="">수정</a> <a href="">삭제</a></td>
					</tr>

					<tr>
						<td id="reply-content">재식오빠 완전 이상해</td>
						<td id="reply-date">2019.09.30 10:30</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>