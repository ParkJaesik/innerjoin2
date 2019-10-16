<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css">
<style type="text/css">
/* .profileP{
	border-radius: 50em;
	border: 1px solid #a2a2a2;
	height: 11em; 
} */

.profileP img{
	width: 13em;
	height: 13em;
	border-radius: 150px;
}

.line{
	border-bottom: none;
}
.mInfo{
	height: 10em;
	border: 2px solid #ed786a;
	border-radius: 5px;
	padding: 1em;
}
</style>
</head>
<body>
<div class="margin"></div>
	<div class="container-fluid  line">
		<section id="myPage-nav">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-4"></div>
                            
                            <!-- form -->
                            

							<div class="col-md-4" align="center">
		                        	<input type="hidden" name="memberId" value="${otherUser.memberId }">
									<div class="profileP" >
		                        		<img class="img-circle" src="${contextPath}/resources/images/member/${otherUser.memberProPath }">
	    	                        </div>
	        	                    <br>
	        	                    
	        	                    <div class="myprofile"><h5>${otherUser.memberName }(${otherUser.memberId })</h5></div>
	            	                <div class="myProfile mInfo">${ otherUser.memberIntroduce }</div>
	                	            <br>           
	                    	   
                        	</div>

                        <div class="col-md-4"></div>
					</div>
                    <br>
                    <div class="row">
                    
                        <div class="col-md-12">
                        	
                        </div>
                    </div>
                    <br>
				</div>
			</div>
		</section>
	</div>
	<div class="col-md-1 aside"></div>
	</div>
	</div>
	
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
</body>
</html>