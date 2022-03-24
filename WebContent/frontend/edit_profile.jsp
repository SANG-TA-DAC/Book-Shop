
	<jsp:directive.include file="header.jsp" />
	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="/BookStoreWebsite">Home</a>
                </li>
                <li class="active">Edit Profile </li>
            </ul>
        </div>
    </div>
</div>
<br/>
<div align="center">

<h2 > Edit My Profile </h2> <br/>

								<form action="update_profile" method="post" id="customerForm" oninput='confirmPassword.setCustomValidity(confirmPassword.value != password.value ? "Passwords do not match." : "")'>
								<div class="col-lg-6  ">
                                <table class="table table-bordered  ">
                                        <tr>
                                            <td><b>E-mail Address </b></td>
                                            <td><b>${loggedCustomer.email }</b> <i>(*) Cannot be changed !</i></td>
                                        </tr>     
                                        <tr>
                                            <td><b>Full Name </b></td>
                                            <td> <input type="text" class="form-control form-control-user" id="fullName" name="fullName" aria-describedby="emailHelp" value="${loggedCustomer.fullname }" required></td>
                                        </tr>   
                                        <tr>
                                            <td><b>Phone Number </b></td>
                                            <td><input type="text" class="form-control form-control-user" id="phone" name="phone" aria-describedby="emailHelp" value="${loggedCustomer.phone }" required></td>
                                        </tr>   
                                        <tr>
                                            <td><b>Address </b></td>
                                            <td><input type="text" class="form-control form-control-user" id="address" name="address" aria-describedby="emailHelp" value="${loggedCustomer.address }" required></td>
                                        </tr>  
                                        <tr>
                                            <td><b>City </b></td>
                                            <td><input type="text" class="form-control form-control-user" id="city" name="city" aria-describedby="emailHelp" value="${loggedCustomer.city }"  required></td>
                                        </tr> 
                                        <tr>
                                            <td><b>Zip Code </b></td>
                                            <td><input type="text" class="form-control form-control-user" id="zipCode" name="zipCode" aria-describedby="emailHelp" value="${loggedCustomer.zipcode }" required></td>
                                        </tr> 
                                        <tr>
                                            <td><b>Country </b></td>
                                            <td><input type="text" class="form-control form-control-user" id="country" name="country" aria-describedby="emailHelp" value="${loggedCustomer.country }" required></td>
                                        </tr>
                                        
                                         <tr >
                                            <td colspan="2" align="center"><i>(*) Leave password fields blank if you don't want to change password.</i></td>
                                        </tr>
                                        
                                        <tr>
                                            <td><b>New Password </b></td>
                                            <td> <input type="password" class="form-control form-control-user" id="password" name="password"  ></td>
                                        </tr> 
                                        <tr>
                                            <td><b>Confirm New Password </b></td>
                                            <td><input type="password" class="form-control form-control-user" id="confirmPassword" name="confirmPassword"   ></td>
                                        </tr>                     
                                </table>
                                 <div class="button-box">
                                            <button type="submit"  >Update</button>
                                 </div>
                                 <br/>
                             </div>	
                             </form>	
                             </div>
	<jsp:directive.include file="footer.jsp" />


