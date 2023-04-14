<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
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
<title>Create Flight</title>
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
	
	<div class="container h-100 d-flex align-items-center justify-content-center py-5">
		<div class="row col-12">
		<div class=" col-12 col-lg-8 col-xl-6 mx-auto regForm bg-light p-5">
		<form:form method="POST" action="/flights/create" modelAttribute="flightObj">
			<h2 class="mb-4 text-uppercase">Schedule a Flight</h2>
			<div class="form-outline">
				<label class="form-label">Departure City:</label>
				<form:select class="form-control form-control-lg" path="departure">
				<form:errors path="departure" />
						<form:option class="form-control form-control-lg" value="SEA">
							<c:out value="SEA" />
						</form:option>
						<form:option class="form-control form-control-lg" value="PDX">
							<c:out value="PDX" />
						</form:option>
						<form:option class="form-control form-control-lg" value="BOI">
							<c:out value="BOI" />
						</form:option>
						<form:option class="form-control form-control-lg" value="ANC">
							<c:out value="ANC" />
						</form:option>
				</form:select>
			</div> 
			<div class="form-outline">
				<label class="form-label">Arrival City:</label>
				<form:select class="form-control form-control-lg" path="destination">
				<form:errors path="destination" />
						<form:option class="form-control form-control-lg" value="SEA">
							<c:out value="SEA" />
						</form:option>
						<form:option class="form-control form-control-lg" value="PDX">
							<c:out value="PDX" />
						</form:option>
						<form:option class="form-control form-control-lg" value="BOI">
							<c:out value="BOI" />
						</form:option>
						<form:option class="form-control form-control-lg" value="ANC">
							<c:out value="ANC" />
						</form:option>
				</form:select>
			</div>
			<div class="form-outline">
				<label class="form-label">Departure Time:</label>
				<form:input class="form-control form-control-lg" type="datetime-local" path="departure_time" />
				<form:errors path="departure_time" />
			</div>
			<div class="form-outline">
				<label class="form-label">Arrival Time:</label>
				<form:input class="form-control form-control-lg" type="datetime-local" path="arrival_time" />
				<form:errors path="arrival_time" />
			</div>
			<div class="form-outline">
				<label class="form-label">Price</label>
				<form:input type="price" path="price" class="form-control form-control-lg" />
				<form:errors path="price" class="" />
			</div>
			<div class="form-outline">
				<label class="form-label">Status:</label>
				<form:select class="form-control form-control-lg" path="status">
				<form:errors path="status" />
						<form:option class="form-control form-control-lg" value="On-time">
							<c:out value="On-time" />
						</form:option>
						<form:option class="form-control form-control-lg" value="Delayed">
							<c:out value="Delayed" />
						</form:option>
						<form:option class="form-control form-control-lg" value="Canceled">
							<c:out value="Canceled" />
						</form:option>
				</form:select>
			</div>
			<div class="form-outline mb-2">
				<label class="form-label">Number of Seats</label>
				<form:select class="form-control form-control-lg" path="number_of_seats">
				<form:errors path="number_of_seats" />
						<form:option class="form-control form-control-lg" value="120">
							<c:out value="120" />
						</form:option>
				</form:select>
			</div>
				<button class=" form-label btn btn-primary btn-lg w-100">Submit</button>
		</form:form>
		<form action="/admins/dashboard">
			<button class=" form-label btn btn-danger btn-lg w-100">Cancel</button>
		</form>
		</div>
		</div>
	</div>
</body>
</html>