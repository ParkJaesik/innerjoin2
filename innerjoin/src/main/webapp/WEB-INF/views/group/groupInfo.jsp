<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#group-btn-index {
	background-color: #17A2B8 !important;
	color: #FFFFFF !important;
}
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/group/groupInfo-style.css" type="text/css">

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
				
				<div id="group-main-container">
					<div id="left-container">
						<div id="left-content">
							<div id="group-main-info-container">
								<h1>모임 소개</h1>
								<div id="group-main-info">${ group.gInfo }</div>
							</div>
							<div id="group-main-new-container">
								<h1>NEW</h1>
								<div id="group-main-new">
									<c:if test="${empty board}">
										새 글이 없습니다.
									</c:if>
									<c:forEach var="b" items="${ board }">
											<div class="row board">
														<div class="col-md-3">
														${b.boardCreateDate } <c:url var="boardDetail" value="bdetail.ij">
															<c:param name="boardNo" value="${ b.boardNo }" />
															<c:param name="page" value="${ pi.currentPage }" />
														</c:url>
														</div>
														<div class="col-md-9" align="right">
														<a href="${ boardDetail }">${ b.boardTitle }</a>
														</div>
														<hr>
											</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
			
					<div id="right-container">
						<div id="right-content">
							<div id="group-main-event-container">
								<h1>예정된 이벤트</h1>
								<c:if test="${empty event}">
									<div class="row detailWrapper" style="align:center">
										<div class="col-md-12">
											<div class="row eventDetail detailView_127">
												<div class="col-md-12">
													<div class="row eventTitle">
													예정된 이벤트가 없습니다.
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:forEach var="e" items="${ event }">
									<%-- <div id="group-main-event">
										<span style="font-weight:bold">${ e.eTitle }</span>
									</div><br> --%>
									<div class="row detailWrapper" style="align:center">
										<div class="col-md-12">
											<div class="row eventDetail detailView_127">
												<div class="col-md-12">
													<div class="row eventTitle">
														<div class="col-md-9">
															<span class="eventLabel">${e.eTitle}</span>
														</div>
														<div class="col-md-3 eventClose">
															<span class="eventLabel">
																<!-- <img class="closeBtn detailView_127" alt="닫기" src="resources/images/close.png"> -->
																<%-- <c:if test="${groupMemberCode eq 0 or groupMemberCode eq 1 or groupMemberCode  eq 2}">
																<img id="${e.eno }" class="checkBtn detailView_127" alt="참석" src="resources/images/check.jpg">
																</c:if> --%>
															</span>
														</div>
														
													</div>
													<div class="row">
														<div class="col-md-8 eventContent">
															<span class="badge badge-default eventLabel">내용</span><span class="eventLabel">${e.eContent}</span>
																	<!-- <textarea>.....</textarea> -->
														</div>
														<div class="col-md-4 eventMember"><span class="badge badge-default eventLabel">참석회원</span><span class="eventMemberLabel"><span class="badge badge-dark eventLabel">${e.eMemCount }</span>&nbsp; / &nbsp;<span class="badge badge-dark eventLabel">${e.eLimit }</span></span>
													</div>
													<div class="row eventInfo">
															<div class="col-md-12">
																<div class="eventDay">
																	<span class="badge badge-default eventLabel">시간</span>
																	<div>
																		<span class="eventStart">${e.eStart}</span>
																		 - 
																		<span class="eventEnd">${e.eEnd}</span>
																	</div>
																</div>
																<div class="eventLocation"><span class="badge badge-default eventLabel">위치</span>
																	<address class="address"></address>
																</div>
																
															</div>
															
															
															
															
													</div>
												</div>
											</div>
										</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				$(function() {
					$(".address").text($("#group-area").text().split(':')[1]);
				});
		
			
			// eventDetailView에서 체크버튼 누르면 member_event table에 데이터 삽입.
			$(document).on('click', '.checkBtn', function(event) {
				
				location.href="calendar.ij"
			});
			
			</script>
		
			<div class="col-md-1 aside">
				<c:if test="${groupMemberCode == 0 or groupMemberCode == 1 or groupMemberCode  == 2}">
				<div id="groupChatWrapper">
					<%@ include file="/WEB-INF/views/chat/chat.jsp"%>
				</div>
				</c:if>
			</div>
		</div>

		<div class="row" id="footer-wrapper">
			<div class="col-md-12" id="all-footer"></div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>