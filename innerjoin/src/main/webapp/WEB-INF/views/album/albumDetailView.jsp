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
<!-- 	<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
	<%-- <script src='${contextPath }/resources/js/album/album-detail.js'></script> --%>
</head>
<body>
<%-- <%@ include file="../group/groupMenubar.jsp" %> --%>
<script>
        // Get the modal

        	$(function(){
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
            });

/*             
            $(".carousel").carousel({
            	interval:false
            }); */
            
        	
        

            
  
            $(function(){
            	getReplyList('${album.albumNo}');
            
        		// 댓글 리스트 조회 함수
        		function getReplyList(albumNo){
        			$.ajax({
        				url : "rList.ij",
        				data : {albumNo : albumNo},
        				dataType : "json",
        				success : function(list){
         					var $reBox = $(".reBox");
        					var $reInfo;
        					var $reContent;
        					var $arWriter;
							var $arCreateDate;
        					$reBox.children('div').html("");
        					
        					
        					if(list.length > 0){
        						// 댓글 목록 출력
        						// rWriter -> width=100px
        						// rCreateDate -> width=100px
        						$.each(list,function(i,v){
        							$reInfo = $("<div class='row' id='re-info'>");
                					$reContent = $("<div class='row' id='re-content'>");
        							$arWriter = $("<div class=\"col-md-3\">").text(list[i].arWriter);
        							$arCreateDate = $("<div align=\"right\" class=\"col-md-9\">").text(list[i].arCreateDate);

        							
        							if('${loginUser.memberId}' == list[i].arWriter){
        								/* var rId = list[i].arNo; */
        								$arCreateDate = $("<div align=\"right\" class=\"col-md-7\">").text(list[i].arCreateDate);
	        							var $editBox = $("<div class=\"col-md-1\">");
	        							var $edit = $("<img id=\""+list[i].arNo+"\" class='edit' src=\"resources/images/album/edit.png\">");
	        							var $deleteBox = $("<div class=\"col-md-1\">");
	        							var $delete = $("<img id=\""+list[i].arNo+"\" class='delete' src=\"resources/images/album/delete.png\">");
	        							
	        							$editBox.append($edit);
	        							$deleteBox.append($delete);
	        							if ('${loginUser.memberId}' == list[i].arWriter){
	        								$arWriter.css("color","red");
	        							}
	        							$reInfo.append($arWriter).append($arCreateDate).append($editBox).append($deleteBox).append($("<hr>"));
        							}else{
        								
	        							$reInfo.append($arWriter).append($arCreateDate);
        							}
        							
        							
        							$reBox.append($reInfo);
        							var $arContent = $("<div class=\"col-md-12\">").text(list[i].arContent);
        							$reContent.append($arContent);
        							console.log("info 등록");
        							$reBox.append($reContent);
        							console.log("content 등록");
        						});
        					}else{ // 댓글이 없는 경우
/*         						$tr = $("<tr>");
        						$rContent = $("<td colspan=\"3\">").text("등록된 댓글이 없습니다.");
        						$tr.append($rContent);
        						$tableBody.append($tr); */
        						$reInfo = $("<div class='row' id='re-info' align='center'>").text("등록된 댓글이 없습니다.");
        						$reBox.append($reInfo);
        					}
        					
        				}
        			});
        		}
        		
                $("#submit-btn").click(function(){
                	var arContent = $("#rContent").val();
                	var albumNo = ${album.albumNo};
                	var groupNo = ${album.groupNo};
                	alert(arContent + ", "+ albumNo + ", " + groupNo);
        			$.ajax({
        				url: "addReply.ij",
        				data : {arContent : arContent, albumNo : albumNo,groupNo : groupNo},
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
                
                
        		$(document).on("click",".delete",function(event){
    				if(confirm("정말 삭제하시겠습니까?")){
    			    	var albumNo = ${album.albumNo};
    			    	var groupNo = ${album.groupNo};
    			    	var arNo = $(this).attr('id');
    			    
    			    	alert(albumNo + ", " + groupNo + ", id = " + arNo);
    					$.ajax({
    						url: "deleteReply.ij",
    						data : {albumNo : albumNo, groupNo : groupNo, arNo:arNo},
							success: function(result){
								console.log(result);
	        					if(result == 'success'){
	        						
	        						// 댓글 작성 부분 초기화
	        						alert("댓글 삭제 성공!");
	        						getReplyList(albumNo);
	        					}
							},
    						error: function(e){
    							console.log(e);
    						}
    					});
    				}
    			});
        		
        		$(document).on("click",".edit",function(event){
    			    	var albumNo = ${album.albumNo};
    			    	var groupNo = ${album.groupNo};
    			    	var arNo = $(this).attr('id');
    			    
    			    	var $reBox = $("<div class=\"col-md-11\">");
    			    	var $txtArea =$("<textarea id='rContent' rows='3' cols='100' placeholder='comment...'>");
    			    	var $btnBox = $("<div class=\"col-md-1\">");
    			    	var $editBtn = $("<button id=\""+arNo+"\" class=\"re-edit\">");
    			    	var $cancelBtn = $("<button class=\"re-cancel\">");
    			    	$editBtn.text("수정");
    			    	$cancelBtn.text("취소");
    			    	$reBox.append($txtArea);
    			    	$btnBox.append($editBtn).append($cancelBtn);
    			    	
    			    	/* alert(albumNo + ", " + groupNo + ", id = " + arNo); */
    			    	$(this).parent().parent().next().append($reBox).append($btnBox);
    			    	var prevVal = $(this).parent().parent().next().children('.col-md-12').text();
    			    	/* alert(prevVal); */
    			    	$txtArea.html(prevVal);
    			    	$(this).css("display","none");
    			    	$(this).parent().parent().next().children('.col-md-12').css("display","none");
    			    	$txtArea.focus(); 
 
    				}
    			);
        		
        		$(document).on("click",".re-cancel",function(event){
        				$(this).parent().prev().prev().css("display","block");
        				$(this).parent().parent().prev().children().children().css("display","block");
 						$(this).parent().parent().children('.col-md-11').remove();
 						$(this).parent().parent().children('.col-md-1').remove();
    				}
    			);
        		
        		$(document).on("click",".re-edit",function(event){
        				var arContent = $(this).parent().prev().children().val();
        				var arNo = $(this).attr("id");
        				alert(arContent + ", id = " + arNo);
                    	var albumNo = ${album.albumNo};
                    	var groupNo = ${album.groupNo};
             			$.ajax({
            				url: "updateReply.ij",
            				data : {arContent : arContent, albumNo : albumNo,groupNo : groupNo,arNo : arNo},
            				type : "post",
            				success : function(data){
            					if(data == 'success'){
            						
            						// 댓글 작성 부분 초기화
            						alert("댓글 수정 성공!");
            						$(this).parent().parent().children('.col-md-11').remove();
             						$(this).parent().parent().children('.col-md-1').remove();
            						getReplyList(albumNo);
            					}
            				},
            				error : function(e){
            					console.log("Ajax 통신 실패");
            				}
            			}); 
    				}
    			);

            });
 
</script>

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
                    <c:if test="${ loginUser.memberId eq album.memberId }">
	                    <div style="width: 30px; height: 30px; overflow: hidden; float:right; padding:5px;">
	                        <img src="resources/images/album/delete.png" onclick="goDelete();">
	                    </div>
	                    <div style="width: 30px; height: 30px; overflow: hidden;float:right; padding:5px;">
	                        <img src="resources/images/album/edit.png" onclick="goEdit();">
	                    </div>
                    </c:if>
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
                                <button id="submit-btn" class="submit-btn">submit</button>
                            </div>
                        </div>

                        <div class="row re-list">
                            <div class="col-md-12 reBox" style="padding:10px !important;">
                                <p style="font-size:20px; font-weight:500">Comment</p>
                                <hr>
<!-- 	                            <div class="row" id="re-info">
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
                                </div>  -->
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
      

<script>
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