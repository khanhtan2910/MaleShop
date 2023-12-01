<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb__text">
					<h4>Shop</h4>
					<div class="breadcrumb__links">
						<a href="/shop/homee">Home</a> <span>Shop</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shop Section Begin -->
<section class="shop spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="shop__sidebar">
					<div class="shop__sidebar__search">
						<form action="/shop/shop-category">
							<input type="text" name="keywords" placeholder="Search..." >
							<button type="submit">
								<span class="icon_search"></span>
							</button>
						</form>
					</div>
					<div class="shop__sidebar__accordion">
						<div class="accordion" id="accordionExample">
							<div class="card">
								<div class="card-heading">
									<a data-toggle="collapse" data-target="#collapseOne">Categories</a>
								</div>
								<div id="collapseOne" class="collapse show"
									data-parent="#accordionExample">
									<div class="card-body">
										<div class="shop__sidebar__categories">
											<ul class="nice-scroll">
												<c:forEach var="item" items="${categories }">
													<li class="main-nav-list"><a
														href="/shop/shop-category?categoryProduct_id=${item.id }&size=40">${item.name }</a></li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-heading">
									<a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
								</div>
								<div id="collapseTwo" class="collapse show"
									data-parent="#accordionExample">
									<div class="card-body">
										<div class="shop__sidebar__brand">
											<ul class="nice-scroll">
												<c:forEach var="item" items="${brands }">
													<li class="main-nav-list"><a
														href="/shop/shop-category?brand_id=${item.id }&size=40">${item.name }</a></li>
												</c:forEach>

											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-heading">
									<a data-toggle="collapse" data-target="#collapseThree">Filter
										Price</a>
								</div>
								<div id="collapseThree" class="collapse show"
									data-parent="#accordionExample">
									<div class="card-body">
										<div class="shop__sidebar__price">
											<ul>
												<li><a href="#">$0.00 - $50.00</a></li>
												<li><a href="#">$50.00 - $100.00</a></li>
												<li><a href="#">$100.00 - $150.00</a></li>
												<li><a href="#">$150.00 - $200.00</a></li>
												<li><a href="#">$200.00 - $250.00</a></li>
												<li><a href="#">250.00+</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							
							<div class="card">
								<div class="card-heading">
									<a data-toggle="collapse" data-target="#collapseFive">Material</a>
								</div>
								<div id="collapseFive" class="collapse show"
									data-parent="#accordionExample">
									<div class="card-body">
										<div class="shop__sidebar__price">
										<ul class="nice-scroll">
											<c:forEach var="item" items="${colors }">
												<li><a
													href="/shop/shop-category?color_id=${item.id }&size=40">
														${item.name }
												</a></li>
											</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-heading">
									<a data-toggle="collapse" data-target="#collapseSix">Tags</a>
								</div>
								<div id="collapseSix" class="collapse show"
									data-parent="#accordionExample">
									<div class="card-body">
										<div class="shop__sidebar__tags">
										<c:forEach var="item" items="${categories }">
													<a
														href="/shop/shop-category?categoryProduct_id=${item.id }&size=40">${item.name }</a>
												</c:forEach>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9" >
				<div class="shop__product__option">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="shop__product__option__left">
								<p>Showing 1-12 of 126 results</p>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="shop__product__option__right row">
								<p>Filter by : </p>
								<form action="/shop/shop-category">
						   <select name="field" id="field" onchange="this.form.submit()">
							<option value="id"
								<c:if test="${field == 'id'}">selected="selected"</c:if>>Default
								sorting</option>
							<option value="name"
								<c:if test="${field == 'name'}">selected="selected"</c:if>>Product
								name</option>
							<option value="price"
								<c:if test="${field == 'price'}">selected="selected"</c:if>>Price</option>
							<option value="discount"
								<c:if test="${field == 'discount'}">selected="selected"</c:if>>Discount</option>
							<option value="quantity"
								<c:if test="${field == 'quantity'}">selected="selected"</c:if>>Quantity</option>
						</select>
					</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
				<c:if test="${empty resultPage.content }">
					<h3 class="title_confirmation text-center text-danger m-4">No
						product.</h3>
				</c:if>
				<c:if test="${not empty resultPage.content }">
				<c:forEach var="item" items="${resultPage.content }"
							varStatus="loopCounter">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="img/product/product-2.jpg">
								<a href="/shop/product-detail?id=${item.id }"><img class="img-fluid"
										src="/uploads/${item.banner }" alt="Banner product"></a>
								<ul class="product__hover">
									<li><a href="/shop/like/add?id=${item.id }"><img src="/static/shop/imga/icon/heart.png" alt=""><span>Wistlist</span></a></li>
									<li><a href="#"><img src="/static/shop/imga/icon/compare.png" alt="">
											<span>Compare</span></a></li>
									<li><a href="#"><img src="/static/shop/imga/icon/search.png" alt=""></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>${item.name }</h6>
								<a href="/shop/cart/add?id=${item.id }" class="add-cart">+ Add To Cart</a>
								<div class="rating">
									
								</div>
								<div class="row">
											<c:set var="startDay"
												value="${item.startDayDiscount.getTime() }" />
											<c:set var="endDay" value="${item.endDayDiscount.getTime() }" />
											<c:set var="dayNow" value="<%=(new Date()).getTime()%>" />
											<c:if
												test="${item.discount > '0' && startDay <= dayNow && endDay >= dayNow }">
												
												<h5 class="l-through col-4" style="text-decoration: line-through;color : red">$${item.price }</h5>
												<h5 class=" col-4">$${item.price - (item.price * item.discount * 0.01)
													}</h5>
											</c:if>
											<c:if
												test="${item.discount == '0' || startDay > dayNow || endDay < dayNow }">
												<h5 class=" col-4">$${item.price }</h5>
											</c:if>
										</div>
								
							</div>
						</div>
					</div>
					</c:forEach>
					</c:if>
				</div>
				<div class="row">
				<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<div class="product__pagination">
							<c:if test="${resultPage.totalPages > 0}">
						
					   <div class="pagination">
					   
						<a href="/shop/shop-category?field=${field }&keywords=${keywords }&size=${size }&page=1"
							class="${resultPage.number + 1 == 1 ? 'prev-arrow active' : 'prev-arrow'}">
							<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
						</a>
						<c:forEach var="pageNumber" items="${pageNumbers }">
							<c:if test="${resultPage.totalPages > 1}">
								<a
									href="/shop/shop-category?field=${field }&keywords=${keywords }&size=${size }&page=${pageNumber }"
									class="${pageNumber == resultPage.number + 1 ? 'active' : ''}">${pageNumber}</a>
							</c:if>
						</c:forEach>

						<a
							href="/shop/shop-category?field=${field }&keywords=${keywords } &size=${size }&page=${resultPage.totalPages }"
							class="${resultPage.number + 1 == resultPage.totalPages ? 'next-arrow active' : 'next-arrow'}"><i
							class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
					</div>
				    </c:if>
						</div>
					</div>
					<div class="col-lg-4"></div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/layout/shop/common/related-product.jsp"></jsp:include>