<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/index.css">

<!-- for Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/registration.css">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body class="background-blue min-vh-100">

	<!-- ----------- HEADER ----------- -->
	<header class="bd-highlight py-3 px-0 px-md-5 header bg-secondary bg-gradient">
	  <div class="container ">
		  <div class="row">
			  <a href="/" class="col-8 d-flex justify-content-start d-md-block">
				<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
			  </a>
		  </div>
	  </div>
	</header>
	<!-- ----------- HEADER ----------- -->
	<div class="stripe px-md-3 py-3">
		<div class="container">
			<div class="row d-flex align-items-center">	
				<h2 class="text-white"><span class="red-text">PNW</span> Airlines - Customer Login</h2>
			</div>
		</div>
	</div>
	
	<!-- ----------- LOGIN / REGISTER ----------- -->
	<div class="h-100 d-flex align-items-center justify-content-center py-5">
	
		<div class="regForm bg-light p-5">
		
		
	<!-- ----------- LOGIN FORM ----------- -->
			<form:form action="/login" class="" method="POST" modelAttribute="newLogin">
			<h2 class="mb-4 text-uppercase">Login to Reserve your seat</h2>
				<div class="row mb-5">
					<div class="col-md-6">
						<div class="form-outline">
							<label class="form-label">Email</label>
							<form:input path="email" class="form-control form-control-lg" />
							<form:errors path="email" class="" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-outline">
							<label class="form-label">Password</label>
							<form:input type="password" path="password" class="form-control form-control-lg" />
							<form:errors path="password" class="" />
						</div>
					</div>
				</div>
				<button class=" form-label btn btn-primary btn-lg w-100 mb-4">Login</button>
			</form:form>
	<!-- ----------- LOGIN FORM ----------- -->
			
			
				<div class="">
					<h2 class="text-uppercase mt-5 mb-4">Don't have an account?</h2>
					<form:form action="/register" method="GET" class="my-4">
						<button class=" form-label btn btn-primary btn-lg w-100">Register Here</button>
					</form:form>
				</div>
		</div>
	</div>
	<!-- ----------- LOGIN / REGISTER ----------- -->
</body>
</html>