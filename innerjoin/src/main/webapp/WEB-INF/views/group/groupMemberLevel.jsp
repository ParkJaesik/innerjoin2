<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<div class="content-wrap">
			<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">등급레벨</button><br/>
			<div class="modal fade" id="layerpop" >
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- header -->
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
							<h4 class="modal-title">회원 등급</h4>
						</div>
						<!-- body -->
						<form action="memlevel.ij">
							<div class="modal-body">
								<div class="div1">
									<input type="text" readonly value="">							
								</div>
								<div class="div2">
									모임장<input type="radio" name="levelCode">
									매니저<input type="radio" name="levelCode">
									일반회원<input type="radio" name="levelCode">
								</div>
								
							</div>
							<!-- Footer -->
							<div class="modal-footer">
								<button type="button" class="btn" data-dismiss="modal">취소</button>
	                            <button type="submit" class="btn">수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			
			
			
		</div>
	</div>
	
	
	
	
	<div class="modal fade" id="modal-container-775486" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">
						회원등급
					</h5> 
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form action="memlevel.ij">
					<div class="modal-body">
						<div class="div1">
							<input type="text" readonly value="">							
						</div>
						<div class="div2">
							모임장<input type="radio" name="levelCode">
							매니저<input type="radio" name="levelCode">
							일반회원<input type="radio" name="levelCode">
						</div>
						
					</div>
					<div class="modal-footer">
						 
						<button type="button" class="btn btn-secondary" data-dismiss="modal">
							취소
						</button>
						<button type="submit" class="btn btn-primary">
							수정
						</button> 
					</div>
				</form>	
			</div>
		</div>
	</div>
</body>
</html>