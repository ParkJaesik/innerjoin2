<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/join.css">
 <style type="text/css">
  
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
				<div class="search-header row">

                            <a href="#" class="searchOp">유저검색</a>
                            <a href="#" class="searchOp">모임검색</a>
                            
                            <div class="search-section container" align="center">
                                
                                <form action="" method="get">
                                    <input type="search" name="userSearch" id="userSearch" style="margin-top: 2em; padding: 1em;">
                                    <button><img/>검색</button>
                                </form>    
                            </div>
                        </div>
				
				
				<section id="content">
					<div>
						<div class="mgTitle">
							<h3>회원 검색</h3>
						</div>
						<c:forEach var="user" items="${ list }" varStatus="status">
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
						    <img src="${contextPath}/resources/images/member/${user.memberProPath}"></div>
							
								<div class="col-8">
									<c:url var="goGorup" value="goGroupPage.ij"> <!-- 수정 -->
										<!-- 나중에 맞는 값 넣기 -->
										<c:param name="memberId" value="${ user.memberId }" />
									</c:url>
									<h5><a href="${ goGroup }">${ user.memberName }</a></h5> <!-- 수정 -->
									<br>
									<p><a href="${ goGroup }">${ user.memberIntroduce }</a></p> <!-- 수정 -->
									<c:url var="invDeny" value="invDeny.ij"> <!-- 수정 -->
										<c:param name="gNo" value="${ invite.gNo }" /> <!--  신고시 수정 -->
									</c:url>
									<c:url var="invAccept" value="invAccept.ij"><!-- 초대시수정 -->
										<c:param name="gNo" value="${ invite.gNo }" /> <!-- 초대 시  수정 -->
									</c:url>
								<c:if test="${ !empty loginUser }">
									<a href="${ invDeny }" class="btton report">신고</a>  <!-- 신고 시 수정 -->
									<a href="${ invAccept }" class="btton">초대</a> <!-- 초대 시 수정 -->
								</c:if>
								</div>
					</div>
					</c:forEach>
			</div>
			</section>
			
			<div style="margin: 30px;"></div>
			<div>
			<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="blist.kh">
					<c:param name="page" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
					
				<c:if test="${ p ne currentPage }">
					<c:url var="pagination" value="blist.kh">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.kh">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</div>
		
				
			</div>
			<div class="col-md-1 aside">
				
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>