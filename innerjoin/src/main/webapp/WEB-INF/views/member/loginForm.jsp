<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<title>Insert title here</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/join.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css">

<title>마이페이지</title>
<style type="text/css">
	/* *{
	 	 border: 1px solid black;
	 }  */
</style>
</head>
<body>

<div class="container-fluid" id="all-wrapper">

		<!-- 페이지 헤더부분 -->
		<div class="row" id="header-wrapper">
			<div class="col-md-12" id="all-hearder">
				<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
			</div>
		</div>

		<!-- 페이지 바디부분 -->
		<div class="row" id="body-wrapper">
			<div class="col-md-1 aside"></div>
			<!-- 다들 이 페이지 틀 복사해서 만드는페이지에 기본으로 깔고     밑에 body-content 공간에  본인 페이지 include해줘 -->
			<div class="col-md-10" id="body-content">
				<!-- 메인페이지 content 부분 -->
				 
				 
				  <div class="row">
				  	<div class="col-4"></div>
				  	<div class="col-4">
				  		<div class="margin" style="margin: 50px;"></div>
				  		<form action="login.ij" method="post">
							<div class="input-group input-group-icon">
								<input type="text" placeholder="Email Adress" name="memberId"/>
								<br>
								<!-- <span aling="center">출력메세지</span> -->
							</div>
							<div class="input-group input-group-icon">
								<input type="password" placeholder="Password" name="memberPwd"/>
								<c:if test="${ !empty msg }">
								<span  aling="center" style="color: #df5849;">${ msg }</span>
								</c:if>
							</div>
							<button id="submit-btn" style="float: right; padding: 15px 20px 15px 20px; width: 100%;" >
								로그인
							</button>
						</form>
						<div>
							<a href="joinForm.ij" style="margin-left: 50px; margin-top: 10px; float: left; ">회원가입</a>
							<a href="findPwdForm.ij" style="margin-right: 50px; margin-top: 10px; float: right;">비밀번호 찾기</a>
						</div>
				  	</div>
				  	<div class="col-4"></div>
				  </div>
				</div>
				<div class="col-md-1 aside"></div>
			</div>
	</div>
	<div class="margin" style="margin: 50px;"></div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</body>
</html>
