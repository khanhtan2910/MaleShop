<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="/shop/home">Home</a>
                            <a href="/shop/shop-category">Shop</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
        <c:if test="${empty cart }">
			<h3 class="title_confirmation text-center text-danger m-4">You
				have no items in your shopping cart.</h3>
		</c:if>
		<c:if test="${not empty cart }">
			<c:if test="${sessionScope['shop'] == null}">
			<div class="returning_customer">
					<div class="check_title">
						<h2>
							Returning Customer? <a href="/shop/account/login" style="color:blue;font-size :20px">Click here
								to login</a>
						</h2>
					</div>
					<p>If you have shopped with us before, please enter your
						details in the boxes below. If you are a new customer, please
						proceed to the Billing & Shipping section.</p>
					<div class="col-md-12 form-group">
						<a class="lost_pass" href="/shop/account/forgot-password" style="color:blue;font-size :15px">Lost
							your password?</a>
					</div>
				</div>
			</c:if>
            <div class="checkout__form">
                <form:form action="/shop/checkout/submit" modelAttribute="order"
					method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="checkout__title">Billing Details</h6>
                            <c:if test="${not empty error}">
								<b class="error text-danger"> <c:out value="${error}" />
								</b>
							</c:if>
                            
                            <div class="row contact_form">
								<div class="col-md-12 form-group checkout__input">
									<form:input path="fullName" class="form-control"
										placeholder="Full name" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Full name'" />
									<form:errors path="fullName" class="error text-danger" />
								</div>
								<div class="col-md-6 form-group p_star checkout__input">
									<form:input path="phone" class="form-control"
										placeholder="Phone number" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Phone number'" />
									<form:errors path="phone" class="error text-danger" />
								</div>
								<div class="col-md-6 form-group p_star checkout__input">
									<form:input path="email" class="form-control"
										placeholder="Email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Email'" />
									<form:errors path="email" class="error text-danger" />
								</div>
								<div class="col-md-12 form-group p_star checkout__input">
									<form:input path="birthDay" type="date" class="form-control"
										placeholder="Birth day" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Birth day'" />
									<form:errors path="birthDay" class="error text-danger" />
								</div>
								<div class="col-md-12 form-group p_star checkout__input">
									<form:input path="addressOrder" class="form-control"
										placeholder="Address order" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Address order'" />
									<form:errors path="addressOrder" class="error text-danger" />
								</div>
								<div class="col-md-12 form-group checkout__input">
									<form:input path="zip" class="form-control"
										placeholder="Postcode/ZIP" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Postcode/ZIP'" />
									<form:errors path="zip" class="error text-danger" />
								</div>
								<div class="col-md-12 form-group checkout__input">
									<div class="creat_account">
										<h3>Shipping Details</h3>
									</div>
									<form:textarea path="note" class="form-control" rows="1"
										placeholder="Order Notes"></form:textarea>
								</div>
							</div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
								<h2>Your Order</h2>
								<c:set var="subtotal" value="0" />
								<c:set var="totalDiscount" value="0" />
								<ul class="checkout__total__products ">
									<li><a >Product <span>Total</span></a></li>
									<c:forEach var="item" items="${cart }" varStatus="loopCounter">
										<li><a href="/shop/product-detail?id=${item.product_id }" style="color : black">${item.name }
												<span >x ${item.quantity }</span> <span
												class="last">$${item.price * item.quantity }</span>
										</a></li>
										<c:set var="subtotal"
											value="${(item.price * item.quantity) + subtotal }" />
										<c:if test="${item.discount > '0' }">
											<c:set var="totalDiscount"
												value="${(item.price * item.quantity * item.discount * 0.01) + totalDiscount }" />
										</c:if>
										<c:if test="${item.discount == '0' }">
											<c:set var="totalDiscount" value="${totalDiscount }" />
										</c:if>
									</c:forEach>
								</ul>
								<ul class="checkout__total__all" >
									<li><a href="#" style="color : black">Subtotal <span>$${subtotal }</span></a></li>
									<li><a href="#" style="color : black">TotalDiscount <span>$${totalDiscount
												}</span></a></li>
									<li><a href="#" style="color : black">Total <span>$${subtotal -
												totalDiscount }</span></a></li>
								</ul>
								<div class="checkout__input__checkbox">
									<div class="checkout__input__checkbox">
										<form:radiobutton path="pay" id="f-option5" name="pay"
											checked="checked" value="check payments" />
										<label for="f-option5">Check payments</label>
										<div class="check"></div>
									</div>
									<p>Please send a check to Store Name, Store Street, Store
										Town, Store State / County, Store Postcode.</p>
								</div>
								<div class="checkout__input__checkbox">
									<div class="radion_btn">
										<form:radiobutton path="pay" id="f-option6" name="pay"
											value="paypal" />
										<label for="f-option6">Paypal </label> <img
											src="<c:url value="/static/shop/imga/payment.png" />"
											alt="">
										<div class="check"></div>
									</div>
									<p>Pay via PayPal; you can pay with your credit card if you
										don't have a PayPal account.</p>
								</div>
								<button class="primary-btn" type="submit">Proceed to
									Paypal</button>
							</div>
                        </div>
                    </div>
                </form:form>
            </div>
            </c:if>
        </div>
    </section>