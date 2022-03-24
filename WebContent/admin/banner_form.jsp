

	<jsp:directive.include file="header.jsp" />
	
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${banner != null}">
				<h3 class="m-0 font-weight-bold text-primary">Edit Banner</h3>
				<br>
			</c:if>
			<c:if test="${banner == null}">
				<h3 class="m-0 font-weight-bold text-primary">Create Banner</h3>
				<br>
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${banner != null}">
			<form action="update_banner" method="post" id="bannerForm" enctype="multipart/form-data" >
			<input type="hidden" name="bannerId" value="${banner.bannerId}">
		</c:if>
		<c:if test="${banner == null}">
			<form action="create_banner" method="post" id="bannerForm" enctype="multipart/form-data" >
		</c:if>
		
		 
		  
		  
		  
		  
		   <div class="form-group row ">
		    <label  class="col-sm-2 col-form-label">Banner Image :</label>
		    <div class="col-sm-6">
		       <div class="file-drop-area">
		       		<input type="file" class="file-input float-left"  id="bannerImage" name="bannerImage"
			           accept=".jfif,.jpg,.jpeg,.png,.gif"    >
			           <img class="float-left" id="thumbnail" alt="Image Preview" style="width:20%;margin-top: 10px" src="data:image/jpg;base64,${banner.base64Image }"/>
			    </div>
		    </div>
		  </div>
		  
		  <br/>
		 
		
		  <button type="submit" class="btn btn-primary " >Submit</button>
		  <button onclick="history.go(-1);" class="btn btn btn-danger ">Cancel</button>	
		</form>
	</div>
	
<script>

$(document).ready(function(){
	$('#bannerImage').change(function(){
		showImageThumbnail(this);
	});
});

function showImageThumbnail(fileInput){
	var file = fileInput.files[0];
	var reader = new FileReader();
	reader.onload = function(e){
		$('#thumbnail').attr('src', e.target.result);
	};
	reader.readAsDataURL(file);
}
    
    
    
</script> 
<br/><br/>
	<jsp:directive.include file="footer.jsp" />



