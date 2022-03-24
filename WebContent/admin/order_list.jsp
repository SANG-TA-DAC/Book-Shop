
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary text-center">Book Order Management</h3>
                            
                        </div>
						<c:if test="${message != null}">
							<div align="center" class="alert alert-success" role="alert">
								<h4 class="message alert-heading">${message}</h4>
							</div>
						</c:if>
					<div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center"   width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="table-primary  ">
                                            <th>Index</th>
                                            <th>Order ID</th>
                                            <th>Order By</th>
                                            <th>Book Copies</th>
                                            <th>Total</th>
                                            <th>Payment Method</th>
                                            <th>Status</th>
                                            <th>Order Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead> 
								<c:forEach var="order" items="${listOrder}" varStatus="status">									
                                    <tbody>
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${order.orderId}</td>
                                            <td>${order.customer.fullname}</td>
                                            <td>${order.bookCopies}</td>
                                            <td>
                                            	<fmt:setLocale value = "en_US"/>
                                            	<fmt:formatNumber value="${order.total}" type="currency" /> 
                                            </td>
                                            <td>${order.paymentMethod}</td>
                                            <td>${order.status}</td>
                                            <td>${order.orderDate}</td>
                                            <td>
												<a href="view_order?id=${order.orderId}" class="btn btn-primary "><i class="fas fa-thumbtack"></i></a> &nbsp;
												<a href="edit_order?id=${order.orderId}" class="btn btn-success "><i class="far fa-edit"></i></a> &nbsp;
												<a href="javascript:void(0);" class="deleteLink btn btn-danger" id="${order.orderId}" ><i class="far fa-trash-alt"></i></a>
											</td>  
                                        </tr>                        
                                    </tbody>
								</c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
	
		<script>
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click", function() {
					orderId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the review with ID ' +  orderId + '?')) {
						window.location = 'delete_order?id=' + orderId;
					}					
				});
			});
	
		});
	</script>
	
	<jsp:directive.include file="footer.jsp" />
	

