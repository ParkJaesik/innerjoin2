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
							
							<c:if test="${ loginUser.memberId eq board.memberId }">
								<button onclick="location.href='${ boardModify }';" type="button" class="btn btn-primary" id="board-btn-modify">수정</button>
							</c:if>
							
							<c:if test="${ loginUser.memberId eq board.memberId or loginUser.memberName eq group.gHost }">
								<button onclick="location.href='${ boardDelete }';" type="button" class="btn btn-primary" id="board-btn-delete">삭제</button>
							</c:if>
							
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
			/* var loginUser = ${ loginUser.memberId } */
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
							$content = '<div class="reply-view" align="center" style="margin-top:10px;" id="reply-view'+list[i].replyNo+'"><table><tr>';
							$content += '<td class="reply-writer" style="width:500px; font-size:12px;">'+list[i].memberName+'</td>';
							$content += '<td class="reply-button" style="width:200px; text-align:center; font-size:12px;">';
							
							/* if (loginUser == list[i].memberId) {} */
								$content += '<a id="reply-edit" href="javascript:replyEdit('+list[i].replyNo+',\''+list[i].memberName+'\',\''+list[i].replyContent+'\');">수정</a>&nbsp;&nbsp;';
								$content += '<a id="reply-delete" href="javascript:replyDelete('+list[i].replyNo+')">삭제</a>';
							
							$content += '</td></tr><tr>';
							$content += '<td class="reply-content" style="font-size:12px;">'+list[i].replyContent+'</td>';
							$content += '<td class="reply-date" style="text-align:center; font-size:12px;">'+list[i].replyModifyDate+'</td></tr>';
							$content += '</table></div>';
							$wrapper.append($content);
						});
					} 
				}
			});
		}
		
		replyList();
		
		function replyEdit(i, name, content){
			$("#reply-view"+i).empty().css("height","75");
			$content = "";
			$content += '<table><tr>';
			$content += '<td class="reply-writer" style="width:500px; font-size:12px;">'+name+'</td>'
			$content += '<td class="reply-button" style="width:200px; text-align:center; font-size:12px;" rowspan="2">'
			$content += '<a id="edit-edit'+i+'" href="javascript:goEdit('+i+');">완료</a>&nbsp;&nbsp;';
			$content += '<a id="edit-cancel" href="javascript:replyList();">취소</a></td></tr><tr>';
			$content += '<td class="reply-content" style="font-weight:bold">'
			$content += '<textarea id="edit-content'+i+'" style="resize:none; width:100%; height:100%; font-size:12px;">'+content+'</textarea></td></tr>';
			$content += '</table>';
			$("#reply-view"+i).append($content);
			$("#edit-content"+i).focus();
		}
		
		function goEdit(i) {
			var replyNo = i;
			var replyContent = $("#edit-content"+i).val();
			
			$.ajax({
				url: "rupdate.ij",
				data : {replyNo : replyNo, replyContent : replyContent},
				success : function(result) {
					if (result == "success") {
						alert("댓글 수정 완료");
						replyList();
						
					} else {
						alert("댓글 수정 실패. 다시 시도해주세요");
					}
				}
			});
		}

		function replyDelete(i){
			if (confirm("삭제하시겠습니까?")) {
				var replyNo = i;
				
				$.ajax({
					url : "rdelete.ij",
					data : {replyNo : replyNo},
					success : function(result){
						if (result == "success") {
							alert("댓글 삭제 완료");
							replyList();
							
						} else {
							alert("댓글 삭제 실패. 다시 시도해주세요");
						}
					}
				});
			}
		}
		
		replyList();
		
		$("#reply-btn-input").on("click", function(){
			var replyContent = $("#reply").val();
			var boardNo = ${ board.boardNo };
			var groupNo = ${ group.gNo };
			
			
			var gName = "${gName}";
			
			$.ajax({
				url : "rinsert.ij",
				data : {replyContent : replyContent, boardNo : boardNo, groupNo : groupNo},
				type : "post",
				success : function(receiverId) {
						socket.send("boardReply," + gName + "," + boardNo + "," + receiverId + "," + groupNo);
						$("#reply").val("");
						replyList();
					
				}
			});
		});
		
		
	</script>
</body>
</html>