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
<style>

    div{
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
        min-height: 30px;
        margin: auto;
    }
    
    .div2{
        max-height: 800px;
    }
    .div3{
        min-height: 100px;

    }
    .div4{
        min-height: 100px;
    }


    a{
        float: right;
        margin-right: 2px;
        text-decoration: none;
        color: black;
        margin-top: 75px;
    }

    table{
        border: 1px solid black;
        border-collapse: collapse;
        width: 100%;
    }

    tr, td, th{
        border: 1px solid black;
    }
    th, td{
        text-align: center;     
    }

    .div4{
        display: inline-block;
       
    }

    
</style>
</head>
<body>
	<div class="content">
        <div class="content-wrap">
            <div class="div1">
                <h3>신고</h3>
            </div>
            
            <div class="div2">
                <table>
                    <tr>
                        <th>no</th>
                        <th>신고자</th>
                        <th>신고받은 사람</th>
                        <th>신고내용</th>
                        <th>날짜</th>
                    </tr>
                    
                    <c:forEach var="r" items="${blist }">
	                    <tr>
	                        <td>${r.rNo }</td>
	                        <td>${r.reportId }</td>
	                        <td>${r.responId }</td>
	                        <td><a href="#">${r.rCategory }</a></td>
	                        <td>${r.rDate }</td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
            
            <!-- 게시물 검색하기 -->
            <div class="div3">
                <form action="bsearch.ij" name="searchForm" method="get">
                    <select id="searchSel">
                        <option value="all" <c:if test="${search.searchSel == 'all' }" >selected</c:if>>전체</option>
                        <option value="rept" <c:if test="${search.searchSel == 'rept' }" >selected</c:if>>신고자</option>
                        <option value="resp" <c:if test="${search.searchSel == 'resp' }" >selected</c:if>>신고받은 사람</option>
                        <option value="category" <c:if test="${search.searchSel == 'category' }" >selected</c:if>>신고내용</option>
                    </select>
                    <input type="text" name="searchText" value="${search.searchText }">
                    <button id="searchBtn">검색</button>
                </form>
                
            </div>
            <div class="div4">
                
            </div>
        </div>
    </div>

</body>
</html>