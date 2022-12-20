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
	<div class="container">
	<h1>Add Flight</h1>
		<form:form method="POST" action="/flights/create" modelAttribute="flightObj">
			
			<p>
				Departure City:
				<form:select path="departure">
				<form:errors path="departure" />
						<form:option value="SEA">
							<c:out value="SEA" />
						</form:option>
						<form:option value="PDX">
							<c:out value="PDX" />
						</form:option>
						<form:option value="BOI">
							<c:out value="BOI" />
						</form:option>
						<form:option value="ANC">
							<c:out value="ANC" />
						</form:option>
				</form:select>
			</p> 
			<p>
				Arrival City:
				<form:select path="destination">
				<form:errors path="destination" />
						<form:option value="SEA">
							<c:out value="SEA" />
						</form:option>
						<form:option value="PDX">
							<c:out value="PDX" />
						</form:option>
						<form:option value="BOI">
							<c:out value="BOI" />
						</form:option>
						<form:option value="ANC">
							<c:out value="ANC" />
						</form:option>
				</form:select>
			</p>
			<p>
				Departure Time:
				<form:input type="datetime-local" path="departure_time" />
				<form:errors path="departure_time" />
			</p>
			<p>
				Arrival Time:
				<form:input type="datetime-local" path="arrival_time" />
				<form:errors path="arrival_time" />
			</p>
			<p>
				Status:
				<form:select path="status">
				<form:errors path="status" />
						<form:option value="On-time">
							<c:out value="On-time" />
						</form:option>
						<form:option value="Delayed">
							<c:out value="Delayed" />
						</form:option>
						<form:option value="Canceled">
							<c:out value="Canceled" />
						</form:option>
				</form:select>
			</p>
			<p>
				Number of Seats:
				<form:select path="number_of_seats">
				<form:errors path="number_of_seats" />
						<form:option value="120">
							<c:out value="120" />
						</form:option>
				</form:select>
			</p>
				<button>Submit</button>
		</form:form>
		<form action="/home">
			<button>Cancel</button>
		</form>
	</div>
</body>
</html>