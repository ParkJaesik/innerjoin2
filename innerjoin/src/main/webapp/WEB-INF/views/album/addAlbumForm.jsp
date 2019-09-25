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
		.wrapper{
			width: 1020px;
		}
		.wrapper div{
			margin-top: 10px;
			margin-bottom:0;
		}
		.float_right{
			float:right;
			margin:auto;
			margin-right:10px;
		}
		#preview img {
		max-width: 100%;
		max-height:90%;
		margin-left:auto;
		margin-right:auto;
		}
	
		#preview p {
			/*  text-overflow: ellipsis;*/
			overflow: hidden;
			bottom:0;
		}
		#preview a {
			/*  text-overflow: ellipsis;*/
			padding-left:15px;
		}
		
		.preview-box {
			padding: 5px;
			border-radius: 2px;
			margin-right:10px;
			margin-bottom: 10px;
			float:left;
			width:320px;
			height:300px;
			
		}

	</style>
</head>
<body>

	<div class="container-fluid wrapper">
		<div class="row">
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
								<input type="text" class="form-control" name="albumTitle" maxlength="50"><br>
								<h2 display="inline-block">�����߰�</h2>
								<div class="custom-file">
									<input id="uploadInputBox" class="custom-file-input"  aria-describedby="inputGroupFileAddon01"  type="file" name="filedata" multiple />	
									<label class="custom-file-label" for="uploadInputBox">Choose file</label>
								</div>
							</div>
							<div class="col-md-4">
								<button class="submit float_right btn btn-warning">�ٹ����</button>
								<button class="float_right btn btn-warning">������</button>
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
		</div>
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
     
                        if (validation(file.name))
                            continue;
     
                        var reader = new FileReader();
                        reader.onload = function(img) {
                            //div id="preview" ���� �����ڵ��߰�.
                            //�� �κ��� �����ؼ� �̹��� ��ũ �� ���ϸ�, ������ ���� �ΰ������� �� �� ���� ���̴�.
                            var imgNum = previewIndex++;
                            $("#preview")
                                    .append(
                                            "<div class=\"preview-box\" value=\"" + imgNum +"\">"
                                                    + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                                    + "<p>"
                                                    + file.name
                                                    + "<a href=\"#\" value=\""
                                                    + imgNum
                                                    + "\" onclick=\"deletePreview(this)\">"
                                                    + "����" + "</a>" 
                                                    + "</p>"
                                                    + "</div>");
                            files[imgNum] = file;
                        };
                        reader.readAsDataURL(file);
                    }
                } else
                    alert('invalid file input'); // ÷��Ŭ�� �� ��ҽ��� ����å�� ������ �ʾҴ�.
            }
     
            //preview �������� ���� ��ư Ŭ���� �ش� �̸������̹��� ���� ����
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
        
                    console.log(form);
                    
                    for (var index = 0; index < Object.keys(files).length; index++) {
                        //formData ������ files��� �̸����� ������ �߰��Ѵ�.
                        //���ϸ����� ��� �߰��� �� �ִ�.
                        formData.append('files',files[index]);
                    }
      
                    formData.append("title","����");
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
                    //document.frm.action="location.href='addPhoto.ij";         // ���� �ٸ� �ּҷ� ���� �� ���

                    //document.frm.submit(); 

                    
                    
                    //ajax ������� multipart form�� �����Ѵ�.
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
                            //�� �κ��� �����ؼ� �پ��� �ൿ�� �� �� ������,
                            //���⼭�� �����͸� ���۹޾Ҵٸ� �����ϰ� OK ���� ������� �Ͽ���.
                            //-1 = �߸��� Ȯ���� ���ε�, -2 = �뷮�ʰ�, �׿� = ����(1)
                           alert("����");
                            $("#preview").empty();

                        }
                        //���۽��п����� �ڵ鸵�� ������� ����
                    }); */
                    
                    //return false;
                }); 
                // <input type=file> �±� ��� ����
                $('#uploadInputBox').change(function() {
                    addPreview($(this)); //preview form �߰��ϱ�
                });
            });
        </script>
</body>
</html>