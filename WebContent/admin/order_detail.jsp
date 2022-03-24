
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary">Detail Of Order ID: ${order.orderId }</h3>
                        </div>
						<c:if test="${message != null}">
							<div align="center" class="alert alert-success" role="alert">
								<h4 class="message alert-heading">${message}</h4>
							</div>
						</c:if>
						<div align="center">
						<h2 >Order Overview</h2>
						 <div class="col-lg-6  ">
                                <table class="table table-bordered  ">
                                        <tr>
                                            <td><b>Order By </b></td>
                                            <td>${order.customer.fullname }</td>
                                        </tr>     
                                        <tr>
                                            <td><b>Book Copies </b></td>
                                            <td>${order.bookCopies }</td>
                                        </tr>   
                                        <tr>
                                            <td><b>Total Amount </b></td>
                                            <td>
	                                            <fmt:setLocale value = "en_US"/>
	                                            <fmt:formatNumber value="${order.total}" type="currency" /> 
                                            </td>
                                        </tr>   
                                        <tr>
                                            <td><b>Recipient Name </b></td>
                                            <td>${order.recipientName }</td>
                                        </tr>  
                                        <tr>
                                            <td><b>Recipient Phone </b></td>
                                            <td>${order.recipientPhone }</td>
                                        </tr> 
                                        <tr>
                                            <td><b>Ship To </b></td>
                                            <td>${order.shippingAddress }</td>
                                        </tr> 
                                        <tr>
                                            <td><b>Payment Method </b></td>
                                            <td>${order.paymentMethod}</td>
                                        </tr>  
                                         <tr>
                                            <td><b>Order Status</b></td>
                                            <td>${order.status}</td>
                                        </tr> 
                                         <tr>
                                            <td><b>Order Date </b></td>
                                            <td>${order.orderDate}</td>
                                        </tr>                   
                                </table>
                             </div>	
                         </div>
       <div align="center">
       		<h2>Order Book</h2>
       		
				<div class="col-lg-6  ">
							<table class=" table table-bordered text-center ">
								<thead>
									<tr class="table-primary  ">
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
								<c:forEach items="${order.orderDetails }" var="orderDetail" varStatus="status">
									<tr>
										<td>${status.index + 1 }</td>
										<td><img src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48" height="64" /></td>
										<td>${orderDetail.book.title }</td>
										<td>${orderDetail.book.author}</td>
										<td>
											<fmt:setLocale value = "en_US"/>
	                                        <fmt:formatNumber value="${orderDetail.book.price}" type="currency" /> 	
										</td>
										<td>${orderDetail.quantity}</td>
										<td>
											<fmt:setLocale value = "en_US"/>
	                                        <fmt:formatNumber value="${orderDetail.subtotal}" type="currency" /> 
										</td>
									</tr>
									</c:forEach>
									<tr>
										<td colspan="5"><b>TOTAL:</b></td>
										<td><b>${order.bookCopies }</b></td>
										<td>
											<fmt:setLocale value = "en_US"/>
	                                        <b><fmt:formatNumber value="${order.total }" type="currency" /></b>
										</td>
									</tr>
								</tbody>
							</table>
							<div align="center">
								<a href="edit_order?id=${order.orderId }" class="btn btn-success  ">Edit This Order</a> &nbsp;
								<a href="javascript:void(0);" class="deleteLink btn btn-danger " id="${order.orderId}">Delete This Order</a> &nbsp;
							</div>
							<br/><br/>
				</div>
       </div>                
</div>
		<script>
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click", function() {
					reviewId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the review with ID ' +  reviewId + '?')) {
						window.location = 'delete_review?id=' + reviewId;
					}					
				});
			});
		});
	</script>

	
	<jsp:directive.include file="footer.jsp" />
	

