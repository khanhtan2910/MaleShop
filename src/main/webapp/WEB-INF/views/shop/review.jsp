<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="breadcrumb-option">
	<div class="container">
		<div
			class="row">
			<div class="breadcrumb__text">
				<h1>Review list</h1>
				<nav class="breadcrumb__links">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/review">Review list</a>
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
					have not rated any products yet.</h3>
			</c:if>
			<c:if test="${not empty list }">
				<div class="progress-table-wrap">
					<div class="progress-table">
						<div class="table-head">
							<div class="serial">#</div>
							<div class="image">Product image</div>
							<div class="name">Product name</div>
							<div class="day">Star</div>
							<div class="action">Action</div>
						</div>
						<c:forEach var="item" items="${list }" varStatus="loopCounter">
							<div class="table-row">
								<div class="serial">${loopCounter.count}</div>
								<div class="image">
									<a href="/shop/product-detail?id=${item.product.id }"><img
										src="/uploads/${item.product.banner }" class="w-50" alt="flag"></a>
								</div>
								<div class="name">${item.product.name }</div>
								<div class="day">
									<c:forEach var="i" begin="1" end="${item.star }">
										<i class="fa fa-star"></i>
									</c:forEach>
								</div>
								<div class="percentage">
									<a href="/shop/review/delete?id=${item.id }"
										class="genric-btn danger radius">Remove</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>