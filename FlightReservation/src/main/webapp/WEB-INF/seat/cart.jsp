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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/cart.css">
<link rel="stylesheet" type="text/css" href="/css/index.css">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
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

	<!-- ----------- SLOGAN ----------- -->
	<div class="stripe px-md-3 py-3">
		<div class="container">
			<div class="row d-flex align-items-center">
				<p class="h3 text-white col-8 col-sm-6 col-lg-4 my-4 my-auto">We're grateful to have you on board with <span class="red-text">PNW</span> Airlines</p>
			</div>
		</div>
	</div>
	<!-- ----------- SLOGAN ----------- -->

	<main class="container py-5 h-100">
		<div class="row">
		
			<c:if test="${not empty error}">
				<div class="col-12 mb-4">
					<div class="row px-2 px-md-3 py-4 bg-light roundedBottom roundedTop">
						<h2  class="mx-auto col-12 text-danger "><c:out value="${error}" /></h2>
		       		</div>
		       	</div>
			</c:if>
		
	<!-- ----------- FLIGHT DETAILS CARD ----------- -->
	
		<div class="col-12 c6 col-xl-8 mb-4">
		
	<!-- ----------- FLIGHT DETAILS HEADER ----------- -->
			<div class="row justify-content-between px-2 px-md-3 py-4 bg-light text-dark align-items-center btm-border-divider  roundedTop">
			<div class="col-4 p-0 col-lg-1">
				<img class=" pnwLogo-sm" src="${pageContext.request.contextPath}/PnwLogoNoText.png">
			</div>
			<div class="col-4 col-lg-4 d-flex justify-content-center align-items-center">
	       		<h2 class="text-uppercase">Flight Details</h2>
			</div>
	       	<div class="col-4 p-0 col-lg-1 d-flex justify-content-end align-items-center">
	       		<a href="/seats/${seat.flight.id}/remove" class="btn btn-primary minWidth">Remove</a>
	       	</div>
	       	</div>
	<!-- ----------- FLIGHT DETAILS HEADER ----------- -->
	       	
	       	
	       	
	<!-- ----------- FLIGHT DETAILS BODY ----------- -->
				<div class="row d-flex flex-wrap py-4 roundedBottom bg-light ">

					<!-- ----------- DEPARTURE INFO ----------- -->
					<div class="col-12  col-md-6 col-lg-4 mb-4 mb-lg-0">
						<div class="d-flex justify-content-between gap-3 mb-4">
							<h5 class="text-dark">Departure City:</h5>
							<h5 class="text-dark text-end ">
								<c:out value="${ seat.flight.departure }"></c:out>
							</h5>
						</div>
						<div class="d-flex justify-content-between gap-3 my-4">
							<h5 class="text-dark">Departure Time:</h5>
							<h5 class="text-dark text-end departure-time">${seat.flight.departure_time}</h5>
						</div>
						<div class="d-flex justify-content-between gap-3 mt-4">
							<h5 class="text-dark">Departure Date:</h5>
							<h5 class="text-dark text-end departure-date">${seat.flight.departure_time}</h5>
						</div>
					</div>
					<!-- ----------- DEPARTURE INFO ----------- -->
					

					<!-- ----------- ARRIVAL INFO ----------- -->
					<div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
						<div class="d-flex justify-content-between gap-3 mb-4">
							<h5 class="text-dark">Arrival City:</h5>
							<h5 class="text-dark text-end">
								<c:out value="${ seat.flight.destination }"></c:out>
							</h5>
						</div>
						<div class="d-flex justify-content-between gap-3 my-4">
							<h5 class="text-dark">Arrival Time:</h5>
							<h5 class="text-dark text-end arrival-time">${seat.flight.arrival_time}</h5>
						</div>
						<div class="d-flex justify-content-between gap-3 mt-4">
							<h5 class="text-dark">Arrival Date:</h5>
							<h5 class="text-dark text-end departure-date">${seat.flight.arrival_time}</h5>
						</div>
					</div>
					<!-- ----------- ARRIVAL INFO ----------- -->


					<!-- ----------- FLIGHT INFO ----------- -->
					<div class="col-12 col-md-6 col-lg-4">
						<div class="d-flex justify-content-between gap-3 mb-4">
							<h5 class="text-dark">Flight Price:</h5>
							<h5 class="text-dark text-end">
								$
								<fmt:formatNumber type="number" maxFractionDigits="2"
									value="${seat.price / 100}" />
							</h5>
						</div>
						<div class="d-flex justify-content-between gap-3 my-4">
							<h5 class="text-dark">Seat:</h5>
							<h5 class="text-dark text-end">
								<c:out value="${ seat.aisle }"></c:out>
								<c:out value="${ seat.row }"></c:out>
							</h5>
						</div>
						<div class="d-flex justify-content-between gap-3 mt-4">
							<h5 class="text-dark">Flight Number:</h5>
							<h5 class="text-dark text-end">
								<c:out value="${ seat.flight.id }"></c:out>
							</h5>
						</div>
					</div>
					<!-- ----------- FLIGHT INFO ----------- -->


				</div>
				<!-- ----------- FLIGHT DETAILS BODY ----------- -->
				
       	</div>
	<!-- ----------- FLIGHT DETAILS CARD ----------- -->


       	
	<!-- ----------- ORDER SUMMARY ----------- -->
	
		<div class="col-12 col-md-6 col-lg-6 col-xl-4 ps-xl-5">
		<div>
		
	<!-- ----------- ORDER SUMMARY HEADER ----------- -->
			<h2 class="row  px-2 px-md-3 py-4 bg-light text-dark text-uppercase text-center my-0 btm-border-divider roundedTop ">Order Summary</h2>
	<!-- ----------- ORDER SUMMARY HEADER ----------- -->

	<!-- ----------- ORDER SUMMARY BODY ----------- -->
			<div class="row card-body bg-light roundedBottom pt-4 pb-2">
				<div class="d-flex justify-content-between mb-4">
					<h5 class="text-dark">Sub Total:</h5>
					<h5 class="text-dark">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${ seat.price / 100}"/></h5>
				</div>
					
				<div class="d-flex justify-content-between mb-4">
					<h5 class="text-dark">Taxes:</h5>
					<h5 class="text-dark">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${ seat.price *.10 / 100}"/></h5>
				</div>
				<div class="d-flex justify-content-between mb-4">
					<h5 class="text-dark">Total Charges:</h5>
					<h5 class="text-dark">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${ seat.price *1.10 / 100}"/></h5>
				</div>
				<form action="/charge" method="POST" id="checkout-form" class="mb-4">
				    <input type="hidden" value="${amount}" name="amount" />
				    <div class="visually-hidden">
				    <script
				       src="https://checkout.stripe.com/checkout.js" 
				       class="stripe-button"
				       data-key="${stripePublicKey}"
				       data-amount="${amount}" 
				       data-currency="${currency}"
				       data-name="PNW Airlines"
				       data-description="PNW Airlines Checkout"
				       data-locale="auto"
				       data-zip-code="false"
				       style="display:hidden;">
				   </script>
				    </div>
				   <button class="btn btn-danger w-100">Pay with Card</button>
				</form>
				<!--
				<form class="my-4" action="/checkout/${seat.id}">
				<button class="align-items-center btn btn-danger w-100">Checkout</button>
				</form>
				-->
			</div>
	<!-- ----------- ORDER SUMMARY BODY ----------- -->
		</div>
	
		</div>
		
	<!-- ----------- ORDER SUMMARY ----------- -->
	
		</div>
	</main>
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

document.getElementById('custom-button').addEventListener('click', function(e) {
  // Open the Stripe Checkout handler
  var stripeHandler = StripeCheckout.configure({
    key: '${stripePublicKey}',
    locale: 'auto',
    token: function(token) {
      // You can access the token ID with `token.id`.
      // Get the token ID to your server-side code for use.
    }
  });

  stripeHandler.open({
    name: 'PNW Airlines',
    description: 'PNW Airlines Checkout',
    currency: '${currency}',
    amount: '${amount}',
    zipCode: false
  });

  e.preventDefault();
});

// Close Checkout on page navigation:
window.addEventListener('popstate', function() {
  stripeHandler.close();
});
</script>
</body>
</html>