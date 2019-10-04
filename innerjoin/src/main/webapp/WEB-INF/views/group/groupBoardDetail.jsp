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
	<%-- <c:import url="" /> --%>

	<div id="board-container">
		<h1 align="center">게시판</h1>
		<div id="board-part">
			<div id="board-count">
				<span id="count">VIEW ${ board.boardCount }</span>
			</div>

			<div id="board-date">
				<span id="date">${ board.boardCreateDate }</span>
			</div>

			<div id="board-writer">
				<span id="writer">${ board.boardWriter }</span>
			</div>

			<div id="board-title">
				<span id="title">${ board.boardTitle }</span>
			</div>

			<div id="board-content">
				<span id="content">${ board.boardContent }</span>
			</div>
		</div>

		<div id="attachment-part">
			<div id="board-attachment">
				<span id="attachment">첨부파일 : </span>
			</div>
		</div>

		<div id="button-part">
			<div id="board-button">
			
				<c:url var="boardModify" value="bmodifyView.ij">
					<c:param name="boardNo" value="${ board.boardNo }"/>
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
				
				<c:url var="boardDelete" value="bdelete.ij">
					<c:param name="boardNo" value="${ board.boardNo }"/>
				</c:url>
				
				<c:url var="boardList" value="blist.ij">
					<c:param name="page" value="${ currentPage }"/>
				</c:url>
				
				<button onclick="location.href='${ boardModify }';" type="button" class="btn btn-primary" id="board-btn-modify">수정</button>
				
				<button onclick="location.href='bdelete.ij';" type="button" class="btn btn-primary" id="board-btn-delete">삭제</button>
				
				<button onclick="location.href='blist.ij';" type="button" class="btn btn-primary" id="board-btn-list">목록</button>
			</div>
		</div>

		<div id="reply-part">
			<div id="reply-input-part">
				<div id="reply-input-text">
					<textarea id="reply"></textarea>
				</div>

				<div id="reply-input-button">
					<button class="btn btn-primary" id="reply-btn-input">댓글등록</button>
				</div>
			</div>

			<div id="reply-count">
				<span id="replyCount"></span>
			</div>

			<div id="reply-view">
				<table align="center">
					<tr>
						<td class="reply-writer"></td>
						<td class="reply-button">
							<a href="javascript:update();">수정</a>
							<a href="">삭제</a>
						</td>
					</tr>

					<tr>
						<td class="reply-content">
						</td>
						<td class="reply-date"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<script>
		replyList();
		
		$("#reply-btn-input").on("click", function(){
			var replyContent = $("#reply").val();
			var boardNo = ${ board.boardNo };
			
			$.ajax({
				url : "rinsert.ij",
				data : {replyContent : replyContent, boardNo : boardNo},
				type : "post",
				success : function(data) {
					if (data == "success") {
						$("#reply").val("");
						replyList();
					}
				}
			});
		});
		
		function replyList() {
			var boardNo = ${ board.boardNo };
			
			$.ajax({
				url : "rlist.ij",
				data : {boardNo : boardNo},
				dataType : "json",
				success : function(list) {
				}
			});
		}
		
		function update() {
			$(this).parent().parent().next().children().
			console.log(this);
			this.parentNode.parentNode.nextSibling.childNodes[0].
		}
		
	</script>
</body>
</html>