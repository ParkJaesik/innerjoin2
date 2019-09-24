<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="clientId" value="474309519585-p4jv3ahraoefv61aaou6s7idiruq4rra.apps.googleusercontent.com"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>SpringProject</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>

	<meta name="google-signin-client_id" content="${clientId }">
	
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>
	
	<div class="g-signin2" data-longtitle="true" data-onsuccess="onSignIn"></div>


	<a href="#" onclick="signOut();">Sign out</a>
	
	<br><br>
	
	<button onclick='location.href="calendar.kh"'>일정보기</button>
	
	
	<script>
		function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  var id_token = googleUser.getAuthResponse().id_token;
		  
		  console.log('Profile: ' + JSON.stringify(profile));
		  console.log('id_token: ' + id_token);
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
		
	
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function () {
				console.log('User signed out.');
			});
		}
	
	</script>
</body>
</html>





