
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${customer != null}">
				<h3 class="m-0 font-weight-bold text-primary">Edit Customer</h3>
				<br>
			</c:if>
			<c:if test="${customer == null }">
				<h3 class="m-0 font-weight-bold text-primary">Create New Customer</h3>
				<br>
			</c:if>
		</h2>
	</div>
	<div align="center">
	
	<c:if test="${customer != null}">
		<form action="update_customer" method="post" id="customerForm"  >
		<input type="hidden" name="customerId" value="${customer.customerId}"/>
	</c:if>
	
	<c:if test="${customer == null }">
		<form action="create_customer" method="post" id="customerForm" oninput='confirmPassword.setCustomValidity(confirmPassword.value != password.value ? "Passwords do not match." : "")'  >
	</c:if>
	
		  <div class="form-group row">
		    <label for="email" class="col-sm-2 col-form-label ">E-mail : </label>
		    <div class="col-sm-6">
		    <input type="email" class="form-control  form-control-user"  id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" value="${customer.email }" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="fullname" class="col-sm-2 col-form-label">Fullname : </label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="fullName" name="fullName" aria-describedby="emailHelp" placeholder="Enter Fullname" value="${customer.fullname }" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="password" class="col-sm-2 col-form-label">Password :</label>
		    <div class="col-sm-6">
		    <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password" value="${customer.password }" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="confirmPassword" class="col-sm-2 col-form-label">Confirm Password :</label>
		    <div class="col-sm-6">
		    <input type="password" class="form-control form-control-user" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" value="${customer.password }" required>
		    </div>
		  </div>
		  
		   <div class="form-group row">
		    <label for="phone" class="col-sm-2 col-form-label">Phone Number : </label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="phone" name="phone" aria-describedby="emailHelp" placeholder="Enter Phone Number" value="${customer.phone }" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="address" class="col-sm-2 col-form-label">Address : </label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="address" name="address" aria-describedby="emailHelp" placeholder="Enter Address" value="${customer.address }" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="city" class="col-sm-2 col-form-label">City : </label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="city" name="city" aria-describedby="emailHelp" placeholder="Enter City" value="${customer.city }" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="zipCode" class="col-sm-2 col-form-label">Zip Code : </label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="zipCode" name="zipCode" aria-describedby="emailHelp" placeholder="Enter Zip Code" value="${customer.zipcode }" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="country" class="col-sm-2 col-form-label">Country : </label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="country" name="country" aria-describedby="emailHelp" placeholder="Enter Your Country" value="${customer.country }" required>
		    </div>
		  </div>
		  
		  <button type="submit" class="btn btn-primary" >Submit</button>
		  <button onclick="history.go(-1);" class="btn btn btn-danger">Cancel</button>
	</form>
	</div>
	<jsp:directive.include file="footer.jsp" />


<!-- </script> -->
