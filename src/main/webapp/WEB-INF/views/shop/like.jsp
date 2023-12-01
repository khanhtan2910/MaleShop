<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="breadcrumb-option">
	<div class="container">
		<div
			class="row">
			<div class="breadcrumb__text">
				<h1>Favorites list</h1>
				<nav class="breadcrumb__links">
					<a href="/shop/homee">Home<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/like">Favorites list</a>
				</nav>
			</div>
		</div>
	</div>
</section>

<div class="whole-wrap pb-100 m-4">
	<div class="container">
		<div class="section">
			<c:if test="${empty list }">
				<h3 class="title_confirmation text-center text-danger m-4">You
					have not liked any products yet.</h3>
			</c:if>
			<c:if test="${not empty list }">
				<div class="row">
					<div class="shopping__cart__table col-12">
						<table class="w-100">
						<thead>
							<tr>
							<th scope="col">#</th>
							<th scope="col">Product image</th>
							<th scope="col">Product name</th>
							<th scope="col">Like day</th>
							<th scope="col">Action</th>
						</tr>
						</thead>
						<tbody>

						</tbody>
						
						<c:forEach var="item" items="${list }" varStatus="loopCounter">
							<tr>
								<th class="serial">${loopCounter.count}</th>
								<th class="image">
									<a href="/shop/product-detail?id=${item.product.id }"><img
										src="/uploads/${item.product.banner }" class="w-50" alt="flag"></a>
								</th>
								<th class="name">${item.product.name }</th>
								<th class="day">
									<fmt:formatDate pattern="dd-MM-yyyy"
										value="${item.createdDate }" />
								</th>
								<th class="action">
									<a href="/shop/like/delete?id=${item.id }"
										style="color:red">Remove</a>
								</th>
							</tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>