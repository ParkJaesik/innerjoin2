<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>

	<style>
		*{
			/* border: 1px solid red; */
		}
		.basicInfoTable td:not(.memProfile), .detailInfoTable td {
			border: 1px solid lightgray;
			font-size: 1em;
			font-weight: bold;
			padding-left: 15px !important;
			height: 40px !important;
		}
		
		.basicInfoArea {
			min-width: 900px;
			max-width: 1000px;
		
		}
		.basicInfoTable {
			width: 100%;
		}
		
		.memProfile {
			min-width: 100px; 
			width: 20% !important;
			height: 160px;
			border: 1px solid lightgray;
			padding: 20px!important;
		}
		
		#profile {
			width: 100%;
			overflow:hidden;
		}
		
		.basicInfoLabel {
			min-width: 150px;
			width: 15%;
			max-width: 200px;
			background-color: #30a5ff;
			color: white;
		}
		
		.basicInfoContent {
			width: 25%;
			min-width: 200px;
			max-width: 300px;
		}
		
		.tableLabel {
			display: inline-block;
			font-wize: 0.8em;
			font-weight: bold;
			margin-bottom: 20px;
		}
		
		.basicInfoTable {
			width: 100%;
			min-width: 500px;
		}
		
		.detailInfoLabel {
			min-width: 90px;
			width: 10%;
			max-width: 200px;
			background-color: #30a5ff;
			color: white;
		}
		
		.detailInfoContent {
			width: 40%;
			min-width: 100px;
			max-width: 300px;
			text-align: center;
		}
		
		.introduce .detailInfoLabel {
			height: 80px !important;
		}
		
		.introduce .detailInfoContent {
			overflow: auto;
		}
		
		.mdDiv {
			margin: 20px;
			border: 1px solid lightgray;
		}
	
		.hostTable, .joinTable {
			min-width: 1000px;
			border: 1px solid lightgray;
		}
		
		th, td {
			text-align: center !important;
			border: 1px solid lightgray !important;
		} 
		.tab-content {
			padding: 0 !important;
		}
		
		.nav-link {
			border: 1px solid lightgray !important;
		}
		
		.hostTable th, .joinTable th, li.active a, .memReptTable th {
			background-color: #30a5ff !important;
			color: white !important;
			font-weight: bold !important;
		}
		
		.selectGroup {
			float: right;
			display: inline-block !important;
			
		}
		
		#memStatusSelect {
			display: inline-block;
			width: 200px;
			height: 40px;			
			border-radius: 5px;
			vertical-align: baseline;
		}
		
		.memStatusSet {
			display: inline-block;
			width: 100px;
			height: 40px;
		}
		
		.memStatusSet button {
			height: 100%;
			vertical-align: baseline;
		}
		
		#proRept{
			color: black;
				
		}
		
	</style>



