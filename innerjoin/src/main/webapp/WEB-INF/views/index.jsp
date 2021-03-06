<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<title>Insert title here</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
<style>
#mainpage-container * {
	font-family: 'Noto Sans KR', sans-serif;
	color: rgb(50, 50, 50);
}

div {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#mainpage-container {
	width: 100%;
	height: 2000px;
}

#mainpage-container h1 {
	font-weight: bold;
}

#mainpage-thumbnail-container {
	width: 100%;
	height: 700px;
}

#thumbnail-container {
	margin-top: 50px !important;
	width: 1000px;
	height: 600px;
	margin: auto;
}

#thumbnail-container * {
	margin: 0;
	padding: 0;
}

#thumbnail-container ul, li {
	list-style: none;
}

#slide {
	height: 600px;
	position: relative;
	overflow: hidden;
}

#slide ul {
	width: 400%;
	height: 100%;
	transition: 1s;
}

#slide ul:after {
	content: "";
	display: block;
	clear: both;
}

#slide li {
	float: left;
	width: 25%;
	height: 100%;
}

#slide li:nth-child(1) {
	
}

#slide li:nth-child(2) {
	
}

#slide li:nth-child(3) {
	
}

#slide li:nth-child(4) {
	
}

#slide input {
	display: none;
}

#slide label {
	display: inline-block;
	vertical-align: middle;
	width: 10px;
	height: 10px;
	border: 2px solid #666;
	background: #fff;
	transition: 0.3s;
	border-radius: 50%;
	cursor: pointer;
}

#slide .pos {
	text-align: center;
	position: absolute;
	bottom: 10px;
	left: 0;
	width: 100%;
	text-align: center;
}

#pos1:checked ~ul {
	margin-left: 0%;
}

#pos2:checked ~ul {
	margin-left: -100%;
}

#pos3:checked ~ul {
	margin-left: -200%;
}

#pos4:checked ~ul {
	margin-left: -300%;
}

#pos1:checked ~.pos>label:nth-child(1) {
	background: #666;
}

#pos2:checked ~.pos>label:nth-child(2) {
	background: #666;
}

#pos3:checked ~.pos>label:nth-child(3) {
	background: #666;
}

#pos4:checked ~.pos>label:nth-child(4) {
	background: #666;
}

#mainpage-group-container {
	margin-top: 50px !important;
	border-top: 2px solid rgb(190, 190, 190);
	width: 1400px;
	height: 1100px;
	margin: auto;
}

#group-container {
	margin-top: 50px !important;
	width: 1300px;
	height: 900px;
	margin: auto;
	text-align: center;
}

#group-container #main-group:nth-child(2), #group-container #main-group:nth-child(5) {
	margin-left: 50px;
	margin-right: 50px;
}

#group-container #main-group:nth-child(1), #group-container #main-group:nth-child(2),
#group-container #main-group:nth-child(3) {
	margin-bottom: 50px;
}

#main-group {
	width: 400px;
	height: 400px;
	float: left;
	background-color: rgb(230, 230, 230);
	border-radius: 10px;
}

#main-group-thumbnail {
	width: 350px;
	margin: auto;
	margin-top: 25px;
	height: 200px;
}

#main-group-thumbnail img {
	width: 100%;
	height: 100%;
}

#main-group-info {
	width: 350px;
	margin: auto;
	margin-top: 25px;
	height: 125px;
}

#mainvideoWrapper{
	
	
	position:relative;   
  width:100%;
   height:600px;
	overflow:hidden;
	background-color: rgba(178, 180, 184, 0.2);
	min-width: 1060px;
}

#mainvideo{
	
	position:absolute;
   	width:100%;
    z-index:-3;
	    
}
.innerMentWrapper{
	position:absolute;
	width:100%;
	z-index:5;
	align:center;
	
}
#innerMent1{
	color: white;
    font-size: 35px;
	text-align:center;
	margin-left: 30%;
    margin-right: 30%;
    margin-top: 15%;
    font-weight:600;
}
#innerMent2{
	color: white;
    font-size: 25px;
    font-weight:600;
	text-align:center;
	
}
#innerMent3{
	margin-left: 45%;
}

.innerMent {
	 text-shadow: 0.5px 0.5px 0.5px gray;
}

