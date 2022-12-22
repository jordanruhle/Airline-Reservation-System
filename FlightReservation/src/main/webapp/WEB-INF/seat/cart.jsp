<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" type="text/css" href="/css/cart.css">
<meta charset="ISO-8859-1">
<title>Flight Details</title>
</head>
<body>
	<header class="navBar d-flex bd-highlight p-3">
		<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64"
			fill="currentColor" class="bi bi-airplane p-2 bd-highlight"
			viewBox="0 0 16 16">
       	<path
				d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z" />
       </svg>
		<div class="p-2 bd-highlight">
			<h1>PNW Airlines</h1>
		</div>
	</header>
	<main class="main d-flex justify-content-center p-5">
	
		<div class="detailsCard border-dark bg-gradient">
			<div class="d-flex justify-content-between card-header p-4 bg-dark bg-gradient text-light align-items-center">
				<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"
					fill="currentColor" class="bi bi-airplane p-2 bd-highlight"
					viewBox="0 0 16 16"> 
	       			<path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z" />
	       		</svg>
	       		<h2 class="detailsText">Flight Details</h2>
	       		<a href="/seats/${seat.flight.id}/picker" class="btn btn-danger">Remove</a> 
	       	</div>
	       	
	       	
	       	<div class="flightDetails card-body d-flex justify-content-between gap-5 p-4 border-dark border border-5 rounded-top">
				<div class ="minWidth">
					<h4 class="my-4">Departure City: <c:out value="${ seat.flight.departure }"></c:out></h4>
					<h4 class="my-4">Departure Time: <fmt:formatDate type="time" pattern="hh:mm a" value="${seat.flight.departure_time}"/></h4>
					<h4 class="my-4">Date: <fmt:formatDate type="date" value="${seat.flight.departure_time}" /></h4>
				</div>
				<div class ="minWidth">
					<h4 class="my-4">Arrival City: <c:out value="${ seat.flight.destination }"></c:out></h4>
					<h4 class="my-4">Arrival Time: <c:out value="${ seat.flight.departure }"></c:out></h4>
					<h4 class="my-4">Arrival Date: <fmt:formatDate type="date" value="${seat.flight.arrival_time}" /></h4>
				</div>
				<div class ="minWidth">
					<h4 class="my-4">Flight Price: $<c:out value="${ seat.price }"></c:out></h4>
					<h4 class="my-4">Seat: <c:out value="${ seat.aisle }"></c:out><c:out value="${ seat.row }"></c:out></h4>
					<h4 class="my-4">Flight Number: <c:out value="${ seat.flight.id }"></c:out></h4>
				</div>

       		</div>
       	</div>
       	
		<div class="orderSummary border-dark border border-5 rounded-top bg-gradient">
			<h2 class="card-header p-4 bg-dark bg-gradient text-light">Summary of Charges</h2>
			<div class="card-body p-4 border-dark border-5">
				<div class="d-flex justify-content-between">
					<h4 class="my-4">PNW SkyMiles:</h4>
					<h4 class="my-4"> 12,309</h4>
				</div>
				<div class="d-flex justify-content-between">
					<h4 class="my-4">Sub Total:</h4>
					<h4 class="my-4">$<c:out value="${ seat.price }"></c:out></h4>
				</div>
					
				<div class="d-flex justify-content-between">
					<h4 class="my-4">Taxes:</h4>
					<h4 class="my-4">$<c:out value="${ seat.price *.10}"></c:out></h4>
				</div>
				<div class="d-flex justify-content-between">
					<h4 class="my-4">Total Charges:</h4>
					<h4 class="my-4">$<c:out value="${ seat.price *1.10}"></c:out></h4>
				</div>
				
				<form action="/login">
				<button class="align-items-center btn btn-primary">Checkout</button>
				</form>
			</div>
		</div>
	</main>
</body>
</html>