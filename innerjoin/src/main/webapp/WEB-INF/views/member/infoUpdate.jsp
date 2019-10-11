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
				  		<form action="" method="post">
			             
			                <div class="row">
			                    <h3>정보 수정</h3>
			                    <div class="input-group input-group-icon">
									<input type="email" name="memberId" value="${ loginUser.memberId }" readonly="readonly"/>
									&nbsp;<span></span>
								</div>
								<br>
								<div class="input-group input-group-icon">
									<input type="text" value="${ loginUser.memberName }"/>
									<input type="hidden" name="memberName" value="${ loginUser.memberName }">
									&nbsp;<span style="text-aling:center;" id="nameCheck">&nbsp;</span>
								</div>
								<div class="input-group input-group-icon">
									<input type="password" placeholder="Password"/>
									<input type="hidden" name="memberPwd" value="${ loginUser.memberPwd }">
									&nbsp;<span id="pwdCheck1">&nbsp;</span>
								</div>
								<div class="input-group input-group-icon">
									<input type="password" placeholder="Password Check"/>
									<input type="hidden" name="memberPwd2" value="${ loginUser.memberPwd }">
									&nbsp;<span id="pwdCheck2">&nbsp;</span>
								</div>
								
								
			                  <div class="row">
			                  	<h3 class="info-title">추가 정보</h3>
			                  	<br>
			                  	<div class="row">
			                    <div class="col-half">
			                      	<h5>Date of Birth</h5>
			                      	<div class="input-group">
			                      	<c:choose>
				                      	<c:when test="${ empty loginUser.memberBirthday }">
				                      	<div class="col-third">
											<input type="text" placeholder="YYYY" maxlength="4"/>
										</div>
										<div class="col-third">
											<input type="text" placeholder="MM" maxlength="2"/>
										</div>
										<div class="col-third">
											<input type="text" placeholder="DD" maxlength="2"/>
										</div>
										</c:when>
			                      	
			                      		<c:when test="${ !empty loginUser.memberBirthday }">
				                        <c:forTokens var="birthday" items="${ loginUser.memberBirthday }" delims="/" varStatus="status">
				                        <c:if test="${ status.index eq 0 }">
				                        <div class="col-third">
											<input type="text" name="birthday1" id="birthday1" value="${ birthday }" maxlength="4"/>
										</div>
										</c:if>
										<c:if test="${ status.index eq 1 }">
										<div class="col-third">
											<input type="text" name="birthday2" id="birthday2" value="${ birthday }" maxlength="2"/>
										</div>
										</c:if>
										<c:if test="${ stauts.index eq 2}">
										<div class="col-third">
											<input type="text" name="birthday3" id="birthday3" value="${ birthday }" maxlength="2"/>
										</div>
										</c:if>
										</c:forTokens>
										</c:when>
									</c:choose>
			                      </div>
			                    </div>
			                    <div class="col-half">
			                      <h5>Gender</h5>
			                      <div class="input-group">
			                      	<input type="radio" name="gender" value="male" id="gender-male"/>
									<label for="gender-male">Male</label>
									<input type="radio" name="gender" value="female" id="gender-female"/>
									<label for="gender-female">Female</label>
			                      </div>
			                    </div>
			                  </div>
			                  </div>
			                  <div class="row">
			                    <h5>Terms and Conditions</h5>
			                    <div class="input-group">
			                      <input type="checkbox" id="terms"/>
			                      <label for="terms">I accept the terms and conditions for signing up to this service, and hereby confirm I have read the privacy policy.</label>
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
				  	<div class="col-4"></div>
				  </div>
				</div>
				<div class="col-md-1 aside"></div>
			</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</body>
</html>

