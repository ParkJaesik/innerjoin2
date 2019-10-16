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
		                        <form action="profileUpdateForm.ij" method="post" >
		                        	<input type="hidden" name="memberId" value="${loginUser.memberId }">
									<div class="profileP" >
		                        		<img class="img-circle" src="${contextPath}/resources/images/member/${loginUser.memberProPath }">
	    	                        </div>
	        	                    <br>
	        	                    <div class="myprofile"><h5>${loginUser.memberName }(${loginUser.memberId })</h5></div>
	        	                  
	            	                <div class="myProfile mInfo">${ loginUser.memberIntroduce }</div>
	                	            <br>           
	                    	        <button>프로필 수정</button>
	                        	</form>
                        	</div>

                        <div class="col-md-4"></div>
					</div>
                    <br>
                    <div class="row">
                    <!-- 	<div class="col-md-2"></div>
                        <div class="col-md-8">캘린더</div>
                        <div class="col-md-2"></div> -->
                        <div class="col-md-12">
                        	<%@ include file="../event/memCalendar.jsp"%>
                        </div>
                    </div>
                    <br>
				</div>
			</div>
		</section>
	</div>
	<section id="myPage-menu">
    	<div class="row">
        	<div class="col-md-12">
            	<div class="row">
                 	<div class="col-md-3"></div>
                    <div class="col-md-6 menu-detail" >
                    	<a href="myGroupForm.ij" class="mgroup">내 모임</a>
                        <a href="myNoteForm.ij" class="note">쪽지함</a>
                        <a href="myNewsForm.ij" class="new">알림함</a>
                        <a href="checkPwdForm.ij" class="uinfo">정보수정</a>
                    </div>
                    <div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(function(){
			var loginUserInt = "${loginUser.memberIntroduce}"
			var loginUserId = "${loginUser.memberId}"
			console.log("loginUser : " +loginUserInt);
			console.log("loginUserId : " +loginUserId);
		});
	</script>
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
</body>
</html>