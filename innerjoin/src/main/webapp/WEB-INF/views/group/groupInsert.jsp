<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<style>
    div{
        box-sizing: border-box;
        border: 1px solid black;
    }


	.content{
        max-width: 1020px;
        
        margin: auto;
    }

    .content-wrap{
        max-width: 100%;
        margin: auto;
    }

    
    .div1{
        width: 30%;
        min-height: 100px;
        float: left;
        display: inline-block;
        
    }

    .div2{
        width: 70%;
        min-height: 100px;
        display: inline-block;
    }

    .temp{
        min-height: 100px;
    }

    .button-wrap{
        width: 100%;
        height: 100px;
    }
    .btn{
        cursor: pointer;
    }
    .active{
        cursor: initial;
    }
</style>
</head>
<body>
	<div class="content">
            <div class="content-wrap">
                <form action="ginsert.ij" method="post" enctype="multipart/form-data">
                    <div class="btn active" style="width: 900px; height:50px; background-color: purple;"></div>
                    <div class="gWrap">
                        <div class="row">
                            <div class="div1">
                                <label>모임장</label>
                            </div>
                            <div class="div2">
                                <input type="text" id="userId" name="userId" readonly="readonly" value="#{loginUser.id }">
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
                                <label>공개 여부</label>
                            </div>
                            <div class="div2">
				                                공개<input type="radio" name="yn">
				                                비공개<input type="radio" name="yn">
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
                    </div>
                    <div class="btn" style="width: 900px; height:50px; background-color: purple;"></div>
                    <div class="gWrap">
                        <div class="row">
                            <div class="div1">
                                <label>모임 소개</label>
                            </div>
                            <div class="div2">
                                <textarea rows="12" cols="50"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="div1">
                                <label>대표 사진</label>
                            </div>
                            <div class="div2">
                                <img id="titleImg" style="max-width: 100%">
                                <input type="file" name="uploadFile">
                            </div>
                        </div>
                        <div class="row">
                            <div class="button-wrap">
                                <button type="button" id="cancel">취소</button>
                                <button type="submit" id="submit">등록</button>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="temp">
                </div>
	   		</div>
        </div>
    <script>
        $(function(){
            $(".btn:not(.active)").next().slideUp();
            $(".btn").on("click",function(){
                $(".btn").removeClass("active");
                $(this).addClass("active");
                $(this).next().slideDown();
                $(".btn:not(.active)").next().slideUp();
            });
        });
    </script>
</body>
</html>