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
		
	</head>
	<body class="no-sidebar is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container">
						<!-- Logo -->
						<h1 id="logo"><a>login</a></h1>
						<!-- 메뉴바 들어가는 부분 -->
					</div>
				</section>

			<!-- Main -->
				
				<section id="header" style="position: relative;">
					<div class="container" style="position: absolute; left: 35%; padding: 70px; text-align: center; border-bottom: 0px; box-shadow: none;">
						<div class="col-4"></div>
						<div class="col-4">
							<form method="post" action="login.ij">
								<div class="row gtr-50" aling="cneter">
									<div class="col-4 col-6-small" >
										<div>
											<input name="memberId" placeholder="Email" type="text" />
											<br>
											<input name="memberPwd" placeholder="password" type="password" />
										</div>
										<br>

										<!-- 로그인 버튼 -->
										<div class="col-4 col-6-small">
											<button class="form-button-submit button icon solid" 
											style="padding: 10px 20px 10px 20px; width: 100%;">로그인</button>
										</div>
										<!-- ---------- -->
									</div>
								</div>
							</form>
							<div class="col-4 col-6-small" style="float: left; margin: 10px;" >
								&nbsp; &nbsp;
								<a href="#">회원가입</a>
								&nbsp; &nbsp; &nbsp; &nbsp; 
								&nbsp; &nbsp; &nbsp; &nbsp; 
								&nbsp; &nbsp; &nbsp; &nbsp; 
								&nbsp; &nbsp; &nbsp; &nbsp;

								<a href="#">아이디/비번찾기</a>
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