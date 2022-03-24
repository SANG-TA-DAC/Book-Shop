
<jsp:directive.include file="header.jsp" />

<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
	<div class="container">
		<div class="breadcrumb-content text-center">
			<ul>
				<li><a href="/BookStoreWebsite">Home</a></li>
				<li class="active">ORDER DETAIL</li>
			</ul>
		</div>
	</div>
</div>
<br/>
	<div align="center">
	<c:if test="${order == null }">
		<h2>Sorry, You Are Not Authorized To View This Order</h2>
	</c:if>
	<c:if test="${order != null }">
		<h3 class="m-0 font-weight-bold">Your Order ID: ${order.orderId }</h3>
		<br />
		<div align="center">
			<div class="col-lg-6 ">
				<table class="table table-bordered table-striped ">
					<tr>
						<td><b>Order Status:</b></td>
						<td>${order.status}</td>
					</tr>
					<tr>
						<td><b>Order Date: </b></td>
						<td>${order.orderDate}</td>
					</tr>
					<tr>
						<td><b>Quantity: </b></td>
						<td>${order.bookCopies }</td>
					</tr>
					<tr>
						<td><b>Total Amount: </b></td>
						<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
								value="${order.total}" type="currency" /></td>
					</tr>
					<tr>
						<td><b>Recipient Name: </b></td>
						<td>${order.recipientName }</td>
					</tr>
					<tr>
						<td><b>Recipient Phone: </b></td>
						<td>${order.recipientPhone }</td>
					</tr>
					<tr>
						<td><b>Shipping To: </b></td>
						<td>${order.shippingAddress }</td>
					</tr>
					<tr>
						<td><b>Payment Method: </b></td>
						<td>${order.paymentMethod}</td>
					</tr>
				</table>
			</div>
		</div>
		<h2>Order Book</h2>

		<div class="col-lg-6  ">
			<table class=" table table-bordered text-center ">
				<thead>
					<tr class="table-info">
						<th>No</th>
						<th>Image</th>
						<th>Book</th>
						<th>Author</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Sub Total</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order.orderDetails }" var="orderDetail"
						varStatus="status">
						<tr>
							<td>${status.index + 1 }</td>
							<td><img
								src="data:image/jpg;base64,${orderDetail.book.base64Image}"
								width="48" height="64" /></td>
							<td>${orderDetail.book.title }</td>
							<td>${orderDetail.book.author}</td>
							<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
									value="${orderDetail.book.price}" type="currency" /></td>
							<td>${orderDetail.quantity}</td>
							<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
									value="${orderDetail.subtotal}" type="currency" /></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"><b>TOTAL:</b></td>
						<td><b>${order.bookCopies } Books</b></td>
						<td><fmt:setLocale value="en_US" /> <b><fmt:formatNumber
									value="${order.total }" type="currency" /></b></td>
					</tr>
				</tbody>
			</table>
			<br /> <br />
		</div>
	</c:if>
</div>

<jsp:directive.include file="footer.jsp" />


