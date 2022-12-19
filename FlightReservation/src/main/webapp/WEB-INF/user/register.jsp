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
	<form:form action="/register" method="POST" modelAttribute="newUser">
		<h2>Register</h2>
		<p>
			First Name:
			<form:input path="firstName" />
			<form:errors path="firstName" />
		</p>
		<p>
			Last Name:
			<form:input path="lastName" />
			<form:errors path="lastName" />
		</p>
		<p>
			Date of Birth:
			<form:input type="date" path="dob" />
			<form:errors path="dob" />
		</p>
		<p>
			Email:
			<form:input path="email" />
			<form:errors path="email" />
		</p>
		<p>
			Address:
			<form:input path="address" />
			<form:errors path="address" />
		</p>
		<p>
			City:
			<form:input path="city" />
			<form:errors path="city" />
		</p>
		<p>
			State:
			<form:input path="state" />
			<form:errors path="state" />
		</p>
		<p>
			Password:
			<form:input path="password" />
			<form:errors path="password" />
		</p>
		<p>
			Confirm Password:
			<form:input path="confirm" />
			<form:errors path="confirm" />
		</p>
		<button>Register</button>
	</form:form>
</body>
</html>