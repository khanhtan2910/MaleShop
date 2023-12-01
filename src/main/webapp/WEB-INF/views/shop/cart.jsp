<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb__text">
					<h4>Shopping Cart</h4>
					<div class="breadcrumb__links">
						<a href="/shop/homee">Home</a> <a href="/shop/shop-category">Shop</a>
						<span>Shopping Cart</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
	<div class="container">
		<c:if test="${empty cart }">
			<h3 class="title_confirmation text-center text-danger m-4">You
				have no items in your shopping cart.</h3>
		</c:if>
		<c:if test="${not empty cart }">
			<div class="row">
				<div class="col-lg-9">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Product</th>
									<th scope="col">Price</th>
									<th scope="col">Discount</th>
									<th scope="col">Quantity</th>
									<th scope="col">Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:set var="totailCart" value="0" />
								<c:forEach var="item" items="${cart }" varStatus="loopCounter">
									<tr>
										<td>${loopCounter.count}</td>
										<td class="product__cart__item">
											<div class="product__cart__item__pic">
												<a href="/shop/product-detail?id=${item.product_id }"><img
													src="/uploads/${item.image }" alt=""
													style="max-width: 150px;"></a>
											</div>
											<div class="product__cart__item__text mt-5">
												<h6>${item.name }</h6>
											</div>
										</td>
										<td>
											<h5 id="price${loopCounter.count}">$${item.price }</h5>
										</td>
										<td>
											<h5 id="discount${loopCounter.count}">${item.discount }%</h5>
										</td>
										<td>
											<div 
												style="display: inline-block; position: relative;">
												<input type="text" name="qty" id="sst${loopCounter.count}"
													maxlength="12" value="${item.quantity }" title="Quantity:"
													
													style="width: 76px; border: 1px solid #eeeeee; border-radius: 3px; padding-left: 10px;">
												<button data-id="${item.product_id }"
													data-name="${loopCounter.count}"
													onclick="increase(this.getAttribute('data-id'),this.getAttribute('data-name'))"
													id="increase" 
													style="display: block; border: none; background: transparent; box-shadow: none; cursor: pointer; position: absolute; right: 0px; font-size: 14px; color: black; -webkit-transition: all 0.3s ease 0s; -moz-transition: all 0.3s ease 0s; -o-transition: all 0.3s ease 0s; transition: all 0.3s ease 0s;top : -4px">
													<i class="bi bi-chevron-up"></i>
												</button>
												<button data-id="${item.product_id }"
													data-name="${loopCounter.count}"
													onclick="reduced(this.getAttribute('data-id') ,this.getAttribute('data-name'))"
													id="reduced"  style="display: block; border: none; background: transparent; box-shadow: none; cursor: pointer; position: absolute; right: 0px; font-size: 14px; color: black; -webkit-transition: all 0.3s ease 0s; -moz-transition: all 0.3s ease 0s; -o-transition: all 0.3s ease 0s; transition: all 0.3s ease 0s;bottom : -8px">													
													<i class="bi bi-chevron-down"></i>
												</button>
											</div>
										</td>
										<td>
											<h5 id="totail${loopCounter.count}">
												<c:if test="${item.discount > '0' }">
										$${item.price * item.quantity - (item.price * item.quantity * item.discount * 0.01) }
										<c:set var="totailCart"
														value="${((item.price * item.quantity) - (item.price * item.quantity * item.discount * 0.01)) + totailCart }" />
												</c:if>
												<c:if test="${item.discount == '0' }">
										$${item.price * item.quantity }
										<c:set var="totailCart"
														value="${(item.price * item.quantity) + totailCart }" />
												</c:if>
											</h5>
										</td>

										<td class="cart__close"><a
											href="/shop/cart/remove?id=${item.product_id }"><i
												class="fa fa-close"></i></a></td>

									</tr>
								</c:forEach>
							</tbody>							
						</table>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn">
								<a href="/shop/shop-category">Continue Shopping</a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn update__btn">
								<a href="#"><i class="fa fa-spinner"></i> Update cart</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="cart__total">

						<h6>Cart total</h6>
						<ul>
							<li>Subtotal
								<h5 id="totailCart">$${totailCart }</h5>
							</li>

						</ul>
						<a href="/shop/checkout" class="primary-btn">Proceed to
							checkout</a>
					</div>
				</div>

			</div>
		</c:if>
	</div>
</section>