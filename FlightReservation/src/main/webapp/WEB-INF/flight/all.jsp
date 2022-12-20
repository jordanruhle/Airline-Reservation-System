<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" /> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">  
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
	<div class="d-flex justify-content-between align-items-center px-5 mb-5">
	<h1>Admin Dashboard</h1>
        <form action="/admins/logout">
        	<button class="btn btn-secondary">Logout</button>
        </form>
	</div>
        <form action="/flights/create" class=" mb-3">
        	<button class="btn btn-primary">Create a Flight</button>
        </form>
		<table class="table table-striped">
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
                        <td class="d-flex">
							<form action="/flights/${flight.id}/view">
        						<button class="btn btn-primary me-2">View</button>
        					</form>
							<form action="/flights/${flight.id}/edit">
        						<button class="btn btn-secondary me-2">Edit</button>
        					</form>
							<form action="/flights/${flight.id}/delete">
        						<button class="btn btn-danger">Delete</button>
        					</form>
						</td> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>
</body>
</html>