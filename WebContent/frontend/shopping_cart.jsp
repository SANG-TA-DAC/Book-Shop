
<jsp:directive.include file="header.jsp"/>

	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
	    <div class="container">
	        <div class="breadcrumb-content text-center">
	            <ul>
	                <li>
	                    <a href="/BookStoreWebsite">Home</a>
	                </li>
	                <li class="active"> CART PAGE </li>
	            </ul>
	        </div>
	    </div>
	</div>

	<c:if test="${message != null}">
		<div align="center" class="alert alert-success" role="alert">
			<h4 class="message alert-heading">${message}</h4>
		</div>
	</c:if>
	
	<c:set var="cart" value="${sessionScope['cart'] }" />

	<c:if test="${cart.totalItems == 0 }">
		<h2 align="center">There's no items in your cart</h2>
	</c:if>
	
	<c:if test="${cart.totalItems > 0 }">
	<div class="cart-main-area pt-90 pb-100">
		<div class="container">
			<h3 class="cart-page-title">Your cart items</h3>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<form action="update_cart" method="post" id="cartForm">
						<div class="table-content table-responsive cart-table-content table-bordered ">
							<table>
								<thead>
									<tr class="table-info"> 
										<th>No</th>
										<th>Image</th>
										<th>Book</th>
										<th>Quantity</th>
										<th>Price</th>
										<th>Subtotal</th>
										<th>Clear Cart</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${cart.items }" var="item" varStatus="status">
									<tr>
										<td>${status.index + 1 }</td>
										<td class="product-thumbnail">
											<a href="view_book?id=${item.key.bookId }">
												<img src="data:image/jpg;base64,${item.key.base64Image}" width="82" height="102" />
											</a>
										</td>
										<td class="product-name"><a href="view_book?id=${item.key.bookId }">${item.key.title }</a></td>
										<td class="product-quantity">
										<input type="hidden" name="bookId" value="${item.key.bookId }"/>
											<div class="cart-plus-minus">
											<input class="cart-plus-minus-box" type="text" name="quantity${status.index + 1}" 
											value="${item.value }"  oninput="check(this)" required/> 
											</div>
										</td>
										<td class="product-price-cart"><span class="amount">
											 <fmt:setLocale value = "en_US"/>
											 <fmt:formatNumber value="${item.key.price }" type="currency"/>
											</span>
										</td>
										
										<td class="product-subtotal" >
											   <fmt:setLocale value = "en_US"/>
											 <fmt:formatNumber value="${item.value * item.key.price }" type="currency" />
										</td>
										<td >
											<a href="remove_from_cart?book_id=${item.key.bookId }">
												<i  class="fa fa-trash"></i>
											</a>
										</td>
									</tr>
									</c:forEach>
									<tr>
										<td colspan="3"></td>
										<td>${cart.totalQuantity } Books</td>
										<td>Total:</td>
										<td colspan="2"><b> <fmt:setLocale value = "en_US"/> <fmt:formatNumber value="${cart.totalAmount }" type="currency" /></b></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="cart-shiping-update-wrapper">
									<div class="cart-shiping-update">
										<a href="${pageContext.request.contextPath }">Continue Shopping</a>
									</div>
									<div class="cart-clear">
										<button type="submit">Update Shopping Cart</button>
										<a id="clearcart">Clear Cart</a>
										<a href="checkout">Check Out</a>
									</div>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</c:if>

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
<script>
 function check(input) {
   if (input.value == 0) {
     input.setCustomValidity('Must be a number greater than zero and not empty!');
   } else if (isNaN(input.value)) {
     input.setCustomValidity('Quantity must be a number!');
   } else {
     // input is fine -- reset the error message
     input.setCustomValidity('');
   }
 }
 
 $(document).ready(function(){
		$('#clearcart').click(function(){
			window.location = 'clear_cart';
		});
	});
 
</script>
</body>
</html>	


