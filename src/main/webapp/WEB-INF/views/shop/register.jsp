<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link rel="stylesheet" href="/static/shop/vendors/css/style.css">
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Register</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/shop/homee">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page"><a
							href="/shop/account/register">Register</a></li>
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
						<h4>Already have an account?</h4>
						<p>There are advances being made in science and technology
							everyday, and a good example of this is the</p>
						<a class="button button-account" href="/shop/account/login">Login
							Now</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner register_form_inner">
					<h3>Create an account</h3>
					<c:if test="${not empty error}">
						<b class="error text-danger"> <c:out value="${error}" />
						</b>
					</c:if>
					<form:form action="/shop/account/register"
						modelAttribute="register" method="post" class="row login_form"
						id="contactForm">
						<div class="col-md-12 form-group">
							<form:input path="fullName" class="form-control"
								placeholder="Full name" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Full name'" />
							<form:errors path="fullName" class="error text-danger" />
						</div>
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
							<form:password path="passwordAgain" class="form-control"
								placeholder="Password again" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password again'" />
							<form:errors path="passwordAgain" class="error text-danger" />
						</div>
						<div class="col-md-12 form-group">
							<form:input path="birthDay" type="date" class="form-control"
								placeholder="Birth day" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Birth day'" />
							<form:errors path="birthDay" class="error text-danger" />
						</div>
						
						<div class="col-md-12 form-group">
							<button type="submit" value="submit"
								class="button button-register w-100">Register</button>
								<a href="/shop/account/forgot-password">Forgot Password?</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>