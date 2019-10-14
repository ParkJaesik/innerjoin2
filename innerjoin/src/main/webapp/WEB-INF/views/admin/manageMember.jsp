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
<body>
	<jsp:include page="adminMenubar.jsp"/>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Widgets</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Widgets</h1>
			</div>
		</div><!--/.row-->

		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>가입 모임 수	</th>
							<th>회원가입일</th>
							<th>누적신고 횟수</th>
							<th>작성 글 수</th>
							<th>회원 등급</th>
							<th>회원 상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							
						</tr>
						<tr class="table-active">
							
						</tr>
						<tr class="table-success">
						
						</tr>
						<tr class="table-warning">
							
						</tr>
						<tr class="table-danger">
							
						</tr>
					</tbody>
				</table>
			</div><!--/.col-->
			<div class="col-sm-12">
				<p class="back-link">Lumino Theme by <a href="https://www.medialoot.com">Medialoot</a></p>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	  
	<script>
		window.onload = function () {
			$("#manageMember").addClass("active");
		};
	</script>
	
</body>
</html>
