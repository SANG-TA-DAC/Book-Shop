
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary ">News Management</h3>
                            <br>
                             <a href="news_form" class="btn btn-primary ">
							<spanclass="icon text-white-50"> <i class="fas fa-plus-circle"></i></span> 
							<span class="text">Create News</span>
							</a>
                        </div>
						<c:if test="${message != null}">
							<div align="center" class="alert alert-success" role="alert">
								<h4 class="message alert-heading">${message}</h4>
							</div>
						</c:if>
					<div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-image text-center " id="example" width="100%" cellspacing="0">
                                    <thead >
                                        <tr class="table-primary ">
                                            <th>Index</th>
                                            <th>ID</th>
                                            <th>Image</th>
                                            <th>Title</th>
											<th>Author</th>
											<th>Publish Date</th>
											<th>Actions</th>
                                        </tr>
                                    </thead> 
																
                                    <tbody >
									<c:forEach var="news" items="${listNews}" varStatus="status">	
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${news.newId}</td>
                                            <td>
												<img src="data:image/jpg;png;jpeg;base64,${news.base64Image}" width="120" height="85" />
											</td>
											<td>${news.title}</td>
											<td>${news.author}</td>
											<td><fmt:formatDate pattern='MM/dd/yyyy' value='${news.publishDate}' /></td>
                                            <td>
												<a href="edit_news?id=${news.newId}" class="btn btn-success "><i class="far fa-edit"></i></a> &nbsp;
												<a href="javascript:void(0);" class="deleteLink btn btn-danger" id="${news.newId}" ><i class="far fa-trash-alt"></i></a>
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
					newId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the news with ID ' +  newId + '?')) {
						window.location = 'delete_news?id=' + newId;
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
	

