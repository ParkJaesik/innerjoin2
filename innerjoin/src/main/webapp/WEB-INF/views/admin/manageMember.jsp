<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lumino - Widgets</title>
	<link href="resources/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/admin/font-awesome.min.css" rel="stylesheet">
	<link href="resources/css/admin/datepicker3.css" rel="stylesheet">
	<link href="resources/css/admin/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	<style>
		.memListTable th {
			text-align: center;
		}
	</style>
</head>
<body>
	<jsp:include page="adminMenubar.jsp"/>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active"><a href="manageMember.ij">회원관리</a></li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">회원 리스트</h1>
			</div>
		</div><!--/.row-->

		<div class="row" class="memListArea">
			<div class="col-md-12">
				
				<h3 align="center">
					총 회원 수 : ${ pi.listCount }
				</h3>
				
				<table class="memListTable" align="center" border="1" cellspacing="0" width="900" id="tb">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>가입한 모임 수</th>
						<th>신고 횟수</th>
						<th>회원 상태</th>
						<th>가입일</th>
					</tr>
					
					<c:forEach var="m" items="${ mList }" varStatus="status">
						<tr>
							<td align="center">${ (pi.currentPage - 1) * pi.limit + status.count }</td>
							
							<td align="left">
								<c:url var="memDetail" value="memDetail.ij">
									<c:param name="memberId" value="${ m.memberId }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ memDetail }">${ m.memberId }</a>
							</td>
							
							<td align="center">${ m.memberName }</td>
							<td align="center">${ m.memberJoinCount }</td>
							<td align="center">${ m.memberReptCount }</td>
							<td align="center">${ m.memberStatusCode }</td>
							<td align="center">${ fn:split(m.memberEnrollDate, ' ')[0] }</td>
						</tr>
					</c:forEach>
					
					<!-- 페이징 처리 -->
					<tr align="center" height="20">
						<td colspan="7">
						
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">
								[이전] &nbsp;
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="manageMember.ij">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a href="${ before }">[이전]</a> &nbsp;
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq currentPage }">
									<font color="red" size="4"><b>[${ p }]</b></font>
								</c:if>
								
								<c:if test="${ p ne currentPage }">
									<c:url var="pagination" value="manageMember.ij">
										<c:param name="page" value="${ p }"/>
									</c:url>
									<a href="${ pagination }">${ p }</a> &nbsp;
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								[다음]
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="manageMember.ij">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								<a href="${ after }">[다음]</a>
							</c:if>
						</td>
					</tr>
				</table>
			
			</div><!--/.col-->
			<div class="col-sm-12">
				<p class="back-link">Lumino Theme by <a href="https://www.medialoot.com">Medialoot</a></p>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	  
	<script>
		window.onload = function () {
			$("#manageMember").addClass("active");
		};
	</script>
	
</body>
</html>
