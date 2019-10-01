<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>        
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Insert title here</title>
	<style>
		.add-wrapper{
			max-width: 1020px;
			min-height: 850px;
		}
 		.add-wrapper div{
			margin-top: 10px;
			margin-bottom:0;
		} 
		.float_right{
			float:right;
			margin:auto;
			margin-right:10px;
		}
		.preview-box div{
			width:100%;
			height:80%;
			overflow:hidden;
			margin:auto;
		}
		#preview{
			margin-top: 40px;
		}
		.preview-box p{
			width:100%;
			height:10%;
		}
		#preview img {
		max-width: 100%;
		max-height:100%;
/* 		margin-left:auto;
		margin-right:auto; */
		display: block;
		margin: 0 auto;
		}
	
		#preview *{
			margin:auto;
		}
		#preview p {
			text-overflow: ellipsis;
			font-size: 12px;
			bottom:0;
			text-align:center;
		}
		#preview a {
			/*  text-overflow: ellipsis;*/
			height:10%;
			color:red;
			float:right;
		}
		
		.preview-box {
			padding: 5px;
			border-radius: 10px;
			margin-right:10px !important;
			margin-bottom: 10px !important;
			float:left;
			width:310px;
			height:300px;
			border : 5px solid rgba(255, 0, 0, .5);
			
		}

	</style>
</head>
<body>

	<div class="container-fluid add-wrapper">
		<!-- <div class="row"> -->
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<h1 align="center">�ٹ� �߰�</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div id="album_attach" class="col-md-8">
								<h2 display="inline-block">�ٹ��̸�</h2>
								<input type="text" class="form-control" name="albumTitle" maxlength="50" required><br>
								<h2 display="inline-block">�����߰�</h2>
								<div class="custom-file">
									<input id="uploadInputBox" class="custom-file-input"  aria-describedby="inputGroupFileAddon01"  type="file" name="filedata" multiple />	
									<label class="custom-file-label" for="uploadInputBox">Choose file</label>
								</div>
							</div>
							<div class="col-md-4">
								<button class="submit float_right btn btn-warning">�ٹ����</button>
								<button class="float_right btn btn-warning" onclick="location.href='albumListView.ij'">������</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div id="preview" class="col-md-12">
					</div>
					<!-- multipart ���ε�� ���� -->
                	<form id="uploadForm" action="addPhoto.ij" method="post" style="display: none;" enctype="multipart/form-data"/>
				</div>
			</div>
		<!-- </div> -->
	</div>
	
	          <script>
            //������ file object����
            var files = {};
            var previewIndex = 0;
     
            // image preview ��� ����
            // input = file object[]
	        function addPreview(input) {
	            if (input[0].files) {
	                //���� ������ ���������� ���� ����
	                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	                    var file = input[0].files[fileIndex];
	                    if(validation(file.name)) continue;
	                    setPreviewForm(file);
	                }
	            } else
	                alert('invalid file input'); // ÷��Ŭ�� �� ��ҽ��� ����å�� ������ �ʾҴ�.
	        }
	        
	        function setPreviewForm(file, img){
	            var reader = new FileReader();
	            
	            //div id="preview" ���� �����ڵ��߰�.
	            //�� �κ��� �����ؼ� �̹��� ��ũ �� ���ϸ�, ������ ���� �ΰ������� �� �� ���� ���̴�.
	            reader.onload = function(img) {
	                var imgNum = previewIndex++;
	                $("#preview").append(
	                        "<div class=\"preview-box\" value=\"" + imgNum +"\">" +
	                        "<div><img class=\"thumbnail\" src=\"" + img.target.result + "\"\/></div>" +
	                        "<p>" + file.name + "</p>" +
	                        "<a href=\"#\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">" +
	                        "����" + "</a>"
	                        +
	                        "</div>"
	                );
	                //resizeHeight();
	                files[imgNum] = file;
	                
	                console.log(files[imgNum]);
	            };
	            
	            reader.readAsDataURL(file);
	        }

            //preview �������� ���� ��ư Ŭ���� �ش� �̸������̹��� ���� ����
            function deletePreview(obj) {
                var imgNum = obj.attributes['value'].value;
                console.log("�����Ϸ��� ���")
                console.log(files[imgNum]);
                
                console.log("���� �� files ��ü")
				console.log(files);
               
                console.log("���� �� files ��ü")
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
                    alert('jpg, gif, png Ȯ���ڸ� ���ε� �����մϴ�.');
                    return true;
                } else {
                    return false;
                }
            }
     
            $(document).ready(function() {
                //submit ���. ������ submit type�� �ƴϴ�.
                $('.submit').on('click',function() {                        
                    var form = $('#uploadForm')[0];
                    var formData = new FormData(form);
        
                    var title = $("input[name=albumTitle]").val();
                    console.log(form);
                    console.log(title);
                    console.log(formData.get("files"));
                    
                    
                  /* for (var index = 0; index < Object.keys(files).length; index++) {
                        //formData ������ files��� �̸����� ������ �߰��Ѵ�.
                        //���ϸ����� ��� �߰��� �� �ִ�.
                        console.log(files[index]);
                        alert(files[index]);
                        formData.append('files',files[index]);
                    }  */
                  
                  
                  for(var index in files){
                	  console.log(files[index]);
                      alert(files[index]);
                      formData.append('files',files[index]);
                  }
                  
      
                    formData.append("title",title);
/* 			        for (var value of formData.get("files")) {

                    	  console.log(value);

                    } */
			        
			        console.log(formData.get("title"));
			        /* console.log(formData.get("files")); */
         
		              //ajax ������� multipart form�� �����Ѵ�.
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
	                        //�� �κ��� �����ؼ� �پ��� �ൿ�� �� �� ������,
	                        //���⼭�� �����͸� ���۹޾Ҵٸ� �����ϰ� OK ���� ������� �Ͽ���.
	                        //-1 = �߸��� Ȯ���� ���ε�, -2 = �뷮�ʰ�, �׿� = ����(1)
	                        if (result === -1) {
	                            alert('jpg, gif, png, bmp Ȯ���ڸ� ���ε� �����մϴ�.');
	                            // ���� ���� ...
	                        } else if (result === -2) {
	                            alert('������ 10MB�� �ʰ��Ͽ����ϴ�.');
	                            // ���� ���� ...
	                        } else {
	                            alert('�̹��� ���ε� ����');
	                            // ���� ���� ...
	                           goList();
	                        }
	                    }
	                    //���۽��п����� �ڵ鸵�� ������� ����
	                });  
                }); 
                // <input type=file> �±� ��� ����
                $('#uploadInputBox').change(function() {
                    addPreview($(this)); //preview form �߰��ϱ�
                });
            });
            
            function goList(){
            	 location.href="albumListView.ij";
            }
        </script>
</body>
</html>