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
				  	<div class="col-4">
				  	
		                <div class="margin" style="margin: 50px;"></div>
				  		<form action="infoUpdate.ij" method="post" onsubmit="return validate();" id="infoForm">
			             
			                <div class="row">
			                    <h3>정보 수정</h3>
			                    <div class="input-group input-group-icon">
									<input type="email" name="memberId" id="memberId" value="${ loginUser.memberId }" readonly="readonly"/>
									&nbsp;<span></span>
								</div>
								<br>
								<div class="input-group input-group-icon">
									<input type="text" value="${ loginUser.memberName }" id="memberName" name="memberName"/>
									<c:if test="${fn:trim(memberName.val())== null }">
									<input type="hidden" name="memberName" id="memberName" value="${ loginUser.memberName }">
									</c:if>
									&nbsp;<span style="text-aling:center;" id="nameCheck">&nbsp;</span>
								</div>
								<div class="input-group input-group-icon">
									<input type="password" placeholder="Password" id="memberPwd" name="memberPwd"/>
									
									&nbsp;<span id="pwdCheck1">&nbsp;</span>
								</div>
								<div class="input-group input-group-icon">
									<input type="password" placeholder="Password Check" id="memberPwd2" name="memberPwd2"/>
									
									&nbsp;<span id="pwdCheck2">&nbsp;</span>
								</div>
								
								
			                  <div class="row">
			                  	<h3 class="info-title">추가 정보</h3>
			                  	<br>
			                  	<div class="row">
			                    <div class="col-half">
			                      	<h5>Date of Birth</h5>
			                      	<div class="input-group">
			                      	<c:choose>
				                      	<c:when test="${ empty loginUser.memberBirthday }">
				                      	<div class="col-third">
											<input type="text" placeholder="YYYY" maxlength="4" id="birthday1" name="birthday1"/>
										</div>
										<div class="col-third">
											<input type="text" placeholder="MM" maxlength="2" name="birthday2" id="birthday2"/>
										</div>
										<div class="col-third">
											<input type="text" placeholder="DD" maxlength="2" name="birthday3" id="birthday3"/>
										</div>
										</c:when>
			                      	
			                      		<c:when test="${ !empty loginUser.memberBirthday }">
				                        <c:forTokens var="birthday" items="${ loginUser.memberBirthday }" delims="/" varStatus="status">
				                        <c:if test="${ status.index eq 0 }">
				                        <div class="col-third">
											<input type="text" name="birthday1" id="birthday1" value="${ birthday }" maxlength="4" readonly="readonly"/>
										</div>
										</c:if>
										<c:if test="${ status.index eq 1 }">
										<div class="col-third">
											<input type="text" name="birthday2" id="birthday2" value="${ birthday }" maxlength="2" readonly="readonly"/>
										</div>
										</c:if>
										<c:if test="${ status.index eq 2}">
										<div class="col-third">
											<input type="text" name="birthday3" id="birthday3" value="${ birthday }" maxlength="2" readonly="readonly"/>
										</div>
										</c:if>
										</c:forTokens>
										</c:when>
									</c:choose>
			                      </div>
			                    </div>
			                    <div class="col-half">
			                      <h5>Gender</h5>
			                      
			                      <!-- 처리하기 -->
			                      <div class="input-group">
			                      	<%-- <c:if test="${ loginUser.memberGender != ''}">
			                      	<input type="radio" name="memberGender" value="M" id="gender-male"
			                      	<% if("M".equals("${loginUser.memberGender}")){%>checked<%}%>/>
									<label for="gender-male">Male</label>
									<input type="radio" name="memberGender" value="F" id="gender-female"
									<% if("F".equals("${loginUser.memberGender}")){%>checked<%}%>/>
									<label for="gender-female">Female</label>
			                      	</c:if>
			                      	<c:if test="${ loginUser.memberGender == ''}"> --%>
			                      	<input type="radio" name="memberGender" value="M" id="gender-male"/>
									<label for="gender-male">Male</label>
									<input type="radio" name="memberGender" value="F" id="gender-female"/>
									<label for="gender-female">Female</label>
			                      	<%-- </c:if> --%>
			                    
			                      </div>
			                    </div>
			                  </div>
			                  </div>
			                 
			              	</div>
			              	<button id="submit-btn" style="float: right;" onclick="validate();"> 수정</button>
							<button style="background-color: rgba(141, 141, 140, 0.836);">취소</button>
							<c:url var="mLeave" value="mLeave.ij">
							<c:param name="memberId" value="${ loginUser.memberId }"/>
							</c:url>
							<a href="${ mLeave }"> 탈퇴하기</a>
			            </form>
				  	</div>
				  	<div class="col-4"></div>
				  </div>
				</div>
				<div class="col-md-1 aside"></div>
			</div>
	</div>
	<script>
	$(function(){
		
		var nameCheck = false;
		var pwdCheck = false;
		var pwdCheck2 = false;
		// 정규식 검사
		/* var idRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; */
		
			
		/* 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 */
		var pwdRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var memberName = $.trim($("#memberName").val());
		var memberPwd = $.trim($("#memberPwd").val());
		var memberPwd2 = $.trim($("#memberPWd2").val());
		
		// 닉네임 중복/형식 검사 
		$("#memberName").on("input", function(){
			var memberName = $.trim($("#memberName").val());
			var nameRegExp = /^[0-9a-zA-z가-힣]{3,15}$/;
			if(!nameRegExp.test(memberName)){
				$("#nameCheck").css({"color":"#df5b4dcb","font-size":"13px"});
				$("#nameCheck").html("문자,숫자 3~15자리 이내로 입력해주세요.");
				idCheck = false;
			}else{
				$.ajax({
					url: "dupName.ij",
					type: "POST",
					data : {name:memberName},
					success:function(result){
						if(result == true){
							$("#nameCheck").css({"color":"green","font-size":"13px"});
							$("#nameCheck").html("사용가능한 닉네임입니다.");
							nameCheck=true;
						}else{
							$("#nameCheck").css({"color":"#df5b4dcb","font-size":"13px"});
							$("#nameCheck").html("이미사용 중인 닉네임입니다.");
							nameCheck = false;
						}
					}
				});
					
			}
		});
		
		// 비밀번호 정규식 검사
		$("#memberPwd").on("input", function(){
			var memberPwd = $.trim($("#memberPwd").val());
			if(!pwdRegExp.test(memberPwd)){
				$("#pwdCheck1").css({"color":"#df5b4dcb", "font-size":"13px"});
				$("#pwdCheck1").html("특수문자, 문자, 숫자 포함 8~15 자리로 입력해주세요.");
				pwdCheck = false;
			}else{
				$("#pwdCheck1").html(" ");
				pwdCheck = true;
			}
					
				
		});
			
		$("#memberPwd, #memberPwd2").on("input", function(){
			memberPwd = $.trim($("#memberPwd").val());
			var memberPwd2 = $.trim($("#memberPwd2").val());
			if(pwdCheck==true){
				if(memberPwd == memberPwd2){
					$("#pwdCheck2").css({"color":"green", "font-size":"13px"});
					$("#pwdCheck2").html("비밀번호 일치");
					pwdCheck2 = true;
				}else{
					$("#pwdCheck2").css({"color":"#df5b4dcb", "font-size":"13px"});
					$("#pwdCheck2").html("비밀번호 불일치");
					pwdCheck2 = false;
				}	
			}
		});
		
		if("${loginUser.memberGender}" == 'F'){
			$("#gender-female").attr("checked", true).attr("disabled", true);
			$("#gender-male").attr("checked", false).attr("disabled", true);
		} else{
			$("#gender-male").attr("checked", true);
			$("#gender-female").attr("checked", false).attr("disabled", true);
		}
		
		
	
	});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</body>
</html>

