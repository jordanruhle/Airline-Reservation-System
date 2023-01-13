<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" type="text/css" href="/css/cart.css">
<meta charset="ISO-8859-1">
<title>Flight Details</title>
</head>
<body>


	<!-- ----------- HEADER ----------- -->
	<header class="d-flex bd-highlight p-3 header bg-secondary">
		<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
	</header>
	<!-- ----------- HEADER ----------- -->
	
	<main class="main d-flex justify-content-center p-5  background-blue">
	
	<!-- ----------- FLIGHT DETAILS ----------- -->
	<!-- ----------- FLIGHT DETAILS HEADER ----------- -->
		<div class="detailsCard border-dark">
			<div class="d-flex justify-content-between card-header p-4 bg-dark bg-gradient text-light align-items-center">
				<img class="pnwLogo-sm" src="${pageContext.request.contextPath}/PnwLogoNoText.png">
	       		<h2 class="detailsText text-uppercase">Flight Details</h2>
	       		<a href="/seats/${seat.flight.id}/picker" class="btn btn-danger">Remove</a> 
	       	</div>
	<!-- ----------- FLIGHT DETAILS HEADER ----------- -->
	       	
	<!-- ----------- FLIGHT DETAILS BODY ----------- -->
	       	<div class="flightDetails card-body d-flex justify-content-between gap-5 p-4 border-dark border border-5 rounded-top bg-dark">
				<div class ="minWidth flex-basis-0">
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Departure City: </h4>
						<h4 class="text-white"><c:out value="${ seat.flight.departure }"></c:out></h4>
					</div>
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Departure Time: </h4>
						<h4 class="text-white"><fmt:formatDate type="time" pattern="hh:mm a" value="${seat.flight.departure_time}"/></h4>
					</div>
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Date: </h4>
						<h4 class="text-white"><fmt:formatDate type="date" value="${seat.flight.departure_time}" /></h4>
					</div>
				</div>
				
				<div class ="minWidth flex-basis-0">
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Arrival City: </h4>
						<h4 class="text-white"><c:out value="${ seat.flight.destination }"></c:out></h4>
					</div>
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Arrival Time: </h4>
						<h4 class="text-white"><fmt:formatDate type="time" pattern="hh:mm a" value="${seat.flight.arrival_time}"/></h4>
					</div>
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Arrival Date: </h4>
						<h4 class="text-white"><fmt:formatDate type="date" value="${seat.flight.arrival_time}" /></h4>
					</div>
				</div>
				
				<div class ="minWidth flex-basis-0">
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Flight Price: </h4>
						<h4 class="text-white">$<c:out value="${ seat.price }"></c:out></h4>
					</div>
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Seat: </h4>
						<h4 class="text-white"><c:out value="${ seat.aisle }"></c:out><c:out value="${ seat.row }"></c:out></h4>
					</div>
					<div class="d-flex justify-content-between my-4">
						<h4 class="text-white">Flight Number: </h4>
						<h4 class="text-white"><c:out value="${ seat.flight.id }"></c:out></h4>
					</div>
				</div>

       		</div>
	<!-- ----------- FLIGHT DETAILS BODY ----------- -->
       	</div>
	<!-- ----------- FLIGHT DETAILS ----------- -->


       	
	<!-- ----------- ORDER SUMMARY ----------- -->
	
		<div class="orderSummary border-dark border border-5 rounded-top bg-dark">
			<h2 class="card-header p-4 bg-dark bg-gradient text-light text-uppercase">Summary of Charges</h2>
			<div class="card-body p-4 border-dark border-5">
				<div class="d-flex justify-content-between">
					<h4 class="text-white my-4">PNW SkyMiles:</h4>
					<h4 class="text-white my-4"> 12,309</h4>
				</div>
				<div class="d-flex justify-content-between">
					<h4 class="text-white my-4">Sub Total:</h4>
					<h4 class="text-white my-4">$<c:out value="${ seat.price }"></c:out></h4>
				</div>
					
				<div class="d-flex justify-content-between">
					<h4 class="text-white my-4">Taxes:</h4>
					<h4 class="text-white my-4">$<c:out value="${ seat.price *.10}"></c:out></h4>
				</div>
				<div class="d-flex justify-content-between">
					<h4 class="text-white my-4">Total Charges:</h4>
					<h4 class="text-white my-4">$<c:out value="${ seat.price *1.10}"></c:out></h4>
				</div>
				
				<form action="/login">
				<button class="align-items-center btn btn-primary">Checkout</button>
				</form>
			</div>
		</div>
		
	<!-- ----------- ORDER SUMMARY ----------- -->
	
	</main>
</body>
</html>