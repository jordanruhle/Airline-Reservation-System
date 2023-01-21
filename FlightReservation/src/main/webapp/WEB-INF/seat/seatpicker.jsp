<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.*" %>

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
<link rel="stylesheet" type="text/css" href="/css/seats.css">
<link rel="stylesheet" type="text/css" href="/css/index.css">



<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="background-blue">
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
	<main class="background-blue pt-5">
        <div class="nose">
            <div class="window">
                <div class="windowBottom"></div>
            </div>
        </div>
        <div class="body-container">
	        <div class="left-wing"></div>
	        <div class="plane" id="plane">
		        <c:forEach var="seat" items="${allSeats}">
		        	<c:choose>

		        		<c:when test = "${seat.user.id == null}">
		        			<div class="square">
		        				<div class="popup d-flex align-items-center gap-3" id="${seat.id}" onmouseleave="removePopup(this)">
		        					<div class="pointer"></div>
		        					<h5 class="m-0">Seat</h5>
		        					<h4 class="m-0"><c:out value="${seat.aisle}"/><c:out value="${seat.row}"/></h4>
		        					<div class="popupDivider"></div>
		        					<h5 class="m-0">$<c:out value="${seat.price/100}"/></h5>
		        					<form action="/seats/${seat.id}">
		        					<button 
		        						onClick="" 
		        						value="${seat.id}" 
		        						class="btn btn-danger minWidth">
		        							Reserve Seat
		        					</button>
		        					</form>
		        				</div>
		        					<button class="btn seat" value="${seat.id}"></button>
		        			</div>
		        		</c:when>
		        		

		        		<c:otherwise>
		        			<div class="square">
		        				<div class="popup" id="${seat.id}">
		        					<p>Seat TAKEN:)</p>
		        				</div>
		        			<form action=""><button  class="reservedSeat">X</button></form></div>
		        		</c:otherwise>
		        		
		        	</c:choose>
		        	
		        	<c:set var = "aisle" scope = "session" value ="${seat.aisle}"></c:set>
		        		<c:set var = "C" scope = "session" value ="C"></c:set>
		        		
		        		<c:if test="${C.equals(aisle)}">        	
		        			<div class="square"><div class="aisle"><c:out value="${seat.row}"></c:out></div></div>
		        		</c:if>
		        	
	        </c:forEach>
	        </div>
	      <div class="right-wing"></div>
        </div>
        <div class="body-container">
         <div class="rear-left-wing"></div>
        <div class="tail">
        	<div class="vertical-stabilizer"></div>
        </div>
        <div class="rear-right-wing"></div>
        </div>
    </main>
    <script src="${pageContent.request.contextPath}/js/seatPicker.js"></script>
</body>
</html>