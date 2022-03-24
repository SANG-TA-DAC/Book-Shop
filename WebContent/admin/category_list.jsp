
<body>
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary ">Category  Management</h3>
                            <br>
                             <a href="category_form.jsp" class="btn btn-primary ">
							<spanclass="icon text-white-50"> <i class="fas fa-plus-circle"></i></span> 
							<span class="text">Create New Category</span>
							</a>
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
                                            <th>Name</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead> 
								<c:forEach var="cat" items="${listCategory}" varStatus="status">									
                                    <tbody>
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${cat.categoryId}</td>
                                            <td>${cat.name}</td>
                                            <td>
												<a href="edit_category?id=${cat.categoryId}" class="btn btn-success "><i class="far fa-edit"></i></a> &nbsp;
												<a href="javascript:void(0);" class="deleteLink btn btn-danger" id="${cat.categoryId}" ><i class="far fa-trash-alt"></i></a>
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
					categoryId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the category with ID ' +  categoryId + '?')) {
						window.location = 'delete_category?id=' + categoryId;
					}					
				});
			});
		});	
	</script>
	
	<jsp:directive.include file="footer.jsp" />
	

