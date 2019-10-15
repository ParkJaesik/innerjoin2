<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content-wrap{
	margin: auto;
	/* margin-top: 3%; */
	width: 70%;
	height: 100%;
}

	
	#outBtn{
	display: none;
	}


</style>

</head>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<title>Insert title here</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
	
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />	

	
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
				<%-- <jsp:include page="/WEB-INF/views/album/albumListView.jsp"></jsp:include> --%>
				<div class="content-wrap">
		            <div class="div1">
		                <h3>모임관리</h3>
		                
		            </div>
		            <div class="div2">
		            	<c:url var="gorlist" value="rblist.ij"></c:url>
		                <label><a href="${gorlist}">신고 게시글 보기</a></label>
		            </div>
		            
		            <div class="div3">
		                <table>
		                    <tr>
		                        <th align="center" id="respond-th">아이디</th>
		                        <th align="center" id="report-th-count">신고받은 횟수</th>
		                       	<!-- <th align="center" id="report-th-status">처리 상태</th>  -->
		                        <th align="center" id="report-th-out">강퇴하기</th>
		                    </tr>
		                    
		                    <c:forEach var="gmr" items="${gmList }">
		                    	
		            			<form name="dropForm" method="post">
			                    <tr>
			                    	<input type="hidden" name="memberId" value="${gmr.memberId}">
			                    	<input type="hidden" name="groupMemReptCount" value="${gmr.groupMemReptCount }">
			                    	<input type="hidden" name="groupNo" value="${gmr.groupNo }">
			                    	<input type="hidden" name="levelCode" value="${gmr.levelCode }">
			                    	<input type="hidden" name="memberName" value="${gmr.memberName }">
			                        <td align="center" id="respond-td">${gmr.memberId}</td>
			                        <td align="center" id="report-td-count">${gmr.groupMemReptCount}</td>
			                        <%-- <td align="center" id="report-td-status"><input type="hidden" name="rStatus" value="${rStatus }">${rStatus }</td>  --%>
			                       	
				                    <td align="center" id="report-td-out">
				                       	<c:if test="${gmr.groupMemReptCount >= 5 }">
						                    <button id="outBtn" name="outBtn" style="display: block;">강퇴하기</button>
				                       	</c:if>
					                </td>
			                    </tr>
				            	</form>
		                    </c:forEach>
		                </table>
		            </div>
		            <!-- 게시글 검색 -->
		            <div class="div4">      
		                <form action="gmrsearch.ij" name="searchForm" method="get">
		                    <select id="searchReptSel">
		                        <option value="all" <c:if test="${search.searchReptSel == 'all'}">selected</c:if>>전체</option>
		                        <option value="rId" <c:if test="${search.searchReptSel == 'reportId'}">selected</c:if>>아이디</option>
		                        <option value="rCount" <c:if test="${search.searchReptSel == 'rCount'}">selected</c:if>>신고받은횟수</option>
		                        <%-- <option value="rStatus" <c:if test="${search.searchReptSel == 'rStatus'}">selected</c:if>>처리상태</option> --%>
		                    </select>
		                    <input type="text" name="searchReptText" id="search">
		                    <button id="searchBtn">검색</button>
		                </form>
		            </div>
		            
		            <!-- 페이징 처리 -->
		            <div class="div5">
		                <c:if test="${pi.currentPage <= 1 }">
		            		 &lt; &nbsp;
		            	</c:if>
		            	<!-- 이전 -->
		            	<c:if test="${pi.currentPage >1 }">
		            		<c:url var="before" value="gmrlist.ij">
		            			<c:param name="page" value="${pi.currentPage-1 }"/>
		            		</c:url>
		            		<a href="${before }">&lt;</a> &nbsp;   
		            	</c:if>
		            	
		            	<!-- 페이지 -->
		            	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
		            		<c:if test="${ p eq currentPage }">
		            			<font size="4"><b>${p }</b></font>
		            		</c:if>
		            		
		            		<c:if test="${p ne currentPage }">
		            			<c:url var="paginaion" value="gmrlist.ij">
		            				<c:param name="page" value="${p }"/>
		            			</c:url>
		            			<a href="${pagination }">${p }</a> &nbsp;
		            		</c:if>
		        		</c:forEach>
		        		
		        		<!-- 다음 -->
		            	<c:if test="${pi.currentPage >= pi.maxPage }">
		            		&gt;
		            	</c:if>
		            	<c:if test="${pi.currentPage < pi.maxPage }">
		            		<c:url var="after" value="gmrlist.ij">
		            			<c:param name="page" value="${pi.currentPage + 1}"/>
		            		</c:url>
		            		<a href="${after }">></a>
		            	</c:if>
		            </div>
		        </div>
				
				
				
				

			</div>
			<div class="col-md-1 aside">
				<div id="groupChatWrapper">
					<%@ include file="/WEB-INF/views/chat/chat.jsp" %>	
				</div>
			</div>
		</div>
		<div class="row" id="footer-wrapper">
			<div class="col-md-12" id="all-footer">
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script type="text/javascript">
    	$("#outBtn").on("click", function () {
    		
    		
			if(confirm("정말 강퇴하시겠습니까?")){
				$("form").attr('action','gmDrop.ij');
				$("form").submit();
			}
			
		});
    
    </script>

</body>
</html>