<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/join.css"/>
<title>정보수정</title>
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
								<h2>비밀번호 입력 </h2>
							</header>
									
							<form action="login.ij" method="post">
								<div>
								<!-- <h4>회원가입</h4> -->
									<div class="input-group input-group-icon">
										<input type="password" placeholder="Password"/>
										<span aling="center">출력메세지</span>
									</div>
									<!-- <div>
										<div class="input-group input-group-icon">
											<input type="password" placeholder="Password"/>
											<span aling="center">출력메세지</span>
										</div>
									</div> -->
									
								</div>
								
								<button id="submit-btn" style="float: right; padding: 15px 20px 15px 20px; width: 100%;"><div class="col-4">확인</button>
								
							</form>
							<div>
								<!-- <a href="#" style="margin-top: 10px; margin-left: 50px; float: left;">뒤로가기</a>
								<a href="#" style="margin-right: 50px; margin-top: 10px; float: right;">비밀번호 찾기</a> -->
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