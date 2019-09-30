<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/menubar.css"/>
</head>
<body>
<section id="header">
	<!-- <div class="container" id="profile" > -->
		<nav id="nav">
			<ul>
				<a href="#"><img id="ij-logo" src="${contextPath}/resources/images/innerJoin.png"></a>
				<li class="menu"><a class="icon solid fa-search" href="#"><span>Search</span></a></li>
				<li class="menu"><a class="icon solid fa-envelope" href="#"><span>News</span></a></li>
                <li class="menu"><a class="icon solid fa-home" href="myGroupForm.ij"><span>MyPage</span></a></li>
			</ul>
		</nav>
	<!-- </div> -->
</section>

</body>
</html>