input[type="button"],
input[type="submit"],
input[type="reset"],
button, 
.button, .btn {
    -moz-transition: all 0.25s ease-in-out;
    -webkit-transition: all 0.25s ease-in-out;
    -ms-transition: all 0.25s ease-in-out;
    transition: all 0.25s ease-in-out;
    -webkit-appearance: none;
    position: relative;
    display: inline-block;
    background: #ed786a;
    color: #fff !important;
    text-transform: uppercase;
    border-radius: 4px;
    border: 0;
    outline: 0;
    font-size: 1em;
    box-shadow: 0.125em 0.175em 0 0 rgba(0, 0, 0, 0.125);
    font-weight: 600;
    text-align: center;
   
    letter-spacing: 2px;
    padding: 0.7em 1em 0.7em 1em;
    border-radius: 5px !important;
    
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
		<br>
		<!-- 페이지 바디부분 -->
		<div class="row" id="body-wrapper">
			<div class="col-md-1 aside"></div>
			<!-- 다들 이 페이지 틀 복사해서 만드는페이지에 기본으로 깔고     밑에 body-content 공간에  본인 페이지 include해줘 -->
			<div class="col-md-10" id="body-content">
				<!-- 메인페이지 content 부분 -->
				<%-- c:url var="goAlbum" value="/albumListView.ij"> <c:param
				name="groupNo" value="1" /> </c:url> <a href="${goAlbum}">앨범</a>


				<c:if test="${ !empty sessionScope.loginUser }"> <a
				href="calendar.ij">임시모임일정</a> <a href="memberCalendar.ij">임시멤버일정</a>
				</c:if> <a href="tempGoGroup.ij">임시 모임 페이지로 이동</a> <c:url
				var="insertGroup" value="ginsertForm.ij"> </c:url> <a
				href="${insertGroup }">모임 만들기</a> <a
				href="goGroupPage.ij?gNo=8">식샤를합시다 모임페이지로 이동</a> <br> <a
				href="googleLogin.ij">구글</a> &nbsp;&nbsp;&nbsp; <a
				href="rboardInsertForm.ij">모임 회원 신고글 작성</a> <br> <a
				href="admin.ij">관리자페이지</a> --%>

				<div id="mainpage-container">
					<div id="mainvideoWrapper">
						<video  id="mainvideo" autoplay loop controls muted="true">
							<source src="${contextPath }/resources/video/mainvideo.mp4" type="video/mp4">
						</video>
						<div class="innerMent" id="innerMentWrapper">
							<div id="innerMent1" class=".innerMent">
								함께하는 즐거움
							</div>
							<br>
							<div id="innerMent2" class=".innerMent">
								모임에 InnerJoin하고 사람들과 좋아하는 일을 함께 하며 새로운 경험을 즐겨 보세요.
							</div>
							<br>
							<c:if test="${loginUser == null }">
							<div id="innerMent3" class=".innerMent">
								<button onclick="location.href='loginForm.ij'">INNERJOIN</button>
							</div>
							</c:if>
							
						</div>
					</div>
					<!-- <div id="mainpage-thumbnail-container">
						<div id="thumbnail-container">
						
							<div id="slide">
								<input type="radio" name="pos" id="pos1" checked>
								<input type="radio" name="pos" id="pos2">
								<input type="radio" name="pos" id="pos3">
								<input type="radio" name="pos" id="pos4">
								
								<ul>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>

								<p class="pos">
									<label for="pos1"></label>
									<label for="pos2"></label>
									<label for="pos3"></label>
									<label for="pos4"></label>
								</p>
							</div>
						</div>
					</div>
 -->
					<div id="mainpage-group-container">
						<h1>새로운 모임</h1>
						<c:set var="groupFilePath" value="resources/guploadFiles"/>
						<div id="group-container">
							<c:forEach var="g" items="${ list }">
								<div id="main-group">
									<div id="main-group-thumbnail">
										<img src="${groupFilePath }/${g.filePath}" alt="">
									</div>
		
									<div id="main-group-info">
										<a href="goGroupPage.ij?gNo=${g.gNo}" style="font-size: 32px; font-weight: bold;">
											${ g.gName }
										</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1 aside"></div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>