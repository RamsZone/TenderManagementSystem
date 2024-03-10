<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: edit Tender</title>
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
							<h3 class="text-center">Update Tender</h3>
							<hr>

							<%
							int id = Integer.parseInt(request.getParameter("id"));
							TenderDAOImpl dao = new TenderDAOImpl(DBConnect.getConn());
							Tenderdtls t = dao.getTenderbyId(id);
							%>



							<form action="../edittenders" method="post">

								<div class="form-group">
									<label for="tname">Tender Name:</label> <input type="text"
										class="form-control" id="tname" name="tname"
										required="required"
										value="<%=t != null ? t.getTendername() : ""%>">
								</div>


								<div class="form-group">
									<label for="ttype">Tender Type:</label> <select
										class="form-control" id="ttype" name="ttype"
										required="required">
										<option value="construction"
											<%=t.getTendertype().equals("construction") ? "selected" : ""%>>Construction</option>
										<option value="research"
											<%=t.getTendertype().equals("research") ? "selected" : ""%>>Research</option>
										<option value="maintenance"
											<%=t.getTendertype().equals("maintenance") ? "selected" : ""%>>Maintenance</option>
										<option value="business"
											<%=t.getTendertype().equals("business") ? "selected" : ""%>>Business
											Implementation</option>
										<option value="software"
											<%=t.getTendertype().equals("software") ? "selected" : ""%>>Software</option>
										<option value="others"
											<%=t.getTendertype().equals("others") ? "selected" : ""%>>Others</option>
									</select>
								</div>

								<div class="form-group">
									<label for="tprice">Base Price:</label> <input type="number"
										class="form-control" id="tprice" name="tprice"
										required="required" value="<%=t.getBaseprice()%>">
								</div>

								<div class="form-group">
									<label for="tdeadline">Strict Deadline:</label> <input
										type="date" class="form-control" id="tdeadline"
										name="tdeadline" required="required"
										value="<%=t.getDeadline()%>">
								</div>

								<div class="form-group">
									<label for="tadd">Address:</label> <input type="text"
										class="form-control" id="tadd" name="tadd" required="required"
										value="<%=t.getLocation()%>">
								</div>

								<div class="form-group">
									<label for="tdesc">Description:</label>
									<textarea class="form-control" rows="4" id="tdesc" name="tdesc"
										required="required"><%=t.getDescription()%></textarea>
								</div>

								<button type="submit" class="btn btn-primary">Update</button>
								<input type="hidden" name="id" value="<%=t.getTenderid()%>">

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