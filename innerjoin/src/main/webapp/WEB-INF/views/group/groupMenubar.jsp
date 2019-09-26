<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/groupMenubar-style.css" type="text/css">

<title>Group Menubar</title>

</head>
<body>
	<div id="group-menubar-container">
		<div id="group-menubar">
			<div id="group-thumbnail">
				<img src="" alt="">
			</div>

			<div id="group-intro-container">
				<div id="group-intro-name">
					<span id="group-name">DEVELOPER STUDY</span>
				</div>

				<div id="group-intro-area">
					<span id="group-area">지역 : 서울 중구</span>
				</div>

				<div id="group-intro-member">
					<span id="group-member">회원 : 35명</span>
				</div>

				<div id="group-intro-leader">
					<span id="group-leader">모임장 : </span>
					<button type="button" class="btn btn-primary"
						id="btn-group-inquiry">문의하기</button>
				</div>
			</div>

			<div id="group-button">
				<!-- 모임에 가입되지 않은 경우 -->
				<button type="button" class="btn btn-primary" id="btn-group-join">이
					모임에 JOIN</button>

				<!-- 모임에 가입된 경우 -->
				<button type="button" class="btn btn-primary" id="btn-group-quit">모임
					탈퇴하기</button>
			</div>
		</div>
	</div>

	<div id="menu-button-container">
		<div id="menu-button">
			<button type="button" class="btn btn-primary" id="btn-menu-info">정보</button>
			<button type="button" class="btn btn-primary" id="btn-menu-schedule">일정</button>
			<button type="button" class="btn btn-primary" id="btn-menu-board">게시판</button>
			<button type="button" class="btn btn-primary" id="btn-menu-member">회원</button>
			<button type="button" class="btn btn-primary" id="btn-menu-gallery">사진</button>
		</div>
	</div>
</body>
</html>