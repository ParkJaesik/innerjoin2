<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
	 .profileP img{
		width: 13em;
		height: 13em;
		border-radius: 150px;
	}
	
	textarea {
	width: 100%;
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
				  	<div class="col-4"></div>
				  	<div class="col-md-4" align="center">
		            	<form action="profileUpdate.ij" method="post" enctype="Multipart/form-data">
		            		<input type="hidden" name="memberId" value="${loginUser.memberId }">
		            		<div class="margin" style="margin: 50px;"></div>
							<div class="profileP" >
							<c:if test="${ !empty member.memberProPath }">
								<input type="hidden" value="${member.memberProPath }" name="memberProPath">
		                    	<img class="img-circle" src="${contextPath}/resources/images/member/${member.memberProPath }">
							</c:if>
							<div class="margin" style="margin: 30px;"></div>
							<input type="file" name="reloadFile">
		                    	
	    	                </div>
	        	            <br>
	            	        <div class="row aln-center">
								<c:set var="memberIntroduce" value="${fn:replace(member.memberIntroduce, '<br>','') }"/>
								<c:if test="${ member.memberIntroduce != null }">
								<textarea name="memberIntroduce" id="memberIntroduce" cols="30" rows="10" style="resize: none;">${ member.memberIntroduce }</textarea>
								</c:if>
								<c:if test="${ member.memberIntroduce eq null }">
								<textarea name="memberIntroduce" id="memberIntroduce" cols="30" rows="10" style="resize: none;" placeholder="간단한 자기 소개를 입력해 주세요."></textarea>
								</c:if>
	                	    <br>
							<div class="col-half">
			                      <h5>자기소개 공개여부</h5>
			                      <div class="input-group">
									<input type="radio" name="memberOpenStatus" value="Y" id="gender-male"/>
									<label for="gender-male">공개</label>
									<input type="radio" name="memberOpenStatus" value="N" id="gender-female"/>
									<label for="gender-female">비공개</label>
								</div>
							</div>
							<div>
	                    	<a href="#" class="button icon solid mMenu" id="goBack">취소</a>
	                    	<button>수정</button>
	                    	</div>
							
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

















<!-- #profile{
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
			} -->
			
