<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- for CSS -->
<link rel="stylesheet" type="text/css" href="/css/registration.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/register" method="POST" modelAttribute="newUser">
<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img src="https://www.diesel-plus.com/wp-content/uploads/2019/07/Airplane-Sky-201811-001-720x475.jpg"
                alt="Airplane photo" class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
            </div>
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">Registration form</h3>

                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <form:input path="firstName" id="form3Example1m" class="form-control form-control-lg" />
                      <form:errors path="firstName"/>
                      <label class="form-label" for="form3Example1m">First name</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <form:input path="firstName" id="form3Example1n" class="form-control form-control-lg" />
                      <form:errors path="lastName"/>
                      <label class="form-label" for="form3Example1n">Last name</label>
                    </div>
                  </div>
                </div>

                <div class="form-outline mb-4">
                  <form:input path="dob" type="date" id="form3Example9" class="form-control form-control-lg" />
                  <form:errors path="dob"/>
                  <label class="form-label" for="form3Example9">Date of Birth</label>
                </div>

                <div class="form-outline mb-4">
                  <form:input path="address" id="form3Example8" class="form-control form-control-lg" />
                  <form:errors path="address"/>
                  <label class="form-label" for="form3Example8">Address</label>
                </div>

                
                <div class="row">
                  <div class="col-md-6 mb-4" >
                    <select class="select form-control form-control-lg">
                      <option value="1">WA</option>
                      <option value="2">OR</option>
                      <option value="3">WY</option>
                    </select>
					<label class="form-label" for="form3Example8">State</label>

                  </div>
                    <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <form:input path="city" id="form3Example1m" class="form-control form-control-lg" />
                      <form:errors path="city"/>
                      <label class="form-label" for="form3Example1m">City</label>
                    </div>
                </div>


                <div class="form-outline mb-4">
                  <form:input path="password" id="form3Example90" class="form-control form-control-lg" />
                  <form:errors path="password"/>
                  <label class="form-label" for="form3Example90">Password</label>
                </div>

                <div class="form-outline mb-4">
                  <form:input path="confirm" id="form3Example99" class="form-control form-control-lg" />
                  <form:errors path="confirm"/>
                  <label class="form-label" for="form3Example99">Confirm Password</label>
                </div>


                <div class="d-flex justify-content-end pt-3">
                  <button type="button" class="btn btn-warning btn-lg ms-2">Submit form</button>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 </div>
</section>
	</form:form>
</body>
</html>