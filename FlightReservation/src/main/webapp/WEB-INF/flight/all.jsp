<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Admin Dashboard</h1>
        <form action="/admins/logout">
        	<button>Logout</button>
        </form>
        <form action="/flights/create">
        	<button>Create a Flight</button>
        </form>
		<table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Departure City</th>
                    <th>Arrival City</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${allFlights}">
                    <tr>
                        <td><c:out value="${flight.departure_time}" /></td>
                        <td><c:out value="${flight.departure}" /></td>
                        <td><c:out value="${flight.arival}" /></td>
                        <td><c:out value="${flight.status}" /></td>
                        <td>
							<form action="/flights/${flight.id}/view">
        						<button>Create a Flight</button>
        					</form>
							<form action="/flights/${flight.id}/edit">
        						<button>Create a Flight</button>
        					</form>
							<form action="/flights/${flight.id}/delete">
        						<button>Create a Flight</button>
        					</form>
						</td> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>
</body>
</html>