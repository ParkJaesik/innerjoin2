<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		.basicInfoTable td {
			border: 1px solid lightgray;
		}
		.memProfile {
			width: 200px;
			height: 200px;
			border-right: 1px solid lightgray;
		}
		
		.basicInfoLabel {
			min-width: 150px;
			max-width: 200px;
			background-color: #30a5ff;
			color: white;
			font-weight: bold;
		}
		#profile {
			
		}
		
	
	</style>



</head>
<body>
	<c:set var="proPath" value="resources/gloadFiles"/>
	<jsp:include page="adminMenubar.jsp"/>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active"><a href="manageGroup.ij">그룹관리</a></li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">그룹 상세</h1>
			</div>
		</div><!--/.row-->
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row basicInfoArea">
						<div class="col-md-12">
							<table class="table basicInfoTable">
								<tr>
									<td rowspan='4' class='memProfile' align="center"><img id='profile' src='${proPath }/${group.filePath }'></td>
									<td class='basicInfoLabel'>모임장</td>
									<td class='basicInfoContent'>${group.gHost }</td>
									<td class='basicInfoLabel'>회원 수</td>
									<td class='basicInfoContent'>${group.gMemCount } / ${group.gLimit }</td>
								</tr>
								<tr>
									<td class='basicInfoLabel'>모임이름</td>
									<td class='basicInfoContent'>${group.gName }</td>
									<td class='basicInfoLabel'>신고받은 수</td>
									<td class='basicInfoContent'>${group.gReptCount}</td>
								</tr>
								<tr>
									<td class='basicInfoLabel'>카테고리</td>
									<td class='basicInfoContent'>${group.gCategoryName }</td>
									<td class='basicInfoLabel'>지역</td>
									<td class='basicInfoContent'>${group.districtName }, ${group.cityName}</td>
								</tr>
								<tr>
									<td class='basicInfoLabel'>개설일</td>
									<td class='basicInfoContent'>${group.gEnrollDate }</td>
									<td class='basicInfoLabel'>그룹상태</td>
									<td class='basicInfoContent'>
										<c:if test="${group.gStatus eq 0}">일반</c:if>
										<c:if test="${group.gStatus eq 1}">폐쇄</c:if>
										<c:if test="${group.gStatus eq 2}">경고</c:if>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="tabbable" id="tabs-267588">
								<ul class="nav nav-tabs">
									<li class="nav-item">
										<a class="nav-link active show" href="#tab1" data-toggle="tab">Section 1</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#tab2" data-toggle="tab">Section 2</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="panel-595324">
										<p>
											I'm in Section 1.
										</p>
									</div>
									<div class="tab-pane" id="tab2">
										<p>
											Howdy, I'm in Section 2.
										</p>
									</div>
								</div>
							</div>
							<table class="table">
								<thead>
									<tr>
										<th>
											#
										</th>
										<th>
											Product
										</th>
										<th>
											Payment Taken
										</th>
										<th>
											Status
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Default
										</td>
									</tr>
									<tr class="table-active">
										<td>
											1
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											01/04/2012
										</td>
										<td>
											Approved
										</td>
									</tr>
									<tr class="table-success">
										<td>
											2
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											02/04/2012
										</td>
										<td>
											Declined
										</td>
									</tr>
									<tr class="table-warning">
										<td>
											3
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											03/04/2012
										</td>
										<td>
											Pending
										</td>
									</tr>
									<tr class="table-danger">
										<td>
											4
										</td>
										<td>
											TB - Monthly
										</td>
										<td>
											04/04/2012
										</td>
										<td>
											Call in to confirm
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>