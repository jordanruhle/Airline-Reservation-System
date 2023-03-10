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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/registration.css">
<meta charset="ISO-8859-1">
<title>Login</title>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="background-blue">

	<!-- ----------- HEADER ----------- -->
	<header class="d-flex bd-highlight p-3 header bg-secondary">
		<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
	</header>
	<!-- ----------- HEADER ----------- -->
	
	<!-- ----------- LOGIN / REGISTER ----------- -->
	<div class="background-blue h-100 d-flex align-items-center justify-content-center py-5">
	
		<div class="regForm bg-dark p-5">
		
		
	<!-- ----------- LOGIN FORM ----------- -->
			<form:form action="/login" class="" method="POST" modelAttribute="newLogin">
			<h2 class="text-white mb-4 text-uppercase">Login</h2>
				<div class="row mb-5">
					<div class="col-md-6">
						<div class="form-outline">
							<label class="form-label text-white">Email</label>
							<form:input path="email" class="form-control form-control-lg" />
							<form:errors path="email" class="text-white" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-outline">
							<label class="form-label text-white">Password</label>
							<form:input path="password" class="form-control form-control-lg" />
							<form:errors path="password" class="text-white" />
						</div>
					</div>
				</div>
				<button class=" form-label btn btn-primary btn-lg text-white w-100 mb-4">Login</button>
			</form:form>
	<!-- ----------- LOGIN FORM ----------- -->
			
			
				<div class="">
					<h2 class="text-white text-uppercase mb-4">Don't have an account?</h2>
					<form:form action="/register" method="GET" class="my-4">
						<button class=" form-label btn btn-primary btn-lg text-white w-100">Sign up!</button>
					</form:form>
				</div>
		</div>
	</div>
	<!-- ----------- LOGIN / REGISTER ----------- -->
</body>
</html>