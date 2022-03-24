
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary ">Books Management</h3>
                            <br>
                             <a href="new_book" class="btn btn-primary ">
							<spanclass="icon text-white-50"> <i class="fas fa-plus-circle"></i></span> 
							<span class="text">Create New Book</span>
							</a>
                        </div>
						<c:if test="${message != null}">
							<div align="center" class="alert alert-success" role="alert">
								<h4 class="message alert-heading">${message}</h4>
							</div>
						</c:if>
					<div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered text-center "  width="100%" cellspacing="0" id="example">
                                    <thead >
                                        <tr class="table-primary ">
                                            <th>Index</th>
                                            <th>ID</th>
                                            <th>Image</th>
                                            <th>Title</th>
											<th>Author</th>
											<th>Category</th>
											<th>Price</th>
											<th>Last Updated</th>
											<th>Actions</th>
                                        </tr>
                                    </thead> 
																
                                    <tbody >
									<c:forEach var="book" items="${listBooks}" varStatus="status">	
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${book.bookId}</td>
                                            <td>
												<img src="data:image/jpg;base64,${book.base64Image}" width="84" height="110" />
											</td>
											<td>${book.title}</td>
											<td>${book.author}</td>
											<td>${book.category.name}</td>
											<td><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${book.price}" type="currency" /></td>
											<td><fmt:formatDate pattern='MM/dd/yyyy' value='${book.lastUpdateTime}' /></td>
                                            <td>
												<a href="edit_book?id=${book.bookId}" class="btn btn-success "><i class="far fa-edit"></i></a> &nbsp;
												<a href="javascript:void(0);" class="deleteLink btn btn-danger" id="${book.bookId}" ><i class="far fa-trash-alt"></i></a>
											</td>                                           
                                        </tr>  
									</c:forEach>										
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
     	<script>
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click", function() {
					bookId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the book with ID ' +  bookId + '?')) {
						window.location = 'delete_book?id=' + bookId;
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
	

