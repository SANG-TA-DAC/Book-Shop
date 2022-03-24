
	<jsp:directive.include file="header.jsp" />
	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="/BookStoreWebsite">Home</a>
                </li>
                <li class="active">Register </li>
            </ul>
        </div>
    </div>
</div>
<div class="login-register-area pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                <div class="login-register-wrapper">
                 <div class="login-register-tab-list nav">
                            <h2 >--- REGISTER ---</h2>
                    </div>
                        <div class="tab-pane">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <form action="register_customer" method="post" id="customerForm" oninput='confirmPassword.setCustomValidity(confirmPassword.value != password.value ? "Passwords do not match." : "")'>
                                    
                                    <div class="row">
                                    		  <div class="col-lg-12 col-md-12">
                                                <div class="billing-info">
                                                    <label>Fullname</label>
                                                   <input type="text" class="form-control form-control-user" id="fullName" name="fullName" aria-describedby="emailHelp"  required>
                                                </div>
                                            </div>
                                           
                                            <div class="col-lg-12 col-md-12">
                                                <div class="billing-info">
                                                    <label>Email Address</label>
                                                    <input type="email" class="form-control  form-control-user"  id="email" name="email" aria-describedby="emailHelp"  required>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>Password</label>
                                                    <input type="password" class="form-control form-control-user" id="password" name="password"  required>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>Confirm Password</label>
                                                     <input type="password" class="form-control form-control-user" id="confirmPassword" name="confirmPassword"   required>
                                                </div>
                                            </div>
                                             <div class="col-lg-12 col-md-12">
                                                <div class="billing-info">
                                                    <label>Phone Number</label>
                                                     <input type="text" class="form-control form-control-user" id="phone" name="phone" aria-describedby="emailHelp"  required>
                                                </div>
                                            </div>
                                    
                                    		<div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>Address</label>
                                                     <input type="text" class="form-control form-control-user" id="address" name="address" aria-describedby="emailHelp"  required>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>City</label>
                                                    <input type="text" class="form-control form-control-user" id="city" name="city" aria-describedby="emailHelp"   required>
                                                </div>
                                            </div>
                                            	<div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>Zip Code</label>
                                                    <input type="text" class="form-control form-control-user" id="zipCode" name="zipCode" aria-describedby="emailHelp"  required>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="billing-info">
                                                    <label>Country</label>
                                                     <input type="text" class="form-control form-control-user" id="country" name="country" aria-describedby="emailHelp"   required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="button-box">
                                            <button type="submit" ><span>Register</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
	<jsp:directive.include file="footer.jsp" />


