<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#group-btn-schedule {
	background-color: #17A2B8 !important;
	color: #FFFFFF !important;
}
</style>
<title>Insert title here</title>
</head>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<title>Insert title here</title>

	<!-- 달력렌더링과 이벤트등록폼에 적용할 js -->
	<script src='${contextPath }/resources/js/event/calendarEvent.js'></script> 
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
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
				<%-- <%@ include file="/WEB-INF/views/group/groupMenubar.jsp"%> --%>
				<jsp:include page="/WEB-INF/views/group/groupMenubar.jsp"/>
				<%@ include file="/WEB-INF/views/event/calendar.jsp" %>

			</div>
			<div class="col-md-1 aside">
				<div id="groupChatWrapper">
					<%@ include file="/WEB-INF/views/chat/chat.jsp" %>	
				</div>
			</div>
		</div>
		<div class="row" id="footer-wrapper">
			<div class="col-md-12" id="all-footer">
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>