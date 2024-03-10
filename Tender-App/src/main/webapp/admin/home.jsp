<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>

</head>

<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>


	<div class="container text-center mt-5">
		<h1 class="text-dark">Welcome Admin</h1>
	</div>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_tender.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-regular fa-square-plus fa-5x text-primary"></i><br>
							<h4>Add Tender</h4>
							-------------------


						</div>
					</div>
				</a>
			</div>



			<div class="col-md-3">
				<a href="all_tenders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-list fa-5x text-success"></i><br>
							<h4>All Tenders</h4>
							-------------------

						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
				<a href="add_notices.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-newspaper fa-5x text-warning"></i><br>
							<h4>Add Notices</h4>
							-------------------

						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
				<a href="bids.jsp">
					<div class="card">

						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-5x text-danger"></i> <br>
							<h4>Bids</h4>
							-------------------

						</div>
					</div>
				</a>

			</div>


		</div>





	</div>
















	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="footer.jsp"%></div>
</body>
</html>