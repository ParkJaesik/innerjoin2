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
	href="${contextPath}/resources/css/board/groupBoardDetail-style.css"
	type="text/css">
<title>Group Board List</title>
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
							<span id="writer">${ board.memberName }</span>
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
							<c:if test="${ !empty board.boardAttaOrigin }">
								<a href="${ contextPath }/resources/buploadFiles/${ board.boardAttaRename }" download>${ board.boardAttaOrigin }</a>
							</c:if>
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
							
							<button onclick="location.href='${ boardDelete }';" type="button" class="btn btn-primary" id="board-btn-delete">삭제</button>
							
							<button onclick="location.href='blist.ij';" type="button" class="btn btn-primary" id="board-btn-list">목록</button>
						</div>
					</div>
					
					<div id="reply-part">
						<div id="reply-input-part">
							<div id="reply-input-text">
								<textarea id="reply"></textarea>
							</div>
				
							<div id="reply-input-button">
								<button type="button" class="btn btn-primary" id="reply-btn-input">댓글등록</button>
							</div>
						</div>
				
						<div id="reply-count">
							<span id="replyCount"></span>
						</div>
				
						<div id="reply-view-container">
								
						</div>
					</div>
				</div>
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
		function replyList() {
			var boardNo = ${ board.boardNo };
			var groupNo = ${ group.gNo }
			$wrapper = $("#reply-view-container");
			$wrapper.empty();
			$content = "";
			$.ajax({
				url : "rlist.ij",
				data : {boardNo : boardNo , groupNo : groupNo},
				dataType : "json",
				success : function(list) {
					if(list.length>0){
						$.each(list, function(i){
							$content = '<div class="reply-view" align="center" style="margin-top:10px;"><table><tr>';
							$content += '<td class="reply-writer" style="width:500px; font-size:12px;">'+list[i].memberName+'</td>';
							$content += '<td class="reply-button" style="width:200px; text-align:center; font-size:12px;">';
							$content += '<a id="reply-edit" href="javascript:update('+list[i].replyNo+');">수정</a>&nbsp;&nbsp;';
							$content += '<a id="reply-delete" href="">삭제</a></td></tr>';
							$content += '<tr>';
							$content += '<td class="reply-content" style="font-weight:bold">'+list[i].replyContent+'</td>';
							$content += '<td class="reply-date" style="text-align:center; font-size:12px;">'+list[i].replyModifyDate+'</td></tr>';
							$content += '</table></div>';
							$wrapper.append($content);
						});
					} 
				}
			});
		}
		
		replyList();
		
		$("#reply-btn-input").on("click", function(){
			var replyContent = $("#reply").val();
			var boardNo = ${ board.boardNo };
			var groupNo = ${ group.gNo }
			$.ajax({
				url : "rinsert.ij",
				data : {replyContent : replyContent, boardNo : boardNo, groupNo : groupNo},
				type : "post",
				success : function(data) {
					if (data == "success") {
						$("#reply").val("");
						replyList();
					}
				}
			});
		});
		
		$("#reply-edit").on("click", function(){
			
		});
	</script>
</body>
</html>