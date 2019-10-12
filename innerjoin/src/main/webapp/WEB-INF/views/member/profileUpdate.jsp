<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/menubar.css"/>


<title>프로필 수정</title>
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
			.inputFile{
				margin-top: 2em;
				margin-bottom: 2em;
			}
			#goBack{
				background-color: rgba(141, 141, 140, 0.836);
			}
			.updateProfile{
				height: 2.5em;
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
							<a href="#"><img id="ij-logo" src="${contextPath}/resources/images/innerJoin.png"></a>
							<li class="menu"><a class="icon solid fa-search" href="#"><span>Search</span></a></li>
							<li class="menu"><a class="icon solid fa-envelope" href="#"><span>News</span></a></li>
                            <li class="menu"><a class="icon solid fa-home" href="myGroupForm.ij"><span>MyPage</span></a></li>
						</ul>
					</nav>
					<div>

						<form action="">
							<div>
								
								<div>
									<img class="img-circle" src="${contextpath}/resources/images/member/${loginUser.memberProPath }" style="border: 1px solid slateblue;">
								</div>
								<div class="inputFile">
									<input type="file">
								</div>
								<div class="row aln-center">
									<div class="col-5 col-12-small">
										<div>
											<textarea name="" id="" cols="30" rows="10" style="resize: none;" placeholder="간단한 자기소개를 입력해주세요."></textarea>
										</div>
									</div>
								</div>
								
								<ul class="actions">
									<li><a href="#" class="button icon solid mMenu" id="goBack">취소</a></li>
									<li><a href="#" class="form-button-submit button icon solid mMenu">수정</a></li>
								</ul>
							</div>
						</form>
			
							
					</div>

				<!-- 메뉴바 -->

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