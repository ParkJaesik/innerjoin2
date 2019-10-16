<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/album/album-list.css"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

</head>

<body>
<%-- <%@ include file="../group/groupMenubar.jsp" %> --%>
 <script>
 	console.log('groupNo:'+'${groupNo}'); 
 	console.log('currentPage:'+'${pi.currentPage}'); 
 </script>
	<div class="container-fluid wrapper">
		<!-- <div class="row">
			<div class="col-md-12 mid_wrapper"> -->
				<div class="row header">
					<div class="col-md-12">
						<h1>${group.gName } - album</h1>
					</div>
				</div>
				<div class="row section">
					<div class="col-md-12 padding_top">
					<%-- <% for(int i= 0; i < 6; i++){ %> --%>
					<c:if test="${empty list}">
						<h4>등록된 앨범이 없습니다</h4>
					</c:if>
					<c:forEach var="a" items="${ list }">
						<div class="preview-box">
							<c:url var="adetail" value="bdetail.kh">
								<c:param name="albumNo" value="${ a.albumNo }"/>
								<c:param name="page" value="${ pi.currentPage }"/>
							</c:url>
							<div class="img-box">
								<img src="resources/auploadFiles/${ a.albumThumbnail}" onclick="goDetail(${a.albumNo});">
							</div>
							<c:choose>
								<c:when test="${ fn:length(a.albumTitle) gt 15}">
									<h4 onclick="goDetail(${a.albumNo});"><c:out value="${fn:substring(a.albumTitle, 0, 15)}"></c:out>...</h4>
								</c:when>
								<c:otherwise>
									<h4 onclick="goDetail(${a.albumNo});"><c:out value="${a.albumTitle}"></c:out></h4>
								</c:otherwise>
							</c:choose>
							<p>by. ${a.memberName}</p>
						</div>
					<%-- <% } %> --%>
					</c:forEach>
					</div>
				</div>
				<div class="row footer">
					<c:if test="${!empty list}">
					<div class="col-md-11" style="min-width:50px; min-height:50px;">
						<!-- 페이징 처리 -->
						<table align="center">
						<tr align="center" height="20">
							<td colspan="6">
							
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									<i class="material-icons">keyboard_arrow_left</i> &nbsp;
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="albumListView.ij">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
										<c:param name="groupNo" value="${groupNo}" />
									</c:url>
									<a href="${ before }"><i class="material-icons">keyboard_arrow_left</i></a> &nbsp;
								</c:if>
								
								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq currentPage }">
										<font color="red" size="4"><b>[${ p }]</b></font>
									</c:if>
									
									<c:if test="${ p ne currentPage }">
										<c:url var="pagination" value="albumListView.ij">
											<c:param name="page" value="${ p }"/>
											<c:param name="groupNo" value="${groupNo}" />
										</c:url>
										<a href="${ pagination }">${ p }</a> &nbsp;
									</c:if>
								</c:forEach>
								
								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<i class="material-icons">keyboard_arrow_right</i>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="after" value="albumListView.ij">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
										<c:param name="groupNo" value="${groupNo}" />
									</c:url> 
									<a href="${ after }"><i class="material-icons">keyboard_arrow_right</i></a>
								</c:if>
							</td>
						</tr>
						</table>
					</div>
					</c:if>
					<div class="col-md-1" style="width:50px; height:50px;">
						<img src="resources/images/album/upload-button.png">
					</div>
				</div>
				
		<!-- </div>
		</div> -->
	</div>
	

	
	<script>
 
    

		function goDetail(albumNo){
			console.log(albumNo);
			location.href="albumDetailView.ij?albumNo="+albumNo + "&page=" + ${pi.currentPage}; 
		}
	
        $(".al-list img").click(function(){
        	location.href="albumListView.ij?page=" + ${currentPage} +"&groupNo=" + ${groupNo};
        });
        
        $(".footer img").click(function(){
        	location.href="addAlbumForm.ij?page=" + ${pi.currentPage} +"&groupNo=" + ${groupNo};
        });
		/* $(".section img").click(function(){
			location.href="albumDetailView.ij";
		}); */
	</script>
</body>
</html>