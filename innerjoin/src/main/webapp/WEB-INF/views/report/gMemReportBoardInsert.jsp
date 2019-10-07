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
		    <div class="div1">
		        <h2>회원</h2>
		    </div>
		    <div class="div2">
		        <h3>회원 신고</h3>
		    </div>
			<form>
			     <div class="write">
			         <div class="div3">
			             <label>신고하는 회원</label>
			         </div>
			         <div class="div4">
			             <input type="text" name="reporterId">
			         </div>
			         <div class="div3">
			             <label>신고 받는 회원</label>
			         </div>
			         <div class="div4">
			             <input type="text" name="respondentId">
			         </div>
			         <div class="div3">
			             <label>신고 유형</label>
			         </div>
			         <div class="div5"></div>
			             <input type="radio" name="rept"> 욕설 및 비방 &nbsp;&nbsp;&nbsp;
			             <input type="radio" name="rept"> 유해하거나 위험한 행동 &nbsp;
			             <input type="radio" name="rept"> 폭력적이거나 혐오 표현 <br> 
			             <input type="radio" name="rept"> 선정적인 표현 &nbsp;
			             <input type="radio" name="rept"> 부적절한 홍보 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			             <input type="radio" name="rept"> 기타 
			         </div>
			         <div>
			     
			             
			         </div>
			     </div>
			     <div class="btn">
			     </div>
			</form>
		</div>
       </div>
	

</body>
</html>