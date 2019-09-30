<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<style>
		*{
			border : 1px solid black;
		}
		.wrapper{
			max-width: 1020px;
			min-width:1020px;
			min-height: 850px;
			margin:auto;
		}
		.mid_wrapper{
			width:100%;
			height:100%;
		}
		.section{
			width:100%;
			max-height:80%;
		}
		.section *{
			width:100%;
			height:100%;
		}
		.footer{
		
			padding-top:50px;
			width:100%;
			
		}

		.footer img{
			max-width:100%;
			max-height:100%;
			min-width:50px;
			min-height:50px;
			cursor:pointer;
			padding:0;
			margin:auto;
		}
		.header{
			width:100%;
			height:10%;
		}
		.header *{
			margin:0;
			width:100%;
			height:100%;
		}
		
		.preview-box {
			padding: 5px;
			border-radius: 2px;
			margin-right:18px;
			margin-bottom: 10px;
			float:left;
			width:300px;
			height:300px;
			
		}
		.preview-box img{
			max-width:100%;
			max-height:100%;
			cursor:pointer;
		}
		.img-box{
			width:100%;
			height:75%;
		}
		.preview-box h3{
			width:100%;
			height: 15%;
			text-align:center;
			margin:0;
		}
		.preview-box p{
			width:100%;
			height: 10%;
			text-align:right;
			margin:0;
		}
		.padding_top{
			padding-top:25px;
		}
		
	</style>
</head>

<body>
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
						<img src="resources/images/upload-button.png">
					</div>
				</div>
		<!-- </div>
		</div> -->
	</div>
	<script>
		$(".footer img").click(function(){
			location.href="addAlbumForm.ij";
		});
		
		$(".section img").click(function(){
			location.href="albumDetailView.ij";
		});
	</script>
</body>
</html>