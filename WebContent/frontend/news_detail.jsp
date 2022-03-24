<jsp:directive.include file="header.jsp" />

<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li class="active">Blog Details </li>
            </ul>
        </div>
    </div>
</div>

<div class="Blog-area pt-100 pb-100">
    <div class="container">
        <div class="row flex-row-reverse">
            <div class="col-lg-9">
                <div class="blog-details-wrapper ml-20">
                    <div class="blog-details-top">
                        <div class="blog-details-img">
                            <img src="data:image/jpg;png;base64,${news.base64Image }" alt=""  width="750" height="440" >
                        </div>
                        <div class="blog-details-content">
                            <div class="blog-meta-2">
                                <ul>
                               
                                    <li> <fmt:formatDate type = "date" dateStyle = "long"  value = "${news.publishDate }" /> - by ${news.author } (Author)</li>
                                </ul>
                            </div>
                            <br/>
                            <h1 align="center">${news.title }</h1>
                            <br/>
                            <p>${news.content }</p>
                        </div>
                    </div>
                    
                    <div class="tag-share">
                       
                        <div class="blog-share">
                            <span>share :</span>
                            <div class="share-social">
                                <ul>
                                    <li>
                                        <a class="facebook" href="#">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="twitter" href="#">
                                        <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="instagram" href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                   
                   
                </div>
            </div>
            <div class="col-lg-3">
                <div class="sidebar-style">
                    <div class="sidebar-widget">
                        <h4 class="pro-sidebar-title">Search </h4>
                        <div class="pro-sidebar-search mb-55 mt-25">
                            <form class="pro-sidebar-search-form" action="search" method="get">
                                <input type="text" name="keyword" placeholder="Search here..."/>
                                <button type="submit" value="Search">
                                    <i class="pe-7s-search"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="sidebar-widget">
                        <h4 class="pro-sidebar-title">Recent Blogs </h4>
                        <div class="sidebar-project-wrap mt-30">
                        <c:forEach items="${listDetailNews }" var="news">
                            <div class="single-sidebar-blog">
                                <div class="sidebar-blog-img">
                                    <a href="view_newsdt?id=${news.newId }">
                                    	 <img src="data:image/jpg;png;base64,${news.base64Image }" alt=""  width="70" height="60" >
                                    </a>
                                </div>
                                <div class="sidebar-blog-content">
                                    <span ><a href="view_newsdt?id=${news.newId }">${news.author }</a></span>
<%--                                     <h5><a href="view_newsdt?id=${news.newId }">${news.title }</a></h5> --%>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:directive.include file="footer.jsp" />