<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/menubar.css"/>

<title>마이페이지</title>
<style>
			#profile{
				padding-top: 150px !important; 
				padding-bottom: 50px !important; 
			}

			.mMenu{
				padding : 5px 20px 5px 20px;
			}

			.name-line{
				border-bottom: 2px solid rgba(151, 150, 150, 0.808);
			}
			.detail-name{
				margin-bottom: 0;
			}
			.sub-menu{
				text-align: center;
			}
			
			.invite-name{
				border-bottom: 1px dashed #7777767e;
			}
			.note{
				margin-top: 40px;
				font-size: 14px;
			}
			.note #send{
				width: 15%;
			}

			.note #note-context{
				width: 70%;
			}
			
		</style>
</head>
<body class="no-sidebar is-preload">
		<div id="page-wrapper">

			<!-- Header -->
			<jsp:include page="myPageHeader.jsp"></jsp:include>
			
			<!-- Main -->
			<section id="main">
				<div class="container">
					<header class="name-line">
						<h2 class="detail-name" style="display: inline;"> 쪽지함 </h2>
					</header>
					
					<div class="note">
						<table class="note">
							<tr>
								<td id="send">보낸 사람</td>
								<td id="note-context">내용</td>
								<td>날짜</td>
							</tr>

						<!-- 받은 쪽지 목록  반복-->
							<tr>
								<td ><a href="">보낸 사람</a></td>
								<td><a href="">내용</a></td>
								<td>날짜</td>
							</tr>
						<!----------------- 반복-->

						</table>
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