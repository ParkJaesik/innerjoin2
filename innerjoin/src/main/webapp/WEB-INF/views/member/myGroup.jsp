<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<title>Insert title here</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
<title>마이페이지</title>
<style type="text/css">
/*  *{
	 	 border: 1px solid black;
	 } */
	 
	 a {
	 	text-decoration: none;
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
				
				<jsp:include page="/WEB-INF/views/member/myPageHeaber.jsp" />



				<section id="content">
					<div class="myG-Info">
						<div class="mgTitle">
							<h3 id="mg">내 모임</h3>
							<a href="ginsertForm.ij" class="createG">모임생성 <span> ▶</span></a>
						</div>
						<div class="row">
							<c:forEach var="myGroup" items="${list}" varStatus="status">
								<div class="col-md-4">
									<br>
									<div class="basic-padding">
										<div class="image-hover">
											<img src="${contextPath}/resources/images/member/${myGroup.filePath }"> 
											<!-- 그룹 썸네일 이미지 -->
											<div class="overlay">
												<h2>${ myGroup.gName }</h2>
												<c:if test="${ !empty loginUser }">
													<%-- <c:url var="goGorup" value="goGroupPage.ij">
														<!-- 나중에 맞는 값 넣기/ 모임페이지 컨트롤러 -->
														<c:param name="gNo" value="${ myGroup.gNo }" />
													</c:url> --%>
													<a href="goGroupPage.ij?gNo=${ myGroup.gNo }" class="btn-hover">Show More</a>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<c:if test="${ status.index }%3 == 2">
									<div class="row">
								</c:if>
								<c:if test="${ status.last }">
						</div>
						</c:if>
						</c:forEach>

					</div>
				</section>
				<div class="margin" style="margin: 30px;"></div>
				<section id="content">
					<div>
						<div class="mgTitle">
							<h3>초대받은 모임</h3>
						</div>
						<c:forEach var="invite" items="${ invList }" varStatus="status">
							<br>
							<c:choose>
								<c:when test="${ !status.last }">
									<div class="row invite" style="border-bottom: 1px dotted #a2a2a2;">
								</c:when>
								<c:when test="${ status.last }">
									<div class="row invite">
								</c:when>
							</c:choose>
							<div class="col-4" style="width: 100%;">
							<img src="${contextPath}/resources/images/member/${ invite.filePath }"> </div>
							<c:if test="${ !empty loginUser }">
								<div class="col-8">
									<c:url var="goGorup" value="goGroupPage.ij">
										<!-- 나중에 맞는 값 넣기 -->
										<c:param name="gNo" value="${ invite.gNo }" />
									</c:url>
									<h5><a href="${ goGroup }">${ invite.gName }</a></h5>
									<br>
									<p><a href="${ goGroup }">${ invite.gInfo }</a></p>
									<c:url var="invDeny" value="invDeny.ij">
										<c:param name="gNo" value="${ invite.gNo }" />
									</c:url>
									<c:url var="invAccept" value="invAccept.ij">
										<c:param name="gNo" value="${ invite.gNo }" />
									</c:url>
									<a href="${ invDeny }" class="btn cancel">거절</a> 
									<a href="${ invAccept }" class="btn">수락</a>
								</div>
							</c:if>
					</div>
					</c:forEach>
			</div>
			</section>

			<div class="margin" style="margin: 30px;"></div>
			<section id="content">
				<div>
					<div class="mgTitle">
						<h3>가입대기 모임</h3>
					</div>
					<c:forEach var="wait" items="${ waitList }" varStatus="status">
						<br>
						<c:choose>
							<c:when test="${ !status.last }">
								<div class="row invite"
									style="border-bottom: 1px dotted #a2a2a2;">
							</c:when>
							<c:when test="${ status.last }">
								<div class="row invite">
							</c:when>
						</c:choose>
						<img src="${contextPath}/resources/images/member/${ wait.filePath }">
						<c:if test="${ !empty loginUser }">
							<div class="col-8">
								<c:url var="goGorup" value="goGroupPage.ij">
									<!-- 나중에 맞는 값 넣기/ 모임페이지 컨트롤러 -->
									<c:param name="gNo" value="${ wait.gNo }" />
								</c:url>
								<h5><a href="${ goGroup }">${ wait.gName }</a></h5>
								<br>
								<p><a href="${ goGroup }">${ wait.gInfo }</a></p>
								<c:url var="waitCancel" value="waitCancel.ij">
									<c:param name="gNo" value="${ wait.gNo }" />
								</c:url>
								<a href="${ waitCancel }" class="btn cancel">신청 취소</a>
							</div>
						</c:if>
				</div>
				</c:forEach>
		</div>
		</section>
	</div>
	<div class="col-md-1 aside"></div>
	</div>
	</div>
	<div class="margin" style="margin: 50px;"></div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>