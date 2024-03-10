<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored = "false" %>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Notices</title>
<%@include file="allCss.jsp"%>
</head>

<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-5 offset-md-5 mx-auto">
				<div class="card">
					<div class="card-body">
						<div class="container">
						<h3 class="text-center">Add Notice</h3>
						<hr>
						
						<C:if test="${not empty succMsg}">
								<h5 class="text-center text-success">${succMsg}</h5>
								<c:remove var="succMsg" scope="session" />
							</C:if>

							<C:if test="${not empty failedMsg}">
								<h5 class="text-center text-danger">${failedMsg}</h5>
								<c:remove var="failedMsg" scope="session" />
							</C:if>
						
						
							<form action="../add_notices" method="post">
								<div class="form-group">
									<label for="title"> Notice Title:</label> 
									<input type="text"
										class="form-control" id="title" name="title"
										required="required">
								</div>

								<div class="form-group">
									<label for="info">Description:</label> 
									<textarea class="form-control" rows="4" id="info" name="info"
										required="required"></textarea>
								</div>

								<button type="submit" class="btn btn-primary" style="background-color:#660033;color:white;">Add Notice to Notice Board</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<div style="margin-top: 180px;">
<%@include file="footer.jsp"%></div>
</body>
</html>
