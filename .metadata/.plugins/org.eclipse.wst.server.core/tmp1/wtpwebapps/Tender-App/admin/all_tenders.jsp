<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All tenders view</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">List of all tenders</h3>
	
	<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>
	


	<C:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</C:if>

	<C:if test="${not empty failedMsg}">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</C:if>

	

	<table class="table table-striped table-dark">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
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
			List<Tenderdtls> list = dao.getAllTenders();
			for (Tenderdtls t : list) {
			%>
			<tr>
				<td><%=t.getTenderid()%></td>
				<td><%=t.getTendername()%></td>
				<td><%=t.getTendertype()%></td>
				<td><%=t.getBaseprice()%></td>
				<td><%=t.getLocation()%></td>
				<td><%=t.getDeadline()%></td>
				<td><%=t.getDescription()%></td>

				<td><a href="edit_tenders.jsp?id=<%=t.getTenderid()%>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-file-pen"></i>Edit</a> <a href="../delete?id=<%=t.getTenderid() %>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a></td>
			</tr>

			<%
}
%>


		</tbody>
	</table>









	<div style="margin-top: 390px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>