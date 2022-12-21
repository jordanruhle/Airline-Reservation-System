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
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Flight Search</title>
</head>
<body>
	<header class="d-flex bd-highlight mb-3">
		<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-airplane p-2 bd-highlight" viewBox="0 0 16 16">
  			<path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z"/>
		</svg>
		<div class="p-2 bd-highlight"><h1> PNW Airlines </h1></div>
		
	</header>
	
	<div class = "container-lg">
	<!--DROP DOWN SEARCH-->
	
		<div class="d-flex justify-content-evenly ">
			<select class="form-control">
				<option value="SEA">SEA</option>
				<option value="PDX">PDX</option>
				<option value="BOI">BOI</option>
				<option value="ANC">ANC</option>
			</select>
	<!--BOOTSTRAP ARROW-->		
			<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
			</svg>
	<!--BOOTSTRAP ARROW-->	
			
			<select class="form-control">
				<option value="SEA">SEA</option>
				<option value="PDX">PDX</option>
				<option value="BOI">BOI</option>
				<option value="ANC">ANC</option>
			</select>
	<!--BOOTSTRAP SPYGLASS SEARCH BTN-->
		
			<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
 				<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
	<!--BOOTSTRAP SPYGLASS SEARCH BTN-->		
		</div>
		<br/>
<!-- =========================================================================================================================================================== -->		
	<!-- SORT BUTTONS -->	
		<div class = "d-flex justify-content-evenly">
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
		<br/>
	<!-- SORT BUTTONS -->
<!-- =========================================================================================================================================================== -->		
	<!-- TABLE -->
		
		<div class="container text-center ">
			<table class="table table-dark table-striped">
	            <thead>
	                <tr>
	                
	                    <th>Date</th>
	                    <th>Departure Time</th>
	                    <th>Arrival Time</th>
	                    <th>Price</th>
	                    <th>Select</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="flight" items="${allFlights}">
	                    <tr >
	                      	<td><fmt:formatDate type="date" value="${flight.departure_time}" /></td>
	                        <td><fmt:formatDate type="time" pattern="hh:mm a" value="${flight.departure_time}" /></td> 	
	                        <td><fmt:formatDate type="time" pattern="hh:mm a" value="${flight.arrival_time}" /></td> 	
	                        <td><c:out value="${seat.flight.price}" /></td>
	                        <td class="d-flex">
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
<!-- =========================================================================================================================================================== -->		
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>