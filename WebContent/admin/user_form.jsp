
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${user != null}">
				<h3 class="m-0 font-weight-bold text-primary">Edit User</h3>
				<br>
			</c:if>
			<c:if test="${user == null }">
				<h3 class="m-0 font-weight-bold text-primary">Create New User</h3>
				<br>
			</c:if>
		</h2>
	</div>
	<div align="center">
	
	<c:if test="${user != null}">
		<form action="update_user" method="post" id="userForm" class="main-form" >
		<input type="hidden" name="userId" value="${user.userId }"/>
	</c:if>
	
	<c:if test="${user == null }">
		<form action="create_user" method="post" id="userForm" class="main-form" >
	</c:if>
			
		  <div class="form-group row">
		    <label for="email" class="col-sm-3 col-form-label">Email: </label>&nbsp;&nbsp;
		    <div class="col-sm-8">
		    <input type="email" class="form-control form-control-user" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter Email" value="${user.email }" required>
		    </div>
		  </div>
		    <div class="form-group row">
		    <label for="fullname" class="col-sm-3 col-form-label">Fullname: </label>&nbsp;&nbsp;
		    <div class="col-sm-8">
		    <input type="text" class="form-control form-control-user" id="fullname" name="fullname" aria-describedby="emailHelp" placeholder="Enter Fullname" value="${user.fullName }" required>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="password" class="col-sm-3 col-form-label">Password:</label>&nbsp;&nbsp;
		    <div class="col-sm-8">
		    <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password" value="${user.password }" required>
		    </div>
		  </div>
		  <button type="submit" class="btn btn-primary" >Submit</button>
		  <button onclick="history.go(-1);" class="btn btn btn-danger">Cancel</button>
	</form>
	</div>
	<jsp:directive.include file="footer.jsp" />


<!-- </script> -->
