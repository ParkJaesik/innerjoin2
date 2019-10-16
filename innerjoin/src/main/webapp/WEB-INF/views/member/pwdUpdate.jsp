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
				  		<form action="updatePwd.ij" method="post" id="updatePwd" name="updatePwd">
			              
			                <div class="row">
			                    <h3>비밀번호 변경</h3>
			                    <div class="input-group input-group-icon">
										<input type="email" placeholder="(*)Email" name="memberId" id="memberId" required/>
										<span aling="center" id="emailCheck">&nbsp;</span>
										<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
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
									
												
			                
			              	</div>
			              	<button type="button" id="button" onclick="return submitCheck();" style="float: right;">비밀번호 변경</button>

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
	var pwdCheck = false;
	var pwdCheck2 = false;
		$(function(){
			
		
		
			// 정규식 검사
			/* var idRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; */
			
				
			/* 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 */
			var pwdRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var memberId = $.trim($("#memberId").val());
			
			var memberPwd = $.trim($("#memberPwd").val());
			var memberPwd2 = $.trim($("#memberPWd2").val());
			
			
			
			
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
							
								idCheck = false;
							}else{
								
								$("#emailCheck").html(" ");
								idCheck = true;
								
								
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
			
			alert("비밀번호 수정완료! 다시  로그인 해주세요!");
			$("#updatePwd").submit();
			
			
		}
			
		</script>
			
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</body>
</html>




