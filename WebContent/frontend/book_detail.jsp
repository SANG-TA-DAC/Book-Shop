	<jsp:directive.include file="header.jsp"/>
	
	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li class="active">Shop Details </li>
            </ul>
        </div>
    </div>
	</div>
	<div class="shop-area pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="product-details dec-img-wrap">
                    <img src="data:image/jpg;base64,${book.base64Image }" alt="" >
                </div>
            </div>
            <div class="col-lg-9 col-md-9">
                <div class="product-details-content ml-70">
                    <h1 class="font-weight-bold">${book.title }</h1>
                    <div class="product-details-price">
                        <span><fmt:setLocale value = "en_US"/> <fmt:formatNumber value="${book.price }" type="currency" /> </span>
                    </div>
                    <div class="pro-details-rating-wrap">
                        <div class="pro-details-rating">
                        	<jsp:directive.include file="book_rating.jsp" />
                        </div>
                         <span><a href="#"> ${fn:length(book.reviews)} Reviews</a></span>
                    </div>
                     <div class="pro-details-list">
                        <ul>
                            <li>- <b> Author :</b> ${book.author }</li>
                            <li>- <b>Publish Date :</b> <fmt:formatDate type = "date" dateStyle = "long"  value='${book.publishDate }' /> </li>
                            <li>- <b>ISBN :</b> ${book.isbn }  </li>
                        </ul>
                    </div>
                    <div class="pro-details-quality">
                        <div class="pro-details-cart btn-hover">
                            <a id="buttonAddToCart">Add To Cart</a>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>

<div class="description-review-area pb-90">
    <div class="container">
        <div class="description-review-wrapper">
            <div class="description-review-topbar nav">
                <a class="active" data-toggle="tab" href="#des-details2">Description</a>
                <a data-toggle="tab" href="#des-details3"> Reviews (${fn:length(book.reviews)}) </a>
            </div>
            <div class="tab-content description-review-bottom">
                <div id="des-details2" class="tab-pane active">
                    <div class="product-description-wrapper">
                        <p>${book.description }</p>
                    </div>
                </div>
                
                 
                <div id="des-details3" class="tab-pane">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="review-wrapper">
                            	<c:forEach items="${book.reviews }" var="review">
                                <div class="single-review">
                                    <div class="review-img">
                                        <img src="assets/img/testimonial/avatar.png" alt="">
                                    </div>
                                    <div class="review-content">
                                        <div class="review-top-wrap">
                                            <div class="review-left">
                                                <div class="review-name">
                                                    <h4>${review.headline}</h4>
                                                </div>
                                                <div class="review-rating">
                                                   <c:forTokens items="${review.stars }" delims="," var="star">
														<c:if test="${star eq 'on' }">
													        <i class="fa fa-star yellow"></i>
													    </c:if>
													    <c:if test="${star eq 'off' }">
													         <i class="fa fa-star-o"></i>
													    </c:if>
													</c:forTokens>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-bottom">
                                          <i class="text-primary">Reviewed by ${review.customer.fullname } - on <fmt:formatDate type = "both" dateStyle = "long"  value='${review.reviewTime }' /> </i>
                                            <p>${review.comment }</p>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                     <button id="buttonWriteReview" class="btn btn-primary">Write A Customer Review</button>
                </div>             
            </div>
        </div>
    </div>
</div>

<div class="related-product-area pb-95">
    <div class="container">
        <div class="section-title text-center mb-50">
            <h2>Related products</h2>
        </div>
        <div class="related-product-active owl-carousel">
        <c:forEach items="${listDetailBook }" var="books">
            <div class="product-wrap">
                <div class="product-img">
                    <a href="view_book?id=${books.bookId }">
                       <img src="data:image/jpg;base64,${books.base64Image }" alt="" width="270" height="345" >
                    </a>
                </div>
                <div class="product-content text-center">
                    <h3><a href="view_book?id=${books.bookId }">${books.title }</a></h3>
                    <div class="product-rating">
                        <jsp:directive.include file="book_rating.jsp" />
                    </div>
                    <div class="product-price">
                        <span><fmt:setLocale value = "en_US"/> <fmt:formatNumber value="${book.price }" type="currency" /></span>
                    </div>
                </div>
            </div>
             </c:forEach>
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
			$('#buttonWriteReview').click(function(){
				window.location = 'write_review?book_id=' + ${book.bookId};
			});
			 
			$('#buttonAddToCart').click(function(){
				window.location = 'add_to_cart?book_id=' + ${book.bookId};
			});
		});
		
	</script>
</body>
</html>	


