<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content-wrap {
	margin: auto;
	width: 900px;
	height: 100%;
	}
	
	


</style>




</head>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/common/index.css">
	
	
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- 써머노트 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<body>

	<div class="container-fluid" id="all-wrapper">
		<div class="row" id="header-wrapper">
			<div class="col-md-12" id="all-hearder">
				<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
			</div>
		</div>
		<div class="row" id="body-wrapper">
			<div class="col-md-1 aside"></div>
			<div class="col-md-10" id="body-content">
				<%@ include file="/WEB-INF/views/group/groupMenubar.jsp"%>
				<%-- <jsp:include page="/WEB-INF/views/album/albumListView.jsp"></jsp:include> --%>
				<div class="content-wrap">
				    <!-- <div class="div1">
				        <h2>회원</h2>
				    </div> -->
				    <div class="div2">
				        <h3>회원 신고</h3>
				    </div>
					<form action="rboard.ij" method="post" name="reportForm">
					     <div class="write">
					         <div class="div3">
					             <label>신고하는 회원</label>
					         </div>
					         <div class="div4">
					             <input type="hidden" name="reportId" value="${loginUser.memberId }">
					             <input type="text" name="reporter" value="${loginUser.memberName }">
					         </div>
					         <div class="div3">
					             <label>신고 받는 회원</label>
					         </div>
					         <div class="div4">
					          
					             <input type="hidden" name="responId" value="${memberId }">
					             <input type="text" name="respond" value="${memberName }">
					         </div>
					         <div class="div3">
					             <label>신고 유형</label>
					         </div>
					         <div class="div5">
					             <input type="radio" name="rCategory" value="욕설 및 비방" <c:if test="${rCategory eq '욕설 및 비방'}">checked="checked"</c:if>> 욕설 및 비방 &nbsp;&nbsp;&nbsp;
					             <input type="radio" name="rCategory" value="폭력적이거나 혐오 표현" <c:if test="${rCategory eq '폭력적이거나 혐오 표현'}">checked="checked"</c:if>> 폭력적이거나 혐오 표현 <br> 
					             <input type="radio" name="rCategory" value="선정적인 표현" <c:if test="${rCategory eq '선정적인 표현'}">checked="checked"</c:if>> 선정적인 표현 &nbsp;
					             <input type="radio" name="rCategory" value="부적절한 홍보" <c:if test="${rCategory eq '부적절한 홍보'}">checked="checked"</c:if>> 부적절한 홍보 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					             <input type="radio" name="rCategory" value="기타 " <c:if test="${rCategory eq '기타 '}">checked="checked"</c:if>> 기타 
					         </div>
					         <div class="div3">
					             <label>신고 내용</label>
					             <p>
					             	신고 내용을 상세하게 적어주셔야 신고처리가 됩니다.<br>
					             	- 증거 사진 첨부
					             </p>
					         </div>
					         <div class="div2">
		                     	<textarea name="rContent" id="summernote" ></textarea>
		                     </div>
					     </div>
					     <div class="btn" align="center">
					     	<button type="button">취소</button>
					     	<button type="submit" onclick="location.href='rblist.ij'">등록</button>
					     </div>
					 
					</form>
				</div>
				
				
				
				
				

			</div>
			<div class="col-md-1 aside">
				<div id="groupChatWrapper">
					<%@ include file="/WEB-INF/views/chat/chat.jsp" %>	
				</div>
			</div>
		</div>
		<div class="row" id="footer-wrapper">
			<div class="col-md-12" id="all-footer">
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		
		
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