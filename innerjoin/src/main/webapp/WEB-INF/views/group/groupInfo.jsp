<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#group-btn-index {
	background-color: #17A2B8 !important;
	color: #FFFFFF !important;
}
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/group/groupInfo-style.css" type="text/css">
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
				
				<div id="group-main-container">
					<div id="left-container">
						<div id="left-content">
							<div id="group-main-info-container">
								<h1>모임 소개</h1>
								<div id="group-main-info">${ group.gInfo }</div>
							</div>
							<div id="group-main-new-container">
								<h1>NEW</h1>
								<div id="group-main-new"></div>
							</div>
						</div>
					</div>
			
					<div id="right-container">
						<div id="right-content">
							<div id="group-main-event-container">
								<h1>예정된 이벤트</h1>
								<c:forEach var="e" items="${ event }">
									<div id="group-main-event">
										<span style="font-weight:bold">${ e.eTitle }</span>
									</div><br>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
				
			<div class="col-md-1 aside">
				<c:if test="${groupMemberCode eq 0 or groupMemberCode eq 1 or groupMemberCode  eq 2}">
				<div id="groupChatWrapper">
					<%@ include file="/WEB-INF/views/chat/chat.jsp"%>
				</div>
				</c:if>
			</div>
		</div>

		<div class="row" id="footer-wrapper">
			<div class="col-md-12" id="all-footer"></div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>