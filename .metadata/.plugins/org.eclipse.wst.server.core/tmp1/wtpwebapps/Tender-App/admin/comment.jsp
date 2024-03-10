<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.CartDAO"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="com.DAO.TenderOrderDAO"%>
<%@ page import="com.DAO.TenderOrderImpl"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.Tender_Order"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Comment</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row justify-content-center p-2">
			<div class="col-md-10">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Response</h3>

						<%
						int id = Integer.parseInt(request.getParameter("id"));

						TenderOrderImpl dao = new TenderOrderImpl(DBConnect.getConn());
						Tender_Order c = dao.getTenderById(id); 
// Re;trieve Tender_Order by ID
						%>



						


						<form action="../update_status" method="post">


<input type="hidden" name="id" value="<%= c.getId() %>">
<input type="hidden" name="email" value="<%= c.getEmail() %>">


							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputPassword4">Message From Admin</label>
									<textarea class="form-control" rows="4" id="inputPassword4"
										name="comm" required></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<button class="btn btn-warning">Message</button>


									<a href="home.jsp" class="btn btn-primary">Back to Home</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 180px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
