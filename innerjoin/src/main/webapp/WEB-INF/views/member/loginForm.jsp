<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="clientId" value="474309519585-p4jv3ahraoefv61aaou6s7idiruq4rra.apps.googleusercontent.com" scope="application" />
<!DOCTYPE HTML>
<html>
	<head>
	
		<script src="https://apis.google.com/js/platform.js" async defer></script>
		
		<meta name="google-signin-client_id" content="${clientId }">
		<meta name="google-signin-scope" content="profile email">
		
		<title>login</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
    
    <script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/join.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css">
		
				
		<style type="text/css">
			#customBtn {
				display: inline-block;
				margin-top: 15px;
				background: #4285F4;
				color: white;
				width: 100%;
				height: 50px;
				border-radius: 5px;
				border: thin solid #4285F4;
				box-shadow: 1px 1px 1px grey;
				white-space: nowrap;
				padding: 0;
				position: relative;
			}
			#customBtn:hover {
				cursor: pointer;
			}
			span.icon {
				/*  background: white; */
				display: inline-block;
				position: absolute;
				left: 0;
				vertical-align: middle;
				width: 48px;
				height: 48px;
				padding: 0;
				margin: 0;
			}
			span.icon img{
				width: 100%;
				height: 100%;
			}
			span.buttonText {
				display: inline-block;
				width: 100%;
				height: 100%;
				padding-top: 10px;
				text-align: center;
				font-size: 14px;
				font-weight: bold;
				/* Use the Roboto font that is loaded in the <head> */
				font-family: 'Roboto', sans-serif;
				margin: 0 auto;
			}
		</style>
		
		<script>
			var googleUser = {};
			var startApp = function() {
				gapi.load('auth2', function(){
					// Retrieve the singleton for the GoogleAuth library and set up the client.
					auth2 = gapi.auth2.init({
						client_id: '${clientId }',
						cookiepolicy: 'single_host_origin',
						// Request scopes in addition to 'profile' and 'email'
						scope: 'profile email'
					});
					attachSignin(document.getElementById('customBtn'));
				});
			};

			function attachSignin(element) {
				console.log(element.id);
				auth2.attachClickHandler(element, {},
					function(googleUser) {
						var profile = googleUser.getBasicProfile();
						var memberId = profile.getEmail();
						var memberName = profile.getName();
						var memberProPath = profile.getImageUrl();
						
						
						// The ID token you need to pass to your backend:
						var id_token = googleUser.getAuthResponse().id_token;
						
						var loginWay = googleJoinedChk(memberId);
						console.log("loginWay : " +loginWay);
						if(loginWay == undefined) loginWay = "";
						if(loginWay=='E') {
							alertMessage("일반 회원으로 가입된 메일입니다.");
							$("#memberId").focus();
							return false;
						}
						console.log("수정 " + loginWay);
						var params = {"memberId": memberId, "memberName":memberName, 
										"memberProPath": memberProPath, "loginWay":loginWay};
						
						console.log(params);
						postGoogleInfo(params);
					},
					function(error) {
						alert(JSON.stringify(error, undefined, 2));
						console.log("에러");
					}
				 );
			}
			
			function postGoogleInfo(params) {
			    
			    var form = document.createElement("form");
			    form.setAttribute("method", 'post');
			    form.setAttribute("action", 'googleLogin.ij');
			 
			    //히든으로 값을 주입시킨다.
			    for(var key in params) {
			        var hiddenField = document.createElement("input");
			        hiddenField.setAttribute("type", "hidden");
			        hiddenField.setAttribute("name", key);
			        hiddenField.setAttribute("value", params[key]);
			 
			        form.appendChild(hiddenField);
			    }
			 
			    document.body.appendChild(form);
				form.submit();
			}
			
			function googleJoinedChk(memberId) {
				var result;
				$.ajax({
					url: "googleJoinedChk.ij",
					data: {memberId: memberId},
					async: false, 
					success: function(res) {
						console.log("회원가입여부: " + res);
						result = res;
					},
					error: function(err) {
						console.log(err);
					}
				});
				return result;
			}
			
			function alertMessage(msg) {
				Swal.fire({
					text: msg,
					width: '20rem'
				});
			}

		</script>
		
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
				  		<form action="login.ij" method="post">
							<div class="input-group input-group-icon">
								<input type="text" placeholder="Email Adress" name="memberId"/>
								<br>
								<!-- <span aling="center">출력메세지</span> -->

							</div>
							<div class="input-group input-group-icon">
								<input type="password" placeholder="Password" name="memberPwd"/>
								<c:if test="${ !empty errorMsg }">
								<span  aling="center" style="color: #df5849;">${ errorMsg }</span>
								</c:if>
							</div>
							<button id="submit-btn" style="float: right; padding: 15px 20px 15px 20px; width: 100%;" >
								로그인
							</button>    
        
						</form>
               <div id="gSignInWrapper">
                <div id="customBtn" class="customGPlusSignIn">
                  <span class="icon">
                    <img src='resources/images/btn_google_icon.svg'>
                  </span>
                  <span class="buttonText" >구글로 로그인</span>
                </div>
              </div>
						<div>
							<a href="joinForm.ij" style="margin-left: 50px; margin-top: 10px; float: left; ">회원가입</a>
							<a href="findPwdForm.ij" style="margin-right: 50px; margin-top: 10px; float: right;">비밀번호 찾기</a>
						</div>
					</div>		
			
				  	</div>
				  	<div class="col-4"></div>
				  </div>
				</div>
				<div class="col-md-1 aside"></div>
			</div>
	</div>
	
	</div>
	<div class="margin" style="margin: 50px;"></div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
      
         
     <script>

       startApp();
     
     </script>

		<!-- Scripts -->
		<script src="${contextPath}/resources/js/jquery.min.js"></script>
		<script src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
		<script src="${contextPath}/resources/js/browser.min.js"></script>
		<script src="${contextPath}/resources/js/breakpoints.min.js"></script>
		<script src="${contextPath}/resources/js/util.js"></script>
		<script src="${contextPath}/resources/js/main.js"></script>


	</body>
</html>
