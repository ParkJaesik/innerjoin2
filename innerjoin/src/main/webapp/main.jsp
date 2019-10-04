<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lnag = "ko">
    <head>
    <meta charset = "UTF-8">
        <title></title>
        
        <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
        <!-- <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/yeti/bootstrap.min.css" rel="stylesheet" integrity="sha384-w6tc0TXjTUnYHwVwGgnYyV12wbRoJQo9iMlC2KdkdmVvntGgzT9jvqNEF/uKaF4m" crossorigin="anonymous"> -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/sketchy/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>

            div {
                border: 1px solid red;
            }

            .nav_area {
                padding-top: 10px;
                height: 60px;
                margin-bottom: 20px;
            }

            .info_area {
                padding-top: 10px;
                height: 600px;
                margin-bottom: 20px;
                width: 100%;
            }

            .info_area video {
                width: 100%;
                height: 100%;
            }
        
            .group_area {
                padding-top: 10px;
                height: 500px;
                margin-bottom: 20px;

            }

            .group_area .carousel {
                height: 50%;
            }

            .group_area .carousel img {
                margin : 0 auto;
                max-width: 80%;
                max-height: 100%;
                /* height: auto;  */
            } 

            .group_area .carousel .carousel-caption{
                color: black;
                
            }


        </style>





    </head>
    <body>

		<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <!-- <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 nav_area navbar-dark bg-warning">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">Messages</a>
                                </li>
                                <li class="nav-item dropdown ml-md-auto">
                                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown link</a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                            <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
                                        <div class="dropdown-divider">
                                        </div> <a class="dropdown-item" href="#">Separated link</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div> -->
                    
                    
                    <div class="row">
                        <div class="col-md-12 info_area" >
                        <c:if test="${ empty sessionScope.loginUser }">
                           <a href="loginForm.ij">로그인</a>
                        </c:if>
                        <c:if test="${ !empty sessionScope.loginUser }">
                        	<a href="logout.ij">로그아웃</a>
                        	<br>
                        	<a href="myGroupForm.ij">마이페이지</a>
                        </c:if>
                        	<a href="gochat.ij">채팅창</a>
                        

                        
                        <button onclick="goAlbum();">앨범</button>
						<script>
							function goAlbum(){
								
								location.href="albumListView.ij";
							} 
						</script>
						
						<c:url var="board" value="b"/>
				<button type="button" class="btn btn-primary" onclick="location.href='${board}'">게시판</button>
						
						<c:url var="secession" value="rblist.ij"/>
				<button type="button" class="btn btn-primary" id="group-btn-manage" onclick="location.href='${secession}'">모임관리</button>

                        <c:url var="goAlbum" value="/albumListView.ij">
							<c:param name="gno" value="1" />
						</c:url>
                        <a href="${goAlbum}">앨범</a>


                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 group_area">
                            <div class="carousel slide" id="group_info_1" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-slide-to="0" data-target="#group_info_1" class="active">
                                    </li>
                                    <li data-slide-to="1" data-target="#group_info_1" >
                                    </li>
                                    <li data-slide-to="2" data-target="#group_info_1" >
                                    </li>
                                </ol>

                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" alt="Carousel Bootstrap First" src="../img/calendar.png" />
                                        <div class="carousel-caption">
                                            <h4>
                                                Inner Join
                                            </h4>
                                            
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" alt="Carousel Bootstrap Second" src="../img/chat.PNG" />
                                        <div class="carousel-caption">
                                            <h4>
                                                inner
                                            </h4>
                                            
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" alt="Carousel Bootstrap Third" src="../img/ballot.PNG" />
                                        <div class="carousel-caption">
                                            <h4>
                                                join
                                            </h4>
                                            
                                        </div>
                                    </div>
                                </div> 

                                <a class="carousel-control-prev" href="#group_info_1" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span> 
                                    <span class="sr-only">Previous</span>
                                </a> 
                                <a class="carousel-control-next" href="#group_info_1" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon"></span> 
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <blockquote class="blockquote">
                                <p class="mb-0">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
                                </p>
                                <footer class="blockquote-footer">
                                    Someone famous in <cite>Source Title</cite>
                                </footer>
                            </blockquote>
                        </div>


                        <div class="col-md-3 group_area">
                            <div class="carousel slide" id="group_info_2">
                                <ol class="carousel-indicators">
                                    <li data-slide-to="0" data-target="#group_info_2" class="active">
                                    </li>
                                    <li data-slide-to="1" data-target="#group_info_2">
                                    </li>
                                    <li data-slide-to="2" data-target="#group_info_2">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" alt="Carousel Bootstrap First" src="../img/group_for.png" />
                                        <div class="carousel-caption">
                                            <h4>
                                                First Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" alt="Carousel Bootstrap Second" src="../img/nature.jpeg" />
                                        <div class="carousel-caption">
                                            <h4>
                                                Second Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" alt="Carousel Bootstrap Third" src="../img/kit.jpeg" />
                                        <div class="carousel-caption">
                                            <h4>
                                                Third Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                </div> 
                                <a class="carousel-control-prev" href="#group_info_2" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span> 
                                    <span class="sr-only">Previous</span></a> 
                                <a class="carousel-control-next" href="#group_info_2" data-slide="next">
                                    <span class="carousel-control-next-icon"></span> 
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <blockquote class="blockquote">
                                <p class="mb-0">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
                                </p>
                                <footer class="blockquote-footer">
                                    Someone famous in <cite>Source Title</cite>
                                </footer>
                            </blockquote>
                        </div>
                        <div class="col-md-3 group_area">
                            <div class="carousel slide" id="carousel-860030">
                                <ol class="carousel-indicators">
                                    <li data-slide-to="0" data-target="#carousel-860030" class="active">
                                    </li>
                                    <li data-slide-to="1" data-target="#carousel-860030">
                                    </li>
                                    <li data-slide-to="2" data-target="#carousel-860030">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
                                        <div class="carousel-caption">
                                            <h4>
                                                First Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
                                        <div class="carousel-caption">
                                            <h4>
                                                Second Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
                                        <div class="carousel-caption">
                                            <h4>
                                                Third Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                </div> <a class="carousel-control-prev" href="#carousel-860030" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-860030" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
                            </div>
                            <blockquote class="blockquote">
                                <p class="mb-0">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
                                </p>
                                <footer class="blockquote-footer">
                                    Someone famous in <cite>Source Title</cite>
                                </footer>
                            </blockquote>
                        </div>
                        <div class="col-md-3 group_area">
                            <div class="carousel slide" id="carousel-289886">
                                <ol class="carousel-indicators">
                                    <li data-slide-to="0" data-target="#carousel-289886" class="active">
                                    </li>
                                    <li data-slide-to="1" data-target="#carousel-289886">
                                    </li>
                                    <li data-slide-to="2" data-target="#carousel-289886">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
                                        <div class="carousel-caption">
                                            <h4>
                                                First Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
                                        <div class="carousel-caption">
                                            <h4>
                                                Second Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
                                        <div class="carousel-caption">
                                            <h4>
                                                Third Thumbnail label
                                            </h4>
                                            <p>
                                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                            </p>
                                        </div>
                                    </div>
                                </div> <a class="carousel-control-prev" href="#carousel-289886" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-289886" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
                            </div>
                            <blockquote class="blockquote">
                                <p class="mb-0">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.
                                </p>
                                <footer class="blockquote-footer">
                                    Someone famous in <cite>Source Title</cite>
                                </footer>
                            </blockquote>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button id="button" class="btn btn-warning" >click!!</button>
        
        <%@ include file="/WEB-INF/views/chat/chat.jsp" %>   <!-- 이후 모임 메인페이지로 이동 -->
	
		<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
        <script>
            $('.carousel').carousel({
                interval: false
            });
        </script>
        


    </body>
</html>