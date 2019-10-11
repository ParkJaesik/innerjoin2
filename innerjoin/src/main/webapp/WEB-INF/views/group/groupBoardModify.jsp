<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#group-btn-board {
	background-color: #17A2B8 !important;
	color: #FFFFFF !important;
}
</style>
<link rel="stylesheet"
	href="${contextPath}/resources/css/board/groupBoardModify-style.css"
	type="text/css">
<title>Group Board Modify</title>
</head>
<body>
	<div class="container-fluid" id="all-wrapper">
		<div class="row" id="header-wrapper">
			<div class="col-md-12" id="all-hearder">
				<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
			</div>
		</div>

		<div class="row" id="body-wrapper">
			<div class="col-md-1 aside"></div>

			<div class="col-md-10" id="body-content">
				<%@ include file="/WEB-INF/views/group/groupMenubar.jsp"%>
				
				<form action="bmodify.ij" method="post" id="bmodifyForm" enctype="multipart/form-data">
					<div id="board-container">
						<h1 align="center">게시글 수정</h1>
				
						<div id="board-part">
							<input type="hidden" name="boardNo" value="${ board.boardNo }">
							<input type="hidden" name="page" value="${ currentPage }">
							<input type="hidden" name="boardAttaRename" value="${ board.boardAttaRename }">
							<input type="hidden" name="boardAttaOrigin" value="${ board.boardAttaOrigin }">
							<div id="board-check">
								<c:if test="${ loginUser.memberId eq group.gHost }">
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
								</c:if>
							</div>
				
							<div id="board-writer">
								<span id="writer">${ board.memberName }</span>
								<input type="hidden" name="boardWriter" value="${ board.memberId }">
							</div>
				
							<div id="board-title">
								<input type="text" id="title" name="boardTitle" value="${ board.boardTitle }" placeholder="제목" autocomplete="off">
							</div>
				
							<div id="board-content">
								<c:set var="boardContent" value="${fn:replace(board.boardContent,'<br>','') }"/>
								<textarea id="content" name="boardContent" placeholder="내용">${ boardContent }</textarea>
							</div>
						</div>
				
						<div id="attachment-part">
							<div id="board-attachment">
								<span id="attachment">첨부파일 : </span>
								<input type="file" name="reloadFile">
								<c:if test="${ !empty board.boardAttaOrigin }">
									<a href="${ contextPath }/resources/buploadFiles/${ board.boardAttaRename }" download>${ board.boardAttaOrigin }</a>
								</c:if>
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
			</div>
				

			<div class="col-md-1 aside">
				<div id="groupChatWrapper">
					<%@ include file="/WEB-INF/views/chat/chat.jsp"%>
				</div>
			</div>
		</div>

		<div class="row" id="footer-wrapper">
			<div class="col-md-12" id="all-footer"></div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
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