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
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css"/>
<title>마이페이지</title>
<style type="text/css">
	.cancel{
		bottom: 0.7em;
		height: 2.8em;
		font-weight: 400 !important;
		float: left;
		margin-left: 0;
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
				  	<div class="col-4">
				  	
		                <div class="margin" style="margin: 50px;"></div>
				  		<form action="join.ij" method="post" id="joinMember" name="joinMember">
			              
			                <div class="row">
			                    <h3>회원가입</h3>
			                    <div class="input-group input-group-icon">
										<input type="email" placeholder="(*)Email" name="memberId" id="memberId" required/>
										<span aling="center" id="emailCheck">&nbsp;</span>
										<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
									</div>
									<div class="input-group input-group-icon">
										<input type="text" placeholder="(*)NickName" name="memberName" id="memberName" required/>
										<span style="text-aling:center;" id="nameCheck">&nbsp;</span>
										<input type="hidden" name="nameDuplicateCheck" id="nameDuplicateCheck" value="0">
									</div>
									
									<div class="input-group input-group-icon">
										<input type="password" placeholder="(*)Password" name="memberPwd" id="memberPwd" required/>
										<span id="pwdCheck1">&nbsp;</span>
									</div>
									<div class="input-group input-group-icon">
										<input type="password" placeholder="(*)Password Check" name="memberPwd2" id="memberPwd2" required/>
										<span id="pwdCheck2">&nbsp;</span>
									</div>
			                    	
									<br>
									
								
								
			                  <div class="row">
			                  	<h3 class="info-title">추가 정보</h3>
			                  	<br>
			                  	<div class="row">
			                    <div class="col-half">
			                      	<h5>Date of Birth</h5>
			                      	<div class="input-group">
											<div class="col-third">
												<input type="text" name="birthday1" id="birthday1" placeholder="YYYY" maxlength="4"/>
											</div>
											<div class="col-third">
												<input type="text" name="birthday2" id="birthday2" placeholder="MM" maxlength="2"/>
											</div>
											<div class="col-third">
												<input type="text" name="birthday3" id="birthday3" placeholder="DD" maxlength="2"/>
											</div>
										</div>
			                    </div>
			                    <div class="col-half">
			                      	<h5>Gender</h5>
			                      	<div class="input-group">
										<input type="radio" name="memberGender" value="M" id="gender-male"/>
										<label for="gender-male">Male</label>
										<input type="radio" name="memberGender" value="F" id="gender-female"/>
										<label for="gender-female">Female</label>
									</div>
									
			                    </div>
			                  </div>
			                  </div>
			                  <!-- <div class="row">
			                    <h5>Terms and Conditions</h5>
			                    <div class="input-group">
			                      <input type="checkbox" id="terms"/>
			                      <label for="terms">I accept the terms and conditions for signing up to this service, and hereby confirm I have read the privacy policy.</label>
			                  	</div>
			                	</div> -->
			              	</div>
			              	<button type="button" id="button" onclick="return submitCheck();" style="float: right;"> 가입</button>
							<button type="button" onclick="index.jsp" class="btn cancel" style="background-color: rgba(141, 141, 140, 0.836); padding: 11.2px 16px 11.2px 16px;">취소</button>
			              							
						
			            </form>
				  	</div>
				  	<div class="col-4"></div>
				  </div>
				</div>
				<div class="col-md-1 aside"></div>
			</div>
	</div>
	
	<script>
	
	var idCheck = false;
	var nameCheck = false;
	var pwdCheck = false;
	var pwdCheck2 = false;
		$(function(){
			
		
		
			// 정규식 검사
			/* var idRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; */
			
				
			/* 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 */
			var pwdRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var memberId = $.trim($("#memberId").val());
			var memberName = $.trim($("#memberName").val());
			var memberPwd = $.trim($("#memberPwd").val());
			var memberPwd2 = $.trim($("#memberPWd2").val());
				
			$("#memberId").on("input", function(){
				var memberId = $.trim($("#memberId").val());
				$.ajax({
					url: "dupId.ij",
					type: "POST",
					data: {id:memberId},
					success:function(result){
						if(result == "true"){
							$("#emailCheck").css({"color":"green", "font-size":"13px"});
							$("#emailCheck").html("사용 가능한 이메일입니다.");
							idCheck = true;	
						}else{
							$("#emailCheck").css({"color":"#df5b4dcb", "font-size":"13px"});
							$("#emailCheck").html("이미 사용 중인 Email입니다.");
							$("#memberId").focus();
							idCheck= false;
						}
					}
				});
			
			});
			
			// 닉네임 중복/형식 검사  --> 한번더 살펴보기
			$("#memberName").on("input", function(){
				var memberName = $.trim($("#memberName").val());
				var nameRegExp = /^[0-9a-zA-z가-힣]{3,15}$/;
				if(!nameRegExp.test(memberName)){
					$("#nameCheck").css({"color":"#df5b4dcb","font-size":"13px"});
					$("#nameCheck").html("문자,숫자 3~15자리 이내로 입력해주세요.");
					nameCheck = false;
				}else{
					$.ajax({
						url: "dupName.ij",
						type: "POST",
						data : {memberName:memberName},
						success:function(result){
							console.log(result);
							if(result){
								$("#nameCheck").css({"color":"green","font-size":"13px"});
								$("#nameCheck").html("사용가능한 닉네임입니다.");
								nameCheck= true;
								
							}else{
								$("#nameCheck").css({"color":"#df5b4dcb","font-size":"13px"});
								$("#nameCheck").html("이미 사용중인 닉네임입니다.");
								nameCheck= false;
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
				
				
				
				
				// 아이디(email) 중복검사
				$("#memberId").on("input", function(){
					var memberId = $.trim($("#memberId").val());
					$.ajax({
						url: "dupId.ij",
						type: "POST",
						data: {id:memberId},
						success:function(result){
							if(result == "true"){
								$("#emailCheck").css({"color":"green", "font-size":"13px"});
								$("#emailCheck").html("사용 가능한 이메일입니다.");
								idCheck = true;
							}else{
								$("#emailCheck").css({"color":"#df5b4dcb", "font-size":"13px"});
								$("#emailCheck").html("이미 사용 중인 Email입니다.");
								$("#memberId").focus();
								idCheck = false;
							}
						}
					});
				
				});
				
				
				
				
			
			
		});	
		
		function submitCheck(){
			
			
			if(idCheck == false){
				
				alert("아이디를 확인해주세요");
				$("#memberId").focus();
				return false;
			}
			
			if(nameCheck == false){
				alert("닉네임을 확인해주세요");
				$("#memberName").focus();
				return false;	
			
			}
			
			if(pwdCheck == false){
				alert("비밀번호를 확인해주세요");
				$("#memberPwd").focus();
				return false;	
			}
			if(pwdCheck2 == false){
				alert("비밀번호를 확인해주세요");
				$("#memberPwd").focus();
				return false;	
			}
			
			
			$("#joinMember").submit();
			
			
		}
			
		</script>
			
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</body>
</html>




