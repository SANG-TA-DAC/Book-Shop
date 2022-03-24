
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary ">Banner Management</h3>
                            <br>
                             <a href="banner_form" class="btn btn-primary ">
							<spanclass="icon text-white-50"> <i class="fas fa-plus-circle"></i></span> 
							<span class="text">Create Banner</span>
							</a>
                        </div>
						<c:if test="${message != null}">
							<div align="center" class="alert alert-success" role="alert">
								<h4 class="message alert-heading">${message}</h4>
							</div>
						</c:if>
					<div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-image text-center "  width="100%" cellspacing="0">
                                    <thead >
                                        <tr class="table-primary ">
                                            <th>Index</th>
                                            <th>ID</th>
                                            <th>Image</th>
											<th>LastUpdate Time</th>
											<th>Actions</th>
                                        </tr>
                                    </thead> 
																
                                    <tbody >
									<c:forEach var="banner" items="${listBanner}" varStatus="status">	
                                        <tr >
                                            <td>${status.index + 1}</td>
                                            <td>${banner.bannerId}</td>
                                            <td>
												<img src="data:image/jpg;png;jpeg;base64,${banner.base64Image}" width="120" height="85" />
											</td>
											<td><fmt:formatDate pattern='MM/dd/yyyy' value='${banner.lastUpdateTime}' /></td>
                                            <td>
												<a href="edit_banner?id=${banner.bannerId}" class="btn btn-success "><i class="far fa-edit"></i></a> &nbsp;
												<a href="javascript:void(0);" class="deleteLink btn btn-danger" id="${banner.bannerId}" ><i class="far fa-trash-alt"></i></a>
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
					bannerId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the news with ID ' +  bannerId + '?')) {
						window.location = 'delete_banner?id=' + bannerId;
					}					
				});
			});
		});
	</script>               
	
	
	<jsp:directive.include file="footer.jsp" />
	

