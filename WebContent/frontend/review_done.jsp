
<jsp:directive.include file="header.jsp"/>

	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
	    <div class="container">
	        <div class="breadcrumb-content text-center">
	            <ul>
	                <li>
	                    <a href="/BookStoreWebsite">Home</a>
	                </li>
	                <li class="active"> Review Done</li>
	            </ul>
	        </div>
	    </div>
	</div>
	<br/>
	<div align="center">
		 			
							<div class="col-lg-6">
                            <div class="ratting-form-wrapper pl-50">
                                <h2 class="text-danger">Thank you! ${loggedCustomer.fullname } , Your Review Has Been Posted.</h2><br/>
                                <a href="${pageContext.request.contextPath}"><u>Click To Continue Shop</u> </a>
                                <hr/>
                                <div class="ratting-form">
                                        <div class="row">
                                        <div class="col-md-4">
                                                <div class="rating-form-style ">
                                                ${book.title}
                                                     <img src="data:image/jpg;base64,${book.base64Image }" alt="" width="270" height="350" >
                                                </div>
                                            </div>
                                           <div class="col-md-8 ">
                                                <div class="rating-form-style ">
                                                	<h3 ></h3><br/>
                                                </div>
                                            </div> 
                                        </div> 
                                </div>
                            </div>
                        </div>
                         
		
	</div>
<jsp:directive.include file="footer.jsp"/>
