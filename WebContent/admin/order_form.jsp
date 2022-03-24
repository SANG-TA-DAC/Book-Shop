
<jsp:directive.include file="header.jsp" />

<div class="card-header py-3">
	<h3 class="m-0 font-weight-bold text-primary">Edit Order ID:
		${order.orderId }</h3>
</div>
<c:if test="${message != null}">
	<div align="center" class="alert alert-success" role="alert">
		<h4 class="message alert-heading">${message}</h4>
	</div>
</c:if>
<div align="center">
	<form action="update_order" method="post" id="orderForm">
		<div class="col-lg-6  ">
			<br />
			<table class="table table-bordered  ">
				<tr>
					<td><b>Order By </b></td>
					<td>${order.customer.fullname }</td>
				</tr>
				<tr>
					<td><b>Order Date </b></td>
					<td>${order.orderDate}</td>
				</tr>
				<tr>
					<td><b>Recipient Name </b></td>
					<td><input value="${order.recipientName }" type="text"
						name="recipientName" size="65" required /></td>
				</tr>
				<tr>
					<td><b>Recipient Phone </b></td>
					<td><input value="${order.recipientPhone }" type="text"
						name="recipientPhone" size="65" required /></td>
				</tr>
				<tr>
					<td><b>Ship To </b></td>
					<td><input value="${order.shippingAddress }" type="text"
						name="shippingAddress" size="65" required /></td>
				</tr>
				<tr>
					<td><b>Payment Method </b></td>
					<td><select name="paymentMethod">
							<option value="Cash On Delivery">Cash On Delivery</option>
					</select></td>
				</tr>
				<tr>
					<td><b>Order Status</b></td>
					<td>
					<select name="orderStatus">
						<option value="Processing" <c:if test="${order.status eq 'Processing' }">selected='selected'</c:if> >Processing</option>
						<option value="Shipping" <c:if test="${order.status eq 'Shipping' }">selected='selected'</c:if>>Shipping</option>
						<option value="Delivered" <c:if test="${order.status eq 'Delivered' }">selected='selected'</c:if>>Delivered</option>
						<option value="Completed" <c:if test="${order.status eq 'Completed' }">selected='selected'</c:if>>Completed</option>
						<option value="Cancelled" <c:if test="${order.status eq 'Cancelled' }">selected='selected'</c:if>>Cancelled</option>
					</select>
					</td>
				</tr>

			</table>
		</div>
		<h2>Order Book</h2>

		<div class="col-lg-6  ">
			<table class=" table table-bordered text-center ">
				<thead>
					<tr class="table-primary  ">
						<th>No</th>
						<th>Book</th>
						<th>Author</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Sub Total</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order.orderDetails }" var="orderDetail"
						varStatus="status">
						<tr>
							<td>${status.index + 1 }</td>
							<td>${orderDetail.book.title }</td>
							<td>${orderDetail.book.author}</td>
							<td><input type="hidden" name="price"
								value="${orderDetail.book.price}" /> <fmt:setLocale
									value="en_US" /> <fmt:formatNumber
									value="${orderDetail.book.price}" type="currency" /></td>
							<td><input type="hidden" name="bookId"
								value="${orderDetail.book.bookId }" /> <input type="text"
								name="quantity${status.index + 1 }"
								value=" ${orderDetail.quantity}" size="5" oninput="check(this)"
								required></td>
							<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
									value="${orderDetail.subtotal}" type="currency" /></td>
							<td><a
								href="remove_book_from_order?id=${orderDetail.book.bookId }">Remove</a></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4"><b>TOTAL:</b></td>
						<td><b>${order.bookCopies }</b></td>
						<td colspan="2"><fmt:setLocale value="en_US" /> <b><fmt:formatNumber
									value="${order.total }" type="currency" /></b></td>
					</tr>
				</tbody>
			</table>
			<div align="center">
				<a href="javascript:showAddBookPopup()" class="btn btn-primary  ">Add
					Books</a> &nbsp; <input type="submit" value="Save"
					class="btn btn-success  " />&nbsp;&nbsp; <input type="button"
					value="Cancel" class="btn btn-danger  "
					onclick="javascript:window.location.href='list_order';" />&nbsp;
			</div>
			<br />
			<br />
		</div>
	</form>
</div>
<script>
	function showAddBookPopup(){
		var width = 800;
		var height = 400;
		var left = (screen.width - width) / 2;
		var top = (screen.height - height) / 2;
		window.open('add_book_form', '_blank', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
	}
	
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
		 
</script>


<jsp:directive.include file="footer.jsp" />


