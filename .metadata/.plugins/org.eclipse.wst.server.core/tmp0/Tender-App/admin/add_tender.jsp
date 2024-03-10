<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Tender</title>
<%@include file="allCss.jsp"%>
</head>

<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-5 offset-md-5 mx-auto">
				<div class="card">
					<div class="card-body">
						<div class="container">
						<h3 class="text-center">Add Tender</h3>
						<hr>

							<C:if test="${not empty succMsg}">
								<h5 class="text-center text-success">${succMsg}</h5>
								<c:remove var="succMsg" scope="session" />
							</C:if>

							<C:if test="${not empty failedMsg}">
								<h5 class="text-center text-danger">${failedMsg}</h5>
								<c:remove var="failedMsg" scope="session" />
							</C:if>


							<form action="../add_tenders" method="post" >
							
								<div class="form-group">
									<label for="tname">Tender Name:</label> 
									<input type="text"
										class="form-control" id="tname" name="tname"
										required="required">
								</div>

								<div class="form-group">
									<label for="ttype">Tender Type:</label> <select
										class="form-control" id="ttype" name="ttype"
										required="required">
										<option value="construction">Construction</option>
										<option value="research">Research</option>
										<option value="maintenance">Maintenance</option>
										<option value="business">Business Implementation</option>
										<option value="software">Software</option>
										<option value="others">Others</option>
									</select>
								</div>

								<div class="form-group">
									<label for="tprice">Base Price:</label> <input type="number"
										class="form-control" id="tprice" name="tprice"
										required="required">
								</div>

								<div class="form-group">
									<label for="tdeadline">Strict Deadline:</label> <input
										type="date" class="form-control" id="tdeadline"
										name="tdeadline" required="required">
								</div>

								<div class="form-group">
									<label for="tadd">Address:</label> <input type="text"
										class="form-control" id="tadd" name="tadd" required="required">
								</div>

								<div class="form-group">
									<label for="tdesc">Description:</label>
									<textarea class="form-control" rows="4" id="tdesc" name="tdesc"
										required="required"></textarea>
								</div>

								<button type="submit" class="btn btn-primary">Launch
									This Tender</button>
							</form>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>



<%@include file="footer.jsp"%>
</body>
</html>