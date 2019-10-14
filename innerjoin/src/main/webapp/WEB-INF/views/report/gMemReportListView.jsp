


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<style type="text/css">
	.content {
	margin: auto;
	width: 900px;
	height: 100%;
	}
	
	#outBtn{
	display: none;
	}


</style>
</head>
<body>
<%@ include file="../group/groupMenubar.jsp" %>
	<div class="content">
        <div class="content-wrap">
            <div class="div1">
                <h3>신고</h3>
                
            </div>
            <div class="div2">
            	<c:url var="gorlist" value="rblist.ij"></c:url>
                <label><a href="${gorlist}">신고 게시글 보기</a></label>
            </div>
            
            <div class="div3">
            <form action="gmDrop.ij" name="dropForm" method="post">
                <table>
                    <tr>
                        <th align="center" id="respond-th">아이디</th>
                        <th align="center" id="report-th-count">신고받은 횟수</th>
                       	<!-- <th align="center" id="report-th-status">처리 상태</th>  -->
                        <th align="center" id="report-th-out">강퇴하기</th>
                    </tr>
                    
                    <c:forEach var="gmr" items="${gmList }">
	                    <tr>
	                        <td align="center" id="respond-td">${gmr.memberId}</td>
	                        <td align="center" id="report-td-count">${gmr.groupMemReptCount}</td>
	                        <%-- <td align="center" id="report-td-status"><input type="hidden" name="rStatus" value="${rStatus }">${rStatus }</td>  --%>
	                       	
		                    <td align="center" id="report-td-out">
		                       	<c:if test="${gmr.groupMemReptCount >= 5 }">
				                    <button id="outBtn" name="outBtn" style="display: block;">강퇴하기</button>
		                       	</c:if>
			                </td>
	                    </tr>
                    </c:forEach>
                </table>
            </form>
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