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
<title>Register</title>
</head>
<body class="background-blue">
	<!-- ----------- HEADER ----------- -->
	<header class="bd-highlight py-3 px-0 px-md-5 header bg-secondary bg-gradient">
	  <div class="container ">
		  <div class="row">
			  <div class="col-8 d-flex justify-content-start d-md-block">
				<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
			  </div>
		  </div>
	  </div>
	</header>
	<!-- ----------- HEADER ----------- -->

	<!-- ----------- MAIN ----------- -->
	<div class="mainContent d-flex align-items-center justify-content-center py-5">
	
	<!-- ----------- FORM ----------- -->
		<form:form action="/register" class="regForm bg-light px-5 py-4 container-sm" method="POST" modelAttribute="newUser">
		<h1>New to PNW Airlines?</h1>
		
		<!-- ----------- FIRST AND LAST NAME ----------- -->
				<div class="row">
				
				<!-- ----------- FIRST NAME ----------- -->
					<div class="col-md-6 mb-4">
						<div class="form-outline">
							<label class="form-label">First name</label>
							<form:input path="firstName" class="form-control form-control-lg" />
							<form:errors path="firstName" />
						</div>
					</div>
				<!-- ----------- FIRST NAME ----------- -->
				
				<!-- ----------- LAST NAME ----------- -->
					<div class="col-md-6 mb-4">
						<div class="form-outline">
							<label class="form-label">Last name</label>
							<form:input path="lastName" class="form-control form-control-lg" />
							<form:errors path="lastName" />
						</div>
					</div>
				<!-- ----------- LAST NAME ----------- -->
				
				</div>
				<!-- ----------- FIRST AND LAST NAME ----------- -->
				
				<!-- ----------- DATE OF BIRTH ----------- -->
				<div class="row">
					<div class="form-outline mb-4">
						<label class="form-label">Date of Birth</label>
						<form:input path="dob" type="date" class="form-control form-control-lg" />
						<form:errors path="dob" />
					</div>
				</div>
				<!-- ----------- DATE OF BIRTH ----------- -->

				<!-- ----------- EMAIL ----------- -->
				<div class="row">
					<div class="form-outline mb-4">
						<label class="form-label">Email</label>
						<form:input path="email" class="form-control form-control-lg" />
						<form:errors path="email" />
					</div>
				</div>			
				<!-- ----------- EMAIL ----------- -->

				<!-- ----------- ADDRESS ----------- -->
				<div class="row">
					<div class="form-outline mb-4">
						<label class="form-label">Address</label>
						<form:input path="address" class="form-control form-control-lg" />
						<form:errors path="address" />
					</div>
				</div>						
				<!-- ----------- ADDRESS ----------- -->
			
			
				<!-- ----------- CITY STATE ZIP ----------- -->
				<div class="row">
				<!-- ----------- CITY ----------- -->
					<div class="col-md-4 mb-4">
						<div class="form-outline">
							<label class="form-label">City</label>
							<form:input path="city" class="form-control form-control-lg" />
							<form:errors path="city" />
						</div>
					</div>
				<!-- ----------- CITY ----------- -->
				
				<!-- ----------- STATE ----------- -->
					<div class="col-md-4 mb-4">
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
				<!-- ----------- STATE ----------- -->
				
				<!-- ----------- ZIP ----------- -->
				<div class="col-md-4 mb-4">
						<div class="form-outline">
							<label class="form-label">Zip Code</label>
							<form:input path="zip" class="form-control form-control-lg" />
							<form:errors path="zip" />
						</div>
					</div>
				<!-- ----------- ZIP ----------- -->
								
				</div>
				<!-- ----------- CITY STATE ZIP ----------- -->
		
		
				<!-- ----------- PASSWORD ----------- -->
					<div class="form-outline mb-4">
						<label class="form-label">Password</label>
						<form:input type="password" path="password" class="form-control form-control-lg" />
						<form:errors path="password" />
					</div>
				<!-- ----------- PASSWORD ----------- -->
		
				<!-- ----------- CONFRIM PASSWORD ----------- -->
					<div class="form-outline mb-4">
						<label class="form-label">Confirm Password</label>
						<form:input type="password" path="confirm" class="form-control form-control-lg" />
						<form:errors path="confirm" />
					</div>
				<!-- ----------- CONFRIM PASSWORD ----------- -->
				
				<!-- ----------- SUBMIT BUTTON ----------- -->
					<button class=" form-label btn btn-primary btn-lg  ">Register</button>
				<!-- ----------- SUBMIT BUTTON ----------- -->
			</form:form>
			<!-- ----------- FORM ----------- -->
		</div>
	<!-- ----------- MAIN ----------- -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>