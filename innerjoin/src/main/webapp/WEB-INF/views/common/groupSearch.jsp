<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<title>Insert title here</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/common/index.css">
<style>
         /* *{border: 1px solid violet;
        box-sizing: border-box;
        }  */
        .search-header{
        	position: relative;
        }
        .searchMenu{
        	display: flex;
			margin: 0 auto;
			padding: 0;
			max-width: 1200px;
			list-style: none;
        }
        
        .searchMenu li{
        	position: relative;
			z-index: 1;
			display: block;
			margin: 0;
			text-align: center;
			flex: 1;
			left: 15.1em !important;
        }
        
        .searchMenu a{
	        position: relative;
			display: block;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			line-height: 2.5;
			padding: 0.5em 0;
			color: #2CC185;
			transition: color 0.3s;
        }
        
        .searchMenu a:hover,
        .searchMenu a:foucs{
        	color: #74777b;
        }
        
        
        .searchOp{
            width: 7em;
            text-align: center;
            height: 3em;
            font-size: 17px;
            color: #ed786a;
            padding-top: 0.7em;
            border-left: 1px solid #ed786a;
            border-right: 1px solid #ed786a;
            border-top: 1px solid #ed786a;
           
        }

        .search-section{
            width: 100%;
            height: 7em;
            border: 1px solid #ed786a;
            position: relative;
            display: inline-block;
            top: 3.1em;
        }

        .search-section input{
            width: 80%;
            height: 2.8em;
            border-radius: 3px;
            border: 1px solid #ed786a;
        }

        .search-section button{
            margin-left: -3.6em;
            padding: 0.6em;
            border-radius: 0 3px 3px 0;
            outline: none;
            box-shadow: none;
            border: none;
        }

        select{
            padding: 0.6em;
            width: 6em;
            border-radius: 3px;
        }
        select option:focus{
            background-color: #ed786a;
            color: white;
        }
    </style> 
   
</head>
<body>
	<div class="container-fluid" id="all-wrapper">

		<!-- 페이지 헤더부분 -->
		<div class="row" id="header-wrapper">
			<div class="col-md-12" id="all-hearder">
				<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
			</div>
		</div>

		<!-- 페이지 바디부분 -->
		<div class="row" id="body-wrapper">
			<div class="col-md-1 aside"></div>
			<!-- 다들 이 페이지 틀 복사해서 만드는페이지에 기본으로 깔고     밑에 body-content 공간에  본인 페이지 include해줘 -->
			<div class="col-md-10" id="body-contents">
				<!-- 메인페이지 content 부분 -->
				<div style="margin: 50px;"></div>
				
				<div class="search-header row" align="center">
					<ul class="searchMenu">
						<li><a href="#" class="searchOp">모임검색</a></li>
						<li><a href="#" class="searchOp">유저검색</a></li>
					</ul>
                    <div class="search-section container" align="center">
                    	<form action="groupSearch.ij" method="get">
                        	<select name="cityCode" id="cityCode">
                       			<option value="">전체</option>
                             	<option value="0">서울시</option>
                      		</select>

                            <select name="districtCode" id="districtCode">
                            	<option value="all">전체</option>
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
                            <input type="search" name="userSearch" id="userSearch" style="margin-top: 2em; padding: 1em;">
                            <button><img/>검색</button>
                                </form>    
                            </div>
                        </div>
			</div>
			<div class="col-md-1 aside">
				
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>