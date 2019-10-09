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
</head>
<body>
	<div class="content">
        <div class="content-wrap">
            <div class="div1">
                <h3>신고</h3>
            </div>
            <div class="div2">
                <label><a href="#">신고내역보기</a></label>
            </div>
            <div class="div3">
                <table>
                    <tr>
                    	<th>회원번호</th>
                        <th>아이디</th>
                        <th>신고받은 횟수</th>
                        <th>처리 상태</th>
                        <th>강퇴하기</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>qqq</td>
                        <td>2</td>
                        <td>처리</td>
                        <td><button id="delete">강퇴하기</button></td>
                    </tr>
                </table>
            </div>
            <div class="div4">      
                <div class="div4-1">
                    <select id="searchSel">
                        <option value="all">전체</option>
                        <option value="">아이디</option>
                        <option value="">신고받은횟수</option>
                        <option value="">처리상태</option>
                    </select>
                    <input type="text" id="search">
                    <button id="searchBtn">검색</button>
                </div>
                
            </div>
            <div class="div5">
                <div class="col-md-12">
                </div>
            </div>
        </div>

    </div>

</body>
</html>