<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* div{
        box-sizing: border-box;
        border: 1px solid black;
    } */

/* 	#body-content{
	margin: auto;
	
	} */
.content-wrap{
	margin: auto;
	margin-top: 3%;
	width: 100%;
	max-height :5000px; 
	margin-left: 15%;
	
	/* padding: 0% */;
}
.div1{
	margin-left: -3%;

}

.row{
	height: 150px;

}




table{
	margin-top: 8%;
}

th{
	width: 40%;

}

td{
	width: 60%;
}

.p{
	font-size: 13px;
	font-weight: 10px;
	color: gray;
}

label{
	font-size: 20px;
}

#userId{
	border: none; 
	color: #ed776acb; 
	font-size: 20px;
}

.input{
	height:40px;

}
#gName{
	width: 600px; 
	height: 42px;
}

#mlimit{
	width: 100px;
	height: 35px;

}

.button-wrap button{
	width: 100px;
	height: 40px;
	
	
}

.button-wrap{
	margin-left: 30%
}




</style>



</head>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
<body>

	<div class="container-fluid" id="all-wrapper">
		<div class="row" id="header-wrapper">
			<div class="col-md-12" id="all-hearder">
				<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
			</div>
		</div>
		<div class="row" id="body-wrapper">
			<div class="col-md-1 aside"></div>
			<div class="col-md-10" id="body-content">
				<div class="content-wrap">
						<!--  <div class="btn active" style="width: 900px; height:50px; background-color:#ed786a ;"></div> -->
						<!--  <div class="gWrap"> -->
					<div class="div1">
						<h3>모임 생성</h3>
					</div>
					<form action="ginsert.ij" method="post" enctype="multipart/form-data" id="groupForm">
						<table>
							<tr class="row">
								<th><label>모임장</label></th>
								<td>
									<input type="text" id="userId" name="gHost" readonly value="${loginUser.memberName}" >
									<input type="hidden" name="levelCode" value="${gmember.levelCode }">
									<c:if test="${ levelCode eq 0 }"></c:if>
								</td>
	
							</tr>
							
							<tr class="row">
								<th><label>모임카테고리</label></th>
								<td>
									<select class="input" id="categorysel" name="gCategoryCode" required >
										<option value="all">카테고리를 선택하세요.</option>
										<option value="0">학습</option>
										<option value="1">운동</option>
										<option value="2">문화예술</option>
										<option value="3">친목</option>
										<option value="4">봉사</option>
										<option value="5">음식</option>
									</select>
								</td>
							</tr>
							
							<tr class="row">
								<th><label>모임명</label></th>
								<td class="div2">
									<input type="text" id="gName" name="gName" required="required" placeholder="모임명을 적어주세요." >
								</td>
							</tr>
						
							<tr class="row">
								<th><label>장소</label></th>
								<td>
									<select id="citysel" required class="input">
										<option value="city">도시를 선택해주세요.</option>
										<option value="0">서울특별시</option>
									</select> <select id="guSel" name="localCode" required class="input">
										<option value="-1">구를 선택해주세요.</option>
										<option value="0">도봉구</option>
										<option value="1">강북구</option>
										<option value="2">노원구</option>
										<option value="3">성북구</option>
										<option value="4">은평구</option>
										<option value="5">종로구</option>
										<option value="6">동대문구</option>
										<option value="7">중랑구</option>
										<option value="8">서대문구</option>
										<option value="9">중구</option>
										<option value="10">성동구</option>
										<option value="11">마포구</option>
										<option value="12">용산구</option>
										<option value="13">광진구</option>
										<option value="14">강서구</option>
										<option value="15">영등포구</option>
										<option value="16">동작구</option>
										<option value="17">서초구</option>
										<option value="18">강남구</option>
										<option value="19">송파구</option>
										<option value="20">강동구</option>
										<option value="21">양천구</option>
										<option value="22">구로구</option>
										<option value="23">금천구</option>
										<option value="24">관악구</option>
									</select>
									<script type="text/javascript">
										$("#citysel").on("input", function() {
											var citysel = $("#citysel").val();
	
											if (citysel == 0) {
												$("#guSel").show();
											} else {
												$("#guSel").hide();
											}
	
										});
									</script>
								</td>
	
							</tr>
							
							<tr class="row">
								<th><label>공개여부</label></th>
								<td>
									<input type="radio" name="gOpenStatus" value="Y" required="required">&nbsp;공개 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="radio" name="gOpenStatus" value="N" required="required">&nbsp;비공개 
								</td>
							</tr>
							<tr class="row">
								<th>
									<label>모임인원</label><br>
									<p class="p">최대 100명까지 가능합니다.</p>
								</th>
								<td><input id="mlimit" type="number" min="0" max="100" name="gLimit" required="required" >&nbsp;명</td>
							</div>
							<!-- </div> -->
							<!-- <div class="btn" style="width: 900px; height:50px; background-color: purple;"></div> -->
							<!-- <div class="gWrap"> -->
							<tr class="row" style="margin-bottom: 30%;">
								<th><label>모임소개</label></th>
								<td class="div2">
									<textarea name="gInfo" id="summernote" value="" required="required" ></textarea>
								</td>
							</tr>

							<tr class="row" style="margin-top: 40%;">
								<th><label>대표사진</label></th>
								<td>
									<img id="gOriginFileName" style="max-width: 100%"> 
									<input type="file" name="uploadFile" required="required">
								</td>
							</tr>
						</table>
	
						<div class="button-wrap">
							<button type="reset" id="cancel">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" id="submit">등록</button>
						</div>
	
							<!--  </div> -->
					</form>
					<div class="temp"></div>
				</div>

			</div>
			<div class="col-md-1 aside">
				<div id="groupChatWrapper">
					<%@ include file="/WEB-INF/views/chat/chat.jsp"%>
				</div>
			</div>
		</div>
		<div class="row" id="footer-wrapper">
			<div class="col-md-12" id="all-footer"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		/*  $(function(){
		     $(".btn:not(.active)").next().slideUp();
		     $(".btn").on("click",function(){
		         $(".btn").removeClass("active");
		         $(this).addClass("active");
		         $(this).next().slideDown();
		         $(".btn:not(.active)").next().slideUp();
		     });
		 }); */

		$(document).ready(function() {
			$("#summernote").summernote({
				height : 400,
				width : 800,
				minHeight : null,
				maxHeight : null,
				focus : true
			});
		});
	</script>

</body>
</html>