<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>        
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>

 
	#preview {
		width:1020px;
		
	}
	#preview img {
		max-width: 100%;
		max-height:75%;
		margin-left:auto;
		margin-right:auto;
	}
	
	#preview p {
		/*  text-overflow: ellipsis;*/
		overflow: hidden;
		
	}
	
	.preview-box {
		border: 1px solid;
		padding: 5px;
		border-radius: 2px;
		margin-bottom: 10px;
		float:left;
		width:30%;
		height:250px;
		
	}
	.footer{
		bottom: 100px;
		position : absolute;
		float:left;
	}
</style>
</head>
    <body>
 <!--        <form class="was-validated">
        <div class="custom-file container-fluid">
            <input multiple="multiple" type="file" class="custom-file-input" id="file" required>
            <label class="custom-file-label" for="file">Choose file...</label>
        </div>

        <div id="img">

        </div>
          </form> -->
        <div class="container-fluid">
            <div class="header">
                <h1>사진 첨부</h1>
            </div>
            <div class="body">
                <!-- 첨부 버튼 -->
                <div id="attach" class="custom-file">
                    <label class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진첨부</label>
                    <input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple />
                </div>
                
                <!-- 미리보기 영역 -->
                <div id="preview" class="content"></div>
                
                <!-- multipart 업로드시 영역 -->
                <form id="uploadForm" action="addPhoto.ij" method="post" style="display: none;" enctype="multipart/form-data"/>
            </div>
            <div class="footer">
                <button class="submit">등록</button>
            </div>
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
     
                        if (validation(file.name))
                            continue;
     
                        var reader = new FileReader();
                        reader.onload = function(img) {
                            //div id="preview" 내에 동적코드추가.
                            //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                            var imgNum = previewIndex++;
                            $("#preview")
                                    .append(
                                            "<div class=\"preview-box\" value=\"" + imgNum +"\">"
                                                    + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                                    + "<p>"
                                                    + file.name
                                                    + "</p>"
                                                    + "<a href=\"#\" value=\""
                                                    + imgNum
                                                    + "\" onclick=\"deletePreview(this)\">"
                                                    + "삭제" + "</a>" + "</div>");
                            files[imgNum] = file;
                        };
                        reader.readAsDataURL(file);
                    }
                } else
                    alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
            }
     
            //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
            function deletePreview(obj) {
                var imgNum = obj.attributes['value'].value;
                delete files[imgNum];
                $("#preview .preview-box[value=" + imgNum + "]").remove();
                resizeHeight();
            }
     
            //client-side validation
            //always server-side validation required
            function validation(fileName) {
                fileName = fileName + "";
                var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
                var fileNameExtension = fileName.toLowerCase().substring(
                        fileNameExtensionIndex, fileName.length);
                if (!((fileNameExtension === 'jpg')
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
        
                    console.log(form);
                    
                    for (var index = 0; index < Object.keys(files).length; index++) {
                        //formData 공간에 files라는 이름으로 파일을 추가한다.
                        //동일명으로 계속 추가할 수 있다.
                        formData.append('files',files[index]);
                    }
      
                    formData.append("title","제목");
			        for (var value of formData.values()) {

                    	  console.log(value);

                    }
                    
			        

                    //form.setAttribute("method", "Post"); 
                   // form.setAttribute("enctype","multipart/form-data");
                   // form.setAttribute("action","addPhoto.ij");
                    
                    //return false;
                    form.submit();
                    //document.frm.encoding = "multipart/form-data";

                    //$form.prop("enctype","multipart/form-data");
                    //$form.prop("action","location.href='addPhoto.ij'");

                    //$form.submit();
                    //document.frm.action="location.href='addPhoto.ij";         // 만약 다른 주소로 전송 할 경우

                    //document.frm.submit(); 

                    
                    
                    //ajax 통신으로 multipart form을 전송한다.
/*                      $.ajax({
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
                           alert("성공");
                            $("#preview").empty();

                        }
                        //전송실패에대한 핸들링은 고려하지 않음
                    }); */
                    
                    //return false;
                }); 
                // <input type=file> 태그 기능 구현
                $('#attach input[type=file]').change(function() {
                    addPreview($(this)); //preview form 추가하기
                });
            });
        </script>
    </body>
</html>