<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<section class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="breadcrumb__text">
				<h4>Order history</h4>
				<nav class="breadcrumb__links">
					<a href="/shop/home">Home</a> <span>Order history</span>
				</nav>
			</div>
		</div>
	</div>
</section>

<div class="shopping-cart spad">
	<div class="container">
		<c:if test="${empty list }">
			<h3 class="title_confirmation text-center text-danger m-4">You
				don't have any orders yet.</h3>
		</c:if>
		<c:if test="${not empty list }">
			<div class="row">
				<div class="shopping__cart__table col-12">
					<table class="w-100">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">ID order</th>
								<th scope="col">Status</th>
								<th scope="col">Pay</th>
								<th scope="col">Action</th>

							</tr>
						</thead>
						<tbody>

						</tbody>
						<c:forEach var="item" items="${list }" varStatus="loopCounter">
							<tr>
								<td>${loopCounter.count}</td>
								<td>${item.id }</td>
								<td><c:if test="${item.status == 'waiting' }">
										<span class="text-danger">${item.status }</span>
									</c:if> <c:if test="${item.status == 'being transported' }">
										<span class="text-warning">${item.status }</span>
									</c:if> <c:if test="${item.status == 'delivered' }">
										<span class="text-success">${item.status }</span>
									</c:if></td>
								<td><c:if test="${item.pay == 'paypal' }">
										<span class="text-danger">${item.pay }</span>
									</c:if> <c:if test="${item.pay == 'check payments' }">
										<span class="text-success">${item.pay }</span>
									</c:if></td>
								<td><a href="/shop/confirmation?id_cart=${item.id }"
									class="" style="color: black">View</a></td>
							</tr>
						</c:forEach>
					</table>


				</div>
			</div>
		</c:if>
	</div>
</div>