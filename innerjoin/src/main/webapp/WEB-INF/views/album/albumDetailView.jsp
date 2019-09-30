<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/album/album-detail.css"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	 
	
</head>
<body>
        <div class="container-fluid al-wrapper">
            <div class="row al-header">
                <div class="col-md-3 al-info">
                    <h5>2019-09-24, 16:39 pm</h5>
                    <h5>by. user01</h5>
                </div>
                <div class="col-md-4 al-title">
                    <h1 align="right">album 01</h1>
                </div>
                <div class="col-md-5 al-list">
                    <div style="width: 50px; height: 50px; overflow: hidden">
                        <img src="resources/images/list.png">
                    </div>
                </div>
            </div>
            <div class="row photo">
                <div class="col-md-12 al-photo" style="/* width: 100%; min-height: 500px;  */overflow: hidden">
								<div class="carousel slide" id="carousel-744270">
									<ol class="carousel-indicators">
										<li data-slide-to="0" data-target="#carousel-744270">
										</li>
										<li data-slide-to="1" data-target="#carousel-744270">
										</li>
										<li data-slide-to="2" data-target="#carousel-744270" class="active">
										</li>
									</ol>
									<div class="carousel-inner">
										<div class="carousel-item">
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
										<div class="carousel-item active">
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
									</div> <a class="carousel-control-prev" href="#carousel-744270" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-744270" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
								</div>
                </div>
            </div>
            <div class="row reply">
                    <div class="col-md-12">
                        <div class="row re-input">
                            <div class="col-md-12 re-txtarea">
                                <textarea rows="3" cols="128" placeholder="comment..."></textarea>
                            </div>
                            <div class="col-md-1 re-submit-btn">
                                <button class="submit-btn">submit</button>
                            </div>
                        </div>

                        <div class="row re-list">
                            <div class="col-md-12">
                                <p style="font-size:20px; font-weight:500">Comment</p>
                                <hr>
                                <div class="row re-info">
                                    <div class="col-md-3">
                                        user01
                                    </div>
                                    <div align="right" class="col-md-7">
                                        2019-09-24, 16:39 pm
                                    </div>
                                    <div class="col-md-1">
                                        <img src="resources/images/edit.png">
                                    </div>
                                    <div class="col-md-1">
                                        <img src="resources/images/delete.png">
                                    </div>
                                </div>
                                <hr>
                                <div class="row re-content">
                                    <div class="col-md-12">
                                        <textarea rows="3" cols="128" readonly>dfdsfdhaksehfuiwehihhefiu</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="row footer">
                <div class="col-md-1 delete">
                </div>
                <div class="col-md-10">
                </div>
                <div class="col-md-1 modify">
                </div>
            </div>
        </div>

           <!-- The Modal -->
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
            	<span class="close">&times;</span>  
              	<div class="modal-img-wrapper">
                	<img>
              	</div>
            </div>
       
        </div>
      
        <script type="text/javascript">
        // Get the modal
            var modal = document.getElementById('myModal');
            
            // Get the button that opens the modal
            //var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];                                          

            // When the user clicks on the button, open the modal 
            $(".al-photo img").click(function() {
                console.log($(this).attr('src'));
                var modalSrc = $(this).attr('src');
                $(".modal-img-wrapper img").attr("src",modalSrc)
                modal.style.display = "block";
            });

            // When the user clicks on <span> (x), close the modal
            $(".modal-content img, .close").click( function() {
                modal.style.display = "none";
            })

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            $(".carousel").carousel({
            	interval:false
            });
            
            $(".al-list img").click(function(){
            	location.href="albumListView.ij";
            });
        </script>
               
</body>
</html>