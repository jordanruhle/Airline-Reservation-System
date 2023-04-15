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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/seats.css">
<link rel="stylesheet" type="text/css" href="/css/index.css">


 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="ISO-8859-1">
<title>Seat Picker</title>
</head>
<body class="background-blue min-vh-100">
	<header class="bd-highlight py-3 px-0 px-md-5 header bg-secondary bg-gradient">
	  <div class="container ">
		  <div class="row">
			  <a href="/" class="col-8 d-flex justify-content-start d-md-block">
				<img class="pnwLogo" src="${pageContext.request.contextPath}/PnwLogo.png">
			  </a>
				<div class="d-flex justify-content-end justify-content-md-end align-items-center gap-4  col-4">
					<h3 class="text-white d-none d-md-block">Welcome</h3>
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
				<p class="h3 text-white col-8 col-sm-6 col-lg-4 my-4 my-auto">Life is an <span class="red-text">Adventure</span> - start yours with <span class="red-text">PNW</span> Airlines</p>
			</div>
		</div>
	</div>
	<main class=" pt-5">
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
						    <c:when test="${seat.aisle == 'A'}">
						        <c:set var="shiftAmount" value="0" />
						        <c:set var="pointershiftAmount" value="0" />
						        
						    </c:when>
						    <c:when test="${seat.aisle == 'B'}">
						        <c:set var="shiftAmount" value="50" />
						        <c:set var="pointershiftAmount" value="0" />
						    </c:when>
						    <c:when test="${seat.aisle == 'C'}">
						        <c:set var="shiftAmount" value="95" />
						    </c:when>
						    <c:when test="${seat.aisle == 'D'}">
						        <c:set var="shiftAmount" value="185" />
						    </c:when>
						    <c:when test="${seat.aisle == 'E'}">
						        <c:set var="shiftAmount" value="230" />
						    </c:when>
						    <c:otherwise>
						        <c:set var="shiftAmount" value="285" />
						    </c:otherwise>
						</c:choose>
		        	
		        	<c:choose>
		        		<c:when test = "${seat.user.id == null}">
		        			<div class="square">
		        				<div class="popup d-flex align-items-center gap-3" id="${seat.id}" style="left: -${shiftAmount}px;" onmouseleave="removePopup(this)">
		        					<div class="pointer" style="left: ${shiftAmount+17}px;"></div>
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