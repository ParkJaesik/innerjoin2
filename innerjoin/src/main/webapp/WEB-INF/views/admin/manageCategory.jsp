<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lumino - Widgets</title>
	<link href="resources/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/admin/font-awesome.min.css" rel="stylesheet">
	<link href="resources/css/admin/datepicker3.css" rel="stylesheet">
	<link href="resources/css/admin/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<style>
	#category th,td{
		text-align:center;
	}

</style>
<body>
	<jsp:include page="adminMenubar.jsp"/>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">카테고리 관리</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">카테고리 관리</h1>
			</div>
		</div><!--/.row-->
		
		<div>
			<div>
				<h4>모임 종류</h4>
			</div>
			<table align="center" border="1"  width="1000" id="category">
				<tr>
					<th>카테고리 코드</th>
					<th>카테고리 이름</th>
					<th></th>
				<tr>
			</table>
			<br>
			
			<div align="right">
			<button type="button" id="addCategory">카테고리 추가하기</button>
			</div>
		</div>
		
		<br>
		<div>
			<h4>지역 카테고리</h4>
		</div>
		
		
		
	</div>	<!--/.main-->
	  
	<script>
		window.onload = function () {
			$("#manageCategory").addClass("active");
		};
	</script>
	<script>
		$(function(){
			loadCategory();
		});
		
		function loadCategory(){
			
			$.ajax({
				
				url:"loadCat.ij",
				dataType:"JSON",
				
				success:function(catList){
					
					console.log(catList);
					catList.forEach(function(element) {
						
						console.log(element.groupCatName);
						$("#category").append("<tr>" + "<form>" +
								"<td><input type='text' value='" + element.groupCatCode + "' name='groupCatCode' readonly>" + "</td>" + 
								"<td><input type='text' value='"+ element.groupCatName +"' name ='groupCatName'>" + "</td>" + 
								"<td>"+ "<button type='button' id='changeCatName'>변경하기</button>" + "</td>" +
								"</form></tr>");
						});
				}
				
				
				
			});
		}
		
		
		
		
		$("#addCategory").click(function(){
			var lastCode = $("#category tr:last-child td:first-child").text();
			var nextCode = Number(lastCode) + 1;
			$("#category").append("<tr>" + 
					"<td>" + nextCode + "</td>" + 
					"<td><input type='text'>" + "</td>" + 
					"<td>"+ "<button type='button'>추가하기</button>" + "</td>" +
					"</tr>");
		});
		
		
		$("#changeCatName").click(function(){
			
		});
	</script>
	
</body>
</html>
