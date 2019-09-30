<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
	<div class="content">
            <div class="content-wrap">
                <form action="">
                    <div class="row">
						<div class="div1">
							<label>모임장</label>
						</div>
						<div class="div2">
							<input type="text" id="userId" name="userId" readonly="readonly">
						</div>
					</div>
                    <div class="row">
						<div class="div1">
							<label>모임 카테고리</label>
						</div>
						<div class="div2">
							<select id="categorysel" name="categorysel">
								<option value="all">카테고리를 선택하세요.</option>	
								<option value="">친목</option>
								<option value="language">언어</option>
								<option value="">운동</option>
								<option value="it">IT</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="div1">
							<label>모임명</label>
						</div>
						<div class="div2">
							<input type="text" name="groupName">
						</div>
					</div>
					<div class="row">
						<div class="div1">
							<label>장소</label>
						</div>
						<div class="div2">
							<select id="citysel" name="citysel">
								<option>시</option>
								<option>서울특별시</option>
							</select>
							<select id="gusel" name="gusel">
								<option value="">구</option>
	                            <option value="">강남구</option>
	                            <option value="">강동구</option>
	                            <option value="">강북구</option>
	                            <option value="">강서구</option>
	                            <option value="">관악구</option>
	                            <option value="">광진구</option>
	                            <option value="">구로구</option>
	                            <option value="">금천구</option>
	                            <option value="">노원구</option>
	                            <option value="">도봉구</option>
	                            <option value="">동대문구</option>
	                            <option value="">동작구</option>
	                            <option value="">마포구</option>
	                            <option value="">서대문구구</option>
	                            <option value="">서초구</option>
	                            <option value="">성동구</option>
	                            <option value="">성북구</option>
	                            <option value="">송파구</option>
	                            <option value="">양천구</option>
	                            <option value="">영등포구</option>
	                            <option value="">용산구</option>
	                            <option value="">은평구</option>
	                            <option value="">종로구</option>
	                            <option value="">중구</option>
	                            <option value="">중랑구</option>
							</select>
							<select id="detailsel" name="detailsel">
								<option value="0">상세 위치를 결정하세요</option>
								<option value="1">협의 후 결정</option>
								<option value="2">직접입력</option>
							</select>
							<input type="text" id="detailtext" name="detailtext">
						</div>
					</div>
					<div class="row">
						<div class="div1">
							<label>날짜  & 시간</label>
						</div>
						<div class="div2">
							<label>매주</label>
							<input type="checkbox" name="weekOne" value="일" class="week">일
							<input type="checkbox" name="weekOne" value="월" class="week">월
							<input type="checkbox" name="weekOne" value="화" class="week">화
							<input type="checkbox" name="weekOne" value="수" class="week">수
							<input type="checkbox" name="weekOne" value="목" class="week">목
							<input type="checkbox" name="weekOne" value="금" class="week">금
							<input type="checkbox" name="weekOne" value="토" class="week">토
							
							<br><br>
							
							<label>시작시간</label> 
							<select class="timeForm" id="startTime" name="startTime">
								<option value=0>시간을 입력하세요</option>
								
								<option value="6:00">06:00 </option>
								<option value="6:30">06:30 </option>
								<option value="7:00">07:00 </option>
								<option value="7:30">07:30 </option>
								<option value="8:00">08:00 </option>
								<option value="8:30">08:30 </option>
								<option value="9:00">09:00 </option>
								<option value="9:30">09:30 </option>
								<option value="10:00">10:00 </option>
								<option value="10:30">10:30 </option>
								<option value="11:00">11:00 </option>
								<option value="11:30">11:30 </option>
								<option value="12:00">12:00 </option>
								<option value="12:30">12:30 </option>
								<option value="13:00">13:00 </option>
								<option value="13:30">13:30 </option>
								<option value="14:00">14:00 </option>
								<option value="14:30">14:30 </option>
								<option value="15:00">15:00 </option>
								<option value="15:30">15:30 </option>
								<option value="16:00">16:00 </option>
								<option value="16:30">16:30 </option>
								<option value="17:00">17:00 </option>
								<option value="17:30">17:30 </option>
								<option value="18:00">18:00 </option>
								<option value="18:30">18:30 </option>
								<option value="19:00">19:00 </option>
								<option value="19:30">19:30 </option>
								<option value="20:00">20:00 </option>
								<option value="20:30">20:30 </option>
								<option value="21:00">21:00 </option>
								<option value="21:30">21:30 </option>
								<option value="22:00">22:00 </option>
								<option value="22:30">22:30 </option>
								<option value="23:00">23:00 </option>
								<option value="23:30">23:30 </option>
								<option value="24:00">24:00 </option>
							</select> 
							<label>끝시간</label> 
							<select class="timeForm" id="endTime" name="endTime">
								<option value="0">시간을 입력하세요</option>
								
								<option value="6:00">06:00 </option>
								<option value="6:30">06:30 </option>
								<option value="7:00">07:00 </option>
								<option value="7:30">07:30 </option>
								<option value="8:00">08:00 </option>
								<option value="8:30">08:30 </option>
								<option value="9:00">09:00 </option>
								<option value="9:30">09:30 </option>
								<option value="10:00">10:00 </option>
								<option value="10:30">10:30 </option>
								<option value="11:00">11:00 </option>
								<option value="11:30">11:30 </option>
								<option value="12:00">12:00 </option>
								<option value="12:30">12:30 </option>
								<option value="13:00">13:00 </option>
								<option value="13:30">13:30 </option>
								<option value="14:00">14:00 </option>
								<option value="14:30">14:30 </option>
								<option value="15:00">15:00 </option>
								<option value="15:30">15:30 </option>
								<option value="16:00">16:00 </option>
								<option value="16:30">16:30 </option>
								<option value="17:00">17:00 </option>
								<option value="17:30">17:30 </option>
								<option value="18:00">18:00 </option>
								<option value="18:30">18:30 </option>
								<option value="19:00">19:00 </option>
								<option value="19:30">19:30 </option>
								<option value="20:00">20:00 </option>
								<option value="20:30">20:30 </option>
								<option value="21:00">21:00 </option>
								<option value="21:30">21:30 </option>
								<option value="22:00">22:00 </option>
								<option value="22:30">22:30 </option>
								<option value="23:00">23:00 </option>
								<option value="23:30">23:30 </option>
								<option value="24:00">24:00 </option>
							</select>
						
						</div>
					</div>
					<div class="row">
						<div class="div1">
							<label>참가비</label>
						</div>
						<div class="div2">
							<select id="pricesel" name="pricesel">
								<option>참가비</option>
								<option>협의 후 결정</option>
								<option>직접 입력</option>
							</select>
							<input type="text" name="price">원
						</div>
					</div>
					<div class="row">
						<div class="div1">
							<label>공개 여부</label>
						</div>
						<div class="div2">
							공개<input type="radio" name="open">
							비공개<input type="radio" name="close">
						</div>
					</div>
					<div class="row">
						<div class="div1">
							<label>최대정원</label>
						</div>
						<div class="div2">
							<input type="number" max="100">명
						</div>
					</div>
					<div class="row">
						<div class="div1">
							<label>모임 소개</label>
						</div>
						<div class="div2">
							<textarea rows="11" cols="40"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="div1">
							<label>대표 사진</label>
						</div>
						<div class="div2">
							<img id="titleImg" style="max-width: 100%">
							<input type="file" id="imgUpload">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						</div>
					</div>
                </form>
	   		</div>
        </div>

</body>
</html>