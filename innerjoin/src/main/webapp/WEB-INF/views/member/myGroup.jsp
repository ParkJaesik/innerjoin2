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
<body class="no-sidebar is-preload">
<div id="page-wrapper">

			<!-- Header -->
			<section id="header">
				<div class="container" id="profile" >
					<nav id="nav">
						<ul>
							<a href="#"><img id="ij-logo" src="${contextPath }/resources/images/innerJoin.png"></a>
							<li class="menu"><a class="icon solid fa-search" href="left-sidebar.html"><span>Search</span></a></li>
							<li class="menu"><a class="icon solid fa-envelope" href="right-sidebar.html"><span>News</span></a></li>
                            <li class="menu"><a class="icon solid fa-home" href="index.html"><span>MyPage</span></a></li>
						</ul>
					</nav>
					<div>

						<form action="">
							<div>
								
								<div>
									<!-- 달력 -->
									<img class="img-circle" src="images/pic01.jpg" style="border: 1px solid slateblue;">
								</div>

								<div>자기소개란</div>
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
						<li><a href="" class="form-button-submit button icon solid mMenu" >내 모임</a></li>
						<li><a href="myNoteForm.ij" class="form-button-submit button icon solid mMenu" >쪽지함</a></li>
						<li><a href="myNewsForm.ij" class="form-button-submit button icon solid mMenu" >알림함</a></li>
						<li><a href="infoUpdateForm.ij" class="form-button-submit button icon solid mMenu" >정보수정</a></li>
					</ul>
				</header> 
			</div>
			
			<!-- Main -->
			<section id="main">
				<div class="container">
					<header class="name-line">
						<h2 class="detail-name" style="display: inline;"> 내 모임 </h2>
						<a href="ginsertForm.ij" class="form-button-submit button icon solid mMenu">모임 생성</a></span>
					</header>
								

					<!-- 2째 줄 시 반복 -->
					<div class="row aln-center">
						<div class="col-4 col-6-medium col-12-small">
							<br>
							<!-- Feature -->
							<section>
								<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
								<header>
									<h3>모임 이름~</h3>
								</header>
								<p> 모임소개</p>
							</section>
						</div>
									
					<!-- 반복 -->
					<!-- ------------------------------------------ -->
						

						<div class="col-4 col-6-medium col-12-small">
							<br>
						<!-- Feature -->
							<section>
								<a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
								<header>
									<h3>모임 이름</h3>
								</header>
								<p>모임 소개</p>
							</section>
		
						</div>
						<div class="col-4 col-6-medium col-12-small">
							<br>
							<!-- Feature -->
							<section>
								<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
								<header>
									<h3>모임 이름</h3>
								</header>
								<p>모임 소개</p>
							</section>
		
						</div>
									
					</div>
								
				</div>
			</section>



			<section id="main">
				<div class="container">
					<header class="name-line">
						<h2 class="detail-name"> 초대받은 모임</h2>
					</header>
						
				<div class="row aln-center">
									
				<!-- 반복 ------------------------------------ -->
					<div class="col-12">
					<!-- Feature -->
						<section>
							<br>
							<br>
							<div class="invite-name row" style="border-bottom: 1px dashed #7777767e">
								<div class="col-4 " style="margin-left: 20px;" >
									<a href="#" class="image featured"> <img src="images/pic01.jpg" alt=""></a>
								</div>
								<div class="col-7">
									<h3>모임 이름~</h3>
									<p>모임소개</p>
									<ul class="invite-list actions" style="float: right;">
										<li><a href="#" class="form-button-submit button icon solid mMenu" >수락</a></li>
										<li><a href="#" class="form-button-submit button icon solid mMenu" style="background-color: rgba(141, 141, 140, 0.836)">거절</a></li>
									</ul>
								</div>
							</div>
												
						</section>
					</div>
				<!-- ------------------------------------------ -->

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