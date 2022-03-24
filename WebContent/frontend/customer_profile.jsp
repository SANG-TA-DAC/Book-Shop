
<jsp:directive.include file="header.jsp"/>

	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
	    <div class="container">
	        <div class="breadcrumb-content text-center">
	            <ul>
	                <li>
	                    <a href="/BookStoreWebsite">Home</a>
	                </li>
	                <li class="active">Profile Page </li>
	            </ul>
	        </div>
	    </div>
	</div>
	
	<div align="center">
		<br/>
		<h2>Welcome , ${loggedCustomer.fullname }</h2>
		<br/>
	
							 <div class="col-lg-4 ">
                                <table class="table table-bordered table-striped ">
                                        <tr>
                                            <td><b>E-mail Address </b></td>
                                            <td>${loggedCustomer.email }</td>
                                        </tr>     
                                        <tr>
                                            <td><b>Full Name </b></td>
                                            <td>${loggedCustomer.fullname }</td>
                                        </tr>   
                                        <tr>
                                            <td><b>Phone Number </b></td>
                                            <td>${loggedCustomer.phone }</td>
                                        </tr>   
                                        <tr>
                                            <td><b>Address </b></td>
                                            <td>${loggedCustomer.address }</td>
                                        </tr>  
                                        <tr>
                                            <td><b>City </b></td>
                                            <td>${loggedCustomer.city }</td>
                                        </tr> 
                                        <tr>
                                            <td><b>Zip Code </b></td>
                                            <td>${loggedCustomer.zipcode }</td>
                                        </tr> 
                                        <tr>
                                            <td><b>Country </b></td>
                                            <td>${loggedCustomer.country }</td>
                                        </tr>                    
                                </table>
                                 <div class="button-box">
                                      <button  ><span><a href="edit_profile">Edit My Profile</a></span></button>
                                 </div>
                                 <br/>
                             </div>	
	</div>
	
<jsp:directive.include file="footer.jsp"/>
