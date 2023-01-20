<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<link rel="stylesheet" type="text/css" href="/css/index.css">

<meta charset="ISO-8859-1">
<title>Flight Details</title>
</head>
<body class="background-blue">


	<!-- ----------- HEADER ----------- -->
	<header class="d-flex bd-highlight p-3 header bg-secondary">
		<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
	</header>
	<!-- ----------- HEADER ----------- -->
	
	<main class="main d-flex flex-wrap justify-content-center py-5 background-blue h-100">
	
	<!-- ----------- FLIGHT DETAILS ----------- -->
		<div class="">
	<!-- ----------- FLIGHT DETAILS HEADER ----------- -->
			
			<div class="d-flex justify-content-between py-4 px-5 bg-light-gray text-dark align-items-center w-100 btm-border-divider">
				<img class="pnwLogo-sm" src="${pageContext.request.contextPath}/PnwLogoNoText.png">
	       		<h2 class="text-uppercase">Flight Details</h2>
	       		<a href="/seats/${seat.flight.id}/remove" class="btn btn-primary">Remove</a> 
	       	</div>
	<!-- ----------- FLIGHT DETAILS HEADER ----------- -->
	       	
	<!-- ----------- FLIGHT DETAILS BODY ----------- -->
	       	<div class="container d-flex flex-wrap card-body gap-5 py-4 px-5 rounded-bottom bg-light ">
	
					<div class ="flex-grow-1 minWidth">
						<div class="d-flex justify-content-between gap-3 mb-4">
							<h5 class="text-dark">Departure City: </h5>
							<h5 class="text-dark text-end "><c:out value="${ seat.flight.departure }"></c:out></h5>
						</div>
						<div class="d-flex justify-content-between gap-3 my-4">
							<h5 class="text-dark">Departure Time: </h5>
							<h5 class="text-dark text-end minWidth"><fmt:formatDate type="time" pattern="hh:mm a" value="${seat.flight.departure_time}"/></h5>
						</div>
						<div class="d-flex justify-content-between gap-3 mt-4">
							<h5 class="text-dark">Departure Date: </h5>
							<h5 class="text-dark text-end"><fmt:formatDate type="date" value="${seat.flight.departure_time}" /></h5>
						</div>
					</div>
					
					<div class ="flex-grow-1 minWidth">
						<div class="d-flex justify-content-between gap-3 mb-4">
							<h5 class="text-dark">Arrival City: </h5>
							<h5 class="text-dark text-end"><c:out value="${ seat.flight.destination }"></c:out></h5>
						</div>
						<div class="d-flex justify-content-between gap-3 my-4">
							<h5 class="text-dark">Arrival Time: </h5>
							<h5 class="text-dark text-end"><fmt:formatDate type="time" pattern="hh:mm a" value="${seat.flight.arrival_time}"/></h5>
						</div>
						<div class="d-flex justify-content-between gap-3 mt-4">
							<h5 class="text-dark">Arrival Date: </h5>
							<h5 class="text-dark text-end"><fmt:formatDate type="date" value="${seat.flight.arrival_time}" /></h5>
						</div>
					</div>
					
					<div class ="flex-grow-1 minWidth">
						<div class="d-flex justify-content-between gap-3 mb-4">
							<h5 class="text-dark">Flight Price: </h5>
							<h5 class="text-dark text-end">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${seat.price / 100}"/></h5>
						</div>
						<div class="d-flex justify-content-between gap-3 my-4">
							<h5 class="text-dark">Seat: </h5>
							<h5 class="text-dark text-end"><c:out value="${ seat.aisle }"></c:out><c:out value="${ seat.row }"></c:out></h5>
						</div>
						<div class="d-flex justify-content-between gap-3 mt-4">
							<h5 class="text-dark">Flight Number: </h5>
							<h5 class="text-dark text-end"><c:out value="${ seat.flight.id }"></c:out></h5>
						</div>
					</div>
					
       		</div>
	<!-- ----------- FLIGHT DETAILS BODY ----------- -->
       	</div>
	<!-- ----------- FLIGHT DETAILS ----------- -->


       	
	<!-- ----------- ORDER SUMMARY ----------- -->
	
		<div class="minWidth">
		
	<!-- ----------- ORDER SUMMARY HEADER ----------- -->
			<h2 class=" py-4 px-5 bg-light-gray text-dark text-uppercase text-center minWidth my-0 btm-border-divider ">Order Summary</h2>
	<!-- ----------- ORDER SUMMARY HEADER ----------- -->

	<!-- ----------- ORDER SUMMARY BODY ----------- -->
			<div class="card-body px-5 bg-light rounded-bottom">
				<div class="d-flex justify-content-between my-4">
					<h5 class="text-dark">Sub Total:</h5>
					<h5 class="text-dark">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${ seat.price / 100}"/></h5>
				</div>
					
				<div class="d-flex justify-content-between my-4">
					<h5 class="text-dark">Taxes:</h5>
					<h5 class="text-dark">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${ seat.price *.10 / 100}"/></h5>
				</div>
				<div class="d-flex justify-content-between my-4">
					<h5 class="text-dark">Total Charges:</h5>
					<h5 class="text-dark">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${ seat.price *1.10 / 100}"/></h5>
				</div>
				<form action="/charge" method="POST" id="checkout-form">
				    <input type="hidden" value="${amount}" name="amount" />
				    <!-- NOTE: data-key/data-amount/data-currency will be rendered by Thymeleaf -->
				    <script
				       src="https://checkout.stripe.com/checkout.js" 
				       class="stripe-button"
				       data-key="${stripePublicKey}"
				       data-amount="${amount}" 
				       data-currency="${currency}"
				       data-name="PNW Airlines"
				       data-description="PNW Airlines Checkout"
				       data-locale="auto"
				       data-zip-code="false">
				   </script>
				</form>
				<!--
				<form class="my-4" action="/checkout/${seat.id}">
				<button class="align-items-center btn btn-danger w-100">Checkout</button>
				</form>
				-->
			</div>
	<!-- ----------- ORDER SUMMARY BODY ----------- -->
	
		</div>
		
	<!-- ----------- ORDER SUMMARY ----------- -->
	
	</main>
</body>
</html>