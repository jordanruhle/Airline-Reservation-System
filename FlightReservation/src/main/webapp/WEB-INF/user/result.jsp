<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<body>
		<c:choose>
			<c:when test="${error}">
				<h3 style='color: red;'><c:out value="${error}" /></h3>
			</c:when>
			<c:otherwise>
				<div>
					 <h3 style='color: green;'>Success!</h3>
		            <div>Id.: <c:out value="${id}" /></div>
		            <div>Status: <c:out value="${status}" /></div>
		            <div>Charge id.: <c:out value="${chargeId}" /></div>
		            <div>Balance transaction id.: <c:out value="${balance_transaction}" /></div>
				</div>
			</c:otherwise>
		</c:choose>
        <a href='/'>Return Home</a>
    </body>
</body>
</html>