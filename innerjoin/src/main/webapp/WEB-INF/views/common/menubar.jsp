<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 선언-->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script> 

</head>
<body>
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
 		<c:remove var="msg"/>
	</c:if>
	
	<h1 align="center">Inner Join!!</h1>
	<br>
	
	
</body>
</html>