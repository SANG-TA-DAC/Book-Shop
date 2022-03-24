
	<jsp:directive.include file="header.jsp" />
	
			<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary">Detail Of Contact ID: ${contact.contactId }</h3>
                        </div>
						<c:if test="${message != null}">
							<div align="center" class="alert alert-success" role="alert">
								<h4 class="message alert-heading">${message}</h4>
							</div>
						</c:if>
						<div align="center">
						<br/>
						 <div class="col-lg-6  ">
                                <table class="table table-bordered  ">
                                        <tr>
                                            <td><b>Contact By </b></td>
                                            <td>${contact.name }</td>
                                        </tr>     
                                        <tr>
                                            <td><b>Email </b></td>
                                            <td>${contact.email }</td>
                                        </tr>   
                                        <tr>
                                            <td><b>Title</b></td>
                                            <td>${contact.title }</td>
                                        </tr>  
                                        <tr>
                                            <td><b>Your Message </b></td>
                                            <td>${contact.description }</td>
                                        </tr> 
                                         <tr>
                                            <td><b>Contact Date </b></td>
                                            <td>${contact.contactDate}</td>
                                        </tr>                   
                                </table>
                                <br/>
                             </div>	
                         </div>
</div>

	
	<jsp:directive.include file="footer.jsp" />
	

