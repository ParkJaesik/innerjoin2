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
			<h3>신고 게시글 상세보기</h3>
		</div>	
		<div class="div2">
			<div class="div3">
				<div class="div3-1">
					<label>신고하는 회원</label>
				</div>
				<div class="div3-2">
					<p>${loginUser.memberName }</p>
				</div>
			</div>
			<div class="div3">
				<div class="div3-1">
					<label>신고받는 회원</label>
				</div>
				<div class="div3-2">
					<p></p>
				</div>
			</div>
			<div class="div3">
				<div class="rType">
					<div class="div3-1">
						<label>신고유형</label>
					</div>
					<div class="div3-2">
						<p></p>
					</div>
				</div>
				<div class="rDate">
					<div class="div3-1">
						<label>날짜</label>
					</div>
					<div class="div3-2">
						<p></p>
					</div>
				</div>
			</div>
			<div class="div4">
				<div class="div4-1">
					<label>신고내용</label>
				</div>
				<div class="div4-2">
					<textarea rows="40" cols="25" readonly></textarea>
				</div>
			</div>	
		</div>
		<div class="btn">
			<div></div>
			<div class="btn1">
				<button type="button">목록</button>
				<button type="button">거절</button>
				<button type="button">수락</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>