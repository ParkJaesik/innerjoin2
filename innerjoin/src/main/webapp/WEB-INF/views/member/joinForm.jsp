<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
		<link rel="stylesheet" href="${contextPath}/resources/css/common/menubar.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/join.css">
	</head>
	<body class="no-sidebar is-preload">
		<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container">

						<!-- Logo -->
							<h1 id="logo"><a href="#">Inner Join</a></h1>
							

						<!-- Nav -->
							

					</div>
				</section>

			<!-- Main -->
				<section id="main">
					<div class="container" style="box-shadow: none;">
						<div id="content">

							<header>
								<h2>회원가입 </h2>
							</header>
									
							<form action="join.ij" method="post" id="joinMember" name="joinMember" onsubmit="return validate();">
								<div>
								<!-- <h4>회원가입</h4> -->
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
									<div>
										<div class="input-group input-group-icon">
											<input type="password" placeholder="(*)Password" name="memberPwd" id="memberPwd" required/>
											<span id="pwdCheck1">&nbsp;</span>
										</div>
									</div>
									<div>
										<div class="input-group input-group-icon">
											<input type="password" placeholder="(*)Password Check" name="memberPwd2" id="memberPwd2" required/>
											<span id="pwdCheck2">&nbsp;</span>
										</div>
									</div>
								</div>
								<header>
									<h2>추가 정보 </h2>
								</header>
								<div>
									<div class="col-half">
										<h4>Date of Birth</h4>
										<div class="input-group">
											<div class="col-third">
												<input type="number" name="memberBirthday1" id="memberBirthday1" placeholder="YYYY" maxlength="4"/>
											</div>
											<div class="col-third">
												<input type="number" name="memberBirthday2" id="memberBirthday2" placeholder="MM" maxlength="2"/>
											</div>
											<div class="col-third">
												<input type="number" name="memberBirthday3" id="memberBirthday3" placeholder="DD" maxlength="2"/>
											</div>
										</div>
									</div>
									<div class="col-half">
										<h4>Gender</h4>
										<div class="input-group">
											<input type="radio" name="gender" value="M" id="gender-male"/>
											<label for="gender-male">Male</label>
											<input type="radio" name="gender" value="F" id="gender-female"/>
											<label for="gender-female">Female</label>
										</div>
									</div>
								</div>
								
								<button id="button" onclick="validate();" style="float: right;"> 가입</button>
								
								<button type="button" onclick="index.jsp" style="background-color: rgba(141, 141, 140, 0.836);">취소</button>
								
							</form>

						</div>
					</div>
				</section>
			
		</div>
		

		<!-- Scripts -->
		<script>
		$(function(){
			
		
			var idCheck = false;
			var nameCheck = false;
			var pwdCheck = false;
			var pwdCheck2 = false;
			// 정규식 검사
			/* var idRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; */
			
				
			/* 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 */
			var pwdRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var memberId = $.trim($("#memberId").val());
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
							if(result == "true"){
								$("#nameCheck").css({"color":"green","font-size":"13px"});
								$("#nameCheck").html("사용가능한 닉네임입니다.");
								nameCheck=true;
							}else{
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
								
							}else{
								$("#emailCheck").css({"color":"#df5b4dcb", "font-size":"13px"});
								$("#emailCheck").html("이미 사용 중인 Email입니다.");
								$("#memberId").focus();
							}
						}
					});
				
				});
				
				
				
				
			});
			
			
			
		</script>
			<script src="${contextPath}/resources/js/jquery.min.js"></script>
			<script src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
			<script src="${contextPath}/resources/js/browser.min.js"></script>
			<script src="${contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${contextPath}/resources/js/util.js"></script>
			<script src="${contextPath}/resources/js/main.js"></script>

	</body>
</html>