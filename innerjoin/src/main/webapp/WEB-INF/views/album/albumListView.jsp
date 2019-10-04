<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


</head>

<body>
<%@ include file="../group/groupMenubar.jsp" %>
 <script>
 	console.log('gno:'+'${gno}'); 
 </script>
	<div class="container-fluid wrapper">
		<!-- <div class="row">
			<div class="col-md-12 mid_wrapper"> -->
				<div class="row header">
					<div class="col-md-12">
						<h1>모임이름 - album</h1>
					</div>
				</div>
				<div class="row section">
					<div class="col-md-12 padding_top">
					<% for(int i= 0; i < 6; i++){ %>
						<div class="preview-box">
							<div class="img-box">
								<img src="">
							</div>
							<h3>album-title</h3>
							<p>by. user0<%=i %></p>
						</div>
					<% } %>
					</div>
				</div>
				<div class="row footer">
					<div class="col-md-11" style="min-width:50px; min-height:50px;">
					</div>
					<div class="col-md-1" style="width:50px; height:50px;">
						<img src="resources/images/album/upload-button.png">
					</div>
				</div>
		<!-- </div>
		</div> -->
	</div>
	

	
	<script>
 
        
        $(".al-list img").click(function(){
        	location.href="albumListView.ij";
        });
        
        $(".footer img").click(function(){
        	location.href="addAlbumForm.ij";
        });
		$(".section img").click(function(){
			location.href="albumDetailView.ij";
		});
	</script>
</body>
</html>