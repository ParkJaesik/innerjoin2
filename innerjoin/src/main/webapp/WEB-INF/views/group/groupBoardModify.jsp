<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
	<form action="bmodify.ij" method="post" id="bmodifyForm" enctype="multipart/form-data">
		<div id="board-container">
			<h1 align="center">게시글 수정</h1>
	
			<div id="board-part">
				<div id="board-check">
					<c:if test="${ board.boardTypeCode eq 0 }">
						<input type="checkbox" name="boardTypeCheck" value="1" id="check" checked="checked">
						<label for="check">공지글</label>
						<input type="hidden" name="boardTypeCode" id="code" value="0">
					</c:if>
					
					<c:if test="${ board.boardTypeCode eq 1 }">
						<input type="checkbox" name="boardTypeCheck" value="1" id="check">
						<label for="check">공지글</label>
						<input type="hidden" name="boardTypeCode" id="code" value="1">
					</c:if>
				</div>
	
				<div id="board-writer">
					<span id="writer">${ board.boardWriter }</span>
					<input type="hidden" name="boardWriter" value="${ board.boardWriter }">
				</div>
	
				<div id="board-title">
					<input type="text" id="title" name="boardTitle" value="${ board.boardTitle }" placeholder="제목" autocomplete="off">
				</div>
	
				<div id="board-content">
					<textarea id="content" name="boardContent" placeholder="내용">${ board.boardContent }</textarea>
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
					<button onclick="location.href='javascript:history.go(-1)';" type="button" class="btn btn-primary" id="board-btn-cancel">취소</button>
				</div>
			</div>
		</div>
	</form>
	
	<script>
		$("#board-btn-modify").click(function(){
			if ($("input:checkbox[id='check']").is(":checked")) {
				$("#code").val("0");
				
			} else {
				$("#code").val("1");
			}
			
			$("#bmodifyForm").submit();
		});
	</script>
</body>
</html>