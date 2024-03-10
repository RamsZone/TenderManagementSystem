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
	<%
	User me = (User) session.getAttribute("userobj");
	%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-success">
			<i class="fa-solid fa-hands-holding-circle"></i> Tender Management
			System
		</h2>
	</div>

	<div class="container-fluid py-4" style="margin: 0 12.5%; width: 75%;">

		<h3 class="card-title text-center mb-4">Welcome to the Tender
			Management System</h3>

		<p
			style="text-align: justify; font-size: 1.1rem; line-height: 1.6; color: #333;">Our
			Tender Management System offers a user-friendly platform for viewing
			tenders and notices. Seamlessly navigate through tender details and
			notices with ease, ensuring smooth communication and organization of
			vital information. You can bid for available tenders depending upon
			your field of expertise and capital. Save time, not looking through
			the newspaper and get to bidding as soon as tenders are added by our
			system. IF any questions were in your mind, just navigate to Chat
			section and chat with the administartor or admin.</p>

		<p
			style="text-align: justify; font-size: 1.1rem; line-height: 1.6; color: #333;">Our
			system features efficient bid submission, streamlined bid evaluation,
			and bid tracking for vendors. Administrators benefit from transparent
			communication with vendors, and a centralized notice board. The
			user-friendly interface provides intuitive navigation and responsive
			design. And many more.</p>

		<p
			style="text-align: justify; font-size: 1.1rem; line-height: 1.6; color: #333;">
			Vendors' bids are evaluated based on
			their price bidding, deadline, and the message they give the admin.In case of multiple vendors with the same bid price, priority is given to the first bidder. 
		</p>


	</div>


	<hr>







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
				<th scope="col">SN</th>
				<th scope="col">Notice</th>
				<th scope="col">Description</th>
			</tr>
		</thead>
		<tbody>
			<%
			NoticeDAOImpl noticedao = new NoticeDAOImpl(DBConnect.getConn());
			List<NoticeDtls> noticelist = noticedao.getAllNotices();
			for (NoticeDtls t : noticelist) {
			%>
			<tr>
				<td><%=t.getNid()%></td>
				<td><%=t.getNtitle()%></td>
				<td><%=t.getnDesc()%></td>
			</tr>
			<%
			}
			%>


		</tbody>
	</table>

	<hr>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
