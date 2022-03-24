
<jsp:directive.include file="header.jsp"/>

	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
	    <div class="container">
	        <div class="breadcrumb-content text-center">
	            <ul>
	                <li>
	                    <a href="/BookStoreWebsite">Home</a>
	                </li>
	                <li class="active">Login </li>
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
                            <h2 >--- LOGIN ---</h2>
                    </div>
                    
						<c:if test="${message != null}">
							<div align="center " class="alert alert-danger" role="alert">
								<h class="message alert-heading">${message}</h>
							</div>
						</c:if>
						
						<div  class="tab-pane active">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <form action="login" method="post">
                                        <input type="email" name="email" id="email" placeholder="Email" required>
                                        <input type="password" name="password" id="password" placeholder="Password" required>
                                        <div class="button-box">
                                            <button type="submit">Login</button>
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
	
<jsp:directive.include file="footer.jsp"/>
