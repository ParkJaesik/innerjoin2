<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/group/groupMember-style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<div id="member-container">
		<h1 align="center">회원</h1>
		
		<h5 align="right">
			<a href="wgmlist.ij">대기중인 명단</a>
		</h5>
		
		<c:forEach var="m" items="${ list }">
			<%-- <c:if test="${ m.levelCode eq 0 or m.levelCode eq 1 or m.levelCode eq 2 }"> --%>
				<div id="member-part">
					<div id="member">
						<div id="member-image" class="rounded-circle">
							<img src="${contextPath}/resources/images/profile.png" alt="" class="rounded-circle">
						</div>
						
						<div id="member-name">
							<span id="name">${ m.memberName }</span>
						</div>
						
						<div id="member-level">
							<c:if test="${ m.levelCode == 0 }">
								<c:set var="member" value="모임장"/>
							</c:if>
							<c:if test="${ m.levelCode == 1 }">
								<c:set var="member" value="매니저"/>
							</c:if>
							<c:if test="${ m.levelCode == 2 }">
								<c:set var="member" value="일반회원"/>
							</c:if>
							<span id="level">${ member }</span>
						</div>
		
						<div id="member-button">

							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter1">회원등급</button>
							
							<!-- 모달창 -->
							<!-- Modal -->
							<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered" role="document">
							    <div class="modal-content">
							      <form action="memlevel.ij">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLongTitle" style="float: left;">Modal title</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right;">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								        <div class="div1" >
											<input type="text" readonly value="">							
										</div>
										<div class="div2" style="margin-top: 10%; margin-left: 0;">
											모임장<input type="radio" name="levelCode">
											매니저<input type="radio" name="levelCode">
											일반회원<input type="radio" name="levelCode">
										</div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								        <button type="submit" class="btn btn-primary">수정</button>
								      </div>
								 </form>
							    </div>
							  </div>
							</div>

						<c:if test="">
						</c:if>
							<button type="button" class="btn btn-primary" id="member-btn-level">회원등급</button>

							<button type="button" class="btn btn-primary" id="member-btn-report">신고하기</button>
						</div>
					</div>
				</div><br>
			<%-- </c:if> --%>
		</c:forEach>
	</div>
</body>
</html>