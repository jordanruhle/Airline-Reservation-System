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
<title>Admin Dashboard</title>
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
				<div class="container d-flex justify-content-between align-items-center">
				<h1 class="text-white">Admin Dashboard</h1>
		        <form action="/admins/logout">
		        	<button class="btn btn-secondary">Logout</button>
		        </form>
			</div>
			</div>
		</div>
	</div>
	
	<div class="container">
        <form action="/flights/create" class=" my-3">
        	<button class="btn btn-primary">Create a Flight</button>
        </form>
		<table class="table roundedTop roundedBottom bg-white table-striped d-none d-lg-table">
            <thead>
                <tr>
                    <th>Flight</th>
                    <th>Date</th>
                    <th>Departure City</th>
                    <th>Arrival City</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${allFlights}">
                    <tr >
                        <td><c:out value="${flight.id}" /></td>
                        <td class=" departure-date"><c:out value="${flight.departure_time}" /></td>
                        <td><c:out value="${flight.departure}" /></td>
                        <td><c:out value="${flight.destination}" /></td>
                        <td class=" departure-time"><c:out value="${flight.departure_time}" /></td>
                        <td class=" arrival-time"><c:out value="${flight.arrival_time}" /></td>
                        <td class="price">
    						$<c:out value="${flight.price / 100}"/><fmt:formatNumber value="${flight.price % 100}" minIntegerDigits="2" maxFractionDigits="0"/> 
						</td>
                        <td><c:out value="${flight.status}" /></td>
                        <td class="">
						    <form action="/flights/${flight.id}" method="POST">
						        <input type="hidden" name="_method" value="DELETE">
						        <button class="btn btn-danger">Delete</button>
						    </form>
						</td> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>
	<c:forEach var="flight" items="${allFlights}">
        <div class="row bg-light text-dark align-items-center roundedTop py-2 d-lg-none">
            <div class="col-6 fs-5 fw-bold text-uppercase">Date</div>
            <div class="col-6 text-end fs-5 departure-date">${flight.departure_time}</div>
        </div>
        <div class="row bg-light text-dark align-items-center py-2 d-lg-none">
            <div class="col-6 fs-5 fw-bold text-uppercase">Departure City</div>
            <div class="col-6 text-end fs-5 departure-city"><c:out value="${flight.departure}" /></div>
        </div>
        <div class="row bg-light text-dark align-items-center py-2 d-lg-none">
            <div class="col-6 fs-5 fw-bold text-uppercase">Destination City</div>
            <div class="col-6 text-end fs-5 destination-city"><c:out value="${flight.destination}" /></div>
        </div>
        <div class="row bg-light text-dark align-items-center  py-2 d-lg-none">
            <div class="col-6 fs-5 fw-bold text-uppercase">Departure Time</div>
            <div class="col-6 text-end fs-5 departure-time">${flight.departure_time}</div>
        </div>
        <div class="row bg-light text-dark align-items-center  py-2 d-lg-none">
            <div class="col-6 fs-5 fw-bold text-uppercase">Arrival Time</div>
            <div class="col-6 text-end fs-5 arrival-time">${flight.arrival_time}</div>
        </div>
        <div class="row bg-light text-dark align-items-center  py-2 d-lg-none">
            <div class="col-6 fs-5 fw-bold text-uppercase">Price</div>
            <div class="col-6 text-end fs-5 price">
			    $<c:out value="${flight.price / 100}"/><fmt:formatNumber value="${flight.price % 100}" minIntegerDigits="2" maxFractionDigits="0"/> 
			</div>
        </div>
        <div class="row bg-light text-dark align-items-center py-2 d-lg-none">
            <div class="col-6 fs-5 fw-bold text-uppercase">Status</div>
            <div class="col-6 text-end fs-5 status"><c:out value="${flight.status}" /></div>
        </div>
        <div class="row bg-light text-dark align-items-center roundedBottom mb-4 d-lg-none">
            <div class="col-4 fs-5 fw-bold text-uppercase">Actions</div>
            <div class="col-8 text-end fs-5 pb-2">
                <form action="/flights/${flight.id}/delete">
                    <button class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </c:forEach>
	</div>
<script>

// Get all the elements with the "departure-date" class
let departureDateElements = document.querySelectorAll('.departure-date');
departureDateElements.forEach(element => {
  let date = new Date(element.textContent);
  let formattedDate = date.toLocaleDateString('en-US');
  element.textContent = formattedDate;
});

// Get all the elements with the "departure-time" class
let departureTimeElements = document.querySelectorAll('.departure-time');
departureTimeElements.forEach(element => {
  let date = new Date(element.textContent);
  let formattedTime = date.toLocaleTimeString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
  element.textContent = formattedTime;
});

// Get all the elements with the "arrival-time" class
let arrivalTimeElements = document.querySelectorAll('.arrival-time');
arrivalTimeElements.forEach(element => {
  let date = new Date(element.textContent);
  let formattedTime = date.toLocaleTimeString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
  element.textContent = formattedTime;
});

</script>
</body>
</html>