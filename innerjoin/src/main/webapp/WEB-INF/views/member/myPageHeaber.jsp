<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage.css">
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
                        	<img class="img-circle" src="${contextPath}/resources/images/member/${loginUser.memberProPath }" style="border: 1px solid slateblue;">
                            
                            <br>
                            <div class="myProfile">자기소개</div>
                            <br>
                            <button>프로필 수정</button>
                        </div>
                        <div class="col-md-4"></div>
					</div>
                    <br>
                    <div class="row">
                    	<div class="col-md-2"></div>
                        <div class="col-md-8">캘린더</div>
                        <div class="col-md-2"></div>
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
                    	<a href="myGroupForm.ij">내 모임</a>
                        <a href="myNoteForm.ij">쪽지함</a>
                        <a href="myNewsForm.ij">알림함</a>
                        <a href="checkPwdForm.ij">정보수정</a>
                    </div>
                    <div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
</body>
</html>