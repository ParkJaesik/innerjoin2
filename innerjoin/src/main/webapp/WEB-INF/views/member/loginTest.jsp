<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="474309519585-p4jv3ahraoefv61aaou6s7idiruq4rra.apps.googleusercontent.com">
<title>Insert title here</title>

<script src="https://apis.google.com/js/platform.js" async defer></script>


</head>
<body>


	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	
	<script>
	
	function init() {
		  gapi.load('auth2', function() {
		    /* Ready. Make a call to gapi.auth2.init or some other API */
		  });
		}
	
		/* function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			} */
	</script>

</body>
</html>