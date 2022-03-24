
<jsp:directive.include file="header.jsp"/>

	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
	    <div class="container">
	        <div class="breadcrumb-content text-center">
	            <ul>
	                <li>
	                    <a href="/BookStoreWebsite">Home</a>
	                </li>
	                <li class="active">Write Review </li>
	            </ul>
	        </div>
	    </div>
	</div>
	<br/>
	<div align="center">
		 			
							<div class="col-lg-6">
                            <div class="ratting-form-wrapper pl-50">
                                <h3>Your Rating</h3>
                                <div id="rateYo" ></div>
                                <hr/>
                                <div class="ratting-form">
                                   <form id="reviewForm" >
                                        <div align="center">
                                        	<h2 class="text-primary">You Already Wrote A Review For This Book.</h2>
                                        </div>
                                       
                                        <div class="row">
                                        <div class="col-md-4">
                                                <div class="rating-form-style ">
                                                <h3>${book.title}</h3>
                                                     <img src="data:image/jpg;base64,${book.base64Image }" alt="" width="270" height="350" >
                                                </div>
                                            </div>
                                           <div class="col-md-8 ">
                                                <div class="rating-form-style ">
                                                	<h3 >Reviewed By Customer : ${loggedCustomer.fullname }</h3><br/>
                                                    <input class="text-center" name="headline"  type="text" readonly="readonly" value="${review.headline }">
                                                    <textarea  name="comment" readonly="readonly" >${review.comment }</textarea>
                                                    <a class="btn btn-primary text-light" onclick="history.go(-1);">Click To Go Back</a>
                                                </div>
                                            </div> 
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                         
		
	</div>

<footer class="footer-area bg-gray pt-100 pb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-4">
                <div class="copyright mb-30">
                    <div class="footer-logo">
                        <a href="index.html">
                            <img alt="" src="assets/img/logo/logo.png">
                        </a>
                    </div>
                    <p>© 2021 <a href="#">Flone</a>.<br> All Rights Reserved</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4">
                <div class="footer-widget mb-30 ml-30">
                    <div class="footer-title">
                        <h3>ABOUT US</h3>
                    </div>
                    <div class="footer-list">
                        <ul>
                            <li><a href="about.html">About us</a></li>
                            <li><a href="#">Store location</a></li>
                            <li><a href="contact.html">Contact</a></li>
                            <li><a href="#">Orders tracking</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4">
                <div class="footer-widget mb-30 ml-50">
                    <div class="footer-title">
                        <h3>USEFUL LINKS</h3>
                    </div>
                    <div class="footer-list">
                        <ul>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Support Policy</a></li>
                            <li><a href="#">Size guide</a></li>
                            <li><a href="#">FAQs</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6">
                <div class="footer-widget mb-30 ml-75">
                    <div class="footer-title">
                        <h3>FOLLOW US</h3>
                    </div>
                    <div class="footer-list">
                        <ul>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#">Youtube</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer-widget mb-30 ml-70">
                    <div class="footer-title">
                        <h3>SUBSCRIBE</h3>
                    </div>
                    <div class="subscribe-style">
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <div id="mc_embed_signup" class="subscribe-form">
                            <form id="mc-embedded-subscribe-form" class="validate" novalidate="" target="_blank" name="mc-embedded-subscribe-form" method="post" action="http://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef">
                                <div id="mc_embed_signup_scroll" class="mc-form">
                                    <input class="email" type="email" required="" placeholder="Enter your email here.." name="EMAIL" value="">
                                    <div class="mc-news" aria-hidden="true">
                                        <input type="text" value="" tabindex="-1" name="b_6bbb9b6f5827bd842d9640c82_05d85f18ef">
                                    </div>
                                    <div class="clear">
                                        <input id="mc-embedded-subscribe" class="button" type="submit" name="subscribe" value="Subscribe">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
   <!-- jQuery JS -->
<script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
<!-- Popper JS -->
<script src="assets/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Plugins JS -->
<script src="assets/js/plugins.js"></script>
<!-- Ajax Mail -->
<!-- Main JS -->
<script src="assets/js/main.js"></script>
 <script src="assets/js/jquery.rateyo.js"></script>
	 <script type="text/javascript" >
		$(document).ready(function(){
			  $('#rateYo').rateYo({
				    starWidth:"40px",
				    fullStar: true,
				    rating: ${review.rating},
					readOnly: true
				  });
		});
		
	</script>
</body>
</html>	

