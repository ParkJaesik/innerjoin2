<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${contextPath}/resources/css/board/groupBoardInsert-style.css"
	type="text/css">
<title>Group Board Insert</title>
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
				
				<form action="binsert.ij" method="post" id="binsertForm" enctype="multipart/form-data">
					<div id="board-container">
						<h1 align="center">게시글 등록</h1>
			
						<div id="board-part">
							<div id="board-check">
								<c:if test="${ loginUser.memberId eq group.gHost }">
									<input type="checkbox" name="boardTypeCheck" value="1" id="check">
									<label for="check">공지글</label>
									<input type="hidden" name="boardTypeCode" id="code">			
								</c:if>
								
								<c:if test="${ !loginUser.memberId eq group.gHost }"> --%>
									<input type="checkbox" name="boardTypeCheck" value="1" id="check" disabled="disabled">
									<label for="check">공지글</label>
									<input type="hidden" name="boardTypeCode" id="code">			
								</c:if>
							</div>
			
							<div id="board-writer">
								<span id="writer">${ loginUser.memberName }</span>
								<input type="hidden" name="memberId" value="${ loginUser.memberId }"> <!-- 차후 변경 요망 -->
							</div>
			
							<div id="board-title">
								<input type="text" id="title" name="boardTitle" placeholder="제목" autocomplete="off">
							</div>
			
							<div id="board-content">
								<textarea id="content" name="boardContent" placeholder="내용"></textarea>
							</div>
						</div>
			
						<div id="attachment-part">
							<div id="board-attachment">
								<span id="attachment">첨부파일 : </span>
								<input type="file" name="uploadFile">
							</div>
						</div>
			
						<div id="button-part">
							<div id="board-button">
								<button type="button" class="btn btn-primary" id="board-btn-input">등록</button>
								<button onclick="location.href='blist.ij'" type="button" class="btn btn-primary" id="board-btn-cancel">취소</button>
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
		$("#board-btn-input").click(function(){
			if ($("input:checkbox[id='check']").is(":checked")){
				$("#code").val("0");
			}else{
				$("#code").val("1");
			} 
			
			$("#binsertForm").submit();
		});
	
	</script>
</body>
</html>