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
<title>Checkout</title>
</head>
<body>
<!-- =========================================================================================================================================================== -->		
<!-- HEADER -->
	<header class="navBar d-flex bd-highlight">
       <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-airplane p-2 bd-highlight" viewBox="0 0 16 16">
       	<path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z"/>
       </svg>
       <div class="p-2 bd-highlight"><h1> PNW Airlines </h1></div>
    </header>
<!-- HEADER -->
<!-- =========================================================================================================================================================== -->		
    
<!-- =========================================================================================================================================================== -->		
<!-- CHECKOUT FORM  -->
	<div class="mainContent d-flex align-items-center justify-content-center">
		<div class="regForm bg-light p-3">
			<form action="/payment" class="container-sm" method="POST">
		<h1>Billing Address</h1>
				<div class="row">
					<div class="col-md-6 mb-4">
						<div class="form-outline">
							<label class="form-label">First name</label>
							<input path="firstName" class="form-control form-control-lg" />
							<errors path="firstName" />
						</div>
					</div>
					<div class="col-md-6 mb-4">
						<div class="form-outline">
							<label class="form-label">Last name</label>
							<input path="lastName" class="form-control form-control-lg" />
							<errors path="lastName" />
						</div>
					</div>
				</div>
			<!--  
					<div class="form-outline mb-4">
						<label class="form-label">Date of Birth</label>
						<input path="dob" type="date" class="form-control form-control-lg" />
						<errors path="dob" />
					</div>
			-->
					<div class="form-outline mb-4">
						<label class="form-label">Email</label>
						<input path="email" class="form-control form-control-lg" />
						<errors path="email" />
					</div>
					
					<div class="form-outline mb-4">
						<label class="form-label">Shipping Address</label>
						<input placeholder="Street address or P.O. Box" path="address" class="form-control form-control-lg" />
						<errors path="address" />
					</div>
			
			
					<div class="row">
						<div class="col-md-6 mb-4">
							<label class="form-label">State</label>
							<select class="select form-control form-control-lg" path="state" placeholder="Select and option...">
								<option value="AL"/>
								<option value="AK"/>
								<option value="AZ"/>
								<option value="AR"/>
								<option value="CA"/>
								<option value="CO"/>
								<option value="CT"/>
								<option value="DE"/>
								<option value="FL"/>
								<option value="GA"/>
								<option value="HI"/>
								<option value="ID"/>
								<option value="IL"/>
								<option value="IN"/>
								<option value="IA"/>
								<option value="KS"/>
								<option value="KY"/>
								<option value="LA"/>
								<option value="ME"/>
								<option value="MD"/>
								<option value="MA"/>
								<option value="MI"/>
								<option value="MN"/>
								<option value="MS"/>
								<option value="MO"/>
								<option value="MT"/>
								<option value="NE"/>
								<option value="NV"/>
								<option value="NH"/>
								<option value="NJ"/>
								<option value="NM"/>
								<option value="NY"/>
								<option value="NC"/>
								<option value="ND"/>
								<option value="OH"/>
								<option value="OK"/>
								<option value="OR"/>
								<option value="PA"/>
								<option value="RI"/>
								<option value="SC"/>
								<option value="SD"/>
								<option value="TN"/>
								<option value="TX"/>
								<option value="UT"/>
								<option value="VT"/>
								<option value="VA"/>
								<option value="WA"/>
								<option value="WV"/>
								<option value="WI"/>
								<option value="WY"/>
							</select>
							<errors path="state" />
			
						</div>
						<div class="col-md-6 mb-4">
							<div class="form-outline">
								<label class="form-label">City</label>
								<input path="city" class="form-control form-control-lg" />
								<errors path="city" />
							</div>
						</div>
			
			
						<div class="form-outline mb-4">
							<label class="form-label">Password</label>
							<input path="password" class="form-control form-control-lg" />
							<errors path="password" />
						</div>
			
						<div class="form-outline mb-4">
							<label class="form-label">Confirm Password</label>
							<input path="confirm" class="form-control form-control-lg" />
							<errors path="confirm" />
						</div>
			
						<div class="d-flex justify-content-end pt-3">
							<button class=" form-label btn btn-warning btn-lg ms-2">Continue to Payment</button>
						</div>
					</div>
			</form>
		</div>
	</div>
<!-- CHECKOUT FORM  -->
<!-- =========================================================================================================================================================== -->		
<br/>
<!-- =========================================================================================================================================================== -->		
<!-- LOGIN FORM -->
	
<!-- LOGIN FORM -->	
<!-- =========================================================================================================================================================== -->		


	<br/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>