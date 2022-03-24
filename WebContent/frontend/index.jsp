
	<jsp:directive.include file="header.jsp"/>

<div class="slider-area">
    <div class="slider-active owl-carousel nav-style-1">
    <c:forEach items="${listBanner }" var="banner">
        <div class="single-slider-2 slider-height-2 d-flex align-items-center bg-img "  data-ride="carousel">
            <img  src="data:image/jpg;base64,${banner.base64Image }" alt="" >
        </div>
        </c:forEach>
    </div>
</div>
<div class="suppoer-area pt-100 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="support-wrap mb-30 support-1">
                    <div class="support-icon">
                        <img class="animated" src="assets/img/icon-img/support-1.png" alt="">
                    </div>
                    <div class="support-content">
                        <h5>Free Shipping</h5>
                        <p>Free shipping on all order</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="support-wrap mb-30 support-2">
                    <div class="support-icon">
                        <img class="animated" src="assets/img/icon-img/support-2.png" alt="">
                    </div>
                    <div class="support-content">
                        <h5>Support 24/7</h5>
                        <p>Free shipping on all order</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="support-wrap mb-30 support-3">
                    <div class="support-icon">
                        <img class="animated" src="assets/img/icon-img/support-3.png" alt="">
                    </div>
                    <div class="support-content">
                        <h5>Money Return</h5>
                        <p>Free shipping on all order</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="support-wrap mb-30 support-4">
                    <div class="support-icon">
                        <img class="animated" src="assets/img/icon-img/support-4.png" alt="">
                    </div>
                    <div class="support-content">
                        <h5>Order Discount</h5>
                        <p>Free shipping on all order</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="product-area pb-60">
    <div class="container">
        <div class="section-title text-center">
            <h2>DAILY DEALS!</h2>
        </div>
                    <br><br>
                <div class="row">
                    <c:forEach items="${listNewBooks }" var="book">
                    <div class="col-xl-3 col-md-6 col-lg-4 col-sm-6">
                        <div class="product-wrap mb-25 scroll-zoom">
                            <div class="product-img">
                                <a href="view_book?id=${book.bookId }">
                                    <img class="default-img" src="data:image/jpg;base64,${book.base64Image }" alt="" width="270" height="350">
                                </a>
                            </div>
                            <div class="product-content text-center">
                                <h3 class="font-weight-bold"><a href="view_book?id=${book.bookId }">${book.title }</a></h3>
                                <i>by ${book.author }</i>
                                <div class="product-rating">
                                	<jsp:directive.include file="book_rating.jsp" />
                                </div>
                                <div class="product-price">
                                    <span class="text-danger"><fmt:setLocale value = "en_US"/> <fmt:formatNumber value="${book.price }" type="currency" /></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
    </div>
</div>

<div class="blog-area pb-55">
    <div class="container">
        <div class="section-title text-center mb-55">
            <h2>OUR BLOG</h2>
        </div>
        <div class="row"> 
        <c:forEach items="${listIndexNews }" var="news">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-wrap mb-30 scroll-zoom">
                    <div class="blog-img">
                        <a href="view_newsdt?id=${news.newId }">
                        	<img class="default-img" src="data:image/jpg;png;base64,${news.base64Image }" alt="" width="370" height="270">
                        </a>
                    </div>
                    <div class="blog-content-wrap">
                        <div class="blog-content text-center">
                            <h3><a href="blog-details.html">${news.title }</a></h3>
                            <span> <fmt:formatDate type = "date"  value = "${news.publishDate }" /> - by ${news.author } </span>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
	<jsp:directive.include file="footer.jsp"/>
