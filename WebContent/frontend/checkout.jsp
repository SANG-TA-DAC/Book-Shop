
<jsp:directive.include file="header.jsp"/>

	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
	    <div class="container">
	        <div class="breadcrumb-content text-center">
	            <ul>
	                <li>
	                    <a href="/BookStoreWebsite">Home</a>
	                </li>
	                <li class="active"> CHECKOUT </li>
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
	<br/>
	<div align="center">
	<h2>Review Your Order Details</h2>
	<div class="col-lg-6 col-md-6 ">
		<table class=" table table-bordered text-center ">
			<thead>
				<tr class="table-info">
					<th>No</th>
					<th>Image</th>
					<th>Book</th>
					<th>Author</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Subtotal</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${cart.items}" var="item" varStatus="status">
				<tr>
					<td>${status.index + 1 }</td>
					<td>
						<a href="view_book?id=${item.key.bookId }">
							<img src="data:image/jpg;base64,${item.key.base64Image}" width="82" height="102" />
						</a>
					</td>
					<td class="product-name"><a href="view_book?id=${item.key.bookId }">${item.key.title }</a></td>
					<td>${item.key.author }</td>
					<td >
						 <fmt:setLocale value = "en_US"/>
						 <fmt:formatNumber value="${item.key.price }" type="currency"/>
					</td>
					<td >${item.value }</td>
					<td >
						   <fmt:setLocale value = "en_US"/>
						 <fmt:formatNumber value="${item.value * item.key.price }" type="currency" />
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5"><b>TOTAL:</b></td>
					<td><b>${cart.totalQuantity } Books</b></td>
					<td>
						<fmt:setLocale value = "en_US"/> 
						<b><fmt:formatNumber value="${cart.totalAmount }" type="currency" /></b>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="button-box">
            <button  ><span><a href="view_cart">Edit Your Cart</a></span></button>
        </div>
	</div>
	<br/>
	<h2>Your Shipping Information</h2>
	<div class="col-lg-4 ">
	<form action="place_order" method="post" id="orderForm">
		<table class=" table table-bordered ">
			<tr>
				<td><b>Recipient Name:</b></td>
				<td><input type="text" name="recipientName" value="${loggedCustomer.fullname }" required /></td>
			</tr>
			<tr>
				<td><b>Recipient Phone:</b></td>
				<td><input type="text" name="recipientPhone" value="${loggedCustomer.phone }" required /></td>
			</tr>
			<tr>
				<td><b>Street Address:</b></td>
				<td><input type="text" name="address" value="${loggedCustomer.address }" required /></td>
			</tr>
			<tr>
				<td><b>City:</b></td>
				<td><input type="text" name="city" value="${loggedCustomer.city }" required /></td>
			</tr>
			<tr>
				<td><b>Zip Code:</b></td>
				<td><input type="text" name="zipCode" value="${loggedCustomer.zipcode }" required /></td>
			</tr>
			<tr>
				<td><b>Country:</b></td>
				<td><input type="text" name="country" value="${loggedCustomer.country }" required /></td>
			</tr>
		</table>
		<div>
			<h2>Payment</h2>
			Choose your payment method:
			<select name="paymentMethod" >
				<option value="Cash On Delivery">Cash On Delivery</option>
				<option value="#">PayPal</option>
			</select>
			<br/><br/>
		</div>
		
		<button type="submit">Place Order</button>&nbsp;&nbsp;&nbsp;
		<button ><a href="${pageContext.request.contextPath }">Continue Shopping</a></button>&nbsp;&nbsp;&nbsp;
		</form>
	</div>
	

<br/>	
</c:if>
<jsp:directive.include file="footer.jsp"/>


