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
</head>

<style>

	
</style>
<body>
	<jsp:include page="adminMenubar.jsp"/>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active"><a href="manageGroup.ij">모임관리</a></li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">그룹 리스트</h1>
			</div>
		</div><!--/.row-->

		<div class="row" class="memListArea">
			<div class="col-md-12">
				
				<h3 align="center">
					총 그룹 수 : ${ pi.listCount }
				</h3>
				
				<table class="memListTable" align="center" border="1" cellspacing="0" width="900" id="tb">
					<tr>
						<th>번호</th>
						<th>모임 번호</th>
						<th>모임 이름</th>
						<th>모임장</th>
						<th>모임 회원 수</th>
						<th>모임 회원 제한</th>
						<th>모임 신고 수</th>
						<th>모임 상태</th>
						<th>개설일</th>
					</tr>
					
					<c:forEach var="g" items="${ gList }" varStatus="status">
						<tr>
							<td align="center">${ status.count }</td>
							
							<td align="center">${ g.gNo }</td>
							
							<td align="left">
								<c:url var="groupDetail" value="groupDetail.ij">
									<c:param name="gNo" value="${ g.gNo }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ groupDetail }">${ g.gName }</a>
							</td>
							
							<td align="center">${ g.gHost }</td>
							<td align="center">${ g.gMemCount }</td>
							<td align="center">${ g.gLimit }</td>
							<td align="center">${ g.gReptCount }</td>
							<td align="center">
							
										<c:if test="${g.gStatus eq 0}">일반</c:if>
										<c:if test="${group.gStatus eq 1}">경고</c:if>
										<c:if test="${group.gStatus eq 2}">폐쇄</c:if>
							</td>
							<td align="center">${ g.gEnrollDate}</td>
						</tr>
					</c:forEach>
					
					<!-- 페이징 처리 -->
					<tr align="center" height="20">
						<td colspan="9">
						
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
			$("#manageGroup").addClass("active");
		};
	</script>
	  
</body>
</html>
