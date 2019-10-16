<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#group-btn-member {
	background-color: #17A2B8 !important;
	color: #FFFFFF !important;
}
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/group/groupMember-style.css" type="text/css">
<title>Insert title here</title>
</head>
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
				
				<div id="member-container">
					<h1 align="center">현재 회원</h1>
					
					<c:if test="${groupMemberCode eq 0 or groupMemberCode eq 1 }">
					<h5 align="right">
						<a href="wgmlist.ij">대기중인 명단</a>
					</h5>
					</c:if>
					<c:forEach var="m" items="${ list }">
						<div id="member-part">
							<div id="member">
								<div id="member-image" class="rounded-circle">
									<img src="${contextPath}/resources/images/profile.png" alt="" class="rounded-circle">
								</div>
								
								<div id="member-name">
									<span id="name">${ m.memberName }</span>
									
								</div>
								
								<div id="member-level" class="${m.levelCode }">
									<c:if test="${ m.levelCode == 0 }">
										<c:set var="member" value="모임장"/>
									</c:if>
									<c:if test="${ m.levelCode == 1 }">
										<c:set var="member" value="매니저"/>
									</c:if>
									<c:if test="${ m.levelCode == 2 }">
										<c:set var="member" value="일반회원"/>
									</c:if>
									<span id="level">${ member }</span>
								</div>
				
								<div id="member-button">
								<c:if test="${groupMemberCode eq 0 or groupMemberCode eq 1 }">
								<button id="${m.memberId }" type="button" class="btn btn-primary levelBtn" data-toggle="modal" data-target="#exampleModalCenter1">회원등급</button>
			
								</c:if>
			
									
									<input type="hidden" value="${m.memberId }">
									<input type="hidden" value="${m.memberName }">
									<button type="button" class="btn btn-primary reportBtn" id="member-btn-report">신고하기</button>
								</div>
							</div>
						</div><br>
					</c:forEach>
				</div>
			</div>
			<!-- Modal -->
									<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									    	<form action="memlevel.ij">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLongTitle" style="float: left;">회원등급</h5>
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          <span aria-hidden="true" >&times;</span>
										        </button>
										      </div>
										      <div class="modal-body">
										        <div class="div1">
													<input type="text" readonly name="memberId">							
												</div>
												<div class="div2" style="margin-top: 10%">
													모임장<input type="radio" name="levelCode" value="0">
													매니저<input type="radio" name="levelCode" value="1">
													일반회원<input type="radio" name="levelCode" value="2">
												</div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
										        <button type="submit" class="btn btn-primary">수정</button>
										      </div>
											</form>      
									    </div>
									  </div>
									</div>
			<script type="text/javascript">
			      /* $(".reportBtn").click(function(e){
			             console.log($(this).prev().val()); 
			             
			             var $reportForm = $("<form>");
			             $reportForm.attr("action","rboardInsertForm.ij").attr("method","post");
			             
			             //var $inputTag = $("input").attr("type","hidden").attr("value", $(this).prev().val());
			             
			             $reportForm.append($(this).prev());
			             
			             $(this).after($reportForm);
			             
			             $reportForm.submit(); 
			          });  
					 */
					 
					$(".levelBtn").on('click',function () {
						var memberId = $(this).attr("id");
						console.log(memberId);
						
						$("input[name=memberId]").val(memberId); 
						
						var levelCode = $(this).parent().prev().attr('class');
						$.each($("input[name=levelCode]"), function(k, v){
							if(v.value == levelCode) {
								v.setAttribute('checked',true);
							}
						});
						
						
					});
			 
			      $(".reportBtn").click(function(e){
			             //alert($(this).prev().val()); 
			             
			             var $reportForm = $("<form>");
			             $reportForm.attr("action","rboardInsertForm.ij").attr("method","post");
			             
			             var memberId = $("<input name='memberId' value='" + $(this).prev().prev().val()+"'>");
			             var memberName = $("<input name='memberName' value='" + $(this).prev().val()+"'>");
			             $reportForm.append(memberId);
			             $reportForm.append(memberName);
			             console.log("아이디: " + $(this).prev().val());
			             $(this).after($reportForm);
			             
			            $reportForm.submit();
			            
			            
			         });  
					 
		
					 
				
			</script>

			<div class="col-md-1 aside">
				<div id="groupChatWrapper">
					<%@ include file="/WEB-INF/views/chat/chat.jsp"%>
				</div>
			</div>
		</div>

		<div class="row" id="footer-wrapper">
			<div class="col-md-12" id="all-footer"></div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>