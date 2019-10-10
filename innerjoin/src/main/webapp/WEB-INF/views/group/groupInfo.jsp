<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/group/groupInfo-style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
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
						<div id="group-main-event">
							<span style="font-weight:bold">ㅎㅎㅎ</span>
						</div><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>