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
			<a href="gmlist.ij">회원 명단</a>
		</h5>
		
		<c:forEach var="m" items="${ list }">
			<%-- <c:if test="${ m.levelCode eq 3 or m.levelCode eq 4 }"> --%>
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
							<button type="button" class="btn btn-primary" id="member-btn-accept">수락하기</button>
							<button type="button" class="btn btn-primary" id="member-btn-reject">거절하기</button>
						</c:if>
						</div>
					</div>
				</div><br>
			<%-- </c:if> --%>
		</c:forEach>
	</div>
	
	<script>
		
	</script>
</body>
</html>