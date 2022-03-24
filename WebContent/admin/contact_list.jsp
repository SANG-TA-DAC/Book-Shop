
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary ">Contact Management</h3>
                           
                        </div>
						<c:if test="${message != null}">
							<div align="center" class="alert alert-success" role="alert">
								<h4 class="message alert-heading">${message}</h4>
							</div>
						</c:if>
					<div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center" id="example" width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="table-primary ">
                                            <th>Index</th>
                                            <th>ID</th>
                                            <th>E-mail</th>
                                            <th>Name</th>
                                            <th>Title</th>
                                            <th>Contact Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead> 
								<c:forEach var="contact" items="${listContact}" varStatus="status">									
                                    <tbody>
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${contact.contactId}</td>
                                            <td>${contact.email}</td>
                                            <td>${contact.name}</td>
                                            <td>${contact.title}</td>
                                            <td>${contact.contactDate}</td>
                                            <td>
												<a href="view_contact?id=${contact.contactId}" class="btn btn-success "><i class="far fa-edit"></i></a> &nbsp;
												<a href="javascript:void(0);" class="deleteLink btn btn-danger" id="${contact.contactId}" ><i class="far fa-trash-alt"></i></a>
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
					contactId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the customer with ID ' +  contactId + '?')) {
						window.location = 'delete_contact?id=' + contactId;
					}					
				});
			});
			 var table = $('#example').DataTable( {
				    pageLength : 5,
				    lengthMenu: [[5, 10, 20, -1], [5, 10, 20, 'All']]
				  } )
		});
	</script>
	
	<jsp:directive.include file="footer.jsp" />
	

