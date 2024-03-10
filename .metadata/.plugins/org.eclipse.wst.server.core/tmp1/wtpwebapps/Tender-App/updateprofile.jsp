<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor:: Update details</title>
<%@include file="all_component/allCss.jsp"%>


</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center">Update Details</h2>
						<hr>

						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger ">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<p class="text-center text-success ">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>






						<form action="update_profile" method="post">
							<input type="hidden" value="${userobj.id}" name="id">


							<div class="form-group">
								<label for="exampleInputEmail1">Enter your full name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									value="${userobj.name}">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									value="${userobj.email}">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone No.</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno"
									value="${userobj.phno}">
							</div>
							
							<div class="form-group">

								<label for="exampleInputPassword1">Company Registration Number</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									required="required" name="crnno" value="${userobj.crnno }">
									<small class="text-muted">Provide valid CRN number!</small>
							</div>


							<div class="form-group">

								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>





							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<br>
	<br>
	<br>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>