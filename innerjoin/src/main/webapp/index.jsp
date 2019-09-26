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
	
	
	
	<button id="goLogin" onclick="javascript:location.href='login2.ij';">로그인 폼</button>
	<br>
	<button id="goLogin2" onclick="location.href='gochat.ij'">채팅화면</button>
	<button id="goLogin3" onclick="location.href='gochat2.ij'">채팅2화면</button>
	
	<button onclick="goAlbum();">앨범</button>
	<script>
		function goAlbum(){
			
			location.href="addAlbumForm.ij";
		} 
		 
	</script> 
</body>
</html>