

	<jsp:directive.include file="header.jsp" />
	
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${news != null}">
				<h3 class="m-0 font-weight-bold text-primary">Edit News</h3>
				<br>
			</c:if>
			<c:if test="${news == null}">
				<h3 class="m-0 font-weight-bold text-primary">Create News</h3>
				<br>
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${news != null}">
			<form action="update_news" method="post" id="newsForm" enctype="multipart/form-data" >
			<input type="hidden" name="newId" value="${news.newId}">
		</c:if>
		<c:if test="${news == null}">
			<form action="create_news" method="post" id="newsForm" enctype="multipart/form-data" >
		</c:if>
		
		 
		  <div class="form-group row">
		    <label for="title" class="col-sm-2 col-form-label">Title :</label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="title" name="title"  placeholder="Enter title" value="${news.title}" required>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="author" class="col-sm-2 col-form-label">Author :</label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control form-control-user" id="author" name="author"  placeholder="Enter author" value="${news.author}" required>
		    </div>
		  </div>
		  
		  
		  <div class="form-group row">
		    <label for="publishDate" class="col-sm-2 col-form-label">Publish Date :</label>
		    <div class="col-sm-6">
		    <input  class="form-control form-control-user" id="publishDate" name="publishDate" 
		    value="<fmt:formatDate pattern='MM/dd/yyyy' value='${news.publishDate }' />" required>
		    </div>
		  </div>
		  
		   <div class="form-group row ">
		    <label  class="col-sm-2 col-form-label">News Image :</label>
		    <div class="col-sm-6">
		       <div class="file-drop-area">
		       		<input type="file" class="file-input float-left"  id="newsImage" name="newsImage"
			           accept=".jfif,.jpg,.jpeg,.png,.gif"    >
			            <img id="thumbnail" alt="Image Preview" style="width:20%;margin-top: 10px" src="data:image/jpg;base64,${news.base64Image }"/>
			    </div>
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="description" class="col-sm-2 col-form-label">Content :</label>
		    <div class="col-sm-6">
		    <textarea  class="form-control form-control-user" id="description" name="description" required>${news.content }</textarea>
		    </div>
		  </div>
		 
		
		  <button type="submit" class="btn btn-primary " >Submit</button>
		  <button onclick="history.go(-1);" class="btn btn btn-danger ">Cancel</button>	
		</form>
	</div>
	
<script>

$(document).ready(function(){
	$('#newsImage').change(function(){
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



