<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html>
	<head>
		<title>회원가입</title>
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
								<h2>회원가입 </h2>
							</header>
									
							<form action="join.ij" method="post">
								<div>
								<!-- <h4>회원가입</h4> -->
									<div class="input-group input-group-icon">
										<input type="text" placeholder="Full Name"/>
										<span class="check-messagealing="center">출력메세지</span>
									</div>
									<div class="input-group input-group-icon">
										<input type="email" placeholder="Email Adress"/>
										<span aling="center">출력메세지</span>
									</div>
									<div>
										<div class="input-group input-group-icon">
											<input type="password" placeholder="Password"/>
											<span aling="center">출력메세지</span>
										</div>
									</div>
									<div>
										<div class="input-group input-group-icon">
											<input type="password" placeholder="Password Check"/>
											<span aling="center">출력메세지</span>
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
											
								<div class="row">
									<h4>Terms and Conditions</h4>
									<div class="input-group">
										<input type="checkbox" id="terms"/>
										<label for="terms">I accept the terms and conditions for signing up to this service, and hereby confirm I have read the privacy policy.</label>
									</div>
								</div>
								<button id="submit-btn" style="float: right;"> 가입</button>
								
								<button type="button" onclick="" style="background-color: rgba(141, 141, 140, 0.836)">취소</button>
							</form>

						</div>
					</div>
				</section>
			
		</div>

		<!-- Scripts -->
			<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${contextPath}/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="${contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${contextPath}/resources/assets/js/util.js"></script>
			<script src="${contextPath}/resources/assets/js/main.js"></script>

	</body>
</html>