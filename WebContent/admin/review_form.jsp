
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
				<h3 class="m-0 font-weight-bold text-primary">Edit Review</h3>
				<br>
		</h2>
	</div>
	<div align="center">
	
		<form action="update_review" method="post" id="reviewForm" class="main-form" >
		<input type="hidden" name="reviewId" value="${review.reviewId }"/>
							<div class="col-lg-12 ">
                                <table class="table table-bordered ">
                                
                                        <tr>
                                            <td>Book :</td>
                                            <td><b>${review.book.title }</b></td>
                                        </tr>     
                                        <tr>
                                            <td>Rating :</td>
                                            <td><b>${review.rating }</b></td>
                                        </tr>   
                                        <tr>
                                            <td>Customer :</td>
                                            <td><b>${review.customer.fullname }</b></td>
                                        </tr> 
                                        <tr>
                                            <td>Headline :</td>
                                            <td>
                                            	<input type="text" name="headline" value="${review.headline }" required/>
                                            </td>
                                        </tr> 
                                         <tr>
                                            <td>Comment :</td>
                                            <td>
                                            	<textarea  class="form-control form-control-user" name="comment" required >${review.comment }</textarea>
                                            </td>
                                        </tr> 
                                        <tr>
                                        	<td colspan="2" align="center">
                                        		<button type="submit" class="btn btn-primary" >Submit</button>
		  										<button onclick="history.go(-1);" class="btn btn btn-danger">Cancel</button> 
                                        	</td>
                                        </tr>
                                </table>
                             </div>	
				</form>
	</div>
	
	<jsp:directive.include file="footer.jsp" />


<!-- </script> -->
