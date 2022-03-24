
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary ">Customer Management</h3>
                            <br>
                             <a href="customer_form.jsp" class="btn btn-primary ">
							<spanclass="icon text-white-50"> <i class="fas fa-plus-circle"></i></span> 
							<span class="text">Create New Customer</span>
							</a>
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
                                        <tr class="table-primary ">
                                            <th>Index</th>
                                            <th>ID</th>
                                            <th>E-mail</th>
                                            <th>Full Name</th>
                                            <th>City</th>
                                            <th>Country</th>
                                            <th>Registered Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead> 
								<c:forEach var="customer" items="${listCustomer}" varStatus="status">									
                                    <tbody>
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${customer.customerId}</td>
                                            <td>${customer.email}</td>
                                            <td>${customer.fullname}</td>
                                            <td>${customer.city}</td>
                                            <td>${customer.country}</td>
                                            <td>${customer.registerDate}</td>
                                            <td>
												<a href="edit_customer?id=${customer.customerId}" class="btn btn-success "><i class="far fa-edit"></i></a> &nbsp;
												<a href="javascript:void(0);" class="deleteLink btn btn-danger" id="${customer.customerId}" ><i class="far fa-trash-alt"></i></a>
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
					customerId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the customer with ID ' +  customerId + '?')) {
						window.location = 'delete_customer?id=' + customerId;
					}					
				});
			});
			
		});
	</script>
	
	<jsp:directive.include file="footer.jsp" />
	

