<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- 써머노트 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
<%@ include file="../group/groupMenubar.jsp" %>
	<div class="content">
		<div class="content-wrap">
		    <div class="div1">
		        <h2>회원</h2>
		    </div>
		    <div class="div2">
		        <h3>회원 신고</h3>
		    </div>
			<form action="rboard.ij" method="post" name="reportForm">
			     <div class="write">
			         <div class="div3">
			             <label>신고하는 회원</label>
			         </div>
			         <div class="div4">
			             <input type="text" name="reportId" value="${loginUser.memberName }">
			         </div>
			         <div class="div3">
			             <label>신고 받는 회원</label>
			         </div>
			         <div class="div4">
			             <input type="text" name="responId" value="">
			         </div>
			         <div class="div3">
			             <label>신고 유형</label>
			         </div>
			         <div class="div5"></div>
			             <input type="radio" name="rCategory"> 욕설 및 비방 &nbsp;&nbsp;&nbsp;
			             <input type="radio" name="rCategory"> 유해하거나 위험한 행동 &nbsp;
			             <input type="radio" name="rCategory"> 폭력적이거나 혐오 표현 <br> 
			             <input type="radio" name="rCategory"> 선정적인 표현 &nbsp;
			             <input type="radio" name="rCategory"> 부적절한 홍보 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			             <input type="radio" name="rCategory"> 기타 
			         </div>
			         <div class="div2">
                     	<textarea name="gInfo" id="summernote" value=""></textarea>
                     </div>
			     </div>
			     <div class="btn" align="center">
			     	<button type="button">취소</button>
			     	<button type="submit">등록</button>
			     </div>
			</form>
		</div>
       </div>
       
       <script>
       $(document).ready(function() {
           $("#summernote").summernote({
                   height: 300,
                   minHeight: null,             
                   maxHeight: null,             
                   focus: true                  
			});
      });
       
       </script>
	

</body>
</html>