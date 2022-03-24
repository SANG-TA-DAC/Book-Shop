
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary text-center">Review Management</h3>
                            
                        </div>
						<c:if test="${message != null}">
							<div align="center" class="alert alert-success" role="alert">
								<h4 class="message alert-heading">${message}</h4>
							</div>
						</c:if>
					<div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center"  width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="table-primary ">
                                            <th>Index</th>
                                            <th>ID</th>
                                            <th>Book</th>
                                            <th>Rating</th>
                                            <th>Headline</th>
                                            <th>Customer</th>
                                            <th>Review On</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead> 
								<c:forEach var="review" items="${listReviews}" varStatus="status">									
                                    <tbody>
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${review.reviewId}</td>
                                            <td>${review.book.title}</td>
                                            <td>${review.rating}</td>
                                            <td>${review.headline}</td>
                                            <td>${review.customer.fullname}</td>
                                            <td>${review.reviewTime}</td>
                                            <td>
												<a href="edit_review?id=${review.reviewId}" class="btn btn-success "><i class="far fa-edit"></i></a> &nbsp;
												<a href="javascript:void(0);" class="deleteLink btn btn-danger" id="${review.reviewId}" ><i class="far fa-trash-alt"></i></a>
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
					reviewId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the review with ID ' +  reviewId + '?')) {
						window.location = 'delete_review?id=' + reviewId;
					}					
				});
			});
			 
		});
	</script>
	
	<jsp:directive.include file="footer.jsp" />
	

