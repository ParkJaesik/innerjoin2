<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 --%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"> -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${contextPath}/resources/css/group/groupMenubar-style.css"
	type="text/css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
	

<title>Group Menubar</title>
<style>
	
</style>
</head>
<body>

<%-- <c:set var="groupNo" value="1"/>
<c:set var="memberId" value="gp@gmail.com"/> --%>
	<div id="group-index-container">
		<div id="group-info-container">
			<div id="group-thumbnail">
				<img src="style_5d10844730af1.jpg" alt="" id="thumbnail">
			</div>

			<div id="group-info">
				<div id="group-info-name">

					<span id="group-name">모임 제목</span>
				</div>

				<div id="group-info-area">
					<span id="group-area">지역 : 모임 지역</span>
				</div>

				<div id="group-info-member">
					<span id="group-member">회원 : 회원 수</span>
				</div>

				<div id="group-info-leader">
					<span id="group-leader">모임장 : </span> <a href="" id="group-inquiry">모임장 이름</a>

					<span id="group-name">${group.gName }</span>
				</div>

				<div id="group-info-area">
					<span id="group-area">지역 : 서울 ${group.districtName }</span>
				</div>

				<div id="group-info-member">
					<span id="group-member">회원 : ${group.gMemCount }명</span>
				</div>

				<div id="group-info-leader">
					<span id="group-leader">모임장 : </span> <a href="" id="group-inquiry">${group.gHost }</a>

				</div>
			</div>

			<div id="group-button">
				<%-- <c:if test="${ loginUser.memberName eq group.gHost }"> --%> <!-- 유저가 모임장일 때 모임관리 버튼 보이게 -->
					<c:url var="secession" value="rblist.ij"/>
					<button type="button" class="btn btn-primary" id="group-btn-manage" onclick="location.href='${secession}'">모임관리</button>
				<%-- </c:if> --%>
				
				<button type="button" class="btn btn-primary" id="group-btn-join">INNER JOIN하기</button>
				<button type="button" class="btn btn-primary" id="group-btn-withdraw">모임에서 나가기</button>
			</div>
		</div>

		<div id="group-menu-container">
			<button type="button" class="btn btn-primary" id="group-btn-index">정보</button>

			<button type="button" class="btn btn-primary" id="group-btn-schedule" onclick="location.href='calendar.ij'">일정</button>

			<button type="button" class="btn btn-primary" id="group-btn-board">게시판</button>
			<button type="button" class="btn btn-primary" id="group-btn-member">회원</button>
			<c:url var="goAlbum" value="albumListView.ij">
				<c:param name="groupNo" value="1" />
			</c:url>
			<button type="button" class="btn btn-primary" id="group-btn-gallery" onclick="location.href='${goAlbum}'">사진</button>
		</div>
	</div>

</body>
</html>