<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link rel="stylesheet" href="/static/shop/vendors/css/style.css">
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Login / Register</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/shop/homee">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Login/Register</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="login_box_img">
					<div class="hover">
						<h4>New to our website?</h4>
						<p>There are advances being made in science and technology
							everyday, and a good example of this is the</p>
						<a class="button button-account" href="/shop/account/register">Create
							an Account</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner">
					<h3>Log in to enter</h3>
					<c:if test="${not empty error}">
						<b class="error text-danger"> <c:out value="${error}" />
						</b>
					</c:if>
					<form:form class="row login_form" action="/shop/account/login"
						modelAttribute="login" method="post" id="contactForm">
						<div class="col-md-12 form-group">
							<form:input path="email" class="form-control" placeholder="Email"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email'" />
							<form:errors path="email" class="error text-danger" />
						</div>
						<div class="col-md-12 form-group">
							<form:password path="password" class="form-control"
								placeholder="Password" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password'" />
							<form:errors path="password" class="error text-danger" />
						</div>

						<div class="col-md-12 form-group">
							<button type="submit" value="submit"
								class="button button-login w-100">Log In</button>
							<a href="/shop/account/forgot-password">Forgot Password?</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>