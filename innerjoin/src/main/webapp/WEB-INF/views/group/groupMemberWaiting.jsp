<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#group-btn-member {
	background-color: #17A2B8 !important;
	color: #FFFFFF !important;
}
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/group/groupMember-style.css" type="text/css">
<title>Insert title here</title>
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
				
				<div id="member-container">
					<h1 align="center">회원</h1>
					
					<h5 align="right">
						<a href="gmlist.ij">회원 명단</a>
					</h5>
					
					<c:forEach var="m" items="${ list }">
						<div id="member-part">
							<div id="member">
								<div id="member-image" class="rounded-circle">
									<img src="${contextPath}/resources/images/profile.png" alt="" class="rounded-circle">
								</div>
								
								<div id="member-name">
									<span id="name">${ m.memberName }</span>
								</div>
								
								<div id="member-level">
									<c:if test="${ m.levelCode == 3 }">
										<c:set var="member" value="초대중인 회원"/>
									</c:if>
									<c:if test="${ m.levelCode == 4 }">
										<c:set var="member" value="가입 신청한 회원"/>
									</c:if>
									<span id="level">${ member }</span>
								</div>
				
								<div id="member-button">
								<c:if test="">
								</c:if>
									<button type="button" class="btn btn-primary" id="member-btn-level">회원등급</button>
									<button type="button" class="btn btn-primary" id="member-btn-report">신고하기</button>
								</div>
							</div>
						</div><br>
					</c:forEach>
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

</body>
</html>