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
<body class="background-blue">
<!-- ----------- HEADER ----------- -->
	<header class="d-flex bd-highlight p-3 header bg-secondary">
		<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
	</header>
<!-- ----------- HEADER ----------- -->
		
<!----------- CHECKOUT FORM ------------  -->

	<div class="mainContent d-flex align-items-center justify-content-center py-5">
		<div class="regForm bg-light p-3">

					   <form action="/charge" method="POST" id="checkout-form">
						    <input type="hidden" value="${amount}" name="amount" />
						    <h2>Total: $<c:out value="${amount/100}" /></h2>
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
		</div>
	</div>
<!----------- CHECKOUT FORM ------------  -->

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>