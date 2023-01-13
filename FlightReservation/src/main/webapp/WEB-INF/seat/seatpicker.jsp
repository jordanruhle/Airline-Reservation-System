<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 

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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header class="navBar d-flex bd-highlight p-3">
       <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-airplane p-2 bd-highlight" viewBox="0 0 16 16">
       	<path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z"/>
       </svg>
       <div class="p-2 bd-highlight"><h1> PNW Airlines </h1></div>
    </header>
	<main>
        <div class="nose">
            <div class="window">
                <div class="windowBottom"></div>
            </div>
        </div>
        <div class="body-container">
	        <div class="left-wing"></div>
	        <div class="plane">
		        <c:forEach var="seat" items="${allSeats}">
		        	<c:choose>

		        		<c:when test = "${seat.user.id == null}">
		        			<div class=" square"><form action="/seats/${seat.id}"><button  class="seat"><img class="seatIcon" src="${pageContext.request.contextPath}/seatLogo.png"></button></form></div>
		        		</c:when>
		        		

		        		<c:otherwise>
		        			<div class=" square"><form action=""><button  class="seat">X</button></form></div>
		        		</c:otherwise>
		        		
		        	</c:choose>
		        	
		        	<c:set var = "aisle" scope = "session" value ="${seat.aisle}"></c:set>
		        		<c:set var = "C" scope = "session" value ="C"></c:set>
		        		
		        		<c:if test="${C.equals(aisle)}">        	
		        			<div class=" square"><div class="aisle"><c:out value="${seat.row}"></c:out></div></div>
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
</body>
</html>