<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			display: block;
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
	
	</style>



</head>
<body>
	<c:set var="proPath" value="resources/memUploadFiles"/>
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
									<td class='basicInfoContent'>${member.memberEnrollDate }</td>
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
	                            			${member.memberBirthday }"
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
	                            			${member.memberIntroduce }"
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
						
						<div class="col-md-12">
							<span class="tableLabel"> >> &nbsp; 가입 모임 정보</span>
							<div class="tabbable" id="memGroupTab">
								<ul class="nav nav-tabs">
									<li class="nav-item">
										<a class="nav-link active show" href="#hostTap" data-toggle="tab">개설 모임</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#joinTab" data-toggle="tab">가입 모임</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="hostTap">
										<table class="table">
											<thead>
												<tr>
													<th>
														그룹네임
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
											</tbody>
										</table>
									</div>
									<div class="tab-pane" id="joinTab">
										<p>
											Howdy, I'm in Section 2.
										</p>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>