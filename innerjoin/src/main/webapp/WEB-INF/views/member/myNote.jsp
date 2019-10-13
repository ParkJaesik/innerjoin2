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
<style>
.nList{
	 	width: 100% !important;
	}
	table {
		width: 100%;
		margin-bottom: 2em;
		border-spacing: 0;
	}
	table tr{
		border-bottom: 1px dotted #a2a2a2;
	}

	table td {
		padding: 0.75em 1em 0.75em 1em;
	}
	.send{
		width: 13em;
	}
	.noteDate{
		width: 10em;
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
				  <jsp:include page="/WEB-INF/views/member/myPageHeaber.jsp"/>
				 
				  <div class="row">
				  	<div class="col-1"></div>
				  	<div class="col-10">
		                <div class="margin" style="margin: 50px;"></div>
				  	<div class="mgTitle">
				           		<h3>쪽지함</h3>
			                </div>
		                <div class="nTable">
							<table class="nList">
								<tr>
									<td class="send">보낸 사람</td>
									<td class="note-context">내용</td>
									<td class="noteDate">날짜</td>
								</tr>
	
							<!-- 받은 쪽지 목록  반복-->
								<tr>
									<td><a href="">보낸 사람</a></td>
									<td><a href="">내용</a></td>
									<td>날짜</td>
								</tr>
							<!----------------- 반복-->
	
							</table>
						</div>
				  		
				  	</div>
				  	<div class="col-1"></div>
				  </div>
				</div>
				<div class="col-md-1 aside"></div>
			</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</body>
</html>



