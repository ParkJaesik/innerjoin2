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
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css">





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

.cancel{
float: left;}
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
							
							<br>
			                      <h5 style="float: left;">공개여부</h5>
			                      <div class="input-group">
									<input type="radio" name="memberOpenStatus" value="Y" id="gender-male"/>
									<label for="gender-male">공개</label>
									<input type="radio" name="memberOpenStatus" value="N" id="gender-female"/>
									<label for="gender-female">비공개</label>
								</div>
							</div>
							<div>
	                    	<a href="javascript:history.back(-1)" class="button icon solid mMenu cancel" id="goBack">취소</a>
	          				<button id="iSubmit" style="float: right;">수정</button>
	                    	</div>
							
	                   </form>
                    </div>
				  	<div class="col-4"></div>
				  </div>
				</div>
				<div class="col-md-1 aside"></div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		
		
		if("${member.memberOpenStatus}" == 'N'){
			$("#gender-female").attr("checked", true);
			$("#gender-male").attr("checked", false);
		} 
		
		if("${member.memberOpenStatus}" == 'Y'){
			$("#gender-male").attr("checked", true);
			$("#gender-female").attr("checked", false);
		}
		
		
	
	});
	
	$("#iSubmit").on("click"), function() {
		var proPath = ${ member.memberProPath };
		var mId = ${ member.memberId};
		var mIntro = ${ member.memberIntroduce };
		var gender = $("input[type = radio ]").val();
		
		$.ajax({
			url: "profileUpdate.ij",
			data : {proPath : proPath, mIntor : mIntro, mId : mId, gender : gender},
			type : "post",
			success : function(member){
				if()
			}
		});
		}

	</body>
</html>

















