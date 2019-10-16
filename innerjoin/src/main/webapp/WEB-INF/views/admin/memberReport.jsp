<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<body>
	<jsp:include page="adminMenubar.jsp"/>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">신고관리</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">회원신고</h1>
			</div>
		</div><!--/.row-->

		<div class="row">
			<div class="col-md-12">
			
				<h3 align="center">
					총 신고 수 : ${ pi.listCount }
				</h3>
				
				<table class="mrListTable" align="center" border="1" cellspacing="0" width="900" id="tb">
					<tr>
						<th>번호</th>
						<th>피신고자 (아이디 / 닉네임)</th>
						<th>신고 내용</th>
						<th>신고일</th>
						<th>신고자 (아이디 / 닉네임)</th>
						<th>처리 상태</th>
					</tr>
					<c:if test="${ !empty mrList}">
						<c:set var="num" value="0"/>
						<c:forEach var="mr" items="${ mrList }" varStatus="status">
							
							<tr>
								<td align="center">${ status.count }
									<c:set var="num" value="${num + 1}"/>${num}
								</td>
								
								<td align="center">${ g.gNo }
									<c:url var="memDetail" value="memDetail.ij">
										<c:param name="memberId" value="${fn:split(mr.reportedId,'/')[0]}"/>
									</c:url>
									<a href="${memDetail }"> ${mr.reportedId} </a>
								</td>
								<td align="left">
									${mr.memReptContent }
								</td>
								<td align="center">
									<%-- <fmt:formatDate value="${mr.memReptDate}" pattern="yyyy.MM.dd"/> --%>	
									${mr.memReptDate}
								</td>
								<td align="center">
									<c:url var="memDetail" value="memDetail.ij">
										<c:param name="memberId" value="${fn:split(mr.reporterId,'/')[0]}"/>
									</c:url>
									<a href="${memDetail }"> ${mr.reporterId} </a>
								</td>
								<td>
									${mr.memReptStatus }
								</td>
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
					</c:if>
					<c:if test="${ empty mrList}">
						<tr>
							<td colspan='6' align="center">
								 회원 신고 내역이 없습니다.
							</td>
						</tr>
					</c:if>
				</table>
			
			</div><!--/.col-->
			<div class="col-sm-12">
				<p class="back-link">Lumino Theme by <a href="https://www.medialoot.com">Medialoot</a></p>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	  
	<script>
		window.onload = function () {
			$("#manageReport").addClass("active");
			$("#manageReport>a").collapse('show');
			$("#groupReport").addClass("active");
		};
	</script>
	
</body>
</html>
