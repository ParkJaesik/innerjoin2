<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.content-wrap{
	margin: auto;
	/* margin-top: 3%; */
	width: 70%;
	margin-left: 20%;
	
}

th{
	width: 35%;
}

td{

	width: 65%;
}

.div2{
	margin-top: 10%;
	
}


.div3{
	height: 150px;

}

.input{
	width: 250px;
	height: 40px;
}

.button-wrap button{
	width: 100px;
	height: 40px;
	border-radius: 5px !important;
	box-shadow: 0.125em 0.175em 0 0 rgba(0, 0, 0, 0.125);
	font-weight: 600;
    text-align: center;
    letter-spacing: 2px;
    background-color: #e6e6e6;
    color: #323232;
	
	
	
}

.button-wrap button:hover{
	background: #fd887a;
    border-radius: 5px;
}

.button-wrap button:active{
	background: #ed786a;
}
.button-wrap{
	margin-left: 30%;
	margin-top: 7%;
}




</style>


</head>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<title>Insert title here</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
	
	
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
					<div class="div1">
						<h3>신고 게시글 상세보기</h3>
					</div>	
					<form method="POST">
					<table class="div2">
						<tr class="div3">
							<th class="div3-1">
								<label>신고하는 회원</label>
							</th>
							<td class="div3-2">
								<input type="hidden" name="reportGNo" value="${report.reportGNo}">
								<input type="hidden" name="responGNo" value="${report.responGNo}">
								<input type="hidden" name="rNo" value="${report.rNo }">
								<input class="input" type="text" name="reportId" value="${report.reportId }" readonly="readonly">
								
							</td>
						</tr>
						<tr class="div3">
							<th class="div3-1">
								<label>신고받는 회원</label>
							</th>
							<td class="div3-2">
								<input class="input" type="text" name="responId" value="${report.responId }" readonly="readonly">
							</td>	 
								
						</tr>
						<tr class="div3">
							<th class="div3-1">
								<label>신고유형</label>
							</th>
							<td class="div3-2">
								<input type="hidden" name="rCategory" value="${report.rCategory }" >
								<p>${report.rCategory }</p>
							</td>
						</tr>
						<tr class="div3">
							<th class="div3-1">
								<label>날짜</label>
							</th>
							<td class="div3-2">
								<fmt:formatDate value="${report.rDate}" pattern="yyyy.MM.dd"/>
								<%-- <p>${report.rDate }</p> --%>
							</td>
						</tr>
						<tr class="div4">
							<th class="div4-1">
								<label>신고내용</label>
							</th>
							<td class="div4-2">
								<input type="hidden" name="rContent" value="${report.rContent}" >
								<c:set var="rContent" value="${fn:replace(report.rContent,'<br>','') }"/>
								<textarea rows="15" cols="80" readonly style="resize: none;">${report.rContent }</textarea>
								
							</td>
						</tr>	
					</div>
					</table>
					
					<div class="button-wrap">
						<button type="button" onclick="location.href='rblist.ij'">목록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="rejectBtn">거절</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="acceptBtn">수락</button>
					</div>
					
					</form>
				
				
				
				
				

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
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	
	<script>
	console.log('${report}');
	$("#rejectBtn").on("click", function () {
		if(confirm("정말 거절하시겠습니까?")){
			$("form").attr('action','breject.ij');
			$("form").submit();
		}
		
	});

	$("#acceptBtn").on("click", function () {
		
		$("form").attr('action','gmrcount.ij');
		$("form").submit();
		
	});
	
	$(document).ready(function() {
		$("#summernote").summernote({
			height : 400,
			width : 800,
			minHeight : null,
			maxHeight : null,
			focus : true
		});
	});
	
	</script>

</body>
</html>