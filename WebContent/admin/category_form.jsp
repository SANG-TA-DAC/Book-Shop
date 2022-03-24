
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${category != null}">
				<h3 class="m-0 font-weight-bold text-primary">Edit Category</h3>
				<br>
			</c:if>
			<c:if test="${category == null}">
				<h3 class="m-0 font-weight-bold text-primary">Create New Category</h3>
				<br>
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${category != null}">
			<form action="update_category" method="post" id="categoryForm" class="main-form">
			<input type="hidden" name="categoryId" value="${category.categoryId}">
		</c:if>
		<c:if test="${category == null}">
			<form action="create_category" method="post" id="categoryForm" class="main-form">
		</c:if>
			
		  <div class="form-group row">
		    <label for="name" class="col-sm-2 col-form-label">Name:</label>
		    <div class="col-sm-10">
		    <input type="text" class="form-control form-control-user" id="name" name="name"  placeholder="Enter Category"  value="${category.name}" required>
		    </div>
		  </div>
			<button type="submit" class="btn btn-primary" >Submit</button>
		  <button onclick="history.go(-1);" class="btn btn btn-danger">Cancel</button>			
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
