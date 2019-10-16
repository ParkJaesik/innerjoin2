<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			width: 300px;
			height: 200px;
			border-right: 1px solid lightgray;
			overflow: hidden;
		}
		
		.basicInfoLabel {
			min-width: 150px;
			max-width: 200px;
			background-color: #30a5ff;
			color: white;
			font-weight: bold;
		}
		#profile {
			width: 100%;
		}
		
	
	</style>



</head>
<body>
	<c:set var="proPath" value="resources/guploadFiles"/>
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
										<c:if test="${group.gStatus eq 1}">경고</c:if>
										<c:if test="${group.gStatus eq 2}">폐쇄</c:if>
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
										<a class="nav-link active show" href="#tab1" data-toggle="tab">${group.gName }의 회원 보기</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#tab2" data-toggle="tab">모임 관리하기</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab1">
										<table class="table">
											<thead>
												<tr>
													<th align="center">#</th>
													<th align="center">회원이름</th>
													<th align="center">가입일</th>
													<th align="center">Status</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${!empty mList}">
													<c:forEach var="m" items="${ mList }" varStatus="status">
														<tr>
															<td align="center">${ status.count }</td>

															<td align="center"><c:url var="memDetail"
																	value="memDetail.ij">
																	<c:param name="memberId" value="${ m.memberId }" />
																</c:url><a href="${memDetail}">${ m.memberId }</a>
															</td>
															<td>가입일이없어용</td>
															<td align="center">
																<c:if	test="${m.levelCode eq 0}">모임장</c:if> 
																<c:if	test="${m.levelCode eq 1}">매니저</c:if> 
																<c:if	test="${m.levelCode eq 2}">일반</c:if>
															</td>
														</tr>
													</c:forEach>

												</c:if>
												<c:if test="${empty mList }">
													<tr><td align="center">그룹 회원이 없습니다.</td></tr>
												</c:if>
											</tbody>
										</table>
									</div>
									<div class="tab-pane" id="tab2">
										<button id="warning" class="btn btn-primary">경고주기</button>
										<button id="close" class="btn btn-primary">폐쇄하기</button>
										<button id="recover" class="btn btn-primary">회복하기</button>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	window.onload = function () {
		$("#manageGroup").addClass("active");
	};
	var gStatus;
	var gNo = ${group.gNo};
	var groupReptNo = '${groupReptNo}';
		$("#warning").click(function(){
			if(confirm("경고를 주시겠습니까?")){
				gStatus = 1;
				$.ajax({
    				url: "updateGroupStatus.ij",
    				data : {gNo : gNo,gStatus:gStatus,groupReptNo:groupReptNo},
    				type : "post",
    				success : function(data){
    					if(data == 1){
    						
    						alert("경고를 줬다!");
    						location.href="groupDetail.ij?gNo="+gNo;
    					} else if(data == 2){
    						alert("신고상태처리완료");
    						location.href="groupReport.ij";
    					}else{
    						alert("실패ㅠ");
    					}
    				},
    				error : function(e){
    					console.log("Ajax 통신 실패");
    				}
    			}); 
			}
		});
		$("#close").click(function(){
			if(confirm("폐쇄하시겠습니까?")){
				gStatus = 2;
				$.ajax({
    				url: "updateGroupStatus.ij",
    				data : {gNo : gNo,gStatus:gStatus,groupReptNo:groupReptNo},
    				type : "post",
    				success : function(data){
						if(data == 1){
    						
    						alert("폐쇄했다!");
    						location.href="groupDetail.ij?gNo="+gNo;
    					} else if(data == 2){
    						alert("신고상태처리완료");
    						location.href="groupReport.ij";
    					}else{
    						alert("실패ㅠ");
    					}
    				},
    				error : function(e){
    					console.log("Ajax 통신 실패");
    				}
    			}); 
			}
		});
		$("#recover").click(function(){
			if(confirm("회복하시겠습니까?")){
				gStatus = 0;
				$.ajax({
    				url: "updateGroupStatus.ij",
    				data : {gNo : gNo,gStatus:gStatus,groupReptNo:groupReptNo},
    				type : "post",
    				success : function(data){
						if(data == 1){
    						
    						alert("회복시켜줬다!");
    						location.href="groupDetail.ij?gNo="+gNo;
    					} else if(data == 2){
    						alert("신고상태처리완료");
    						location.href="groupReport.ij";
    					}else{
    						alert("실패ㅠ");
    					}
    				},
    				error : function(e){
    					console.log("Ajax 통신 실패");
    				}
    			}); 
			}
		});
	</script>
</body>
</html>