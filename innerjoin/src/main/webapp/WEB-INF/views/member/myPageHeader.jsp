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
			
		</style>
</head>
<body>


			<!-- Header -->
			<section id="header">
				<div class="container" id="profile" >
					
					<nav id="nav">
						<ul>
							<a href="#"><img id="ij-logo" src="${contextPath }/resources/images/innerJoin.png"></a>
							<li class="menu"><a class="icon solid fa-search" href="left-sidebar.html"><span>Search</span></a></li>
							<li class="menu"><a class="icon solid fa-envelope" href="myNewsForm.ij"><span>News</span></a></li>
                            <li class="menu"><a class="icon solid fa-home" href=""><span>MyPage</span></a></li>
						</ul>
					</nav> 
					<div>

						<form action="">
							<div>
								
								<div>
									<!-- 달력 -->
									<img class="img-circle" src="images/pic01.jpg" style="border: 1px solid slateblue;">
								</div>

								<div>
								
								</div>
								<ul class="actions">
									<li><a href="profileUpdateForm.ij" class="button icon solid mMenu">프로필 수정</a></li>
									<!-- 로그인 회원과 정보 다를 때  -->
									<li><a href="#" class="button icon solid mMenu">신고하기</a></li>
								</ul>
							</div>
						</form>
			
						<div>
							캘린더
						</div>
							
					</div>

				

				</div>
			</section>
			<div class="container">
				<header>
				
					<ul class="sub-menu actions">
						<li><a href="" class="form-button-submit button icon solid mMenu" dis>내 모임</a></li>
						<li><a href="myNoteForm.ij" class="form-button-submit button icon solid mMenu" >쪽지함</a></li>
						<li><a href="myNewsForm.ij" class="form-button-submit button icon solid mMenu" >알림함</a></li>
						<li><a href="infoUpdateForm.ij" class="form-button-submit button icon solid mMenu" >정보수정</a></li>
					</ul>
				</header> 
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