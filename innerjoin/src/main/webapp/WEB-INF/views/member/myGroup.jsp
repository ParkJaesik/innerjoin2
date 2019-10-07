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
<title>마이페이지</title>

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
				 <jsp:include page="/WEB-INF/views/member/myPageHeaber.jsp"/>
       
			        <section id="content">
			            <div class="myG-Info">
			                <h4>내 모임</h4>
			                <div class="row">
			                    <div class="col-4 g-img"><img src="images/bg.jpg"></div>
			                    <div class="g-title"><p>모임 이름</p></div>
			                
			               
			                    <div class="col-4 g-img"><img src="images/bg.jpg"></div>
			                    <div class="g-title"><p>가나다</p></div>
			                    
			                    
			                    <div class="col-4 g-img"><img src="images/bg.jpg"></div>
			                    <div class="g-title"><p>모임 이름</p></div>
			                    
			                </div>
			            </div>
			           
			        </section>
			        <div class="margin"></div>
			        <section id="content">
			            <div>
			                <h4>초대받은 모임</h4>
			                
			            </div>
			        </section>

			</div>
			<div class="col-md-1 aside">
				
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    

    





			

		

	</body>
</html>