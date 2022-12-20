<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/registration.css">
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<header class="navBar d-flex bd-highlight">
       <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-airplane p-2 bd-highlight" viewBox="0 0 16 16">
       	<path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z"/>
       </svg>
       <div class="p-2 bd-highlight"><h1> PNW Airlines </h1></div>
    </header>
	<div class="mainContent d-flex align-items-center justify-content-center">
		<div class="regForm bg-light p-3">
			<form:form action="/register" class="container-sm" method="POST" modelAttribute="newUser">
		<h1>New to PNW Airlines?</h1>
				<div class="row">
					<div class="col-md-6 mb-4">
						<div class="form-outline">
							<label class="form-label">First name</label>
							<form:input path="firstName" class="form-control form-control-lg" />
							<form:errors path="firstName" />
						</div>
					</div>
					<div class="col-md-6 mb-4">
						<div class="form-outline">
							<label class="form-label">Last name</label>
							<form:input path="lastName" class="form-control form-control-lg" />
							<form:errors path="lastName" />
						</div>
					</div>
				</div>
			
					<div class="form-outline mb-4">
						<label class="form-label">Date of Birth</label>
						<form:input path="dob" type="date" class="form-control form-control-lg" />
						<form:errors path="dob" />
					</div>
			
					<div class="form-outline mb-4">
						<label class="form-label">Email</label>
						<form:input path="email" class="form-control form-control-lg" />
						<form:errors path="email" />
					</div>
					
					<div class="form-outline mb-4">
						<label class="form-label">Address</label>
						<form:input path="address" class="form-control form-control-lg" />
						<form:errors path="address" />
					</div>
			
			
					<div class="row">
						<div class="col-md-6 mb-4">
							<label class="form-label">State</label>
							<form:select class="select form-control form-control-lg" path="state">
								<form:option value="AL"/>
								<form:option value="AK"/>
								<form:option value="AZ"/>
								<form:option value="AR"/>
								<form:option value="CA"/>
								<form:option value="CO"/>
								<form:option value="CT"/>
								<form:option value="DE"/>
								<form:option value="FL"/>
								<form:option value="GA"/>
								<form:option value="HI"/>
								<form:option value="ID"/>
								<form:option value="IL"/>
								<form:option value="IN"/>
								<form:option value="IA"/>
								<form:option value="KS"/>
								<form:option value="KY"/>
								<form:option value="LA"/>
								<form:option value="ME"/>
								<form:option value="MD"/>
								<form:option value="MA"/>
								<form:option value="MI"/>
								<form:option value="MN"/>
								<form:option value="MS"/>
								<form:option value="MO"/>
								<form:option value="MT"/>
								<form:option value="NE"/>
								<form:option value="NV"/>
								<form:option value="NH"/>
								<form:option value="NJ"/>
								<form:option value="NM"/>
								<form:option value="NY"/>
								<form:option value="NC"/>
								<form:option value="ND"/>
								<form:option value="OH"/>
								<form:option value="OK"/>
								<form:option value="OR"/>
								<form:option value="PA"/>
								<form:option value="RI"/>
								<form:option value="SC"/>
								<form:option value="SD"/>
								<form:option value="TN"/>
								<form:option value="TX"/>
								<form:option value="UT"/>
								<form:option value="VT"/>
								<form:option value="VA"/>
								<form:option value="WA"/>
								<form:option value="WV"/>
								<form:option value="WI"/>
								<form:option value="WY"/>
							</form:select>
							<form:errors path="state" />
			
						</div>
						<div class="col-md-6 mb-4">
							<div class="form-outline">
								<label class="form-label">City</label>
								<form:input path="city" class="form-control form-control-lg" />
								<form:errors path="city" />
							</div>
						</div>
			
			
						<div class="form-outline mb-4">
							<label class="form-label">Password</label>
							<form:input path="password" class="form-control form-control-lg" />
							<form:errors path="password" />
						</div>
			
						<div class="form-outline mb-4">
							<label class="form-label">Confirm Password</label>
							<form:input path="confirm" class="form-control form-control-lg" />
							<form:errors path="confirm" />
						</div>
			
						<div class="d-flex justify-content-end pt-3">
							<button class=" form-label btn btn-warning btn-lg ms-2">Submit form</button>
						</div>
					</div>
			</form:form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>