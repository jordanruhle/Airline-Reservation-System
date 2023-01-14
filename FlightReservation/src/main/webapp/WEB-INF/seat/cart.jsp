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
<body class="background-blue">


	<!-- ----------- HEADER ----------- -->
	<header class="d-flex bd-highlight p-3 header bg-secondary">
		<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
	</header>
	<!-- ----------- HEADER ----------- -->
	
	<main class="main d-flex justify-content-center py-5 background-blue h-100">
	
	<!-- ----------- FLIGHT DETAILS ----------- -->
		<div class="col-6">
	<!-- ----------- FLIGHT DETAILS HEADER ----------- -->
			<div class="d-flex justify-content-between card-header py-4 px-5 bg-dark bg-gradient text-light align-items-center w-100">
				<img class="pnwLogo-sm" src="${pageContext.request.contextPath}/PnwLogoNoText.png">
	       		<h2 class="text-uppercase">Flight Details</h2>
	       		<a href="/seats/${seat.flight.id}/picker" class="btn btn-primary">Remove</a> 
	       	</div>
	<!-- ----------- FLIGHT DETAILS HEADER ----------- -->
	       	
	<!-- ----------- FLIGHT DETAILS BODY ----------- -->
	       	<div class="card-body gap-5 py-4 px-5 rounded-bottom bg-dark minWidth">
	       	
		       	<div class="row minWidth">
		       	
					<div class ="minWidth col">
						<div class="d-flex justify-content-between my-4">
							<h4 class="text-white">Departure City: </h4>
							<h4 class="text-white"><c:out value="${ seat.flight.departure }"></c:out></h4>
						</div>
						<div class="d-flex justify-content-between gap-3 my-4">
							<h4 class="text-white">Departure Time: </h4>
							<h4 class="text-white"><fmt:formatDate type="time" pattern="hh:mm a" value="${seat.flight.departure_time}"/></h4>
						</div>
						<div class="d-flex justify-content-between my-4">
							<h4 class="text-white">Date: </h4>
							<h4 class="text-white"><fmt:formatDate type="date" value="${seat.flight.departure_time}" /></h4>
						</div>
					</div>
					
					<div class ="minWidth col">
						<div class="d-flex justify-content-between my-4">
							<h4 class="text-white">Arrival City: </h4>
							<h4 class="text-white"><c:out value="${ seat.flight.destination }"></c:out></h4>
						</div>
						<div class="d-flex justify-content-between my-4">
							<h4 class="text-white">Arrival Time: </h4>
							<h4 class="text-white"><fmt:formatDate type="time" pattern="hh:mm a" value="${seat.flight.arrival_time}"/></h4>
						</div>
						<div class="d-flex justify-content-between gap-3 my-4">
							<h4 class="text-white">Arrival Date: </h4>
							<h4 class="text-white"><fmt:formatDate type="date" value="${seat.flight.arrival_time}" /></h4>
						</div>
					</div>
					
					<div class ="minWidth col">
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

       		</div>
	<!-- ----------- FLIGHT DETAILS BODY ----------- -->
       	</div>
	<!-- ----------- FLIGHT DETAILS ----------- -->


       	
	<!-- ----------- ORDER SUMMARY ----------- -->
	
		<div class="col-2">
		
	<!-- ----------- ORDER SUMMARY HEADER ----------- -->
			<h2 class="card-header py-4 px-5 bg-dark bg-gradient text-light text-uppercase text-center ">Order Summary</h2>
	<!-- ----------- ORDER SUMMARY HEADER ----------- -->

	<!-- ----------- ORDER SUMMARY BODY ----------- -->
			<div class="card-body px-5 bg-dark rounded-bottom">
				<div class="d-flex justify-content-between my-4">
					<h4 class="text-white">Sub Total:</h4>
					<h4 class="text-white">$<c:out value="${ seat.price }"></c:out></h4>
				</div>
					
				<div class="d-flex justify-content-between my-4">
					<h4 class="text-white">Taxes:</h4>
					<h4 class="text-white">$<c:out value="${ seat.price *.10}"></c:out></h4>
				</div>
				<div class="d-flex justify-content-between my-4">
					<h4 class="text-white">Total Charges:</h4>
					<h4 class="text-white">$<c:out value="${ seat.price *1.10}"></c:out></h4>
				</div>
				
				<form class="my-4" action="/login">
				<button class="align-items-center btn btn-danger w-100">Checkout</button>
				</form>
			</div>
	<!-- ----------- ORDER SUMMARY BODY ----------- -->
	
		</div>
		
	<!-- ----------- ORDER SUMMARY ----------- -->
	
	</main>
</body>
</html>