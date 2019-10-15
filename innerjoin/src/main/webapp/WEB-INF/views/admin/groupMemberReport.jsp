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
	<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
		table{
			width:100%;
		}
		
		#reportMsg{
	
	    width: 100%;
    	resize: none;
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
				<li class="active">신고관리</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">모임회원신고</h1>
			</div>
		</div><!--/.row-->

	<div class="row" class="memListArea">
			<div class="col-md-12">
				
				<h3 align="center">
					총 신고 수 : ${ pi.listCount }
				</h3>
				
				<table class="memListTable" align="center" border="1" cellspacing="0" width="900" id="tb">
					<tr>
						<th align="center">번호</th>
						<th align="center" >모임 번호</th>
						<th align="center" width="200px">모임 이름</th>
						<th align="center" width="200px">카테고리</th>
						<th align="center" width="200px">피신고인</th>
						<th align="center" width="200px">신고인</th>
						<th align="center" width="200px">처리 상태</th>
						<th align="center" width="200px">신고일</th>
						<th align="center" width="200px">신고처리일</th>
						<th align="center">관리하기</th>
					</tr>
					
					<c:if test="${!empty gmrList}">
						<c:forEach var="r" items="${ gmrList }" varStatus="status">
						<tr>
							<td align="center">${ status.count }</td>
							
							<td class="gNo"align="center">${ r.reportGNo }</td>
							<td align="left">
								<c:url var="groupDetail" value="groupDetail.ij">
									<c:param name="gNo" value="${ r.reportGNo }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${groupDetail}">${ r.gName }</a>
							</td>
							
							<td align="center">${r.rCategory }</td>
							<td class="memberId" id="${r.responId }" align="center">${r.responId }<br>
								
								<c:if	test="${r.levelCode eq 0}">모임장</c:if> 
								<c:if	test="${r.levelCode eq 1}">매니저</c:if> 
								<c:if	test="${r.levelCode eq 2}">일반</c:if>
								<c:if	test="${r.levelCode eq 3}">초대</c:if>
								<c:if	test="${r.levelCode eq 4}">신청</c:if>
								<c:if	test="${r.levelCode eq 10}">탈퇴</c:if>
							</td>
							<td align="center">${r.reportId }</td>
							<td align="center">${r.rBoardStatus }</td>
							<td align="center">${r.rDate}</td>
							<td align="center">${r.rStatusDate }</td>
							<td align="center" ><button id="${r.levelCode }" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">관리하기</button></td>
						</tr>
						</c:forEach>
					
					</c:if>
					<c:if test="${empty gmrList }">
						<tr><td>신고가 없습니다.</td></tr>
					</c:if>
					<!-- 페이징 처리 -->
					<tr align="center" height="20">
						<td colspan="10">
						
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
	  
	  
	  <!-- 모달 -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="gNo"></h5>번&nbsp;
		        <h5 class="modal-title" id="exampleModalCenterTitle">그룹 회원 관리</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	<div>
		       		<h4 align="center"></h4>
		       		<h3 align="center">
					회원 등급 조정
					</h3>
		       	</div>

						<select name="levelCode" class="custom-select custom-select-lg mb-3">
							<option value="0">개설자</option>
							<option value="1">매니저</option>
							<option value="2">일반</option>
							<option value="3">초대</option>
							<option value="4">신청</option>
							<option value="10">탈퇴</option>
						</select>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="manageBtn">변경하기</button>
		      </div>
		    </div>
		  </div>
		</div>
	<script>
		window.onload = function () {
			$("#manageReport").addClass("active");
			$("#manageReport>a").collapse('show');
			$("#groupReport").addClass("active");
		};
		
		$(function(){
			
			$(".btn-primary").click(function(){
				var memberId = $(this).parent().parent().children('.memberId').attr('id');
				var groupNo = $(this).parent().parent().children('.gNo').text();
				var level = $(this).attr('id'); 
				$("select[name=levelCode] option[value=" + level + "]").attr("selected", "selected");
				$(".modal-body h4").text(memberId);
				$(".modal-header").children('#gNo').text(groupNo);
			/* 	$("select[name=levelCode] option").each(function(i){
					if($(this).val() == level){
						$(this).prop('selected',true);
					}
					console.log($(this));
				});
				 */
			});
			
			$("#manageBtn").click(function(){
				
				var levelCode = $("select[name=levelCode] option:selected").val();
				var groupNo2 = $(".modal-header").children('#gNo').text();
				var memberId2 = $(".modal-body h4").text();
				
				console.log("memberId : "+memberId2 +", groupNo: " + groupNo2 + ", levelCode : " + levelCode);
				if(confirm("변경하시겠습니까?")){
					$.ajax({
						url: "updateGroupMemLevel.ij",
						data : {memberId : memberId2,groupNo:groupNo2,levelCode:levelCode},
						type : "post",
						success : function(data){
							if(data == 'success'){
								alert('변경되었습니다.');
							}else{
								alert('변경 실패');
							}
						},
						error : function(e){
							console.log("Ajax 통신 실패");
						}
					});
				}
				
			});
		});
		
		function selectCode(memberId,groupNo){
			$.ajax({
				url: "adGroupMemSelectCode.ij",
				data : {memberId : memberId,groupNo:groupNo},
				type : "post",
				success : function(code){
					if(code != null){
						return code;
					}else{
						alert('그룹회원 등급 조회 실패');
					}
				},
				error : function(e){
					console.log("Ajax 통신 실패");
				}
			}); 
		}
	</script>
	
</body>
</html>
