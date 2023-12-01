<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Free shipping, 30-day return or refund guarantee.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <a href="login.html">Sign in</a>
                                <a href="#">FAQs</a>
                            </div>
                            <div class="header__top__hover">
                                <span>Usd <i class="arrow_carrot-down"></i></span>
                                <ul>
                                    <li>USD</li>
                                    <li>EUR</li>
                                    <li>USD</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="/shop/homee"><img src="<c:url value="/static/shop/imga/logoo.png" />" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="/shop/homee">Home</a></li>
                            <li><a href="/shop/shop-category">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="./about.html">About Us</a></li>
                                    <li><a href="/shop/cart">Shopping Cart</a></li>
                                    <li><a href="/shop/checkout">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            
                            <li><a href="/shop/contact">Contacts</a></li>
                            <li><a href="#"
							 data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false"><c:if
									test="${sessionScope['shop'] != null}">
									<c:out value="${sessionScope['shop'].getFullName()}" />
								</c:if> <c:if test="${sessionScope['shop'] == null}">
									Account
								</c:if></a>
							<ul class="dropdown">
								<c:if test="${sessionScope['shop'] != null}">
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/change-information">Change information</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/change-password">Change password</a></li>
									<li class="nav-item"><a class="nav-link" href="/shop/order-history">Order
											history</a></li>
									<li class="nav-item"><a class="nav-link" href="/shop/like">Favorites
											list</a></li>
									<li class="nav-item"><a class="nav-link" href="/shop/review">Review
											history</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/logout">Logout</a></li>
								</c:if>
								<c:if test="${sessionScope['shop'] == null}">
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/login">Login</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/register">Register</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/forgot-password">Forgot password</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/tracking">Tracking</a></li>
								</c:if>
							</ul></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="<c:url value="/static/shop/imga/icon/search.png" />" alt=""></a>
                        <a href="#"><img src="<c:url value="/static/shop/imga/icon/heart.png" /> " alt=""></a>
                        <a href="/shop/cart"><img src="<c:url value="/static/shop/imga/icon/cart.png" />" alt=""> <span>0</span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>