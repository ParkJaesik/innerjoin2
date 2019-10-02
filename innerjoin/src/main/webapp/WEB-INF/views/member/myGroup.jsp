<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />



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
			
			<jsp:include page="myPageHeader.jsp"/>
			
			<!-- Main -->
			<section id="main">
				<div class="container">
					<header class="name-line">
						<h2 class="detail-name" style="display: inline;"> 내 모임 </h2>
						<a href="ginsertForm.ij" class="form-button-submit button icon solid mMenu">모임 생성</a></span>
					</header>
								

					<!-- 2째 줄 시 반복 -->
						
					<div class="row aln-center">
					<c:forEach var="myGroup" item="${list}" varStatus="status">
							<div class="col-4 col-6-medium col-12-small">
								<br>
								<!-- Feature -->
								<section>
									<a href="#" class="image featured">${ myGroup.groupOriginFileName }</a>
									<header>
									<!-- loginUser에 값 있을 시 -->
									<c:if test="${ !empty loginUser }">
										<c:url var="" value="">
											<c:param name="" value="${ myGroup.groupNo }"/>
										</c:url>
										<h3><a href=""> ${ group.groupTitle }</a></h3> 
									</c:if>
									
									</header>
									<p><a href="">${ group.groupInfo }</a></p>
								</section>
							</div>
						<c:if test="${status.index}%3 == 2 ">
							</div>
							<div class="row aln-center">
						</c:if>
						<c:if test="${status.last}">
							</div>
						</c:if>
						</c:forEach>
							
									
						
					
						

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

		

	</body>
</html>