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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/cart.css">
<link rel="stylesheet" type="text/css" href="/css/index.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<title>Thanks for Your Order</title>
</head>
<body class="background-blue min-vh-100">
  	<header class="bd-highlight py-3 px-0 px-md-5 header bg-secondary">
	  <div class="container ">
		  <div class="row">
			  <a href="/" class="col-8 d-flex justify-content-start d-md-block">
				<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
			  </a>
				<div class="d-flex justify-content-end justify-content-md-end align-items-center gap-4  col-4">
					<c:if test="${user_id != null}">
						<form action="/logout">
							<button class="btn btn-primary">Logout</button>
						</form>
					</c:if>
				</div>
		  </div>
	  </div>
	</header>
	<div class="stripe px-md-3 py-3">
		<div class="container">
			<div class="row d-flex align-items-center">
				<p class="h5 text-white col-8 col-sm-6 col-lg-4 my-4 my-auto">Your support keeps us flying <span class="red-text">high</span> - thank you for choosing <span class="red-text">PNW</span> Airlines</p>
			</div>
		</div>
	</div>
	<main class="py-5">
				<div class="container">
					<div class="row mx-auto">
						<div class="col-12 col-lg-9 col-xl-8 col-xxl-7 mb-5 mx-auto">
							<div>
							<div class="row justify-content-between px-2 px-md-3 py-4 bg-light text-dark  align-items-center btm-border-divider  roundedTop">
								<div class="col-3 col-md-4 p-0 col-lg-1">
									<img class=" pnwLogo-sm" src="${pageContext.request.contextPath}/PnwLogoNoText.png">
								</div>
								<div class="col-5 col-md-4 d-flex justify-content-center align-items-center">
									<h2 style='color: green;'>Success!</h2>
								</div>
						       	<div class="col-4 p-0 col-lg-1 d-flex justify-content-end align-items-center">
						       		<a href="/" class="btn btn-primary minWidth">Return Home</a>
						       	</div>
							</div>
					       	<div class="row py-4 roundedBottom bg-light ">
					       	<div class="d-flex flex-wrap justify-content-between mb-4">
					            <h5 class="col-12 col-sm-6  text-dark">Id:</h5>
					            <h5 class="col-12 col-sm-6  text-dark minWidth "><c:out value="${id}" /></h5>
					       	</div>
					       	<div class="d-flex flex-wrap justify-content-between mb-4">
					            <h5 class="col-12 col-sm-10 col-md-6  text-dark">Status:</h5>
					            <h5 class="col-12 col-sm-2 col-md-6  text-dark minWidth text-capitalize "><c:out value="${error}" /></h5>
					       	</div>
					       	<div class="d-flex flex-wrap justify-content-between mb-4">
					            <h5 class="col-12 col-sm-6  text-dark">Charge id:</h5>
					            <h5 class="col-12 col-sm-6  text-dark minWidth"><c:out value="${chargeId}" /></h5>
					       	</div>
					       	<div class="d-flex flex-wrap justify-content-between mb-4">
					            <h5 class="col-12 col-sm-6  text-dark">Balance transaction id:</h5>
					            <h5 class="col-12 col-sm-6  text-dark minWidth"><c:out value="${balance_transaction}" /></h5>
					       	</div>
				            </div>
						</div>
					</div>
		       	</div>
	</main>
</body>
</html>