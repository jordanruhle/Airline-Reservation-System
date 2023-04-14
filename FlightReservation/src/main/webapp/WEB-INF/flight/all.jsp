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
<title>Login</title>
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
		<table class="table roundedTop roundedBottom bg-white table-striped">
            <thead>
                <tr>
                    <th>Flight Number</th>
                    <th>Date</th>
                    <th>Departure City</th>
                    <th>Arrival City</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${allFlights}">
                    <tr >
                        <td><c:out value="${flight.id}" /></td>
                        <td><c:out value="${flight.departure_time}" /></td>
                        <td><c:out value="${flight.departure}" /></td>
                        <td><c:out value="${flight.destination}" /></td>
                        <td><c:out value="${flight.status}" /></td>
                        <td class="d-flex justify-content-between gap 1">
							<form action="/flights/${flight.id}/view">
        						<button class="btn btn-primary ">View</button>
        					</form>
							<form action="/flights/${flight.id}/edit">
        						<button class="btn btn-secondary">Edit</button>
        					</form>
							<form action="/flights/${flight.id}/delete">
        						<button class="btn btn-danger">Delete</button>
        					</form>
						</td> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>
	</div>
</body>
</html>