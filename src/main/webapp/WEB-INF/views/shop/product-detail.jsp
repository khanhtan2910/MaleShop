<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<link rel="stylesheet"
	href="/static/shop/cssc/maiin.css" type="text/css" />
<section class="shop-details">
	<div class="product__details__pic">
		<div class="container">
			<div class="row p-3">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="/shop/homee">Home</a>
						<a href="/shop/shop-category">Shop</a>
						<span>Product-details</span>
						
					</div>
				</div>
			</div>
			<div class="row ">
				
				<div class=" col-md-12">
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
						
						<c:forEach var="item"
								items="${listImage }">
								<div class="product__details__pic__item w-100">
									<img style="width: 500px;height: 500px;"
										src="<c:url value="/uploads/${item.name }" />" alt="">
								</div>
							</c:forEach>
						
							
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__pic__item">
								<img src="img/shop-details/product-big-3.png" alt="">
							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__pic__item">
								<img src="img/shop-details/product-big.png" alt="">
							</div>
						</div>
						<div class="tab-pane" id="tabs-4" role="tabpanel">
							<div class="product__details__pic__item">
								<img src="img/shop-details/product-big-4.png" alt=""> <a
									href="https://www.youtube.com/watch?v=8PJ3_p7VqHw&list=RD8PJ3_p7VqHw&start_radio=1"
									class="video-popup"><i class="fa fa-play"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product__details__content">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-8">
					<div class="product__details__text">
						<h4>${product.name }</h4>
						
						<c:set var="startDay"
							value="${product.startDayDiscount.getTime() }" />
						<c:set var="endDay" value="${product.endDayDiscount.getTime() }" />
						<c:set var="dayNow" value="<%=(new Date()).getTime()%>" />
						<c:if
							test="${product.discount > '0' && startDay <= dayNow && endDay >= dayNow }">
							<h2>$${product.price - (product.price * product.discount *
								0.01) }</h2>
							<h6 class="l-through" style="text-decoration: line-through;color : red">$${product.price }</h6>
						</c:if>
						<c:if
							test="${product.discount == '0' || startDay > dayNow || endDay < dayNow }">
							<h2>$${product.price }</h2>
						</c:if>
						<p>Coat with quilted lining and an adjustable hood. Featuring
							long sleeves with adjustable cuff tabs, adjustable asymmetric hem
							with elastic side tabs and a front zip fastening with placket.</p>
						
						<div class="product__details__cart__option">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
							<a href="/shop/cart/add?id=${product.id }" class="primary-btn">add
								to cart</a>
						</div>
						<div class="product__details__btns__option">
							<a href="/shop/like/add?id=${product.id }"><i
								class="fa fa-heart"></i> add to wishlist</a> <a href="#"><i
								class="fa fa-exchange"></i> Add To Compare</a>
						</div>
						<div class="product__details__last__option">
							<h5>
								<span>Guaranteed Safe Checkout</span>
							</h5>
							<img src="/static/shop/imga/payment.png"  alt="">
							<ul >
								<li style="font-size: 20px;"><a class="active" style="color:black"
									href="/shop/shop-category?brand_id=${product.brand.id }&size=40"><span>Brand</span>
										: ${product.brand.name }</a></li>
								<li style="font-size: 20px;"><a class="active" style="color:black"
									href="/shop/shop-category?categoryProduct_id=${product.categoryProduct.id }&size=40"><span >Category</span>
										: ${product.categoryProduct.name }</a></li>
								<li style="font-size: 20px;"><a href="/shop/shop-category?color_id=${product.color.id }&size=40"  style="color:black;"><span>Material :</span>
									${product.color.name }</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row " style="padding-bottom: 50px">
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-5" role="tab">Description</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-6" role="tab">Customer Previews(${totailReview })</a></li>
							
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-5" role="tabpanel">
								<div class="product__details__tab__content_item">
								<h4 style="font-weight: bold;">Products Infomation</h4>
									<p class="note">${product.description }</p>
									
									
								</div>
							</div>
							<div class="tab-pane" id="tabs-6" role="tabpanel" >
								
										<div class="row">
											<div class="col-lg-6">
												<div class="row total_rate">
													<div class="col-6" >
														<div class="box_total" style="text-align:center;background-color: rgb(167, 166, 172);padding: 3px;">
															<h5>Overall</h5>
															<h4>${totailStar }</h4>
															<h6>(${totailReview } Reviews)</h6>
														</div>
													</div>
													<div class="col-6">
														<div class="rating_list">
															<h4>Based on ${totailReview } Reviews</h4>
															<ul class="list-group list-group-flush">
																<c:forEach var="item" items="${listNumberReviewStar }"
																	varStatus="loopCounter">
																	<li class="list-group-item" ><a>${item[0] } Star <c:forEach var="i"
																				begin="1" end="${item[0] }">
																				<i class="fa fa-star" style=color:yellow></i>
																			</c:forEach> ${item[1] }
																	</a></li>

																</c:forEach>
															</ul>
														</div>
													</div>
												</div>
												<div class="review_list">
													<c:if test="${empty resultPageReview.content }">
														<h3 class="title_confirmation text-center text-danger m-4">No
															review.</h3>
													</c:if>
													<c:if test="${not empty resultPageReview.content }">
														<c:forEach var="item" items="${resultPageReview.content }"
															varStatus="loopCounter">
															<div class="review_item" >
																<div class="media">
																	<div class="d-flex">
																		<img src="/uploads/${item.avatar }" alt=""
																			style="width: 70px; height: 70px; border-radius: 100%;">
																	</div>
																	<div class="media-body">
																		<h4>${item.fullName }</h4>
																		<c:forEach var="i" begin="1" end="${item.star }">
																			<i class="fa fa-star"></i>
																		</c:forEach>
																	</div>
																</div>
																<p>${item.review }</p>
																
															</div>
														</c:forEach>
													</c:if>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="review_box">
													<form:form action="/shop/product-detail/review"
														modelAttribute="review" method="post"
														class="row contact_form" id="contactForm">
														<form:hidden path="product.id" value="${product.id }" />
														<c:if test="${sessionScope['shop'] != null}">
															<form:hidden path="avatar"
																value="${sessionScope['shop'].getAvatar()}" />
															<c:set var="email"
																value="${sessionScope['shop'].getEmail()}" />
															<c:set var="fullName"
																value="${sessionScope['shop'].getFullName()}" />
														</c:if>
														<div class="col-md-12">
															<h4>Add a Review</h4>
															<p>Your Rating:</p>
															<div class="rating-wrapper">
																<form:radiobutton path="star" id="5-star-rating"
																	name="star-rating" value="5" />
																<label for="5-star-rating" class="star-rating">
																	<i class="fa fa-star d-inline-block"></i>
																</label>
																<form:radiobutton path="star" id="4-star-rating"
																	name="star-rating" value="4" />
																<label for="4-star-rating" class="star-rating star">
																	<i class="fa fa-star d-inline-block"></i>
																</label>
																<form:radiobutton path="star" id="3-star-rating"
																	name="star-rating" value="3" />
																<label for="3-star-rating" class="star-rating star">
																	<i class="fa fa-star d-inline-block"></i>
																</label>
																<form:radiobutton path="star" id="2-star-rating"
																	name="star-rating" value="2" />
																<label for="2-star-rating" class="star-rating star">
																	<i class="fa fa-star d-inline-block"></i>
																</label>
																<form:radiobutton path="star" id="1-star-rating"
																	name="star-rating" value="1" />
																<label for="1-star-rating" class="star-rating star">
																	<i class="fa fa-star d-inline-block"></i>
																</label>
															</div>
															<p>Outstanding</p>
														</div>
														<div class="col-md-12">
															<div class="form-group">
																<form:input path="fullName" class="form-control"
																	placeholder="Full name" onfocus="this.placeholder = ''"
																	onblur="this.placeholder = 'Full name'"
																	value="${fullName }" />
																<form:errors path="fullName" class="error text-danger" />
															</div>
														</div>
														<div class="col-md-12">
															<div class="form-group">
																<form:input path="email" class="form-control"
																	placeholder="Email" onfocus="this.placeholder = ''"
																	onblur="this.placeholder = 'Email'" value="${email }" />
																<form:errors path="email" class="error text-danger" />
															</div>
														</div>
														<div class="col-md-12">
															<div class="form-group">
																<form:textarea path="review" class="form-control"
																	rows="1" placeholder="Review"
																	onfocus="this.placeholder = ''"
																	onblur="this.placeholder = 'Review'"></form:textarea>
																<form:errors path="review" class="error text-danger" />
															</div>
														</div>
														<div class="col-md-12 text-right">
															<button type="submit" value="submit" class="primary-btn">Submit
																Now</button>
														</div>
													</form:form>
												</div>
											</div>
										</div>
									
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</section>
<!-- Shop Details Section End -->

<!-- Related Section Begin -->
