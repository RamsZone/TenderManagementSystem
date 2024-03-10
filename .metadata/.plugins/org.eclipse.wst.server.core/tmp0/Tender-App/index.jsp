<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DAO.NoticeDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ page import="com.entity.NoticeDtls"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tender: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url(img/Tender-01.png);
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.news-img {
	background: url(img/news.jpeg);
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f7f8fa;
}
</style>
</head>
<body style="background-color: #f7f8fa">
	<%@include file="all_component/navbar.jsp"%>
	<br>
	<% User me = (User) session.getAttribute("userobj"); %>
	<div class="container-fluid back-img">
		<h2 class="text-center text-success">
			<i class="fa-solid fa-hands-holding-circle"></i> Tender Management
			System
		</h2>
	</div>

	<div class="container-fluid py-4">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card border">
					<div class="card-body">
						<h3 class="card-title text-center mb-4">Welcome to the Tender
							Management System</h3>
						<p class="card-text">Our Tender Management System offers a
							user-friendly platform for viewing tenders and notices.
							Seamlessly navigate through tender details and notices with ease,
							ensuring smooth communication and organization of vital
							information. You can bid for available tenders depending upon
							your field of expertise and capital. Save time, not looking
							through the newspaper and get to bidding as soon as tenders are
							added by our system.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<hr>
	<div class="container-fluid">
		<h2 class="text-center text-primary">
			<i class="fa-solid fa-hand-sparkles"></i> NEW TENDERS
		</h2>
	</div>

	<table class="table table-striped table-white">
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
			<% TenderDAOImpl dao = new TenderDAOImpl(DBConnect.getConn());
            List<Tenderdtls> list = dao.getNewTender();
            for (Tenderdtls t : list) {
            %>
			<tr>
				<td><%= t.getTendername() %></td>
				<td><%= t.getTendertype() %></td>
				<td><%= t.getBaseprice() %></td>
				<td><%= t.getLocation() %></td>
				<td><%= t.getDeadline() %></td>
				<td><%= t.getDescription() %></td>
				<td><a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-danger my-2 my-sm-0 ml-1"> <i
						class="fa-solid fa-hand-sparkles"></i> BID
				</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>

	<!-- Button trigger modal -->

	<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Notice</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4>Login Required, proceed to login</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <% if (me == null) { %>
                        <a href="login.jsp" type="button" class="btn btn-danger btn-sm mL-2">Proceed</a>
                    <% } else { %>
                        <a href="Bid?tid=<%= list.get(0).getTenderid() %>&amp;uid=<%= me.getId() %>"
                            type="button" class="btn btn-danger btn-sm ml-2">Proceed</a>
                    <% } %>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
	

	<hr>
	<div class="text-center mt-1">
		<%
        if (me == null) {
        %>
		<a href="login.jsp" type="button" class="btn btn-danger btn-sm mL-2">View
			All</a>
		<% } else { %>
		<a href="Viewall.jsp" type="button" class="btn btn-danger btn-sm ml-2">View
			All</a>
		<% } %>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container-fluid news-img">
		<h2 class="text-center text-success">
			<i class="fa-solid fa-hands-holding-circle"></i> News and Updates
		</h2>
	</div>

	<table class="table table-striped table-white">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Notice</th>
				<th scope="col">Description</th>
			</tr>
		</thead>
		<tbody>
			<% NoticeDAOImpl noticedao = new NoticeDAOImpl(DBConnect.getConn());
            List<NoticeDtls> noticelist = noticedao.getAllNotices();
            for (NoticeDtls t : noticelist) {
            %>
			<tr>
				<td><%= t.getNid() %></td>
				<td><%= t.getNtitle() %></td>
				<td><%= t.getnDesc() %></td>
			</tr>
			<% } %>
			
			
		</tbody>
	</table>

	<hr>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
