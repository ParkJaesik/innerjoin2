<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- <link rel="stylesheet" href="resources/css/album/album-detail.css"/> -->
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<%-- <%@ include file="../group/groupMenubar.jsp" %> --%>
        <div class="container-fluid al-wrapper">
            <div class="row al-header">
                <div class="col-md-3 al-info">
                    <h5>${album.albumModifyDate}</h5>
                    <h6>by. ${album.memberId}</h6>
                </div>
                <div class="col-md-4 al-title">
                    <h1 align="right">${album.albumTitle}</h1>
                </div>
                <div class="col-md-5 al-list">
                    <div style="width: 50px; height: 50px; overflow: hidden; float:right; margin-left:10px;padding-right:0;">
                        <img src="resources/images/album/list.png" onclick="goList();">
                    </div>
                    <div style="width: 30px; height: 30px; overflow: hidden; float:right; padding:5px;">
                        <img src="resources/images/album/delete.png" onclick="goDelete();">
                    </div>
                    <div style="width: 30px; height: 30px; overflow: hidden;float:right; padding:5px;">
                        <img src="resources/images/album/edit.png" onclick="goEdit();">
                    </div>
                </div>
            </div>
            <div class="row photo">
                <div class="col-md-12 al-photo" style="/* width: 100%; min-height: 500px;  */overflow: hidden">
								<div class="carousel slide" id="carousel-744270">
								
									<ol class="carousel-indicators">
										<c:forEach var="p" begin="0" end="${fn:length(list)}" step="1" varStatus="status">
											<c:choose>
												<c:when test="${status.first}">
													<li data-target="#carousel-744270" class="active">
													</li>
												</c:when>
												<c:otherwise>
													<li data-target="#carousel-744270">
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach> 
									</ol>
									
									<div class="carousel-inner">
									
										<c:forEach var="p" items="${list}" begin="0" end="${fn:length(list)}" step="1" varStatus="status">
											<c:choose>
												<c:when test="${status.first}">
													<div class="carousel-item active">
														<img alt="Carousel Bootstrap First" src="resources/auploadFiles/${p.photoRename}" />
													</div>
												</c:when>
												<c:otherwise>
													<div class="carousel-item">
														<img alt="Carousel Bootstrap First" src="resources/auploadFiles/${p.photoRename}" />
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									
									</div> <a class="carousel-control-prev" href="#carousel-744270" data-slide="prev" ><span class="carousel-control-prev-icon" style="color:black;"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-744270" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
								</div>
                </div>
            </div>
            <div class="row reply">
                    <div class="col-md-12">
                        <div class="row re-input">
                            <div class="col-md-12 re-txtarea">
                                <textarea id="rContent" rows="3" cols="110" placeholder="comment..."></textarea>
                            </div>
                            <div class="col-md-1 re-submit-btn">
                                <button class="submit-btn">submit</button>
                            </div>
                        </div>

                        <div class="row re-list">
                            <div class="col-md-12" style="padding:10px !important;">
                                <p style="font-size:20px; font-weight:500">Comment</p>
                                <hr>
                                <div class="row" id="re-info">
                                    <div class="col-md-3">
                                        user01
                                    </div>
                                    <div align="right" class="col-md-7">
                                        2019-09-24, 16:39 pm
                                    </div>
                                    <div class="col-md-1">
                                        <img src="resources/images/album/edit.png">
                                    </div>
                                    <div class="col-md-1">
                                        <img src="resources/images/album/delete.png">
                                    </div>
                                </div>
                                <hr>
                                <div class="row" id="re-content">
                                    <div class="col-md-12">
                                        sdjfhsdoifsdjfdjdddddddddddddddddddsssssssffffssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="row footer">
                <div class="col-md-1 delete">
                </div>
                <div class="col-md-10">
                </div>
                <div class="col-md-1 modify">
                </div>
            </div>
        </div>

           <!-- The Modal -->
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
            	<span class="close">&times;</span>  
              	<div class="modal-img-wrapper">
                	<img>
              	</div>
            </div>
       
        </div>
      
        <script type="text/javascript">
        // Get the modal
            var modal = document.getElementById('myModal');
            
            // Get the button that opens the modal
            //var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];                                          

            // When the user clicks on the button, open the modal 
            $(".al-photo img").click(function() {
                console.log($(this).attr('src'));
                var modalSrc = $(this).attr('src');
                $(".modal-img-wrapper img").attr("src",modalSrc)
                modal.style.display = "block";
            });

            // When the user clicks on <span> (x), close the modal
            $(".modal-content img, .close").click( function() {
                modal.style.display = "none";
            })

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            
            $(".carousel").carousel({
            	interval:false
            });
            
            $(".submit-btn").click(function(){
            	var arContent = $("#rContent").val();
            	var albumNo = ${album.albumNo};
            	
    			$.ajax({
    				url: "addReply.ij",
    				data : {arContent : arContent, albumNo : albumNo},
    				type : "post",
    				success : function(data){
    					if(data == 'success'){
    						
    						// 댓글 작성 부분 초기화
    						alert("댓글 등록 성공!");
    						$("#rContent").val("");
    						getReplyList(albumNo);
    					}
    				},
    				error : function(e){
    					console.log("Ajax 통신 실패");
    				}
    			});
            });
            
    		// 댓글 리스트 조회 함수
    		function getReplyList(albumNo){
    			$.ajax({
    				url : "rList.ij",
    				data : {albumNo : albumNo},
    				dataType : "json",
    				success : function(list){
    					var $reInfo = $("#re-info");
    					var $reContent = $("#re-content");
    					
    					/* $("#rCount").text("댓글("+ list.length +")"); */
    					
    					var $arWriter;
    					var $rCreateDate;
    					var $edit-box = $("<div class='col-md-1'>");
    					var $edit = $("<img src='resources/images/album/edit.png'>");
    					var $delete-box = $("<div class='col-md-1'>");
    					var $delete = $("<img src='resources/images/album/delete.png'>");
    					var $arContent;
    					
    					if(list.length > 0){
    						// 댓글 목록 출력
    						// rWriter -> width=100px
    						// rCreateDate -> width=100px
    						$.each(list,function(i,v){
    							$arWriter = $("<div class='col-md-3'>").text(list[i].arWriter);
    							$arCreateDate = $("<div align='right' class='col-md-7'>").text(list[i].arCreateDate);
    							$edit-box.append($edit);
    							$delete-box.append($delete);
    							$arContent = $("<div class='col-md-12'>").text(list[i].arContent);
    							if ('${loginUser.id}' == list[i].arWriter){
    								$arWriter.css("color","red");
    							}
    							$reInfo.append($arWriter).append($arCreateDate).append($edit-box).append($delete-box).append("<hr>");
    							$reContent.append($arContent);
    							$('.re-list').children('.col-md-12').append($reInfo).append($reContent);
    						});
    					}else{ // 댓글이 없는 경우
    						$tr = $("<tr>");
    						$rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
    						$tr.append($rContent);
    						$tableBody.append($tr);
    					}
    					
    				}
    			});
          
            function goList(){
            	
            	location.href="albumListView.ij?groupNo="+${album.groupNo} + "&page=" + ${currentPage};
            }
            
            function goEdit(){
            	location.href="updateAlbumForm.ij?groupNo="+${album.groupNo} + "&page=" + ${currentPage} +"&albumNo="+${album.albumNo};
            	
            }
            
            function goDelete(){
            	if(window.confirm("정말 삭제 하시겠습니까?")){
            		location.href="deleteAlbum.ij?groupNo=${album.groupNo}+&albumNo=+${album.albumNo}";
            	}
            }
        </script>
               
</body>
</html>