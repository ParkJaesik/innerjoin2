<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <!-- <link rel="stylesheet" href="resources/css/album/album-add.css"/> -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>        
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Insert title here</title>
 
</head>
<body>
<%-- <%@ include file="../group/groupMenubar.jsp" %> --%>

	<div class="container-fluid add-wrapper">
		<!-- <div class="row"> -->
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<h1 align="center">앨범 추가</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div id="album_attach" class="col-md-8">
								<h2 display="inline-block">앨범이름</h2>
								<input type="text" class="form-control" name="albumTitle" maxlength="50" placeholder="title" required><br>
								<h2 display="inline-block">사진추가</h2>
								<div class="custom-file">
									<input id="uploadInputBox" class="custom-file-input"  aria-describedby="inputGroupFileAddon01"  type="file" name="filedata" multiple />	
									<label class="custom-file-label" for="uploadInputBox">Choose file</label>
								</div>
							</div>
							<div class="col-md-4">
								<button class="submit float_right btn btn-warning">앨범등록</button>
								<button id="cancel" class="float_right btn btn-warning">등록취소</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div id="preview" class="col-md-12">
					</div>
					<!-- multipart 업로드시 영역 -->
                	<form id="uploadForm" action="addPhoto.ij" method="post" style="display: none;" enctype="multipart/form-data"/>
				</div>
			</div>
		<!-- </div> -->
	</div>
	
	      <script>
            //임의의 file object영역
            var files = {};
            var previewIndex = 0;
     
            // image preview 기능 구현
            // input = file object[]
	        function addPreview(input) {
	            if (input[0].files) {
	                //파일 선택이 여러개였을 시의 대응
	                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	                    var file = input[0].files[fileIndex];
	                    if(validation(file.name)) continue;
	                    setPreviewForm(file);
	                }
	            } else
	                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	        }
	        
	        function setPreviewForm(file, img){
	            var reader = new FileReader();
	            
	            //div id="preview" 내에 동적코드추가.
	            //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	            reader.onload = function(img) {
	                var imgNum = previewIndex++;
	                $("#preview").append(
	                        "<div class=\"preview-box\" value=\"" + imgNum +"\">" +
	                        "<div><img class=\"thumbnail\" src=\"" + img.target.result + "\"\/></div>" +
	                        "<p>" + file.name + "</p>" +
	                        "<a href=\"#\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">" +
	                        "삭제" + "</a>"
	                        +
	                        "</div>"
	                );
	                //resizeHeight();
	                files[imgNum] = file;
	                
	                console.log(files[imgNum]);
	            };
	            
	            reader.readAsDataURL(file);
	        }

            //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
            function deletePreview(obj) {
                var imgNum = obj.attributes['value'].value;
                console.log("삭제하려는 요소")
                console.log(files[imgNum]);
                
                console.log("삭제 전 files 객체");
				console.log(files);
               
                console.log("삭제 후 files 객체");
				delete files[imgNum];	
                console.log(files);
                
                
                $("#preview .preview-box[value=" + imgNum + "]").remove();
                //console.log(files[imgNum-1]);
                console.log(Object.keys(files).length);
                //console.log(--previewIndex);
                //resizeHeight();
            }
     
            //client-side validation
            //always server-side validation required
            function validation(fileName) {
                fileName = fileName + "";
                var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
                var fileNameExtension = fileName.toLowerCase().substring(
                        fileNameExtensionIndex, fileName.length);
                if (!((fileNameExtension === 'jpg') || (fileNameExtension === 'jpeg')
                        || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                    alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                    return true;
                } else {
                    return false;
                }
            }
     
            $(document).ready(function() {
                //submit 등록. 실제로 submit type은 아니다.
                $('.submit').on('click',function() {                        
                    var form = $('#uploadForm')[0];
                    var formData = new FormData(form);
        
                    var title = $("input[name=albumTitle]").val();
                    console.log(form);
                    console.log(title);
                    console.log(formData.get("files"));
                    
                   
                  if(title.length < 1){
                	  alert('제목을 입력해주세요');
                	  return false;
                  }
                    
                  if(Object.keys(files).length == 0){
                	  alert('이미지를 업로드 해주세요');
                	  return false;
                  }
                  
                  for(var index in files){
                	  console.log(files[index]);
                      formData.append('files',files[index]);
                  }
                  
                  var groupNo = ${group.gNo};
                    formData.append("albumTitle",title);
                    formData.append("groupNo",groupNo);
                    formData.append("memberId",'${loginUser.memberId}');
/* 			        for (var value of formData.get("files")) {

                    	  console.log(value);

                    } */
			        
			        console.log(formData.get("title"));
			        /* console.log(formData.get("files")); */
			        
			        
			        /* websocket 관련 필요 코드 */
         			var loginUserId = "${loginUser.memberId}";
         			var loginUserName = "${loginUser.memberName}";
         			var gName = "${gName}";
         			
         			
         			
         			
         			
		              //ajax 통신으로 multipart form을 전송한다.
  	                $.ajax({
	                    type : 'POST',
	                    enctype : 'multipart/form-data',
	                    processData : false,
	                    contentType : false,
	                    cache : false,
	                    timeout : 600000,
	                    url : 'addPhoto.ij',
	                    dataType : 'JSON',
	                    data : formData,
	                    success : function(result) {
	                        //이 부분을 수정해서 다양한 행동을 할 수 있으며,
	                        //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
	                        //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
	                        if (result === -1) {
	                            alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
	                            // 이후 동작 ...
	                        } else if (result === -2) {
	                            alert('파일이 10MB를 초과하였습니다.');
	                            // 이후 동작 ...
	                        } else {
	                            alert('이미지 업로드 성공');
	                            // 이후 동작 ...
	                            // 알람을 위한 채팅 동작.
	                            
	                            /* websocket 관련 필요 코드 */
	                            
	                            socket.send("albumInsert,"+loginUserId+","+loginUserName+","+gName);
	                            
	                           goList();
	                        }
	                    }
	                    //전송실패에대한 핸들링은 고려하지 않음
	                });  
                }); 
                // <input type=file> 태그 기능 구현
                $('#uploadInputBox').change(function() {
                    addPreview($(this)); //preview form 추가하기
                });
            });
            
            function goList(){
            	
            	location.href="albumListView.ij?groupNo="+${groupNo} + "&page=" + ${currentPage};
            }
            
            $(function(){
	            $("#cancel").click(function(){
	            	 location.href="albumListView.ij?groupNo=${groupNo} + &page=${currentPage}";
	            	 console.log('groupNo : +${groupNo}');
	            	 console.log('currentPage : +${currentPage}');
	            });
            });
            
            
        </script>
</body>
</html>