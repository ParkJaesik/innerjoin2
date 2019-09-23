<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login.ij">
		<input type="text" name="memberId"> 아이디 <br>
		<input type="password" name="memberPwd"> 비밀번호 <br>
		
		<button>로그인</button>
		
	</form>
	<button id="goLogin" onclick="javascript:location.href='login2.ij';">로그인 폼</a>
	
	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</body>
</html>