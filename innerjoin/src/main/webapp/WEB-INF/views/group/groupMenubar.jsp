<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 --%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${contextPath}/resources/css/group/groupMenubar-style.css"
	type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/common/index.css">	
<title>Group Menubar</title>
<style>
	#askMsg{
	
	    width: 100%;
    	resize: none;
    }
</style>
</head>
<body>

<%-- <c:set var="groupNo" value="1"/>
<c:set var="memberId" value="gp@gmail.com"/> --%>
	<div id="group-index-container">
		<div id="group-info-container">
			<div id="group-thumbnail">
				<img src="${ contextPath }/resources/guploadFiles/${ group.filePath }" alt="" id="thumbnail" name="filePath">
			</div>

			<div id="group-info">
				<div id="group-info-name">
					<span id="group-name">${group.gName }</span>
				</div>

				<div id="group-info-area">
					<span id="group-area">지역 : 서울 ${group.districtName }</span>
				</div>

				<div id="group-info-member">
					<span id="group-member">회원 : ${group.gMemCount }명</span>
				</div>

				<div id="group-info-leader">
					<span id="group-leader">모임장 : </span> 
					
					<c:choose>
					<c:when test="${groupMemberCode eq 3 or groupMemberCode eq 5 or groupMemberCode eq 4}">
					<a href="#" id="group-inquiry" data-toggle="modal" data-target="#exampleModalCenter2">${group.gHost }</a>
					</c:when>
					<c:otherwise>
					<a href="#" id="group-inquiry">${group.gHost }</a>
					</c:otherwise>
					</c:choose>
					
					
				</div>
			</div>

			<div id="group-button">
				<c:if test="${ loginUser.memberName eq group.gHost }"> <!-- 유저가 모임장일 때 모임관리 버튼 보이게 -->
					<c:url var="secession" value="rblist.ij"/>
					<button type="button" class="btn btn-primary" id="group-btn-manage">모임관리</button>
				 </c:if>
				<c:set var="groupMemberCode" value = "${groupMemberCode }" scope="session"/>
				
				<c:if test="${groupMemberCode eq 3 or groupMemberCode eq 5 or groupMemberCode eq -1 or groupMemberCode eq 4}">
				<button type="button" class="btn btn-primary" id="group-btn-join" data-toggle="modal" data-target="#exampleModalCenter">INNER JOIN하기</button>
				</c:if>
				
				<c:if test="${groupMemberCode eq 1 or groupMemberCode  eq 2}">
				<button type="button" class="btn btn-primary" id="group-btn-withdraw">모임에서 나가기</button>
				</c:if>
				
			</div>
		</div>

		<div id="group-menu-container">
			<button onclick="location.href='goGroupPage.ij?gNo=8';" type="button" class="btn btn-primary" id="group-btn-index">정보</button>

			<button type="button" class="btn btn-primary" id="group-btn-schedule" onclick="location.href='calendar.ij'">일정</button>
			
			<button onclick="location.href='blist.ij';" type="button" class="btn btn-primary" id="group-btn-board">게시판</button>
			<button onclick="location.href='gmlist.ij';" type="button" class="btn btn-primary" id="group-btn-member">회원</button>
			<c:url var="goAlbum" value="albumListView.ij">
				<c:param name="groupNo" value="1" />
			</c:url>
			<button type="button" class="btn btn-primary" id="group-btn-gallery" onclick="location.href='${goAlbum}'">사진</button>
		</div>
	</div>
	
<!-- 	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button> -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	
        <h5 class="modal-title" id="exampleModalCenterTitle">Inner Join</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                   이 모임에 Inner Join 하겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary"  id="applyGroupBtn">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 가입문의 모달 -->
<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">가입문의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div>${group.gHost }</div>
       	<hr>
       	<textarea rows="5" cols="20" id="askMsg"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="askMsgBtn">문의하기</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(function(){
		
		$("#askMsgBtn").click(function(){
			
			var reciverName = "${group.gHost }";
			var askMsg = $("#askMsg").val();
			var senderId = "${loginUser.memberId}";
			var gName = "${gName}";
			var gNo = "${group.gNo}"
			
			$.ajax({
				
				url : "insertNote.ij",
				type : "post",
				data : {reciverName : reciverName,askMsg:askMsg,senderId:senderId,gName:gName},
				success : function(receiverId){
					
					alert("가입문의 성공");
					socket.send("applyMessage" +"," + gName + "," + receiverId + "," +senderId +"," +gNo);
					$('#exampleModalCenter2').modal('hide');
					
				}
				
				
			});
			
		});
		
	});
	
	
	
	$("#applyGroupBtn").click(function(){
		var groupMemberCode = "${groupMemberCode }";
		var gMemCount = "${group.gMemCount}";
		var gLimit = "${group.gLimit}";
		console.log(gMemCount);
		console.log(gLimit);
		
		if(gMemCount != gLimit){
			if(groupMemberCode == 5){
				$(location).attr('href','insertGroupMember.ij');
				var loginUserId = "${loginUser.memberId}";
				var gName = "${group.gName}"
				var gNo = "${group.gNo}";
				var hostName =  "${group.gHost}";
				socket.send("apply"+"," + loginUserId + "," + gName + "," + hostName +"," + gNo);
				
				
			}else{
				alert("모임 가입 신청을 이미 하셨습니다.");
			}
		}else{
			alert("모임인원이 가득찼습니다.");
		}
	
	});
</script>
</body>
</html>