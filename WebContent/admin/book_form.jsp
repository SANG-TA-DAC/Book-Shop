

	<jsp:directive.include file="header.jsp" />
	
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${book != null}">
				<h3 class="m-0 font-weight-bold text-primary">Edit Book</h3>
				<br>
			</c:if>
			<c:if test="${book == null}">
				<h3 class="m-0 font-weight-bold text-primary">Create New Book</h3>
				<br>
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${book != null}">
			<form action="update_book" method="post" id="bookForm" enctype="multipart/form-data" >
			<input type="hidden" name="bookId" value="${book.bookId}">
		</c:if>
		<c:if test="${book == null}">
			<form action="create_book" method="post" id="bookForm" enctype="multipart/form-data" >
		</c:if>
		
				<div class="form-group row">
		    <label for="category" class="col-sm-2 col-form-label">Category :</label>
		    <div class="col-sm-6">
				<select class="form-control " name="category">
						<c:forEach items="${listCategory}" var="category" >
							<c:if test="${category.categoryId eq book.category.categoryId}">
								<option value="${category.categoryId}" selected >
							</c:if>
							<c:if test="${category.categoryId ne book.category.categoryId}">
								<option value="${category.categoryId}">
							</c:if>							
								${category.name}
							</option>
						</c:forEach>
				</select>
		    </div>
		 </div>
		 
		  <div class="form-group row">
		    <label for="title" class="col-sm-2 col-form-label">Title :</label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="title" name="title"  placeholder="Enter title" value="${book.title}" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="author" class="col-sm-2 col-form-label">Author :</label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="author" name="author"  placeholder="Enter author" value="${book.author}" required>
		    </div>
		  </div>
		  
		   <div class="form-group row">
		    <label for="isbn" class="col-sm-2 col-form-label">ISBN :</label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="isbn" name="isbn"  placeholder="Enter isbn" value="${book.isbn}" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="publishDate" class="col-sm-2 col-form-label">Publish Date :</label>
		    <div class="col-sm-6">
		    <input  class="form-control form-control-user" id="publishDate" name="publishDate" 
		    value="<fmt:formatDate pattern='MM/dd/yyyy' value='${book.publishDate }' />" required>
		    </div>
		  </div>
		  
		   <div class="form-group row ">
		    <label  class="col-sm-2 col-form-label">Book Image :</label>
		    <div class="col-sm-6">
		       <div class="file-drop-area">
			        <input type="file" class="file-input float-left"  id="bookImage" name="bookImage"
			           accept=".jfif,.jpg,.jpeg,.png,.gif"    >
			            <img id="thumbnail" alt="Image Preview" style="width:20%;margin-top: 10px" src="data:image/jpg;base64,${book.base64Image }"/>
			    </div>
		    </div>
		  </div>
		  
		   <div class="form-group row">
		    <label for="price" class="col-sm-2 col-form-label">Price :</label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="price" name="price"  placeholder="Enter price" value="${book.price}" required>
		    </div>
		  </div>
		  
		   <div class="form-group row">
		    <label for="description" class="col-sm-2 col-form-label">Description :</label>
		    <div class="col-sm-6">
		    <textarea  class="form-control form-control-user" id="description" name="description" required>${book.description }</textarea>
		    </div>
		  </div>
		
		  <button type="submit" class="btn btn-primary " >Submit</button>
		  <button onclick="history.go(-1);" class="btn btn btn-danger ">Cancel</button>	
		</form>
	</div>
<script>

$(document).ready(function(){
	$('#bookImage').change(function(){
		showImageThumbnail(this);
	});
	var editor = CKEDITOR.replace('description');
	CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/ckfinder/');
});

function showImageThumbnail(fileInput){
	var file = fileInput.files[0];
	var reader = new FileReader();
	reader.onload = function(e){
		$('#thumbnail').attr('src', e.target.result);
	};
	reader.readAsDataURL(file);
}
    
    $('#publishDate').datepicker({
        uiLibrary: 'bootstrap4'
    });
    
    
</script>
<br/><br/>
	<jsp:directive.include file="footer.jsp" />


