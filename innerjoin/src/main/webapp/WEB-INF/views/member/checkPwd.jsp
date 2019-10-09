<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<title>Insert title here</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">


<link rel="stylesheet" href="${contextPath}/resources/css/myPage.css"/>

<title>정보수정</title>
<style type="text/css">
.error-msg{
	color: #df5849;
}
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
					<div class="col-md-4"></div>
						<div class="col-md-4">
							<div class="margin"></div>
							<div id="content">

							<header>
								<h2>비밀번호 입력 </h2>
							</header>
									
							<form action="checkPwd.ij" id="checkPwd" name="checkPwd" method="post">
								<div>
								<!-- <h4>회원가입</h4> -->
									<div class="input-group input-group-icon">
										<input type="password" name="memberPwd" id="memberPwd" placeholder="Password"/>
										<c:if test="${! empty msg }">
										<span aling="center" class="error-msg">${ msg }</span>
										</c:if>
									</div>
									
									
								</div>
								
								<button id="submit-btn" style="float: right; padding: 15px 20px 15px 20px; width: 100%;">확인</button>
								
							</form>
							<div>
								<!-- <a href="#" style="margin-top: 10px; margin-left: 50px; float: left;">뒤로가기</a>
								<a href="#" style="margin-right: 50px; margin-top: 10px; float: right;">비밀번호 찾기</a> -->
							</div>
						</div>
					</div>
			
						
						</div>
						<div class="col-md-4">
						</div>
					</div>
						
				 
				 
			<div class="col-md-1 aside">
				
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>












