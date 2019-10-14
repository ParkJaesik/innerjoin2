<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
</head>
<body>
<%@ include file="../group/groupMenubar.jsp" %>
<div class="content">
	<div class="content-wrap">
		<form method="POST">
		<div class="div1">
			<h3>신고 게시글 상세보기</h3>
		</div>	
		<div class="div2">
			<div class="div3">
				<div class="div3-1">
					<label>신고하는 회원</label>
				</div>
				<div class="div3-2">
					<input type="hidden" name="reportGNo" value="${report.reportGNo}">
					<input type="hidden" name="responGNo" value="${report.responGNo}">
					<input type="hidden" name="rNo" value="${report.rNo }">
					<input type="text" name="reportId" value="${report.reportId }" readonly="readonly">
					
				</div>
			</div>
			<div class="div3">
				<div class="div3-1">
					<label>신고받는 회원</label>
				</div>
				<div class="div3-2">
					<input type="text" name="responId" value="${report.responId } " readonly="readonly"> 
					
			</div>
			<div class="div3">
				<div class="rType">
					<div class="div3-1">
						<label>신고유형</label>
					</div>
					<div class="div3-2">
						<input type="hidden" name="rCategory" value="${report.rCategory }" >
						<p>${report.rCategory }</p>
					</div>
				</div>
				<div class="rDate">
					<div class="div3-1">
						<label>날짜</label>
					</div>
					<div class="div3-2">
					
						<p>${report.rDate }</p>
					</div>
				</div>
			</div>
			<div class="div4">
				<div class="div4-1">
					<label>신고내용</label>
				</div>
				<div class="div4-2">
				<input type="hidden" name="rContent" value="${report.rContent}" >
					<textarea rows="10" cols="40" readonly >${report.rContent }</textarea>
				</div>
			</div>	
		</div>
		<div class="btn">
			<div></div>
			<div class="btn1">
				<button type="button">목록</button>
				
				
				
				<button type="button" id="rejectBtn">거절</button>
				
				
				<button type="button" id="acceptBtn">수락</button>
			</div>
		</div>
		</form>
	</div>
</div>
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
	
</script>
</body>
</html>