</head>
<body>
	<c:set var="proPath" value="resources/images/member"/>
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
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-8 basicInfoArea">
							<span class="tableLabel">>> &nbsp;회원 가입 정보</span>
							<table class="table basicInfoTable">
								<tr>
									<td rowspan='4' class='memProfile' align="center" width="200px"><img id='profile' src='${proPath }/${member.memberProPath }'></td>
									<td class='basicInfoLabel'>아이디</td>
									<td class='basicInfoContent'>${member.memberId }</td>
									<td class='basicInfoLabel'>개설모임 수</td>
									<td class='basicInfoContent'>${member.memberHostCount }</td>
								</tr>
								<tr>
									<td class='basicInfoLabel'>닉네임</td>
									<td class='basicInfoContent'>${member.memberName }</td>
									<td class='basicInfoLabel'>가입모임 수</td>
									<td class='basicInfoContent'>${member.memberJoinCount}</td>
								</tr>
								<tr>
									<td class='basicInfoLabel'>로그인방식</td>
									<td class='basicInfoContent'>${member.loginWay }</td>
									<td class='basicInfoLabel'>신고횟수</td>
									<td class='basicInfoContent'>${member.memberReptCount }</td>
								</tr>
								<tr>
									<td class='basicInfoLabel'>가입일</td>
									<td class='basicInfoContent'>${ fn:split(member.memberEnrollDate, ' ')[0] }</td>
									<td class='basicInfoLabel'>상태코드</td>
									<td class='basicInfoContent'>
										<c:if test="${member.memberStatusCode eq 0}">관리자</c:if>
										<c:if test="${member.memberStatusCode eq 1}">일반</c:if>
										<c:if test="${member.memberStatusCode eq 2}">경고</c:if>
									</td>
								</tr>
							</table>
						</div>
						<div class="col-sm-4" id="detailInfo">
							<span class="tableLabel"> >> &nbsp;추가정보</span>
	                        <table class="table detailInfoTable">
	                            <tr>
	                            	<td class="detailInfoLabel">성별</td>
	                            	<td class="detailInfoContent">
	                            		<c:if test="${member.memberGender != 0}">
	                            			${member.memberGender }
	                            		</c:if>
	                            		<c:if test="${member.memberGender == 0}">
	                            			-
	                            		</c:if>
		                            	<td class="detailInfoLabel">공개여부</td>
		                            	<td class="detailInfoContent">
		                            		<c:if test="${ member.memberOpenStatus == 0 }">-</c:if>
		                            		<c:if test="${ member.memberOpenStatus == 89 }">공개</c:if>
		                            		<c:if test="${ member.memberOpenStatus == 78 }">비공개</c:if>
		                            	</td>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td class="detailInfoLabel">생일</td>
	                            	<td class="detailInfoContent" colspan='3'>
	                            		<c:if test="${!empty member.memberBirthday }">
	                            			${member.memberBirthday }
	                            		</c:if>
	                            		<c:if test="${empty member.memberBirthday }">
	                            			-
	                            		</c:if>
	                            	</td>
	                            </tr>
	                            <tr class="introduce">
	                            	<td class="detailInfoLabel" rowspan='2'>회원 소개</td>
	                            	<td class="detailInfoContent" colspan='3' rowspan='2'>
	                            		<c:if test="${!empty member.memberIntroduce }">
	                            			${member.memberIntroduce }
	                            		</c:if>
	                            		<c:if test="${empty member.memberIntroduce }">
	                            			-
	                            		</c:if>
	                            	</td>
	                            </tr>
	                            <tr>
	                            
	                            </tr>
	                        </table>
		                </div>
						
						<div class="col-md-12 mdDiv"></div>
						
						<!-- 가입모임 정보 -->
						<div class="col-md-12">
							<span class="tableLabel"> >> &nbsp; 가입 모임 정보</span>
							<div class="tabbable" id="memGroupTab">
								<ul class="nav nav-tabs">
									<li class="nav-item active">
										<a class="nav-link active show" href="#hostTap" data-toggle="tab">개설 모임</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#joinTab" data-toggle="tab">가입 모임</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="hostTap">
										<table class="table hostTable">
											<thead>
												<tr>
													<th> 번호 </th>
													<th> 그룹명 </th>
													<th> 지역 </th>
													<th> 그룹카테고리 </th>
													<th> 그룹개설일 </th>
													<th> 공개여부 </th>
													<th> 그룹상태 </th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${ empty mgInfo}">
													<tr>
														<td colspan='7' align="center">
															개설한 모임이 없습니다.
														</td>
													</tr>
												</c:if>
												<c:if test="${ !empty mgInfo}">
													<c:set var="num" value="0"/>
													<c:forEach var="g" items="${mgInfo}" varStatus="i">
														<c:if test="${g.value['levelCode'] == 0 }">
														<c:set var="num" value="${num + 1}"/>
														<tr>
															<td>
																${num }
															</td>
															<td>
																${(g.value['gInfo']).gName }
															</td>
															<td>
																${(g.value['gInfo']).cityName } &nbsp; ${(g.value['gInfo']).districtName }
															</td>
															<td>
																${(g.value['gInfo']).gCategoryName }
															</td>
															<td>
																<fmt:formatDate value="${(g.value['gInfo']).gEnrollDate}" pattern="yyyy.MM.dd"/>	
																<%-- ${(g.value['gInfo']).gEnrollDate } --%>
															</td>
															<td>
																<c:if test="${(g.value['gInfo']).gOpenStatus == 'Y'}"> 공개 </c:if>
																<c:if test="${(g.value['gInfo']).gOpenStatus == 'N'}"> 비공개 </c:if>
															</td>
															<td>
																<c:if test="${(g.value['gInfo']).gStatus == 0}"> 일반 </c:if>
																<c:if test="${(g.value['gInfo']).gStatus == 1}"> 경고 </c:if>
																<c:if test="${(g.value['gInfo']).gStatus == 2}"> 폐쇄 </c:if>
															</td>
														</tr>
														</c:if>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
									</div>
									<div class="tab-pane" id="joinTab">
										<table class="table joinTable">
											<thead>
												<tr>
													<th>번호</th>
													<th>그룹명</th>
													<th>지역</th>
													<th>그룹카테고리</th>
													<th>그룹개설일</th>
													<th>그룹 회원 등급</th>
													<th>공개여부</th>
													<th>그룹상태</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${ empty mgInfo}">
													<tr>
														<td colspan='8' align="center">
															 가입한 모임이 없습니다.
														</td>
													</tr>
												</c:if>
												<c:if test="${ !empty mgInfo}">
													<c:set var="num2" value="0"/>
													<c:forEach var="g" items="${mgInfo}" varStatus="i">
														<c:if test="${g.value['levelCode'] != 0 }">
														<c:set var="num2" value="${num2 + 1}"/>
														<tr>
															<td>
																${num2 }
															</td>
															<td>
																<c:url var="groupDetail" value="groupDetail.ij">
																	<c:param name="gNo" value="${g.key}"/>
																</c:url>
																<a href="${groupDetail}">${(g.value['gInfo']).gName }</a>
															</td>
															<td>
																${(g.value['gInfo']).cityName } &nbsp; ${(g.value['gInfo']).districtName }
															</td>
															<td>
																${(g.value['gInfo']).gCategoryName }
															</td>
															<td>
																<fmt:formatDate value="${(g.value['gInfo']).gEnrollDate}" pattern="yyyy-MM-dd"/>	
																<%-- ${(g.value['gInfo']).gEnrollDate } --%>
															</td>
															<td>
																<c:if test="${g.value['levelCode'] == 1}"> 매니저 </c:if>
																<c:if test="${g.value['levelCode'] == 2}"> 일반 </c:if>
																<c:if test="${g.value['levelCode'] == 3}"> 초대 </c:if>
																<c:if test="${g.value['levelCode'] == 4}"> 신청 </c:if>
																<c:if test="${g.value['levelCode'] == 10}"> 탈퇴 </c:if>
															</td>
															<td>
																<c:if test="${(g.value['gInfo']).gOpenStatus == 'Y'}"> 공개 </c:if>
																<c:if test="${(g.value['gInfo']).gOpenStatus == 'N'}"> 비공개 </c:if>
															</td>
															<td>
																<c:if test="${(g.value['gInfo']).gStatus == 0}"> 일반 </c:if>
																<c:if test="${(g.value['gInfo']).gStatus == 1}"> 경고 </c:if>
																<c:if test="${(g.value['gInfo']).gStatus == 2}"> 폐쇄 </c:if>
															</td>
														</tr>
														</c:if>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							
						</div> <!-- /col-md-12 : 가입 모임 정보  -->
						
						<div class="col-md-12 mdDiv"></div>
						
						<!-- 신고 내역 -->
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-12">
									<span class="tableLabel"> >> &nbsp; 신고 받은 내역</span>
									
									<div class="input-group selectGroup">
										<select name="memStatus" class="custom-select" id="memStatusSelect">
											<option value="1" selected>일반</option>
											<option value="2">경고</option>
											<option value="3">탈퇴</option>
										</select>
										<div class="memStatusSet">
											<button class="btn btn-outline-secondary statusSetBtn" type="button" onclick="setMemStatusCode();">등급조정</button>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 신고 내역 테이블 -->
							<div class="reportTableArea">
								<table class="table memReptTable">
									<thead>
										<tr>
											<th> 번호 </th>
											<th> 신고 내용 </th>
											<th> 신고자 (아이디 / 닉네임) </th>
											<th> 신고상태 </th>
											<th> 신고일 </th>
											<th>
												<button type="button" id="proRept" onclick="processReport();">처리</button>
												<input type="checkbox" id="allReptChk">all
											</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${ empty mrList}">
											<tr>
												<td colspan='6' align="center">
													신고받은 내역이 없습니다.
												</td>
											</tr>
										</c:if>
										<c:if test="${ !empty mrList}">
											<c:set var="num" value="0"/>
											<c:forEach var="mr" items="${mrList}" varStatus="i">
												<c:set var="num" value="${num + 1}"/>
												<tr>
													<td>
														${num }
													</td>
													<td>
														${mr.memReptContent }
													</td>
													<td>
														<c:url var="memDetail" value="memDetail.ij">
															<c:param name="memberId" value="${fn:split(mr.reporterId,'/')[0]}"/>
														</c:url>
														<a href="${memDetail }"> ${mr.reporterId} </a>
													</td>
													<td>
														${mr.memReptStatus}
													</td>
													<td>
														${mr.memReptDate}
													</td>
													<td>
														<c:if test='${!mr.memReptStatus.equals("미처리")}'>
															<input type="checkbox" disabled='true'>
														</c:if>
														<c:if test='${mr.memReptStatus.equals("미처리")}'>
															<input type="checkbox" name="memReptNo" value="${mr.memReptNo }">
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
							
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
	
	<script>
		function setMemStatusCode() {
			var currStatusCode = "${member.memberStatusCode}";
			var currStatus
			if(currStatusCode == 1) currStatus = "일반";
			else if(currStatusCode == 2) currStatus = "경고";
			else if(currStatusCode == 3) currStatus = "탈퇴";

			var changeStatusCode = $("#memStatusSelect").val();
			var changeStatus;

			if(changeStatusCode == 1) changeStatus = "일반";
			else if(changeStatusCode == 2) changeStatus = "경고";
			else if(changeStatusCode == 3) changeStatus = "탈퇴";
			
			if(currStatusCode == changeStatusCode) {
				alert("현재 등급과 같은 등급으로 변경이 불가합니다.");
				return false;
			}
			
			if(!confirm("${member.memberId} 회원의 등급을 " + 
					currStatus + " -> " + changeStatus + " 변경하시겠습니까?" )) 
				return false;
			
			location.href="setMemStatus.ij?memberId=${member.memberId}&statusCode=" + changeStatusCode;
		}
	
		
		function processReport() {
			if(!confirm("선택한 모든 신고내역의 그룹 회원 상태를 변경하시겠습니까?")) return;
			
			var reptNoList = "";
			var length = $("input[name=gMemReptNo]:checked").length;
			var gMember =[];
			for(var i=0;i<length;i++){
				
			}
			
			$("input[name=gMemReptNo]:checked").each(function(i){
				reptNoList += $(this).val() + ",";
			});
			reptNoList = reptNoList.slice(0, -1);
			console.log(reptNoList);

			location.href="updateGroupMemLevel.ij?memberId=${member.memberId}&reptNoList=" + reptNoList;
			
		}
		
		$(function() {
			$("#allReptChk").click(function() {
				if($("#allReptChk").is(":checked")) 
					$("input[name=memReptNo]").prop('checked', true);
		        else  
					$("input[name=memReptNo]").prop('checked', false);
			});
		});
	
	</script>

</body>
</html>