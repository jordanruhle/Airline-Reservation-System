<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/index.css">

<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Flight Search</title>
</head>
<body class="background-blue ">
	<header class="d-flex justify-content-between bd-highlight p-3 px-5 header bg-secondary">
		<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
		<div class="d-flex justify-content-center align-items-center gap-4">
			<h3 class="text-white">Welcome</h3>
			<c:if test="${user_id != null}">
				<form action="/logout">
					<button class="btn btn-primary">Logout</button>
				</form>
			</c:if>
		</div>
	</header>
	<!--DROP DOWN SEARCH-->
	<div class="stripe p-3">
	<form:form action="/flights" method="POST" class="d-flex justify-content-center gap-5 align-items-start mx-auto w-75" >
	<div class="col-6">
		<h2 class="text-white mx-auto mb-3" >Plan your next adventure.</h2>
		<div class="d-flex justify-content-center align-items-center mx-auto gap-2">
			<select name="departure" class="form-control ">
				<option value="SEA">SEA</option>
				<option value="PDX">PDX</option>
				<option value="BOI">BOI</option>
				<option value="ANC">ANC</option>
			</select>
	<!--BOOTSTRAP ARROW-->	
			<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
			</svg>
	<!--BOOTSTRAP ARROW-->	
			<select name="destination" class="form-control">
				<option value="SEA">SEA</option>
				<option value="PDX">PDX</option>
				<option value="BOI">BOI</option>
				<option value="ANC">ANC</option>
			</select>
	<!--BOOTSTRAP SPYGLASS SEARCH BTN-->
			<button class="btn btn-primary">
    			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
  			</button>
	<!--BOOTSTRAP SPYGLASS SEARCH BTN-->
		</div>
	</div>
		<p class="h3 text-white col-2">Explore the Northwest flying with the <span class="red-text">Best</span></p>
	</form:form >
	</div>		
<!-- =========================================================================================================================================================== -->		
	<main class="background-blue">
	<!-- SORT BUTTONS -->	
		<div class = "d-flex justify-content-evenly p-3">
			<form action="#">
				<button class="btn btn-secondary btn-lg">Cheapest</button>
			</form>
			<form action="#">
				<button class="btn btn-secondary btn-lg">Quickest</button>
			</form>
			<form action="#">
				<button class="btn btn-secondary btn-lg">Earliest</button>
			</form>
			<form action="#">
				<button class="btn btn-secondary btn-lg">Latest</button>
			</form>
		</div>
	<!-- SORT BUTTONS -->
<!-- =========================================================================================================================================================== -->		
	<!-- TABLE -->
		
		<div class="container text-center ">
			<table class="table table-light table-striped">
	            <thead>
	                <tr>
	                    <th class="text-uppercase">Date</th>
	                    <th class="text-uppercase">Departure City</th>
	                    <th class="text-uppercase">Destination City</th>
	                    <th class="text-uppercase">Departure Time</th>
	                    <th class="text-uppercase">Arrival Time</th>
	                    <th class="text-uppercase">Select</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="flight" items="${allFlights}">
	                    <tr >
	                      	<td><fmt:formatDate type="date" value="${flight.departure_time}" /></td>
	                      	<td><c:out value="${flight.departure}" /></td>
	                      	<td><c:out value="${flight.destination}" /></td>
	                        <td><fmt:formatDate type="time" pattern="hh:mm a" value="${flight.departure_time}" /></td> 	
	                        <td><fmt:formatDate type="time" pattern="hh:mm a" value="${flight.arrival_time}" /></td> 	
	                        <td class="">
								<form action="/seats/${flight.id}/picker">
	        						<button class="btn btn-primary me-2">Choose Seat</button>
	        					</form>
							</td> 
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
		</div>	
				
	<!-- TABLE -->
	</main>
<!-- =========================================================================================================================================================== -->		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>