<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE HTML>
<!--
	Strongly Typed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>login</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
		<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" href="${contextPath}/resources/css/main.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/join.css">
		
	</head>
	<body class="no-sidebar is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container">

						<!-- Logo -->
							<h1 id="logo"><a href="index.html">Inner Join</a></h1>
							

						<!-- Nav -->
							

					</div>
				</section>

			<!-- Main -->
				<section id="main">
					<div class="container" style="box-shadow: none;">
						<div id="content">

							<header>
								<h2>로그인 </h2>
							</header>
									
							<form action="login.ij" method="post">
								<div>
								<!-- <h4>회원가입</h4> -->
									<div class="input-group input-group-icon">
										<input type="text" placeholder="Email Adress" name="memberId"/>
										<span aling="center">출력메세지</span>
									</div>
									<div>
										<div class="input-group input-group-icon">
											<input type="password" placeholder="Password" name="memberPwd"/>
											<span aling="center">출력메세지</span>
										</div>
									</div>
									
								</div>
								
								<button id="submit-btn" style="float: right; padding: 15px 20px 15px 20px; width: 100%;"><div class="col-4">로그인</button>
								
							</form>
							
							<div>
								<a href="joinForm.ij" style="margin-left: 50px; margin-top: 10px; float: left; ">회원가입</a>
								
								<a href="#" style="margin-right: 50px; margin-top: 10px; float: right;">비밀번호 찾기</a>
							</div>
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