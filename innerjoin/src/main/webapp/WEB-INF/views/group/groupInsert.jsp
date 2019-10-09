<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<!-- 써머노트 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
    /* div{
        box-sizing: border-box;
        border: 1px solid black;
    } */


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
    
    #guSel{
    	display: none;
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
                                <input type="text" id="userId" name="gHost" readonly value="${loginUser.memberName}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="div1">
                                <label>모임 카테고리</label>
                            </div>
                            <div class="div2">
                                <select id="categorysel" name="gCategoryCode">
                                    <option value="all">카테고리를 선택하세요.</option>	
                                    <option value="0">학습</option>
                                    <option value="1">운동</option>
                                    <option value="2">문화예술</option>
                                    <option value="3">친목</option>
                                    <option value="4">봉사</option>
                                    <option value="5">음식</option>
                                </select>
                                
                            
                            	    
                            </div>
                        </div>
                        <div class="row">
                            <div class="div1">
                                <label>모임명</label>
                            </div>
                            <div class="div2">
                                <input type="text" name="gName">
                            </div>
                        </div>
                        <div class="row">
                            <div class="div1">
                                <label>장소</label>
                            </div>
                            <div class="div2">
                                <select id="citysel" name="localCode">
                                    <option value="city">도시를 선택해주세요.</option>
                                    <option value="0">서울특별시</option>
                                </select>
                                <select id="guSel" name="districtName">
                                    <option value="gu">구를 선택해주세요.</option>
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
                          			$("#citysel").on("input", function () {
                          				var citysel = $("#citysel").val();
                          				
                          				if(citysel == 0){
                          					$("#guSel").show();
                          				}else{
                          					$("#guSel").hide();
                          				}
										
									});
                          		</script>
                            </div>
                        
                        </div>
                        <div class="row">
                            <div class="div1">
                                <label>공개 여부</label>
                            </div>
                            <div class="div2">
				                                공개<input type="radio" name="gOpenStatus" value="Y">
				                                비공개<input type="radio" name="gOpenStatus" value="N">
                            </div>
                        </div>
                        <div class="row">
                            <div class="div1">
                                <label>최대정원</label>
                            </div>
                            <div class="div2">
                                <input type="number" max="100" name="gMemCount">명
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
                            	<textarea name="gInfo" id="summernote" value=""></textarea>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="div1">
                                <label>대표 사진</label>
                            </div>
                            <div class="div2">
                                <img id="gOriginFileName" style="max-width: 100%">
                                <input type="file" name="uploadFile">
                            </div>
                        </div>
                        
						<div class="button-wrap" align="center">
						    <button type="reset" id="cancel">취소</button>
						    <button type="submit" id="submit">등록</button>
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
        
        $(document).ready(function() {
            $("#summernote").summernote({
                    height: 300,
                    minHeight: null,             
                    maxHeight: null,             
                    focus: true                  
			});
       });

    </script>
</body>
</html>