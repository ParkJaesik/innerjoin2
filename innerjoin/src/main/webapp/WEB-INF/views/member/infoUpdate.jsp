<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/menubar.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/join.css"/>
<title>마이페이지</title>
</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">
		<section id="header">
			<div class="container" id="profile" > 
				<nav id="nav">
					<ul>
						<a href="#"><img id="ij-logo" src="${contextPath}/resources/images/innerJoin.png"></a>
						<li class="menu"><a class="icon solid fa-search" href="#"><span>Search</span></a></li>
						<li class="menu"><a class="icon solid fa-envelope" href="#"><span>News</span></a></li>
			            <li class="menu"><a class="icon solid fa-home" href="myGroupForm.ij"><span>MyPage</span></a></li>
					</ul>
				</nav>
			</div> 
		</section>
		<!-- Main -->
		<section id="main">
			<div class="container" style="box-shadow: none;">
				<div id="content">

					<header>
						<h2>정보수정 </h2>
					</header>
									
					<form action="join.ij" method="post">
						<div>
					<!-- <h4>회원가입</h4> -->
							<div class="input-group input-group-icon">
								<input type="email" name="memberId" value="${ loginUser.memberId }" readonly="readonly"/>
							</div>
							<br>
							<div class="input-group input-group-icon">
								<input type="text" value="${ loginUser.memberName }"/>
								<input type="hidden" name="memberNaem" value="${ loginUser.memberName }">
								&nbsp;<span style="text-aling:center;" id="nameCheck">&nbsp;</span>
							</div>
							<div>
								<div class="input-group input-group-icon">
									<input type="password" placeholder="Password"/>
									<input type="hidden" name="memberPwd" value="${ loginUser.memberPwd }">
									&nbsp;<span id="pwdCheck1">&nbsp;</span>
								</div>
							</div>
							<div>
								<div class="input-group input-group-icon">
									<input type="password" placeholder="Password Check"/>
									<input type="hidden" name="memberPwd2" value="${ loginUser.memberPwd }">
									&nbsp;<span id="pwdCheck2">&nbsp;</span>
								</div>
							</div>
						</div>
						<div>
							<div class="col-half">
								<h4>Date of Birth</h4>
								<div class="input-group">
									<div class="col-third">
										<input type="text" placeholder="YYYY" maxlength="4"/>
									</div>
									<div class="col-third">
										<input type="text" placeholder="MM" maxlength="2"/>
									</div>
									<div class="col-third">
										<input type="text" placeholder="DD" maxlength="2"/>
									</div>
								</div>
							</div>
							<div class="col-half">
								<h4>Gender</h4>
									<div class="input-group">
										<input type="radio" name="gender" value="male" id="gender-male"/>
										<label for="gender-male">Male</label>
										<input type="radio" name="gender" value="female" id="gender-female"/>
										<label for="gender-female">Female</label>
									</div>
								</div>
							</div>	
								
								<button id="submit-btn" style="float: right;"> 수정</button>
								<button style="background-color: rgba(141, 141, 140, 0.836);">취소</button>
								<c:url var="mLeave" value="mLeave.ij">
									<c:param name="memberId" value="${ loginUser.memberId }"/>
								</c:url>
							
								<a href="${ mLeave }"> 탈퇴하기</a>
							</form>

						</div>
					</div>
				</section>
			
		</div>

		<!-- Scripts -->
		<script src="${contextPath}/resources/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
		<script src="${contextPath}/resources/js/browser.min.js"></script>
		<script src="${contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${contextPath}/resources/js/util.js"></script>
		<script src="${contextPath}/resources/js/main.js"></script>

	</body>
</html>