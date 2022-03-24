	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Book Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    
    <!-- CSS
	============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="assets/css/icons.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/jquery.rateyo.css">
    <!-- Modernizer JS -->

</head>

<body>
<header class="header-area header-padding-1 sticky-bar header-res-padding clearfix">
 <div class="header-top-area">
        <div class="container">
            <div class="header-top-wap">
                <div class="language-currency-wrap">
                	<c:if test="${loggedCustomer == null }">
						<div class="same-language-currency ">
							<a href="login">Login </a>
						</div>
						<div class="same-language-currency ">
							<a href="register">Register</a>
						</div>
					</c:if>
					
					<c:if test="${loggedCustomer != null }">
						<div class="same-language-currency  ">
							<a href="view_orders">My Orders</a>
						</div>
						<div class="same-language-currency ">
							<a href="logout">Logout</a>
						</div>
						<div class="same-language-currency">
                        <a href="view_profile">Welcome , ${loggedCustomer.fullname }</a>
                    </div>
					</c:if>
					
                </div>
                <div class="header-offer">
                    <p>Free delivery on order over <span>$200</span></p>
                </div>
            </div>
        </div>
    </div>
     <div class="header-bottom sticky-bar header-res-padding">
    <div class="container">
        <div class="row">
            <div class="col-xl-2 col-lg-2 col-md-6 col-4">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}">
                        <img alt="" src="assets/img/logo/logo.png">
                    </a>
                </div>
            </div>
            <div class="col-xl-8 col-lg-8 d-none d-lg-block">
                <div class="main-menu">
                    <nav>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}">Home <i class="fa fa-angle"></i></a></li>
                            <li><a href="#"> Book <i class="fa fa-angle-down"></i></a>
                                <ul class="submenu">
                                    <c:forEach var="category" items="${listCategory }" varStatus="status">
                                        <li>    
                                            <a href="view_category?id=${category.categoryId }">
                                                <c:out value="${category.name }"/>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li><a href="view_news">Blog <i class="fa fa-angle"></i></a></li>
                            <li><a href="about"> About </a></li>
                            <li><a href="contact"> Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-xl-2 col-lg-2 col-md-6 col-8">
                   <div class="header-right-wrap">
                    <div class="same-style header-search">
                        <a class="search-active" href="#"><i class="pe-7s-search"></i></a>
                        <div class="search-content">
                            <form action="search" method="get">
                                <input type="text" name="keyword" placeholder="Search" />
                                <button class="button-search" type="submit" value="Search"><i class="pe-7s-search"></i></button>
                            </form>
                        </div> 
                    </div>
                    
                    <div class="same-style cart-wrap">
                        <button class="icon-cart">
                            <i class="pe-7s-shopbag"></i>
                            <span class="count-style">${cart.totalQuantity }</span>
                        </button>
                        <div class="shopping-cart-content">
                            <ul>
                            <c:forEach items="${cart.items }" var="item" varStatus="status">
                                <li class="single-shopping-cart">
                                    <div class="shopping-cart-img">
                                        <a href="view_book?id=${item.key.bookId }"><img src="data:image/jpg;base64,${item.key.base64Image}" width="82" height="102" /></a>
                                    </div>
                                    <div class="shopping-cart-title">
                                        <h4><a href="view_book?id=${item.key.bookId }">${item.key.title } </a></h4>
                                        <h6>Qty: ${item.value }</h6>
                                        <span><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${item.value * item.key.price }" type="currency" /></span>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                            <div class="shopping-cart-total">
                            	<h4>Total Quantity : <span>${cart.totalQuantity } Books</span></h4>
                                <h4>Total : <span class="shop-total"><fmt:setLocale value = "en_US"/><fmt:formatNumber value="${cart.totalAmount }" type="currency"/></span></h4>
                            </div>
                            <div class="shopping-cart-btn btn-hover text-center">
                                <a class="default-btn" href="view_cart">view cart</a>
                                <a class="default-btn" href="checkout">checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mobile-menu-area">
            <div class="mobile-menu">
                <nav id="mobile-menu-active">
                    <ul class="menu-overflow">
                        <li><a href="/BookStoreWebsite">HOME</a></li>
                        <li><a href="#">Book</a>
                            <ul>
                            	<c:forEach var="category" items="${listCategory }" varStatus="status">
                                	<li>
                                		<a href="view_category?id=${category.categoryId }">
                                			<c:out value="${category.name }"/>
                                		</a>
                                	</li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li><a href="shop.html">Collection</a></li>
                        <li><a href="blog.html">Blog</a></li>
                        <li><a href="about.html">About us</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    </div>
</header>