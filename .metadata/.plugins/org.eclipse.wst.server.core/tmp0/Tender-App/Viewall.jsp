<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor: All tenders view</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<h3 class="text-center">List of all tenders</h3>
	<%User me=(User) session.getAttribute("userobj"); %>

	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Notice</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="text-center">
						<h4>Did you properly check all the requirements!</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
							<%
if (me == null) {
%>
    <a href="login.jsp" type="button" class="btn btn-danger btn-sm mL-2">Bid</a>
<%
} else {
%>
    <a href="Vendorbid.jsp" type="button" class="btn btn-danger btn-sm ml-2">Bid</a>
<%
}
%>
							
											

					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!--end of trigger modal  -->





	<table class="table table-striped table-dark">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Type</th>
				<th scope="col">Base price</th>
				<th scope="col">Location</th>
				<th scope="col">Deadline</th>
				<th scope="col">Description</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			TenderDAOImpl dao = new TenderDAOImpl(DBConnect.getConn());
			List<Tenderdtls> list = dao.getTenderbydescorder();
			for (Tenderdtls t : list) {
			%>
			<tr>

				<td><%=t.getTendername()%></td>
				<td><%=t.getTendertype()%></td>
				<td><%=t.getBaseprice()%></td>
				<td><%=t.getLocation()%></td>
				<td><%=t.getDeadline()%></td>
				<td><%=t.getDescription()%></td>

				<td><a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-danger my-2 my-sm-0 ml-1"><i
						class="fa-solid fa-hand-sparkles"></i> BID</a>
						
			</tr>

			<%
}
%>


		</tbody>
	</table>









	<div style="margin-top: 390px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>