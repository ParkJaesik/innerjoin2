<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 * {
	font-family: 'Noto Sans KR', sans-serif;
	color: rgb(50, 50, 50);
}

div {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}




.content-wrap{
	margin: auto;
	/* margin-top: 3%; */
	width: 70%;
	height: 100%;
}

h3 {
/* 	margin: 0 0 50px 0; */
	font-weight: bold;
	margin: auto;
}

.div2 {
	margin: auto;
	width: 100%;
	min-height: 100px;
	margin-bottom: 5%;
	margin-top: 5%;
}

table{
	margin: auto;
	width: 100%;
	
}

#report-th-no {
	width: 2%;
}

#respond-th{
	width: 20%;
}

#report-th{
	width: 20%;
}

#report-th-content {
	width: 30%;
}
#report-th-date{
	width: 20%;
}

.div2 td {
	height: 30px;
	font-size: 12px;
	border-bottom: 2px solid rgb(190, 190, 190);
}

#report-td-content {
	padding-left: 30px;
}

.div3{
	margin-top: 10%;
}

.div4 {
	width: 100%;
	height: 40px;
	text-align: center;
	margin-top: 5%;
	
}
.div4 a {
	color: rgb(50, 50, 50);
	font-size: 12px;
}

.mreport{
	float: right;
	margin-right: 2%;

}




</style>
</head>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />


<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
<!-- 추가한것 -->
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
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
		                <h3>신고</h3>
		            </div>
		            
		            <div class="div2">
		                <table align="center">
		                    <tr>
		                        <th align="center" id="report-th- no">no</th>
		                        <th align="center" id="report-th">신고자</th>
		                        <th align="center" id="respond-th">신고받은 사람</th>
		                        <th align="center" id="report-th-content">신고내용</th>
		                        <th align="center" id="report-th-date">날짜</th>
		                    </tr>
		                    
		                    <c:forEach var="r" items="${blist }">
			                    <tr>
			                        <td align="center" id="report-td-no">${r.rNo }</td>
			                        <td align="center" id="report-td">${r.reportId }</td>
			                        <td align="center" id="respond-td">${r.responId }</td>
			                        <td align="center" id="report-td-content">
			                        <c:url var="rdetail" value="rdetail.ij">
			                        	<c:param name="rNo" value="${ r.rNo }"/> 
			                        </c:url>
			                        <a href="${rdetail}">${r.rCategory }</a></td>
			                        <td align="center" id="report-td-date">${r.rDate }</td>
			                    </tr>
		                    </c:forEach>
		                </table>
		            </div>
		            <div class="mreport">
		            	<c:url var="gogmlist" value="gmrcount.ij">
		            		<c:param name="gNo" value="${group.gNo }"></c:param>
		            	</c:url>
		                <label><a href="${gogmlist}">신고 회원 보기</a></label>
		            </div>
		            
		            <!-- 게시물 검색하기 -->
		            <div class="div3" align="center">
		                <form action="bsearch.ij" name="searchForm" method="get">
		                    <select id="searchSel">
		                        <option value="all" <c:if test="${search.searchSel == 'all' }" >selected</c:if>>전체</option>
		                        <option value="rept" <c:if test="${search.searchSel == 'rept' }" >selected</c:if>>신고자</option>
		                        <option value="resp" <c:if test="${search.searchSel == 'resp' }" >selected</c:if>>신고받은 사람</option>
		                        <option value="category" <c:if test="${search.searchSel == 'category' }" >selected</c:if>>신고내용</option>
		                    </select>
		                    <input type="text" name="searchText" value="${search.searchText }">
		                    <button id="searchBtn">검색</button>
		                </form>
		                
		            </div>
		            
		            <!-- 페이징 처리 -->
		            <div class="div4">
		            	<c:if test="${pi.currentPage <= 1 }">
		            		 &lt; &nbsp;
		            	</c:if>
		            	
		            	<!-- 이전 -->
		            	<c:if test="${pi.currentPage >1 }">
		            		<c:url var="before" value="rblist.ij">
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
		            			<c:url var="paginaion" value="rblist.ij">
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
		            		<c:url var="after" value="rblist.ij">
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

</body>
</html>